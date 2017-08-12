import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 24
b = 20
m = 20
n = 24
u = 20
w = 24
v = 20
gflops = a*b*m*n*u*w*v*2/1e9
A = np.empty((w,m,v,n,u), order='f', dtype=np.float32)
B = np.empty((a,w,u,v,b), order='f', dtype=np.float32)
C = np.empty((n,b,a,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "w,m,v,n,u", B, "a,w,u,v,b", beta, C, "n,b,a,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("wmvnu,awuvb->nbam", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
