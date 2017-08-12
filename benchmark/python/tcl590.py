import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
m = 16
o = 16
n = 15
q = 15
p = 15
u = 16
gflops = a*m*o*n*q*p*u*2/1e9
A = np.empty((o,m,p,u,n,q), order='f', dtype=np.float32)
B = np.empty((u,a), order='f', dtype=np.float32)
C = np.empty((m,q,n,o,a,p), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "o,m,p,u,n,q", B, "u,a", beta, C, "m,q,n,o,a,p" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("ompunq,ua->mqnoap", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
