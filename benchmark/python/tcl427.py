import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 12
c = 12
b = 16
m = 48
n = 40
u = 12
w = 12
v = 12
gflops = a*c*b*m*n*u*w*v*2/1e9
A = np.empty((m,w,v,n,u), order='f', dtype=np.float32)
B = np.empty((b,a,c,w,u,v), order='f', dtype=np.float32)
C = np.empty((n,c,a,b,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,w,v,n,u", B, "b,a,c,w,u,v", beta, C, "n,c,a,b,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("mwvnu,bacwuv->ncabm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
