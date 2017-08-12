import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 864
m = 30
o = 30
n = 32
u = 32
v = 30
gflops = a*m*o*n*u*v*2/1e9
A = np.empty((u,m,o,v,n), order='f', dtype=np.float32)
B = np.empty((u,a,v), order='f', dtype=np.float32)
C = np.empty((n,o,a,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,m,o,v,n", B, "u,a,v", beta, C, "n,o,a,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("umovn,uav->noam", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
