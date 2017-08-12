import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 72
b = 72
m = 72
n = 72
u = 72
v = 72
gflops = a*b*m*n*u*v*2/1e9
A = np.empty((v,m,u,n), order='f', dtype=np.float32)
B = np.empty((a,u,v,b), order='f', dtype=np.float32)
C = np.empty((m,n,b,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,m,u,n", B, "a,u,v,b", beta, C, "m,n,b,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vmun,auvb->mnba", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
