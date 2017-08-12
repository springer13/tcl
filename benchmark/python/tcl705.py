import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 15
c = 16
b = 15
d = 16
m = 200
u = 15
v = 15
gflops = a*c*b*d*m*u*v*2/1e9
A = np.empty((c,b,a,u,d,v), order='f', dtype=np.float32)
B = np.empty((m,u,v), order='f', dtype=np.float32)
C = np.empty((d,a,b,c,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "c,b,a,u,d,v", B, "m,u,v", beta, C, "d,a,b,c,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("cbaudv,muv->dabcm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
