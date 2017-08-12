import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 12
b = 12
m = 12
o = 16
n = 16
u = 12
w = 12
v = 12
gflops = a*c*b*m*o*n*u*w*v*2/1e9
A = np.empty((o,w,u,n,v,m), order='f', dtype=np.float32)
B = np.empty((a,v,u,c,w,b), order='f', dtype=np.float32)
C = np.empty((n,m,c,o,a,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "o,w,u,n,v,m", B, "a,v,u,c,w,b", beta, C, "n,m,c,o,a,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("owunvm,avucwb->nmcoab", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
