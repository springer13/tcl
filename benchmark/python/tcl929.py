import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 18
c = 18
b = 16
m = 16
o = 18
n = 18
u = 4500
gflops = a*c*b*m*o*n*u*2/1e9
A = np.empty((m,u,o,n), order='f', dtype=np.float32)
B = np.empty((b,c,a,u), order='f', dtype=np.float32)
C = np.empty((m,b,n,a,o,c), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,u,o,n", B, "b,c,a,u", beta, C, "m,b,n,a,o,c" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("muon,bcau->mbnaoc", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
