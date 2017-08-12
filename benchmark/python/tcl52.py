import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 16
b = 16
m = 15
n = 16
u = 256
gflops = a*c*b*m*n*u*2/1e9
A = np.empty((u,n,m), order='f', dtype=np.float32)
B = np.empty((c,b,u,a), order='f', dtype=np.float32)
C = np.empty((n,a,c,m,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,n,m", B, "c,b,u,a", beta, C, "n,a,c,m,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("unm,cbua->nacmb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
