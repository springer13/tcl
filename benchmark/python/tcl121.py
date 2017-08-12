import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 10
c = 10
b = 10
e = 10
d = 10
m = 24
u = 8
gflops = a*c*b*e*d*m*u*2/1e9
A = np.empty((m,u), order='f', dtype=np.float32)
B = np.empty((u,c,e,b,a,d), order='f', dtype=np.float32)
C = np.empty((m,d,e,a,b,c), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,u", B, "u,c,e,b,a,d", beta, C, "m,d,e,a,b,c" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("mu,ucebad->mdeabc", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
