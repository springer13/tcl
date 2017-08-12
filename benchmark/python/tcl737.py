import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
m = 15
o = 16
n = 16
q = 16
p = 16
u = 16
gflops = a*m*o*n*q*p*u*2/1e9
A = np.empty((q,n,o,u,p,m), order='f', dtype=np.float32)
B = np.empty((a,u), order='f', dtype=np.float32)
C = np.empty((q,p,a,n,m,o), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "q,n,o,u,p,m", B, "a,u", beta, C, "q,p,a,n,m,o" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("qnoupm,au->qpanmo", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
