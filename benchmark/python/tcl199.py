import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 20
c = 16
b = 20
m = 24
n = 16
u = 324
gflops = a*c*b*m*n*u*2/1e9
A = np.empty((m,n,u), order='f', dtype=np.float32)
B = np.empty((c,a,u,b), order='f', dtype=np.float32)
C = np.empty((n,b,a,c,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,n,u", B, "c,a,u,b", beta, C, "n,b,a,c,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("mnu,caub->nbacm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
