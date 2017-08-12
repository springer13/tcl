import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 15
c = 16
b = 16
m = 16
o = 16
n = 16
u = 60
v = 60
gflops = a*c*b*m*o*n*u*v*2/1e9
A = np.empty((b,a,c,v,u), order='f', dtype=np.float32)
B = np.empty((n,m,u,v,o), order='f', dtype=np.float32)
C = np.empty((b,o,n,a,m,c), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "b,a,c,v,u", B, "n,m,u,v,o", beta, C, "b,o,n,a,m,c" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("bacvu,nmuvo->bonamc", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
