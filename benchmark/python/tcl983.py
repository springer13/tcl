import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 30
b = 32
m = 32
n = 30
u = 30
w = 32
v = 30
gflops = a*b*m*n*u*w*v*2/1e9
A = np.empty((w,u,m,v,n), order='f', dtype=np.float32)
B = np.empty((b,u,v,w,a), order='f', dtype=np.float32)
C = np.empty((m,n,b,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "w,u,m,v,n", B, "b,u,v,w,a", beta, C, "m,n,b,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("wumvn,buvwa->mnba", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
