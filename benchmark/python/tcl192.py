import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 40
u = 40
c = 40
b = 40
m = 48
gflops = a*u*c*b*m*2/1e9
A = np.empty((m,u), order='f', dtype=np.float32)
B = np.empty((a,b,c,u), order='f', dtype=np.float32)
C = np.empty((m,a,c,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,u", B, "a,b,c,u", beta, C, "m,a,c,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("mu,abcu->macb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
