import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 1152
m = 32
n = 32
u = 32
v = 32
gflops = a*m*n*u*v*2/1e9
A = np.empty((a,v,u), order='f', dtype=np.float32)
B = np.empty((u,v,n,m), order='f', dtype=np.float32)
C = np.empty((a,m,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,v,u", B, "u,v,n,m", beta, C, "a,m,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("avu,uvnm->amn", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
