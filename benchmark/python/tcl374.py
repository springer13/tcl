import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 1800
m = 16
o = 16
n = 12
u = 12
w = 16
v = 12
gflops = a*m*o*n*u*w*v*2/1e9
A = np.empty((m,u,o,n,v,w), order='f', dtype=np.float32)
B = np.empty((w,a,v,u), order='f', dtype=np.float32)
C = np.empty((o,a,n,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,u,o,n,v,w", B, "w,a,v,u", beta, C, "o,a,n,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("muonvw,wavu->oanm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
