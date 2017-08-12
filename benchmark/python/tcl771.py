import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 200
m = 16
o = 15
n = 16
p = 16
u = 16
v = 16
gflops = a*m*o*n*p*u*v*2/1e9
A = np.empty((p,o,m,n,u,v), order='f', dtype=np.float32)
B = np.empty((a,v,u), order='f', dtype=np.float32)
C = np.empty((m,a,o,n,p), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "p,o,m,n,u,v", B, "a,v,u", beta, C, "m,a,o,n,p" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("pomnuv,avu->maonp", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
