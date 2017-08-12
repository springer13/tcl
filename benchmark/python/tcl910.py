import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 864
m = 30
o = 32
n = 32
u = 32
v = 30
gflops = a*m*o*n*u*v*2/1e9
A = np.empty((n,v,u,o,m), order='f', dtype=np.float32)
B = np.empty((u,a,v), order='f', dtype=np.float32)
C = np.empty((o,n,m,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "n,v,u,o,m", B, "u,a,v", beta, C, "o,n,m,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("nvuom,uav->onma", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
