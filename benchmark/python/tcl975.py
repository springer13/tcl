import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 30
b = 32
m = 864
u = 30
w = 30
v = 30
gflops = a*b*m*u*w*v*2/1e9
A = np.empty((b,u,a,v,w), order='f', dtype=np.float32)
B = np.empty((m,w,u,v), order='f', dtype=np.float32)
C = np.empty((b,a,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "b,u,a,v,w", B, "m,w,u,v", beta, C, "b,a,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("buavw,mwuv->bam", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
