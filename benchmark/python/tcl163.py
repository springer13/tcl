import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 144
m = 128
b = 144
u = 144
gflops = a*m*b*u*2/1e9
A = np.empty((a,u,b), order='f', dtype=np.float32)
B = np.empty((u,m), order='f', dtype=np.float32)
C = np.empty((b,a,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,u,b", B, "u,m", beta, C, "b,a,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("aub,um->bam", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
