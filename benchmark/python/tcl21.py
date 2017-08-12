import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 32
m = 32
b = 30
u = 1152
n = 32
gflops = a*m*b*u*n*2/1e9
A = np.empty((u,a,b), order='f', dtype=np.float32)
B = np.empty((m,u,n), order='f', dtype=np.float32)
C = np.empty((a,n,m,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,a,b", B, "m,u,n", beta, C, "a,n,m,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("uab,mun->anmb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
