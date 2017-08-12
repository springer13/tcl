import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 10
c = 10
b = 10
m = 9
o = 8
n = 8
u = 10
w = 10
v = 8
gflops = a*c*b*m*o*n*u*w*v*2/1e9
A = np.empty((o,n,w,m,u,v), order='f', dtype=np.float32)
B = np.empty((v,w,u,b,c,a), order='f', dtype=np.float32)
C = np.empty((n,b,a,m,c,o), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "o,n,w,m,u,v", B, "v,w,u,b,c,a", beta, C, "n,b,a,m,c,o" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("onwmuv,vwubca->nbamco", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
