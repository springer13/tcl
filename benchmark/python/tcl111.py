import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 10
c = 10
b = 8
m = 9
o = 8
n = 10
u = 32
v = 32
gflops = a*c*b*m*o*n*u*v*2/1e9
A = np.empty((u,v,o,m,n), order='f', dtype=np.float32)
B = np.empty((b,c,v,a,u), order='f', dtype=np.float32)
C = np.empty((o,c,a,n,m,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,v,o,m,n", B, "b,c,v,a,u", beta, C, "o,c,a,n,m,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("uvomn,bcvau->ocanmb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
