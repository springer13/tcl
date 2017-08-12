import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 24
b = 24
m = 24
o = 24
n = 24
u = 24
v = 24
gflops = a*b*m*o*n*u*v*2/1e9
A = np.empty((b,v,u,a), order='f', dtype=np.float32)
B = np.empty((n,u,m,o,v), order='f', dtype=np.float32)
C = np.empty((a,n,o,m,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "b,v,u,a", B, "n,u,m,o,v", beta, C, "a,n,o,m,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("bvua,numov->anomb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
