import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 48
m = 48
b = 48
u = 1944
n = 45
gflops = a*m*b*u*n*2/1e9
A = np.empty((b,u,a), order='f', dtype=np.float32)
B = np.empty((u,m,n), order='f', dtype=np.float32)
C = np.empty((a,n,m,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "b,u,a", B, "u,m,n", beta, C, "a,n,m,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("bua,umn->anmb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
