import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 3456
m = 16
o = 15
n = 16
u = 16
w = 16
v = 16
gflops = a*m*o*n*u*w*v*2/1e9
A = np.empty((m,n,v,u,w,o), order='f', dtype=np.float32)
B = np.empty((a,w,u,v), order='f', dtype=np.float32)
C = np.empty((n,a,o,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,n,v,u,w,o", B, "a,w,u,v", beta, C, "n,a,o,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("mnvuwo,awuv->naom", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
