import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 60
b = 64
m = 64
n = 64
u = 64
v = 64
gflops = a*b*m*n*u*v*2/1e9
A = np.empty((b,v,u,a), order='f', dtype=np.float32)
B = np.empty((v,n,m,u), order='f', dtype=np.float32)
C = np.empty((b,m,n,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "b,v,u,a", B, "v,n,m,u", beta, C, "b,m,n,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("bvua,vnmu->bmna", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
