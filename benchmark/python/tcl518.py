import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 2400
m = 15
o = 15
n = 16
u = 15
w = 15
v = 16
gflops = a*m*o*n*u*w*v*2/1e9
A = np.empty((v,w,u,a), order='f', dtype=np.float32)
B = np.empty((n,m,u,w,o,v), order='f', dtype=np.float32)
C = np.empty((a,o,m,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,w,u,a", B, "n,m,u,w,o,v", beta, C, "a,o,m,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vwua,nmuwov->aomn", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
