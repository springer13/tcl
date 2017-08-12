import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
b = 18
m = 20
o = 20
n = 20
u = 16
v = 20
gflops = a*b*m*o*n*u*v*2/1e9
A = np.empty((a,u,b,v), order='f', dtype=np.float32)
B = np.empty((u,v,n,m,o), order='f', dtype=np.float32)
C = np.empty((a,b,o,m,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,u,b,v", B, "u,v,n,m,o", beta, C, "a,b,o,m,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("aubv,uvnmo->abomn", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
