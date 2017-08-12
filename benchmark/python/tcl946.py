import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 864
m = 32
n = 30
u = 30
w = 30
v = 30
gflops = a*m*n*u*w*v*2/1e9
A = np.empty((m,v,n,u,w), order='f', dtype=np.float32)
B = np.empty((a,w,v,u), order='f', dtype=np.float32)
C = np.empty((m,n,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,v,n,u,w", B, "a,w,v,u", beta, C, "m,n,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("mvnuw,awvu->mna", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
