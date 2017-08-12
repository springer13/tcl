import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 9
b = 8
m = 10
o = 10
n = 8
p = 10
u = 96
gflops = a*b*m*o*n*p*u*2/1e9
A = np.empty((u,a,b), order='f', dtype=np.float32)
B = np.empty((n,u,m,o,p), order='f', dtype=np.float32)
C = np.empty((b,n,m,a,p,o), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,a,b", B, "n,u,m,o,p", beta, C, "b,n,m,a,p,o" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("uab,numop->bnmapo", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
