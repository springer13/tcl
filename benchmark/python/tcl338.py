import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 45
m = 40
c = 48
b = 45
u = 45
gflops = a*m*c*b*u*2/1e9
A = np.empty((c,b,u,a), order='f', dtype=np.float32)
B = np.empty((m,u), order='f', dtype=np.float32)
C = np.empty((c,m,a,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "c,b,u,a", B, "m,u", beta, C, "c,m,a,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("cbua,mu->cmab", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
