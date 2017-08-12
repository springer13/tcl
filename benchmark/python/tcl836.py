import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 16
b = 16
m = 15
o = 16
n = 16
u = 60
v = 60
gflops = a*c*b*m*o*n*u*v*2/1e9
A = np.empty((o,u,v,n,m), order='f', dtype=np.float32)
B = np.empty((b,a,c,v,u), order='f', dtype=np.float32)
C = np.empty((n,c,m,a,b,o), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "o,u,v,n,m", B, "b,a,c,v,u", beta, C, "n,c,m,a,b,o" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("ouvnm,bacvu->ncmabo", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
