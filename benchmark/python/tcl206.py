import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 8
c = 8
b = 12
m = 12
o = 8
n = 12
u = 1500
gflops = a*c*b*m*o*n*u*2/1e9
A = np.empty((a,b,c,u), order='f', dtype=np.float32)
B = np.empty((o,m,u,n), order='f', dtype=np.float32)
C = np.empty((c,m,b,o,a,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,b,c,u", B, "o,m,u,n", beta, C, "c,m,b,o,a,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("abcu,omun->cmboan", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
