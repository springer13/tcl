import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 24
c = 24
b = 24
m = 480
u = 24
v = 24
gflops = a*c*b*m*u*v*2/1e9
A = np.empty((c,b,v,a,u), order='f', dtype=np.float32)
B = np.empty((u,v,m), order='f', dtype=np.float32)
C = np.empty((a,b,c,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "c,b,v,a,u", B, "u,v,m", beta, C, "a,b,c,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("cbvau,uvm->abcm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
