import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 15
c = 15
b = 16
d = 15
m = 144
u = 16
v = 15
gflops = a*c*b*d*m*u*v*2/1e9
A = np.empty((u,m,v), order='f', dtype=np.float32)
B = np.empty((b,c,v,u,a,d), order='f', dtype=np.float32)
C = np.empty((m,d,b,a,c), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,m,v", B, "b,c,v,u,a,d", beta, C, "m,d,b,a,c" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("umv,bcvuad->mdbac", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
