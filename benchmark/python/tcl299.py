import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 24
m = 20
o = 20
n = 20
p = 20
u = 24
gflops = a*m*o*n*p*u*2/1e9
A = np.empty((u,a), order='f', dtype=np.float32)
B = np.empty((u,o,m,n,p), order='f', dtype=np.float32)
C = np.empty((a,m,p,n,o), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,a", B, "u,o,m,n,p", beta, C, "a,m,p,n,o" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("ua,uomnp->ampno", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
