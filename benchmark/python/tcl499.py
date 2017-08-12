import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 48
b = 50
m = 50
n = 48
u = 50
v = 50
gflops = a*b*m*n*u*v*2/1e9
A = np.empty((a,v,u,b), order='f', dtype=np.float32)
B = np.empty((n,u,v,m), order='f', dtype=np.float32)
C = np.empty((a,b,m,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,v,u,b", B, "n,u,v,m", beta, C, "a,b,m,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("avub,nuvm->abmn", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
