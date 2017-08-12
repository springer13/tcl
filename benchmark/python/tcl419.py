import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 12
c = 12
b = 12
d = 16
m = 12
n = 12
u = 16
v = 16
gflops = a*c*b*d*m*n*u*v*2/1e9
A = np.empty((u,b,v,c,d,a), order='f', dtype=np.float32)
B = np.empty((v,n,m,u), order='f', dtype=np.float32)
C = np.empty((d,m,a,b,n,c), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,b,v,c,d,a", B, "v,n,m,u", beta, C, "d,m,a,b,n,c" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("ubvcda,vnmu->dmabnc", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
