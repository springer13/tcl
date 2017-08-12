import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 12
c = 12
b = 12
d = 12
m = 8
n = 12
u = 8
v = 8
gflops = a*c*b*d*m*n*u*v*2/1e9
A = np.empty((u,v,m,n), order='f', dtype=np.float32)
B = np.empty((v,b,a,d,c,u), order='f', dtype=np.float32)
C = np.empty((m,d,n,a,c,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,v,m,n", B, "v,b,a,d,c,u", beta, C, "m,d,n,a,c,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("uvmn,vbadcu->mdnacb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
