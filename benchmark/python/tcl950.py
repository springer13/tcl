import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
b = 16
m = 18
o = 16
n = 18
p = 16
u = 18
v = 16
gflops = a*b*m*o*n*p*u*v*2/1e9
A = np.empty((o,m,n,u,p,v), order='f', dtype=np.float32)
B = np.empty((v,a,b,u), order='f', dtype=np.float32)
C = np.empty((p,b,a,n,m,o), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "o,m,n,u,p,v", B, "v,a,b,u", beta, C, "p,b,a,n,m,o" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("omnupv,vabu->pbanmo", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
