import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
b = 15
m = 16
o = 15
n = 15
p = 15
u = 15
v = 16
gflops = a*b*m*o*n*p*u*v*2/1e9
A = np.empty((v,o,p,m,u,n), order='f', dtype=np.float32)
B = np.empty((v,a,b,u), order='f', dtype=np.float32)
C = np.empty((m,p,b,n,o,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,o,p,m,u,n", B, "v,a,b,u", beta, C, "m,p,b,n,o,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vopmun,vabu->mpbnoa", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
