import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 8
m = 9
o = 10
n = 10
q = 8
p = 8
u = 8
gflops = a*m*o*n*q*p*u*2/1e9
A = np.empty((p,q,m,n,o,u), order='f', dtype=np.float32)
B = np.empty((u,a), order='f', dtype=np.float32)
C = np.empty((q,p,o,m,a,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "p,q,m,n,o,u", B, "u,a", beta, C, "q,p,o,m,a,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("pqmnou,ua->qpoman", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
