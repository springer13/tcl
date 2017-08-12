import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 128
u = 135
m = 144
v = 144
gflops = a*u*m*v*2/1e9
A = np.empty((v,m,u), order='f', dtype=np.float32)
B = np.empty((v,a,u), order='f', dtype=np.float32)
C = np.empty((m,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,m,u", B, "v,a,u", beta, C, "m,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vmu,vau->ma", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
