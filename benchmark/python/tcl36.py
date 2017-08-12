import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 10
b = 10
m = 9
o = 8
n = 8
p = 10
u = 96
gflops = a*b*m*o*n*p*u*2/1e9
A = np.empty((n,o,p,u,m), order='f', dtype=np.float32)
B = np.empty((u,a,b), order='f', dtype=np.float32)
C = np.empty((o,m,n,b,p,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "n,o,p,u,m", B, "u,a,b", beta, C, "o,m,n,b,p,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("nopum,uab->omnbpa", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
