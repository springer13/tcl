import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 8
b = 10
m = 9
o = 10
n = 8
p = 10
u = 10
v = 10
gflops = a*b*m*o*n*p*u*v*2/1e9
A = np.empty((n,p,o,m,u,v), order='f', dtype=np.float32)
B = np.empty((a,u,b,v), order='f', dtype=np.float32)
C = np.empty((n,o,a,p,m,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "n,p,o,m,u,v", B, "a,u,b,v", beta, C, "n,o,a,p,m,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("npomuv,aubv->noapmb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
