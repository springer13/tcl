import tcl
import numpy as np
import time
import argparse
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'

sizeA = []
sizeB = []
sizeC = []
order = 'f'
alpha = 1.0
beta = 0.0
floatType = np.float32

parser = argparse.ArgumentParser(description='Benchmark for tensor contractions using TCL and NumPY.')

parser.add_argument('indA', metavar='indicesA', type=str, help="comma separated list of characters, which denote the indices of A (e.g., 'u,m,n')")
parser.add_argument('indB', metavar='indicesB', type=str, help="comma separated list of characters, which denote the indices of B (e.g., 'a,u')")
parser.add_argument('indC', metavar='indicesC', type=str, help="comma separated list of characters, which denote the indices of C (e.g., 'n,m,a')")
parser.add_argument('sizes', metavar='sizes', type=str, help="<indice:size>,<indice:size>,... (e.g., a:100,b:200)")
parser.add_argument('--floatType', metavar='floatType', type=str, help="float type can be either 'double' or 'float' (default)")
parser.add_argument('--alpha', type=float, help='alpha scalar (default: 1.0)')
parser.add_argument('--beta', type=float, help='beta scalar (default: 0.0)')

args = parser.parse_args()
if( args.alpha):
    alpha = float(args.alpha)
if( args.beta):
    beta = float(args.beta)


sizes = {}
gflops = 2./1e9
for pair in args.sizes.split(","):
    idx = pair.split(':')[0]
    size = int(pair.split(':')[1])
    gflops *= size
    sizes[idx] = size

indA = ""
indB = ""
indC = ""
for idx in args.indA.split(","):
    indA+= idx + ","
    sizeA.append(sizes[idx])
indA= indA[:-1]
for idx in args.indB.split(","):
    indB+= idx + ","
    sizeB.append(sizes[idx])
indB = indB[:-1]
for idx in args.indC.split(","):
    indC+= idx + ","
    sizeC.append(sizes[idx])
indC= indC[:-1]

Ma = np.random.rand(2500**2).astype('f')
Mb = np.random.rand(2500**2).astype('f')
A = np.empty(sizeA, order='f', dtype=floatType)
B = np.empty(sizeB, order='f', dtype=floatType)
C = np.empty(sizeC, order='f', dtype=floatType)
tcl.randomNumaAwareInit(A)
tcl.randomNumaAwareInit(B)
tcl.randomNumaAwareInit(C)

timeTCL = 1e100
for i in range(5):
   Mb = Ma *1.1 +  Mb #trash cache
   s = time.time()
   tcl.tensorMult( alpha, A, indA, B, indB, beta, C, indC)
   timeTCL = min(timeTCL, time.time() - s)
timeNP = 1e100

for i in range(5):
   Mb = Ma *1.1 +  Mb #trash cache
   s = time.time()
   C_ = np.einsum("%s,%s->%s"%(indA.replace(',',''),indB.replace(',',''),indC.replace(',','')), A, B)
   timeNP = min(time.time() - s, timeNP)

if( not tcl.equal(C, C_, 1000) ):
    print "ERROR: validation" + FAIL + " failed!!!" + ENDC
else:
    print "%.2f GFLOPS %.2f GFLOPS speedup: %.2fx"%( gflops/timeTCL, gflops/timeNP, timeNP/ timeTCL)
