import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 15
c = 16
b = 15
m = 15
o = 16
n = 15
u = 54
v = 48
gflops = a*c*b*m*o*n*u*v*2/1e9
A = np.empty((v,n,o,m,u), order='f', dtype=np.float32)
B = np.empty((c,b,v,u,a), order='f', dtype=np.float32)
C = np.empty((o,b,n,a,c,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,n,o,m,u", B, "c,b,v,u,a", beta, C, "o,b,n,a,c,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vnomu,cbvua->obnacm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
