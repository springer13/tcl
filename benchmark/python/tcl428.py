import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 16
b = 12
m = 16
o = 12
n = 12
u = 12
w = 12
v = 12
gflops = a*c*b*m*o*n*u*w*v*2/1e9
A = np.empty((a,v,u,c,w,b), order='f', dtype=np.float32)
B = np.empty((m,u,n,w,o,v), order='f', dtype=np.float32)
C = np.empty((c,o,n,b,m,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "a,v,u,c,w,b", B, "m,u,n,w,o,v", beta, C, "c,o,n,b,m,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("avucwb,munwov->conbma", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
