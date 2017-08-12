import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 16
b = 16
d = 16
m = 192
u = 16
v = 16
gflops = a*c*b*d*m*u*v*2/1e9
A = np.empty((v,m,u), order='f', dtype=np.float32)
B = np.empty((c,a,d,v,b,u), order='f', dtype=np.float32)
C = np.empty((m,a,c,b,d), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "v,m,u", B, "c,a,d,v,b,u", beta, C, "m,a,c,b,d" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("vmu,cadvbu->macbd", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
