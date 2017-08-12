import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 24
m = 16
o = 16
n = 16
p = 16
u = 16
gflops = a*m*o*n*p*u*2/1e9
A = np.empty((u,a), order='f', dtype=np.float32)
B = np.empty((o,p,m,u,n), order='f', dtype=np.float32)
C = np.empty((a,p,n,m,o), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,a", B, "o,p,m,u,n", beta, C, "a,p,n,m,o" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("ua,opmun->apnmo", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
