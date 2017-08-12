import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 9
c = 10
b = 8
m = 10
o = 10
n = 10
u = 32
v = 32
gflops = a*c*b*m*o*n*u*v*2/1e9
A = np.empty((b,c,v,a,u), order='f', dtype=np.float32)
B = np.empty((u,n,v,o,m), order='f', dtype=np.float32)
C = np.empty((b,m,a,o,c,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "b,c,v,a,u", B, "u,n,v,o,m", beta, C, "b,m,a,o,c,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("bcvau,unvom->bmaocn", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
