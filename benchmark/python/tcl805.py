import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 15
b = 16
m = 16
o = 16
n = 16
p = 16
u = 16
v = 16
gflops = a*b*m*o*n*p*u*v*2/1e9
A = np.empty((v,u,a,b), order='f', dtype=np.float32)
B = np.empty((u,v,p,m,o,n), order='f', dtype=np.float32)
C = np.empty((b,o,p,n,a,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,u,a,b", B, "u,v,p,m,o,n", beta, C, "b,o,p,n,a,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vuab,uvpmon->bopnam", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
