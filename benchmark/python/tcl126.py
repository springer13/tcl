import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 8
c = 10
b = 10
d = 10
m = 96
u = 10
v = 8
gflops = a*c*b*d*m*u*v*2/1e9
A = np.empty((v,u,m), order='f', dtype=np.float32)
B = np.empty((a,d,b,u,v,c), order='f', dtype=np.float32)
C = np.empty((m,b,d,c,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,u,m", B, "a,d,b,u,v,c", beta, C, "m,b,d,c,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vum,adbuvc->mbdca", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
