import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 32
b = 30
m = 32
n = 32
u = 32
v = 32
gflops = a*b*m*n*u*v*2/1e9
A = np.empty((a,u,v,b), order='f', dtype=np.float32)
B = np.empty((m,v,u,n), order='f', dtype=np.float32)
C = np.empty((a,m,n,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,u,v,b", B, "m,v,u,n", beta, C, "a,m,n,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("auvb,mvun->amnb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
