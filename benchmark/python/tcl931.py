import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 18
c = 18
b = 16
m = 18
o = 16
n = 16
u = 4500
gflops = a*c*b*m*o*n*u*2/1e9
A = np.empty((o,u,m,n), order='f', dtype=np.float32)
B = np.empty((b,c,a,u), order='f', dtype=np.float32)
C = np.empty((n,m,c,o,b,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "o,u,m,n", B, "b,c,a,u", beta, C, "n,m,c,o,b,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("oumn,bcau->nmcoba", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
