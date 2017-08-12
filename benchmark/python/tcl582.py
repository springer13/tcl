import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 72
m = 64
u = 64
o = 54
n = 54
gflops = a*m*u*o*n*2/1e9
A = np.empty((u,a), order='f', dtype=np.float32)
B = np.empty((m,u,n,o), order='f', dtype=np.float32)
C = np.empty((a,n,m,o), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,a", B, "m,u,n,o", beta, C, "a,n,m,o" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("ua,muno->anmo", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
