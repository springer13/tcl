import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 18
c = 16
b = 16
m = 16
n = 18
u = 20
v = 20
gflops = a*c*b*m*n*u*v*2/1e9
A = np.empty((c,u,b,a,v), order='f', dtype=np.float32)
B = np.empty((m,n,u,v), order='f', dtype=np.float32)
C = np.empty((b,c,a,n,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "c,u,b,a,v", B, "m,n,u,v", beta, C, "b,c,a,n,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("cubav,mnuv->bcanm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
