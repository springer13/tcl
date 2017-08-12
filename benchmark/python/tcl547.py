import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 24
b = 24
m = 20
n = 20
u = 24
w = 24
v = 24
gflops = a*b*m*n*u*w*v*2/1e9
A = np.empty((v,w,a,u,b), order='f', dtype=np.float32)
B = np.empty((w,u,n,v,m), order='f', dtype=np.float32)
C = np.empty((b,a,n,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,w,a,u,b", B, "w,u,n,v,m", beta, C, "b,a,n,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vwaub,wunvm->banm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
