import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
m = 15
o = 15
n = 15
q = 16
p = 15
u = 15
gflops = a*m*o*n*q*p*u*2/1e9
A = np.empty((q,o,m,p,u,n), order='f', dtype=np.float32)
B = np.empty((a,u), order='f', dtype=np.float32)
C = np.empty((q,p,m,a,n,o), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "q,o,m,p,u,n", B, "a,u", beta, C, "q,p,m,a,n,o" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("qompun,au->qpmano", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
