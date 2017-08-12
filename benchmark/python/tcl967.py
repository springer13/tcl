import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 30
c = 30
b = 30
m = 864
u = 32
v = 32
gflops = a*c*b*m*u*v*2/1e9
A = np.empty((u,m,v), order='f', dtype=np.float32)
B = np.empty((v,u,c,a,b), order='f', dtype=np.float32)
C = np.empty((m,b,a,c), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,m,v", B, "v,u,c,a,b", beta, C, "m,b,a,c" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("umv,vucab->mbac", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
