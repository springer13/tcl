import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 24
c = 20
b = 20
m = 24
n = 20
u = 432
gflops = a*c*b*m*n*u*2/1e9
A = np.empty((a,u,c,b), order='f', dtype=np.float32)
B = np.empty((m,n,u), order='f', dtype=np.float32)
C = np.empty((a,n,c,m,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,u,c,b", B, "m,n,u", beta, C, "a,n,c,m,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("aucb,mnu->ancmb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
