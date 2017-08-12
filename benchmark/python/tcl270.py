import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 12
c = 8
b = 12
d = 8
m = 128
u = 12
v = 12
gflops = a*c*b*d*m*u*v*2/1e9
A = np.empty((c,a,u,v,d,b), order='f', dtype=np.float32)
B = np.empty((m,v,u), order='f', dtype=np.float32)
C = np.empty((d,a,b,c,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "c,a,u,v,d,b", B, "m,v,u", beta, C, "d,a,b,c,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("cauvdb,mvu->dabcm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
