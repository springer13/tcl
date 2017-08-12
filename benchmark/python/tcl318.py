import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 20
b = 24
m = 20
o = 20
n = 24
u = 432
gflops = a*b*m*o*n*u*2/1e9
A = np.empty((u,a,b), order='f', dtype=np.float32)
B = np.empty((n,m,u,o), order='f', dtype=np.float32)
C = np.empty((b,m,a,o,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,a,b", B, "n,m,u,o", beta, C, "b,m,a,o,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("uab,nmuo->bmaon", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
