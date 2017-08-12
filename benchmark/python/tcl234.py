import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 18
c = 20
b = 16
d = 16
m = 16
u = 20
gflops = a*c*b*d*m*u*2/1e9
A = np.empty((b,u,a,d,c), order='f', dtype=np.float32)
B = np.empty((m,u), order='f', dtype=np.float32)
C = np.empty((d,b,c,a,m), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "b,u,a,d,c", B, "m,u", beta, C, "d,b,c,a,m" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("buadc,mu->dbcam", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
