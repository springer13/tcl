import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 972
m = 8
o = 9
n = 10
u = 8
w = 10
v = 8
gflops = a*m*o*n*u*w*v*2/1e9
A = np.empty((u,v,m,n,w,o), order='f', dtype=np.float32)
B = np.empty((v,w,u,a), order='f', dtype=np.float32)
C = np.empty((m,a,n,o), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,v,m,n,w,o", B, "v,w,u,a", beta, C, "m,a,n,o" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("uvmnwo,vwua->mano", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
