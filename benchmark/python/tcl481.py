import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 50
m = 48
c = 48
b = 50
u = 48
gflops = a*m*c*b*u*2/1e9
A = np.empty((u,m), order='f', dtype=np.float32)
B = np.empty((c,b,a,u), order='f', dtype=np.float32)
C = np.empty((m,c,a,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,m", B, "c,b,a,u", beta, C, "m,c,a,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("um,cbau->mcab", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
