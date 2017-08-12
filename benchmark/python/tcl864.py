import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 16
b = 16
m = 60
n = 64
u = 16
w = 16
v = 16
gflops = a*c*b*m*n*u*w*v*2/1e9
A = np.empty((v,m,w,u,n), order='f', dtype=np.float32)
B = np.empty((a,b,u,c,v,w), order='f', dtype=np.float32)
C = np.empty((n,a,c,b,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,m,w,u,n", B, "a,b,u,c,v,w", beta, C, "n,a,c,b,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vmwun,abucvw->nacbm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
