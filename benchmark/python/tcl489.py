import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 48
m = 2560
b = 48
u = 50
v = 50
gflops = a*m*b*u*v*2/1e9
A = np.empty((a,u,b,v), order='f', dtype=np.float32)
B = np.empty((m,v,u), order='f', dtype=np.float32)
C = np.empty((b,m,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,u,b,v", B, "m,v,u", beta, C, "b,m,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("aubv,mvu->bma", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
