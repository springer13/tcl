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
n = 32
u = 30
v = 30
gflops = a*b*m*o*n*u*v*2/1e9
A = np.empty((o,m,v,u,n), order='f', dtype=np.float32)
B = np.empty((a,b,u,v), order='f', dtype=np.float32)
C = np.empty((n,b,a,m,o), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "o,m,v,u,n", B, "a,b,u,v", beta, C, "n,b,a,m,o" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("omvun,abuv->nbamo", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
