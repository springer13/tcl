import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 15
b = 15
m = 3072
u = 15
w = 16
v = 15
gflops = a*c*b*m*u*w*v*2/1e9
A = np.empty((m,u,w,v), order='f', dtype=np.float32)
B = np.empty((w,a,v,c,b,u), order='f', dtype=np.float32)
C = np.empty((m,c,a,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,u,w,v", B, "w,a,v,c,b,u", beta, C, "m,c,a,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("muwv,wavcbu->mcab", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
