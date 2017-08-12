import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 25
c = 25
b = 24
d = 25
m = 24
u = 25
gflops = a*c*b*d*m*u*2/1e9
A = np.empty((m,u), order='f', dtype=np.float32)
B = np.empty((b,c,d,u,a), order='f', dtype=np.float32)
C = np.empty((m,c,a,d,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,u", B, "b,c,d,u,a", beta, C, "m,c,a,d,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("mu,bcdua->mcadb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
