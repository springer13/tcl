import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 24
c = 27
b = 24
m = 24
n = 27
u = 24
v = 27
gflops = a*c*b*m*n*u*v*2/1e9
A = np.empty((b,c,v,a,u), order='f', dtype=np.float32)
B = np.empty((u,m,v,n), order='f', dtype=np.float32)
C = np.empty((a,c,m,b,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "b,c,v,a,u", B, "u,m,v,n", beta, C, "a,c,m,b,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("bcvau,umvn->acmbn", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
