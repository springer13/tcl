import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
m = 16
o = 18
n = 18
q = 18
p = 18
u = 18
gflops = a*m*o*n*q*p*u*2/1e9
A = np.empty((m,u,o,p,n,q), order='f', dtype=np.float32)
B = np.empty((a,u), order='f', dtype=np.float32)
C = np.empty((m,n,p,a,o,q), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,u,o,p,n,q", B, "a,u", beta, C, "m,n,p,a,o,q" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("muopnq,au->mnpaoq", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
