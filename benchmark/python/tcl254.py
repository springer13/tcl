import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 12
c = 12
b = 8
m = 12
o = 12
n = 8
u = 40
v = 40
gflops = a*c*b*m*o*n*u*v*2/1e9
A = np.empty((u,v,n,m,o), order='f', dtype=np.float32)
B = np.empty((b,v,c,a,u), order='f', dtype=np.float32)
C = np.empty((n,o,b,m,a,c), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,v,n,m,o", B, "b,v,c,a,u", beta, C, "n,o,b,m,a,c" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("uvnmo,bvcau->nobmac", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
