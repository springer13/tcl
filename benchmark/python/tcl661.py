import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 15
b = 16
m = 16
o = 15
n = 15
p = 15
u = 15
v = 16
gflops = a*b*m*o*n*p*u*v*2/1e9
A = np.empty((v,a,b,u), order='f', dtype=np.float32)
B = np.empty((v,o,p,m,u,n), order='f', dtype=np.float32)
C = np.empty((b,n,a,m,p,o), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,a,b,u", B, "v,o,p,m,u,n", beta, C, "b,n,a,m,p,o" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vabu,vopmun->bnampo", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
