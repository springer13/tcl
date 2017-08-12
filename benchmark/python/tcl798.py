import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 24
b = 27
m = 27
o = 27
n = 24
u = 24
v = 27
gflops = a*b*m*o*n*u*v*2/1e9
A = np.empty((u,o,n,v,m), order='f', dtype=np.float32)
B = np.empty((u,a,v,b), order='f', dtype=np.float32)
C = np.empty((n,b,m,o,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,o,n,v,m", B, "u,a,v,b", beta, C, "n,b,m,o,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("uonvm,uavb->nbmoa", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
