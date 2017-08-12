import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 16
b = 18
d = 18
m = 16
n = 16
u = 18
v = 16
gflops = a*c*b*d*m*n*u*v*2/1e9
A = np.empty((a,u,v,b,c,d), order='f', dtype=np.float32)
B = np.empty((v,u,m,n), order='f', dtype=np.float32)
C = np.empty((c,m,b,n,a,d), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,u,v,b,c,d", B, "v,u,m,n", beta, C, "c,m,b,n,a,d" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("auvbcd,vumn->cmbnad", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
