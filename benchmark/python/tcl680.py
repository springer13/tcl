import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 25
c = 24
b = 25
m = 24
n = 24
u = 25
v = 25
gflops = a*c*b*m*n*u*v*2/1e9
A = np.empty((n,v,u,m), order='f', dtype=np.float32)
B = np.empty((c,b,u,v,a), order='f', dtype=np.float32)
C = np.empty((m,b,a,c,n), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "n,v,u,m", B, "c,b,u,v,a", beta, C, "m,b,a,c,n" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("nvum,cbuva->mbacn", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
