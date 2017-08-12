import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 24
c = 24
b = 20
m = 20
n = 20
u = 20
v = 24
gflops = a*c*b*m*n*u*v*2/1e9
A = np.empty((a,b,v,u,c), order='f', dtype=np.float32)
B = np.empty((v,m,n,u), order='f', dtype=np.float32)
C = np.empty((c,b,m,a,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,b,v,u,c", B, "v,m,n,u", beta, C, "c,b,m,a,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("abvuc,vmnu->cbman", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
