import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 24
b = 24
m = 480
u = 24
w = 24
v = 24
gflops = a*b*m*u*w*v*2/1e9
A = np.empty((a,b,v,u,w), order='f', dtype=np.float32)
B = np.empty((v,w,m,u), order='f', dtype=np.float32)
C = np.empty((b,a,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,b,v,u,w", B, "v,w,m,u", beta, C, "b,a,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("abvuw,vwmu->bam", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
