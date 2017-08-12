import tcl
import numpy as np
import time
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
a = 16
c = 16
b = 16
m = 3456
u = 16
w = 16
v = 16
gflops = a*c*b*m*u*w*v*2/1e9
A = np.empty((w,u,m,v), order='f', dtype=np.float32)
B = np.empty((a,v,u,w,b,c), order='f', dtype=np.float32)
C = np.empty((m,c,b,a), order='f', dtype=np.float32)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)
alpha = 1.0
beta = 0.0
s = time.time()
tcl.tensorMult( alpha, A, "w,u,m,v", B, "a,v,u,w,b,c", beta, C, "m,c,b,a" )
timeTCL = time.time() - s
s = time.time()
C_ = np.einsum("wumv,avuwbc->mcba", A, B)
timeNP = time.time() - s
print "%.2f GFLOPS %.2f GFLOPS %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
#if( not tcl.equal(C, C_) ):
#    print "validation:" + FAIL + " failed!!!" + ENDC
