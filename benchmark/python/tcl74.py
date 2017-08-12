import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
b = 16
m = 16
o = 15
n = 16
u = 16
v = 16
gflops = a*b*m*o*n*u*v*2/1e9
A = np.empty((v,n,o,u,m), order='f', dtype=np.float32)
B = np.empty((u,b,a,v), order='f', dtype=np.float32)
C = np.empty((m,b,n,a,o), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,n,o,u,m", B, "u,b,a,v", beta, C, "m,b,n,a,o" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vnoum,ubav->mbnao", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
