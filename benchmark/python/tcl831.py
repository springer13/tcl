import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 27
b = 24
m = 768
u = 24
w = 24
v = 27
gflops = a*b*m*u*w*v*2/1e9
A = np.empty((w,a,b,v,u), order='f', dtype=np.float32)
B = np.empty((u,v,w,m), order='f', dtype=np.float32)
C = np.empty((b,a,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "w,a,b,v,u", B, "u,v,w,m", beta, C, "b,a,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("wabvu,uvwm->bam", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
