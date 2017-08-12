import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 8
c = 9
b = 10
m = 10
o = 8
n = 10
u = 10
w = 10
v = 8
gflops = a*c*b*m*o*n*u*w*v*2/1e9
A = np.empty((v,w,u,b,c,a), order='f', dtype=np.float32)
B = np.empty((o,n,w,m,u,v), order='f', dtype=np.float32)
C = np.empty((a,n,b,o,m,c), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,w,u,b,c,a", B, "o,n,w,m,u,v", beta, C, "a,n,b,o,m,c" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vwubca,onwmuv->anbomc", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
