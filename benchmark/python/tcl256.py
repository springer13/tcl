import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
b = 18
m = 18
n = 18
u = 20
w = 20
v = 16
gflops = a*b*m*n*u*w*v*2/1e9
A = np.empty((a,u,v,w,b), order='f', dtype=np.float32)
B = np.empty((v,u,n,w,m), order='f', dtype=np.float32)
C = np.empty((a,b,m,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,u,v,w,b", B, "v,u,n,w,m", beta, C, "a,b,m,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("auvwb,vunwm->abmn", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
