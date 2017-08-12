import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 8
m = 8
o = 12
n = 12
q = 8
p = 12
u = 12
gflops = a*m*o*n*q*p*u*2/1e9
A = np.empty((m,u,o,p,q,n), order='f', dtype=np.float32)
B = np.empty((a,u), order='f', dtype=np.float32)
C = np.empty((q,o,a,p,m,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,u,o,p,q,n", B, "a,u", beta, C, "q,o,a,p,m,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("muopqn,au->qoapmn", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
