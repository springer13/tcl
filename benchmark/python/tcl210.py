import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 40
b = 40
m = 48
n = 40
u = 40
v = 40
gflops = a*b*m*n*u*v*2/1e9
A = np.empty((m,v,u,n), order='f', dtype=np.float32)
B = np.empty((a,u,b,v), order='f', dtype=np.float32)
C = np.empty((n,b,m,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "m,v,u,n", B, "a,u,b,v", beta, C, "n,b,m,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("mvun,aubv->nbma", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
