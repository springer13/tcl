import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 8
c = 9
b = 10
m = 32
n = 32
u = 8
w = 10
v = 8
gflops = a*c*b*m*n*u*w*v*2/1e9
A = np.empty((u,v,a,w,c,b), order='f', dtype=np.float32)
B = np.empty((v,w,n,u,m), order='f', dtype=np.float32)
C = np.empty((a,n,c,m,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,v,a,w,c,b", B, "v,w,n,u,m", beta, C, "a,n,c,m,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("uvawcb,vwnum->ancmb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
