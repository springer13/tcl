import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 32
c = 30
b = 30
d = 30
m = 24
u = 32
gflops = a*c*b*d*m*u*2/1e9
A = np.empty((u,m), order='f', dtype=np.float32)
B = np.empty((a,d,b,c,u), order='f', dtype=np.float32)
C = np.empty((m,b,a,c,d), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,m", B, "a,d,b,c,u", beta, C, "m,b,a,c,d" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("um,adbcu->mbacd", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
