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
w = 16
v = 18
gflops = a*c*b*m*n*u*w*v*2/1e9
A = np.empty((b,u,v,a,w,c), order='f', dtype=np.float32)
B = np.empty((w,m,u,n,v), order='f', dtype=np.float32)
C = np.empty((c,a,n,m,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "b,u,v,a,w,c", B, "w,m,u,n,v", beta, C, "c,a,n,m,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("buvawc,wmunv->canmb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
