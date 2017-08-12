import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
b = 18
m = 18
o = 16
n = 20
u = 16
v = 20
gflops = a*b*m*o*n*u*v*2/1e9
A = np.empty((u,n,v,m,o), order='f', dtype=np.float32)
B = np.empty((a,u,b,v), order='f', dtype=np.float32)
C = np.empty((o,a,b,m,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,n,v,m,o", B, "a,u,b,v", beta, C, "o,a,b,m,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("unvmo,aubv->oabmn", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
