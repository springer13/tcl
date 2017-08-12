import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 24
b = 32
m = 30
n = 30
u = 30
w = 32
v = 30
gflops = a*b*m*n*u*w*v*2/1e9
A = np.empty((b,u,v,w,a), order='f', dtype=np.float32)
B = np.empty((w,u,m,v,n), order='f', dtype=np.float32)
C = np.empty((a,b,n,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "b,u,v,w,a", B, "w,u,m,v,n", beta, C, "a,b,n,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("buvwa,wumvn->abnm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
