import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 3240
m = 64
n = 54
u = 54
v = 54
gflops = a*m*n*u*v*2/1e9
A = np.empty((a,u,v), order='f', dtype=np.float32)
B = np.empty((m,n,v,u), order='f', dtype=np.float32)
C = np.empty((a,n,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,u,v", B, "m,n,v,u", beta, C, "a,n,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("auv,mnvu->anm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
