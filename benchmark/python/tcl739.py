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
A = np.empty((p,q,m,u,o,n), order='f', dtype=np.float32)
B = np.empty((a,u), order='f', dtype=np.float32)
C = np.empty((p,n,m,o,a,q), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "p,q,m,u,o,n", B, "a,u", beta, C, "p,n,m,o,a,q" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("pqmuon,au->pnmoaq", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
