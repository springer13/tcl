import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 8
c = 12
b = 8
m = 1536
u = 12
w = 12
v = 12
gflops = a*c*b*m*u*w*v*2/1e9
A = np.empty((a,u,v,b,w,c), order='f', dtype=np.float32)
B = np.empty((m,v,u,w), order='f', dtype=np.float32)
C = np.empty((b,c,a,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,u,v,b,w,c", B, "m,v,u,w", beta, C, "b,c,a,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("auvbwc,mvuw->bcam", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
