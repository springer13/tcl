import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 48
m = 48
u = 48
w = 45
v = 45
gflops = a*m*u*w*v*2/1e9
A = np.empty((u,w,m,v), order='f', dtype=np.float32)
B = np.empty((u,a,w,v), order='f', dtype=np.float32)
C = np.empty((m,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,w,m,v", B, "u,a,w,v", beta, C, "m,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("uwmv,uawv->ma", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
