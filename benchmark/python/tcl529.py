import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 15
c = 15
b = 16
d = 15
m = 24
n = 16
u = 162
gflops = a*c*b*d*m*n*u*2/1e9
A = np.empty((m,n,u), order='f', dtype=np.float32)
B = np.empty((b,u,d,a,c), order='f', dtype=np.float32)
C = np.empty((n,c,d,m,a,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,n,u", B, "b,u,d,a,c", beta, C, "n,c,d,m,a,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("mnu,budac->ncdmab", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
