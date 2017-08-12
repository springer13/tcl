import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 20
b = 20
m = 24
o = 20
n = 20
u = 20
v = 24
gflops = a*b*m*o*n*u*v*2/1e9
A = np.empty((m,n,u,o,v), order='f', dtype=np.float32)
B = np.empty((v,a,u,b), order='f', dtype=np.float32)
C = np.empty((m,b,n,a,o), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,n,u,o,v", B, "v,a,u,b", beta, C, "m,b,n,a,o" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("mnuov,vaub->mbnao", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
