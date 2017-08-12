import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 12
c = 16
b = 12
d = 12
m = 12
n = 12
u = 144
gflops = a*c*b*d*m*n*u*2/1e9
A = np.empty((c,u,b,a,d), order='f', dtype=np.float32)
B = np.empty((u,m,n), order='f', dtype=np.float32)
C = np.empty((c,d,m,b,n,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "c,u,b,a,d", B, "u,m,n", beta, C, "c,d,m,b,n,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("cubad,umn->cdmbna", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
