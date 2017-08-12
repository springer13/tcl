import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 12
b = 12
m = 16
o = 12
n = 16
u = 45
v = 45
gflops = a*c*b*m*o*n*u*v*2/1e9
A = np.empty((m,u,o,n,v), order='f', dtype=np.float32)
B = np.empty((a,v,b,u,c), order='f', dtype=np.float32)
C = np.empty((n,b,o,a,m,c), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,u,o,n,v", B, "a,v,b,u,c", beta, C, "n,b,o,a,m,c" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("muonv,avbuc->nboamc", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
