import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 27
c = 24
b = 27
m = 768
u = 27
v = 27
gflops = a*c*b*m*u*v*2/1e9
A = np.empty((m,u,v), order='f', dtype=np.float32)
B = np.empty((c,v,u,a,b), order='f', dtype=np.float32)
C = np.empty((m,b,c,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,u,v", B, "c,v,u,a,b", beta, C, "m,b,c,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("muv,cvuab->mbca", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
