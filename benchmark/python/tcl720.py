import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 15
c = 16
b = 15
m = 16
o = 15
n = 15
u = 15
w = 16
v = 16
gflops = a*c*b*m*o*n*u*w*v*2/1e9
A = np.empty((v,w,b,u,c,a), order='f', dtype=np.float32)
B = np.empty((w,n,v,m,u,o), order='f', dtype=np.float32)
C = np.empty((c,m,n,b,o,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,w,b,u,c,a", B, "w,n,v,m,u,o", beta, C, "c,m,n,b,o,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vwbuca,wnvmuo->cmnboa", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
