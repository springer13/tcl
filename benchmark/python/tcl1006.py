import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 18
c = 16
b = 16
m = 64
n = 64
u = 18
w = 18
v = 16
gflops = a*c*b*m*n*u*w*v*2/1e9
A = np.empty((b,u,v,a,w,c), order='f', dtype=np.float32)
B = np.empty((v,u,n,m,w), order='f', dtype=np.float32)
C = np.empty((c,n,a,b,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "b,u,v,a,w,c", B, "v,u,n,m,w", beta, C, "c,n,a,b,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("buvawc,vunmw->cnabm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
