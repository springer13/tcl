import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 64
m = 64
c = 60
b = 64
u = 64
gflops = a*m*c*b*u*2/1e9
A = np.empty((b,u,c,a), order='f', dtype=np.float32)
B = np.empty((m,u), order='f', dtype=np.float32)
C = np.empty((a,b,m,c), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "b,u,c,a", B, "m,u", beta, C, "a,b,m,c" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("buca,mu->abmc", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
