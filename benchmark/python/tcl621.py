import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 600
m = 25
o = 24
n = 25
u = 24
v = 25
gflops = a*m*o*n*u*v*2/1e9
A = np.empty((u,v,a), order='f', dtype=np.float32)
B = np.empty((o,m,u,n,v), order='f', dtype=np.float32)
C = np.empty((a,m,n,o), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,v,a", B, "o,m,u,n,v", beta, C, "a,m,n,o" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("uva,omunv->amno", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
