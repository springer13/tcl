import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 15
b = 15
m = 15
o = 16
n = 16
u = 48
v = 48
gflops = a*c*b*m*o*n*u*v*2/1e9
A = np.empty((o,v,m,n,u), order='f', dtype=np.float32)
B = np.empty((v,u,b,a,c), order='f', dtype=np.float32)
C = np.empty((n,a,m,o,b,c), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "o,v,m,n,u", B, "v,u,b,a,c", beta, C, "n,a,m,o,b,c" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("ovmnu,vubac->namobc", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
