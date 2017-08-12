import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 768
m = 24
o = 27
n = 24
u = 24
v = 27
gflops = a*m*o*n*u*v*2/1e9
A = np.empty((m,v,u,n,o), order='f', dtype=np.float32)
B = np.empty((u,a,v), order='f', dtype=np.float32)
C = np.empty((n,a,o,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,v,u,n,o", B, "u,a,v", beta, C, "n,a,o,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("mvuno,uav->naom", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
