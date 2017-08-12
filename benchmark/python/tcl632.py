import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 25
c = 25
b = 24
m = 24
n = 24
u = 600
gflops = a*c*b*m*n*u*2/1e9
A = np.empty((m,u,n), order='f', dtype=np.float32)
B = np.empty((b,a,c,u), order='f', dtype=np.float32)
C = np.empty((n,b,m,c,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,u,n", B, "b,a,c,u", beta, C, "n,b,m,c,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("mun,bacu->nbmca", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
