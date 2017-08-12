import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 15
c = 15
b = 16
m = 15
o = 15
n = 16
u = 16
w = 15
v = 15
gflops = a*c*b*m*o*n*u*w*v*2/1e9
A = np.empty((u,o,n,m,v,w), order='f', dtype=np.float32)
B = np.empty((b,c,a,w,v,u), order='f', dtype=np.float32)
C = np.empty((n,c,o,m,a,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,o,n,m,v,w", B, "b,c,a,w,v,u", beta, C, "n,c,o,m,a,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("uonmvw,bcawvu->ncomab", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
