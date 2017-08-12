import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
m = 18
o = 18
n = 16
q = 18
p = 16
u = 18
gflops = a*m*o*n*q*p*u*2/1e9
A = np.empty((p,n,m,u,o,q), order='f', dtype=np.float32)
B = np.empty((a,u), order='f', dtype=np.float32)
C = np.empty((n,p,m,q,o,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "p,n,m,u,o,q", B, "a,u", beta, C, "n,p,m,q,o,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("pnmuoq,au->npmqoa", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
