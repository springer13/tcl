import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 15
b = 15
m = 16
o = 15
n = 16
u = 15
w = 15
v = 16
gflops = a*c*b*m*o*n*u*w*v*2/1e9
A = np.empty((m,w,n,u,v,o), order='f', dtype=np.float32)
B = np.empty((v,w,b,u,c,a), order='f', dtype=np.float32)
C = np.empty((n,c,b,a,m,o), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,w,n,u,v,o", B, "v,w,b,u,c,a", beta, C, "n,c,b,a,m,o" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("mwnuvo,vwbuca->ncbamo", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
