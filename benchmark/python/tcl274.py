import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 12
c = 12
b = 12
d = 12
m = 8
n = 12
u = 12
v = 8
gflops = a*c*b*d*m*n*u*v*2/1e9
A = np.empty((m,v,n,u), order='f', dtype=np.float32)
B = np.empty((v,b,a,d,c,u), order='f', dtype=np.float32)
C = np.empty((m,c,a,b,d,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,v,n,u", B, "v,b,a,d,c,u", beta, C, "m,c,a,b,d,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("mvnu,vbadcu->mcabdn", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
