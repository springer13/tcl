import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 15
b = 15
m = 48
n = 48
u = 15
w = 16
v = 16
gflops = a*c*b*m*n*u*w*v*2/1e9
A = np.empty((v,n,u,w,m), order='f', dtype=np.float32)
B = np.empty((w,c,a,u,b,v), order='f', dtype=np.float32)
C = np.empty((m,c,n,b,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,n,u,w,m", B, "w,c,a,u,b,v", beta, C, "m,c,n,b,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vnuwm,wcaubv->mcnba", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
