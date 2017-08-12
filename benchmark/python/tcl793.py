import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 72
m = 64
u = 64
w = 64
v = 64
gflops = a*m*u*w*v*2/1e9
A = np.empty((v,u,w,a), order='f', dtype=np.float32)
B = np.empty((u,m,v,w), order='f', dtype=np.float32)
C = np.empty((a,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,u,w,a", B, "u,m,v,w", beta, C, "a,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vuwa,umvw->am", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
