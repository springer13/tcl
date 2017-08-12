import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 8
b = 12
m = 8
o = 12
n = 12
p = 12
u = 8
v = 12
gflops = a*b*m*o*n*p*u*v*2/1e9
A = np.empty((u,m,n,p,v,o), order='f', dtype=np.float32)
B = np.empty((a,u,b,v), order='f', dtype=np.float32)
C = np.empty((m,a,o,n,b,p), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "u,m,n,p,v,o", B, "a,u,b,v", beta, C, "m,a,o,n,b,p" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("umnpvo,aubv->maonbp", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
