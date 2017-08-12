import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 15
b = 15
m = 15
o = 16
n = 15
u = 3125
gflops = a*c*b*m*o*n*u*2/1e9
A = np.empty((a,b,c,u), order='f', dtype=np.float32)
B = np.empty((o,m,u,n), order='f', dtype=np.float32)
C = np.empty((a,m,n,c,o,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,b,c,u", B, "o,m,u,n", beta, C, "a,m,n,c,o,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("abcu,omun->amncob", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
