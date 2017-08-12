import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 45
b = 48
m = 45
n = 48
u = 48
v = 45
gflops = a*b*m*n*u*v*2/1e9
A = np.empty((u,v,a,b), order='f', dtype=np.float32)
B = np.empty((n,v,m,u), order='f', dtype=np.float32)
C = np.empty((b,n,a,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,v,a,b", B, "n,v,m,u", beta, C, "b,n,a,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("uvab,nvmu->bnam", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
