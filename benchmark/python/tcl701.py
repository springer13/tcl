import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 16
b = 15
e = 15
d = 15
m = 16
u = 16
gflops = a*c*b*e*d*m*u*2/1e9
A = np.empty((c,a,b,d,e,u), order='f', dtype=np.float32)
B = np.empty((u,m), order='f', dtype=np.float32)
C = np.empty((a,e,d,m,b,c), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "c,a,b,d,e,u", B, "u,m", beta, C, "a,e,d,m,b,c" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("cabdeu,um->aedmbc", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
