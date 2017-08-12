import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 15
c = 16
b = 16
m = 16
o = 15
n = 15
u = 54
v = 48
gflops = a*c*b*m*o*n*u*v*2/1e9
A = np.empty((c,b,v,u,a), order='f', dtype=np.float32)
B = np.empty((v,n,o,m,u), order='f', dtype=np.float32)
C = np.empty((b,n,c,m,o,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "c,b,v,u,a", B, "v,n,o,m,u", beta, C, "b,n,c,m,o,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("cbvua,vnomu->bncmoa", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
