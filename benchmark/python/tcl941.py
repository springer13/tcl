import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 32
b = 30
m = 30
o = 32
n = 30
u = 30
v = 32
gflops = a*b*m*o*n*u*v*2/1e9
A = np.empty((v,n,u,o,m), order='f', dtype=np.float32)
B = np.empty((a,b,u,v), order='f', dtype=np.float32)
C = np.empty((o,a,n,m,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,n,u,o,m", B, "a,b,u,v", beta, C, "o,a,n,m,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vnuom,abuv->oanmb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
