import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 48
m = 48
u = 48
o = 45
n = 45
gflops = a*m*u*o*n*2/1e9
A = np.empty((a,u), order='f', dtype=np.float32)
B = np.empty((u,n,o,m), order='f', dtype=np.float32)
C = np.empty((a,m,o,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,u", B, "u,n,o,m", beta, C, "a,m,o,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("au,unom->amon", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
