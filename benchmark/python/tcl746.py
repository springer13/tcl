import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 64
m = 72
b = 64
u = 4050
n = 64
gflops = a*m*b*u*n*2/1e9
A = np.empty((n,u,m), order='f', dtype=np.float32)
B = np.empty((b,a,u), order='f', dtype=np.float32)
C = np.empty((m,b,n,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "n,u,m", B, "b,a,u", beta, C, "m,b,n,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("num,bau->mbna", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
