import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 48
b = 54
m = 16
o = 15
n = 15
u = 16
w = 15
v = 15
gflops = a*b*m*o*n*u*w*v*2/1e9
A = np.empty((u,b,w,v,a), order='f', dtype=np.float32)
B = np.empty((u,v,w,o,m,n), order='f', dtype=np.float32)
C = np.empty((a,o,n,b,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,b,w,v,a", B, "u,v,w,o,m,n", beta, C, "a,o,n,b,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("ubwva,uvwomn->aonbm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
