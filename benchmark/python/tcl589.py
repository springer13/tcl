import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 24
m = 24
o = 25
n = 25
p = 25
u = 25
gflops = a*m*o*n*p*u*2/1e9
A = np.empty((a,u), order='f', dtype=np.float32)
B = np.empty((m,o,n,u,p), order='f', dtype=np.float32)
C = np.empty((a,o,p,n,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,u", B, "m,o,n,u,p", beta, C, "a,o,p,n,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("au,monup->aopnm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
