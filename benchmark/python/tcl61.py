import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 10
c = 10
b = 10
m = 8
o = 9
n = 8
u = 1000
gflops = a*c*b*m*o*n*u*2/1e9
A = np.empty((n,m,o,u), order='f', dtype=np.float32)
B = np.empty((u,b,a,c), order='f', dtype=np.float32)
C = np.empty((m,n,c,b,o,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "n,m,o,u", B, "u,b,a,c", beta, C, "m,n,c,b,o,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("nmou,ubac->mncboa", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
