import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 12
c = 16
b = 12
m = 12
o = 12
n = 16
u = 1800
gflops = a*c*b*m*o*n*u*2/1e9
A = np.empty((n,m,u,o), order='f', dtype=np.float32)
B = np.empty((c,b,u,a), order='f', dtype=np.float32)
C = np.empty((n,b,c,a,m,o), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "n,m,u,o", B, "c,b,u,a", beta, C, "n,b,c,a,m,o" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("nmuo,cbua->nbcamo", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
