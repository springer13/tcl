import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 8
c = 9
b = 10
m = 10
o = 10
n = 8
u = 1000
gflops = a*c*b*m*o*n*u*2/1e9
A = np.empty((u,b,a,c), order='f', dtype=np.float32)
B = np.empty((n,m,o,u), order='f', dtype=np.float32)
C = np.empty((a,o,m,b,n,c), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,b,a,c", B, "n,m,o,u", beta, C, "a,o,m,b,n,c" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("ubac,nmou->aombnc", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
