import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 16
b = 16
m = 16
o = 18
n = 18
u = 18
w = 16
v = 18
gflops = a*c*b*m*o*n*u*w*v*2/1e9
A = np.empty((w,v,o,m,u,n), order='f', dtype=np.float32)
B = np.empty((b,a,w,c,v,u), order='f', dtype=np.float32)
C = np.empty((m,o,n,c,a,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "w,v,o,m,u,n", B, "b,a,w,c,v,u", beta, C, "m,o,n,c,a,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("wvomun,bawcvu->moncab", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
