import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 240
m = 16
o = 18
n = 18
p = 18
u = 18
v = 16
gflops = a*m*o*n*p*u*v*2/1e9
A = np.empty((v,a,u), order='f', dtype=np.float32)
B = np.empty((m,v,u,p,o,n), order='f', dtype=np.float32)
C = np.empty((a,m,o,p,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,a,u", B, "m,v,u,p,o,n", beta, C, "a,m,o,p,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vau,mvupon->amopn", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
