import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 1944
m = 48
v = 48
u = 48
n = 45
gflops = a*m*v*u*n*2/1e9
A = np.empty((u,n,m,v), order='f', dtype=np.float32)
B = np.empty((v,u,a), order='f', dtype=np.float32)
C = np.empty((m,n,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,n,m,v", B, "v,u,a", beta, C, "m,n,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("unmv,vua->mna", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
