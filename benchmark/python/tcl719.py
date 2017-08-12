import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 15
c = 16
b = 15
m = 54
n = 48
u = 15
w = 15
v = 16
gflops = a*c*b*m*n*u*w*v*2/1e9
A = np.empty((v,w,c,u,a,b), order='f', dtype=np.float32)
B = np.empty((n,w,v,m,u), order='f', dtype=np.float32)
C = np.empty((c,a,n,b,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,w,c,u,a,b", B, "n,w,v,m,u", beta, C, "c,a,n,b,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vwcuab,nwvmu->canbm", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
