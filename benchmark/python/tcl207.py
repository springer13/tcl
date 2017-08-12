import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 8
c = 12
b = 12
m = 12
o = 8
n = 12
u = 1500
gflops = a*c*b*m*o*n*u*2/1e9
A = np.empty((o,m,u,n), order='f', dtype=np.float32)
B = np.empty((a,b,c,u), order='f', dtype=np.float32)
C = np.empty((o,n,b,a,c,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "o,m,u,n", B, "a,b,c,u", beta, C, "o,n,b,a,c,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("omun,abcu->onbacm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
