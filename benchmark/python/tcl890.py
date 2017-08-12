import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 72
u = 5000
b = 72
m = 72
n = 72
gflops = a*u*b*m*n*2/1e9
A = np.empty((m,u,n), order='f', dtype=np.float32)
B = np.empty((b,a,u), order='f', dtype=np.float32)
C = np.empty((n,a,b,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,u,n", B, "b,a,u", beta, C, "n,a,b,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("mun,bau->nabm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
