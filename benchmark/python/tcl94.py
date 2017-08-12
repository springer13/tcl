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
m = 8
n = 9
u = 96
gflops = a*c*b*d*m*n*u*2/1e9
A = np.empty((u,m,n), order='f', dtype=np.float32)
B = np.empty((a,b,u,d,c), order='f', dtype=np.float32)
C = np.empty((m,c,d,n,b,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,m,n", B, "a,b,u,d,c", beta, C, "m,c,d,n,b,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("umn,abudc->mcdnba", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
