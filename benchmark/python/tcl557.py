import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 15
c = 15
b = 16
e = 15
d = 16
m = 16
u = 15
gflops = a*c*b*e*d*m*u*2/1e9
A = np.empty((d,a,b,u,e,c), order='f', dtype=np.float32)
B = np.empty((m,u), order='f', dtype=np.float32)
C = np.empty((b,m,c,a,e,d), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "d,a,b,u,e,c", B, "m,u", beta, C, "b,m,c,a,e,d" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("dabuec,mu->bmcaed", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
