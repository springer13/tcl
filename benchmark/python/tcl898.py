import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 30
b = 30
m = 30
o = 32
n = 30
u = 864
gflops = a*b*m*o*n*u*2/1e9
A = np.empty((u,o,m,n), order='f', dtype=np.float32)
B = np.empty((u,a,b), order='f', dtype=np.float32)
C = np.empty((o,b,m,a,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,o,m,n", B, "u,a,b", beta, C, "o,b,m,a,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("uomn,uab->obman", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
