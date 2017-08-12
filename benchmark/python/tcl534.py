import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 24
c = 24
b = 24
m = 20
n = 24
u = 24
v = 24
gflops = a*c*b*m*n*u*v*2/1e9
A = np.empty((v,n,m,u), order='f', dtype=np.float32)
B = np.empty((v,c,a,u,b), order='f', dtype=np.float32)
C = np.empty((n,a,c,m,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,n,m,u", B, "v,c,a,u,b", beta, C, "n,a,c,m,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vnmu,vcaub->nacmb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
