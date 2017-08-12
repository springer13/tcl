import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 16
b = 12
m = 1800
u = 12
w = 16
v = 12
gflops = a*c*b*m*u*w*v*2/1e9
A = np.empty((a,c,v,w,u,b), order='f', dtype=np.float32)
B = np.empty((w,m,u,v), order='f', dtype=np.float32)
C = np.empty((c,a,m,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,c,v,w,u,b", B, "w,m,u,v", beta, C, "c,a,m,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("acvwub,wmuv->camb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
