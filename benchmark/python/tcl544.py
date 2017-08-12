import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 15
c = 16
b = 15
m = 16
o = 15
n = 15
u = 48
v = 48
gflops = a*c*b*m*o*n*u*v*2/1e9
A = np.empty((v,u,b,a,c), order='f', dtype=np.float32)
B = np.empty((u,o,n,v,m), order='f', dtype=np.float32)
C = np.empty((c,b,m,o,a,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,u,b,a,c", B, "u,o,n,v,m", beta, C, "c,b,m,o,a,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vubac,uonvm->cbmoan", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
