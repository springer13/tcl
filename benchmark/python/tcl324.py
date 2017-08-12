import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 12
b = 12
m = 12
o = 16
n = 12
p = 12
u = 144
gflops = a*b*m*o*n*p*u*2/1e9
A = np.empty((u,p,m,o,n), order='f', dtype=np.float32)
B = np.empty((u,b,a), order='f', dtype=np.float32)
C = np.empty((o,m,n,a,p,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,p,m,o,n", B, "u,b,a", beta, C, "o,m,n,a,p,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("upmon,uba->omnapb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
