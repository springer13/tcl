import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 12
c = 12
b = 16
e = 12
d = 12
m = 24
u = 12
gflops = a*c*b*e*d*m*u*2/1e9
A = np.empty((m,u), order='f', dtype=np.float32)
B = np.empty((b,u,d,a,e,c), order='f', dtype=np.float32)
C = np.empty((m,c,a,b,e,d), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,u", B, "b,u,d,a,e,c", beta, C, "m,c,a,b,e,d" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("mu,budaec->mcabed", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
