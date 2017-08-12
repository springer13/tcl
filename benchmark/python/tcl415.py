import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 12
b = 12
d = 12
m = 144
u = 16
v = 12
gflops = a*c*b*d*m*u*v*2/1e9
A = np.empty((u,b,a,c,v,d), order='f', dtype=np.float32)
B = np.empty((m,v,u), order='f', dtype=np.float32)
C = np.empty((a,d,b,m,c), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,b,a,c,v,d", B, "m,v,u", beta, C, "a,d,b,m,c" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("ubacvd,mvu->adbmc", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
