import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 96
m = 10
o = 10
n = 10
p = 8
u = 10
v = 8
gflops = a*m*o*n*p*u*v*2/1e9
A = np.empty((v,u,a), order='f', dtype=np.float32)
B = np.empty((p,u,v,m,o,n), order='f', dtype=np.float32)
C = np.empty((a,m,p,n,o), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,u,a", B, "p,u,v,m,o,n", beta, C, "a,m,p,n,o" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vua,puvmon->ampno", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
