import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 16
b = 16
m = 16
o = 15
n = 16
u = 3456
gflops = a*c*b*m*o*n*u*2/1e9
A = np.empty((m,u,n,o), order='f', dtype=np.float32)
B = np.empty((u,c,b,a), order='f', dtype=np.float32)
C = np.empty((n,a,c,o,m,b), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,u,n,o", B, "u,c,b,a", beta, C, "n,a,c,o,m,b" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("muno,ucba->nacomb", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
