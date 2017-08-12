import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 600
m = 25
n = 24
u = 24
w = 25
v = 24
gflops = a*m*n*u*w*v*2/1e9
A = np.empty((v,u,m,n,w), order='f', dtype=np.float32)
B = np.empty((u,v,a,w), order='f', dtype=np.float32)
C = np.empty((n,m,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,u,m,n,w", B, "u,v,a,w", beta, C, "n,m,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vumnw,uvaw->nma", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
