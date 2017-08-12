import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 32
b = 32
m = 30
n = 32
u = 32
v = 32
gflops = a*b*m*n*u*v*2/1e9
A = np.empty((n,v,m,u), order='f', dtype=np.float32)
B = np.empty((a,u,v,b), order='f', dtype=np.float32)
C = np.empty((n,b,m,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "n,v,m,u", B, "a,u,v,b", beta, C, "n,b,m,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("nvmu,auvb->nbma", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
