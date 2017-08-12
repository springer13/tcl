import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 12
c = 12
b = 8
d = 12
m = 12
n = 8
u = 128
gflops = a*c*b*d*m*n*u*2/1e9
A = np.empty((u,a,c,d,b), order='f', dtype=np.float32)
B = np.empty((n,m,u), order='f', dtype=np.float32)
C = np.empty((b,c,n,d,m,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,a,c,d,b", B, "n,m,u", beta, C, "b,c,n,d,m,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("uacdb,nmu->bcndma", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
