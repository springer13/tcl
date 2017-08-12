import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 200
m = 15
o = 15
n = 16
p = 15
u = 16
v = 15
gflops = a*m*o*n*p*u*v*2/1e9
A = np.empty((n,u,p,v,m,o), order='f', dtype=np.float32)
B = np.empty((u,a,v), order='f', dtype=np.float32)
C = np.empty((n,o,p,m,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "n,u,p,v,m,o", B, "u,a,v", beta, C, "n,o,p,m,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("nupvmo,uav->nopma", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
