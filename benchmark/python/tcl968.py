import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 32
c = 30
b = 30
m = 864
u = 32
v = 32
gflops = a*c*b*m*u*v*2/1e9
A = np.empty((v,u,c,a,b), order='f', dtype=np.float32)
B = np.empty((u,m,v), order='f', dtype=np.float32)
C = np.empty((a,c,m,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,u,c,a,b", B, "u,m,v", beta, C, "a,c,m,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vucab,umv->acmb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
