import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
b = 16
m = 16
o = 16
n = 18
p = 18
u = 18
v = 16
gflops = a*b*m*o*n*p*u*v*2/1e9
A = np.empty((o,u,m,n,p,v), order='f', dtype=np.float32)
B = np.empty((v,a,b,u), order='f', dtype=np.float32)
C = np.empty((m,b,p,o,n,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "o,u,m,n,p,v", B, "v,a,b,u", beta, C, "m,b,p,o,n,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("oumnpv,vabu->mbpona", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
