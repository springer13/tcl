import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 24
c = 20
b = 20
m = 24
n = 20
u = 20
v = 24
gflops = a*c*b*m*n*u*v*2/1e9
A = np.empty((v,m,n,u), order='f', dtype=np.float32)
B = np.empty((a,b,v,u,c), order='f', dtype=np.float32)
C = np.empty((m,c,n,b,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,m,n,u", B, "a,b,v,u,c", beta, C, "m,c,n,b,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vmnu,abvuc->mcnba", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
