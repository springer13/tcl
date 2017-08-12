import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 25
b = 24
m = 24
o = 25
n = 25
u = 600
gflops = a*b*m*o*n*u*2/1e9
A = np.empty((m,n,u,o), order='f', dtype=np.float32)
B = np.empty((b,u,a), order='f', dtype=np.float32)
C = np.empty((m,a,o,b,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,n,u,o", B, "b,u,a", beta, C, "m,a,o,b,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("mnuo,bua->maobn", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
