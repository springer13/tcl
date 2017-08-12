import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 24
b = 27
m = 768
u = 24
w = 24
v = 27
gflops = a*b*m*u*w*v*2/1e9
A = np.empty((u,v,w,m), order='f', dtype=np.float32)
B = np.empty((w,a,b,v,u), order='f', dtype=np.float32)
C = np.empty((m,b,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,v,w,m", B, "w,a,b,v,u", beta, C, "m,b,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("uvwm,wabvu->mba", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
