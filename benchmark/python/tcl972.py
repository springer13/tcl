import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 30
c = 30
b = 32
m = 30
n = 32
u = 30
v = 32
gflops = a*c*b*m*n*u*v*2/1e9
A = np.empty((v,c,a,b,u), order='f', dtype=np.float32)
B = np.empty((n,v,u,m), order='f', dtype=np.float32)
C = np.empty((b,m,n,a,c), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,c,a,b,u", B, "n,v,u,m", beta, C, "b,m,n,a,c" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vcabu,nvum->bmnac", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
