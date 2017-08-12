import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 48
b = 45
m = 16
o = 16
n = 12
u = 12
w = 12
v = 16
gflops = a*b*m*o*n*u*w*v*2/1e9
A = np.empty((m,o,n,u,v,w), order='f', dtype=np.float32)
B = np.empty((v,u,a,b,w), order='f', dtype=np.float32)
C = np.empty((o,b,m,a,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,o,n,u,v,w", B, "v,u,a,b,w", beta, C, "o,b,m,a,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("monuvw,vuabw->obman", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
