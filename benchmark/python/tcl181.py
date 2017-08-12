import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 12
b = 8
m = 8
o = 8
n = 12
p = 12
u = 128
gflops = a*b*m*o*n*p*u*2/1e9
A = np.empty((o,m,u,n,p), order='f', dtype=np.float32)
B = np.empty((b,a,u), order='f', dtype=np.float32)
C = np.empty((m,n,b,p,a,o), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "o,m,u,n,p", B, "b,a,u", beta, C, "m,n,b,p,a,o" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("omunp,bau->mnbpao", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
