import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 128
m = 12
o = 8
n = 12
p = 8
u = 12
v = 12
gflops = a*m*o*n*p*u*v*2/1e9
A = np.empty((o,p,u,n,v,m), order='f', dtype=np.float32)
B = np.empty((a,v,u), order='f', dtype=np.float32)
C = np.empty((p,a,n,m,o), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "o,p,u,n,v,m", B, "a,v,u", beta, C, "p,a,n,m,o" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("opunvm,avu->panmo", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
