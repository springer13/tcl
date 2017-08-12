import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 15
c = 16
b = 15
d = 16
m = 16
n = 15
u = 200
gflops = a*c*b*d*m*n*u*2/1e9
A = np.empty((c,a,u,b,d), order='f', dtype=np.float32)
B = np.empty((m,u,n), order='f', dtype=np.float32)
C = np.empty((d,a,b,c,n,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "c,a,u,b,d", B, "m,u,n", beta, C, "d,a,b,c,n,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("caubd,mun->dabcnm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
