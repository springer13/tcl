import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 64
b = 60
m = 16
o = 16
n = 16
u = 16
w = 16
v = 16
gflops = a*b*m*o*n*u*w*v*2/1e9
A = np.empty((v,b,a,w,u), order='f', dtype=np.float32)
B = np.empty((w,o,m,u,v,n), order='f', dtype=np.float32)
C = np.empty((a,m,b,n,o), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,b,a,w,u", B, "w,o,m,u,v,n", beta, C, "a,m,b,n,o" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vbawu,womuvn->ambno", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
