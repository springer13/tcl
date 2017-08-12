import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 15
b = 16
d = 15
m = 160
u = 15
v = 15
gflops = a*c*b*d*m*u*v*2/1e9
A = np.empty((b,c,v,u,a,d), order='f', dtype=np.float32)
B = np.empty((m,u,v), order='f', dtype=np.float32)
C = np.empty((a,c,m,d,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "b,c,v,u,a,d", B, "m,u,v", beta, C, "a,c,m,d,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("bcvuad,muv->acmdb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
