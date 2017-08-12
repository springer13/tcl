import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 18
c = 16
b = 18
d = 16
m = 16
n = 18
u = 250
gflops = a*c*b*d*m*n*u*2/1e9
A = np.empty((c,u,b,d,a), order='f', dtype=np.float32)
B = np.empty((m,n,u), order='f', dtype=np.float32)
C = np.empty((d,b,m,a,n,c), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "c,u,b,d,a", B, "m,n,u", beta, C, "d,b,m,a,n,c" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("cubda,mnu->dbmanc", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
