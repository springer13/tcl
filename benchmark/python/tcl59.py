import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 24
m = 1152
b = 32
u = 32
v = 32
gflops = a*m*b*u*v*2/1e9
A = np.empty((a,b,v,u), order='f', dtype=np.float32)
B = np.empty((u,m,v), order='f', dtype=np.float32)
C = np.empty((b,m,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,b,v,u", B, "u,m,v", beta, C, "b,m,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("abvu,umv->bma", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
