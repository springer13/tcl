import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 24
b = 27
m = 24
o = 27
n = 27
u = 24
v = 27
gflops = a*b*m*o*n*u*v*2/1e9
A = np.empty((u,a,v,b), order='f', dtype=np.float32)
B = np.empty((m,v,u,o,n), order='f', dtype=np.float32)
C = np.empty((a,n,o,b,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,a,v,b", B, "m,v,u,o,n", beta, C, "a,n,o,b,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("uavb,mvuon->anobm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
