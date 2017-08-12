import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 18
b = 16
m = 324
u = 16
v = 20
gflops = a*c*b*m*u*v*2/1e9
A = np.empty((a,u,b,c,v), order='f', dtype=np.float32)
B = np.empty((u,v,m), order='f', dtype=np.float32)
C = np.empty((b,m,c,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,u,b,c,v", B, "u,v,m", beta, C, "b,m,c,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("aubcv,uvm->bmca", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
