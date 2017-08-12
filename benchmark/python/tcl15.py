import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 8
m = 9
o = 8
n = 10
q = 10
p = 10
u = 8
gflops = a*m*o*n*q*p*u*2/1e9
A = np.empty((o,p,m,u,q,n), order='f', dtype=np.float32)
B = np.empty((u,a), order='f', dtype=np.float32)
C = np.empty((o,m,q,p,a,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "o,p,m,u,q,n", B, "u,a", beta, C, "o,m,q,p,a,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("opmuqn,ua->omqpan", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
