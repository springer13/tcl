import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 10
c = 10
b = 10
m = 960
u = 10
w = 8
v = 10
gflops = a*c*b*m*u*w*v*2/1e9
A = np.empty((w,u,v,m), order='f', dtype=np.float32)
B = np.empty((w,v,b,u,c,a), order='f', dtype=np.float32)
C = np.empty((m,a,c,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "w,u,v,m", B, "w,v,b,u,c,a", beta, C, "m,a,c,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("wuvm,wvbuca->macb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
