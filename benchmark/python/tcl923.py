import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 32
c = 32
b = 30
m = 30
n = 30
u = 864
gflops = a*c*b*m*n*u*2/1e9
A = np.empty((a,c,u,b), order='f', dtype=np.float32)
B = np.empty((u,m,n), order='f', dtype=np.float32)
C = np.empty((c,n,a,b,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,c,u,b", B, "u,m,n", beta, C, "c,n,a,b,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("acub,umn->cnabm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
