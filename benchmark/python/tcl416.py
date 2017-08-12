import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 12
c = 16
b = 12
d = 12
m = 8
n = 12
u = 16
v = 12
gflops = a*c*b*d*m*n*u*v*2/1e9
A = np.empty((u,b,v,c,d,a), order='f', dtype=np.float32)
B = np.empty((m,u,v,n), order='f', dtype=np.float32)
C = np.empty((c,b,a,m,d,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,b,v,c,d,a", B, "m,u,v,n", beta, C, "c,b,a,m,d,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("ubvcda,muvn->cbamdn", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
