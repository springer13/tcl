import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 8
c = 9
b = 10
d = 10
m = 10
n = 10
u = 8
v = 8
gflops = a*c*b*d*m*n*u*v*2/1e9
A = np.empty((u,d,a,v,c,b), order='f', dtype=np.float32)
B = np.empty((v,m,n,u), order='f', dtype=np.float32)
C = np.empty((a,d,c,m,b,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,d,a,v,c,b", B, "v,m,n,u", beta, C, "a,d,c,m,b,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("udavcb,vmnu->adcmbn", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
