import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 24
b = 25
m = 25
o = 25
n = 24
u = 25
v = 24
gflops = a*b*m*o*n*u*v*2/1e9
A = np.empty((v,o,m,n,u), order='f', dtype=np.float32)
B = np.empty((v,b,a,u), order='f', dtype=np.float32)
C = np.empty((n,m,b,o,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,o,m,n,u", B, "v,b,a,u", beta, C, "n,m,b,o,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vomnu,vbau->nmboa", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
