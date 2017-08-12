import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 27
c = 27
b = 24
m = 24
n = 27
u = 24
v = 27
gflops = a*c*b*m*n*u*v*2/1e9
A = np.empty((b,c,v,a,u), order='f', dtype=np.float32)
B = np.empty((u,n,m,v), order='f', dtype=np.float32)
C = np.empty((b,n,a,c,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "b,c,v,a,u", B, "u,n,m,v", beta, C, "b,n,a,c,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("bcvau,unmv->bnacm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
