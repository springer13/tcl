import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 18
c = 18
b = 16
m = 4608
u = 18
w = 16
v = 18
gflops = a*c*b*m*u*w*v*2/1e9
A = np.empty((w,m,u,v), order='f', dtype=np.float32)
B = np.empty((b,c,a,w,v,u), order='f', dtype=np.float32)
C = np.empty((m,c,b,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "w,m,u,v", B, "b,c,a,w,v,u", beta, C, "m,c,b,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("wmuv,bcawvu->mcba", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
