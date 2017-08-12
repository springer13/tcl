import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 15
b = 16
m = 16
o = 15
n = 15
u = 15
w = 15
v = 15
gflops = a*c*b*m*o*n*u*w*v*2/1e9
A = np.empty((b,c,a,w,v,u), order='f', dtype=np.float32)
B = np.empty((m,n,o,u,v,w), order='f', dtype=np.float32)
C = np.empty((a,n,c,m,o,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "b,c,a,w,v,u", B, "m,n,o,u,v,w", beta, C, "a,n,c,m,o,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("bcawvu,mnouvw->ancmob", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
