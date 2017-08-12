import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
b = 15
m = 16
o = 15
n = 15
p = 16
u = 162
gflops = a*b*m*o*n*p*u*2/1e9
A = np.empty((m,o,n,p,u), order='f', dtype=np.float32)
B = np.empty((a,b,u), order='f', dtype=np.float32)
C = np.empty((p,n,b,a,o,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,o,n,p,u", B, "a,b,u", beta, C, "p,n,b,a,o,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("monpu,abu->pnbaom", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
