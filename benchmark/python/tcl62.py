import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 10
c = 10
b = 10
m = 9
o = 8
n = 10
u = 1000
gflops = a*c*b*m*o*n*u*2/1e9
A = np.empty((u,n,m,o), order='f', dtype=np.float32)
B = np.empty((u,b,a,c), order='f', dtype=np.float32)
C = np.empty((o,a,m,n,b,c), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,n,m,o", B, "u,b,a,c", beta, C, "o,a,m,n,b,c" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("unmo,ubac->oamnbc", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
