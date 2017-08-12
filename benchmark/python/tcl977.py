import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 18
c = 16
b = 18
m = 16
o = 18
n = 18
u = 64
v = 64
gflops = a*c*b*m*o*n*u*v*2/1e9
A = np.empty((m,u,o,v,n), order='f', dtype=np.float32)
B = np.empty((c,v,b,u,a), order='f', dtype=np.float32)
C = np.empty((m,a,o,n,c,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,u,o,v,n", B, "c,v,b,u,a", beta, C, "m,a,o,n,c,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("muovn,cvbua->maoncb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
