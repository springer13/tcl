import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 4500
m = 16
o = 16
n = 18
u = 18
w = 18
v = 16
gflops = a*m*o*n*u*w*v*2/1e9
A = np.empty((m,w,o,v,n,u), order='f', dtype=np.float32)
B = np.empty((v,a,u,w), order='f', dtype=np.float32)
C = np.empty((o,m,n,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,w,o,v,n,u", B, "v,a,u,w", beta, C, "o,m,n,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("mwovnu,vauw->omna", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
