import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 24
b = 27
m = 24
n = 27
u = 24
w = 27
v = 27
gflops = a*b*m*n*u*w*v*2/1e9
A = np.empty((u,n,m,v,w), order='f', dtype=np.float32)
B = np.empty((a,b,u,w,v), order='f', dtype=np.float32)
C = np.empty((m,b,n,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,n,m,v,w", B, "a,b,u,w,v", beta, C, "m,b,n,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("unmvw,abuwv->mbna", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
