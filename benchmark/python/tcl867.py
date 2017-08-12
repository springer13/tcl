import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 16
b = 16
m = 15
o = 16
n = 16
u = 16
w = 16
v = 16
gflops = a*c*b*m*o*n*u*w*v*2/1e9
A = np.empty((v,u,n,m,w,o), order='f', dtype=np.float32)
B = np.empty((u,b,a,v,c,w), order='f', dtype=np.float32)
C = np.empty((n,b,o,a,m,c), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,u,n,m,w,o", B, "u,b,a,v,c,w", beta, C, "n,b,o,a,m,c" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vunmwo,ubavcw->nboamc", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
