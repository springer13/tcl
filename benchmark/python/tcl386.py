import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 20
c = 24
b = 20
m = 432
u = 24
v = 20
gflops = a*c*b*m*u*v*2/1e9
A = np.empty((u,a,c,b,v), order='f', dtype=np.float32)
B = np.empty((m,u,v), order='f', dtype=np.float32)
C = np.empty((c,a,b,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,a,c,b,v", B, "m,u,v", beta, C, "c,a,b,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("uacbv,muv->cabm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
