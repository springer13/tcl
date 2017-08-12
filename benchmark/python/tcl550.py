import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 48
b = 48
m = 15
o = 15
n = 16
u = 16
w = 15
v = 16
gflops = a*b*m*o*n*u*w*v*2/1e9
A = np.empty((u,w,v,m,o,n), order='f', dtype=np.float32)
B = np.empty((v,b,w,u,a), order='f', dtype=np.float32)
C = np.empty((n,b,a,o,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,w,v,m,o,n", B, "v,b,w,u,a", beta, C, "n,b,a,o,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("uwvmon,vbwua->nbaom", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
