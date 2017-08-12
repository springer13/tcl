import numpy as np
import ctypes
from ctypes import cdll
import os

TCL_ROOT = ""
try:
    TCL_ROOT = os.environ['TCL_ROOT']
except:
    print "[TCL] ERROR: TCL_ROOT environment variable is not set. Point TCL_ROOT to the folder which includes TCL_ROOT/lib/libtcl.so"
    exit(-1)

# load TCL library
lib = cdll.LoadLibrary(TCL_ROOT+"/lib/libtcl.so")

def randomNumaAwareInit( A ):
    """ 
    initializes the passed numpy.ndarray (which have to be created with
    numpy.empty) and initializes it with random data in paralle such that the
    pages are equally distributed among the numa nodes 
    """
    lib.randomNumaAwareInit( ctypes.c_void_p(A.ctypes.data),
            ctypes.cast(A.ctypes.shape, ctypes.POINTER(ctypes.c_voidp)),
            ctypes.c_int32(A.ndim) )


def tensorMult( alpha, A, indicesA, B, indicesB, beta,  C, indicesC):
    """ 
        This function computes the tensor contraction of A and B, yielding C.
        The tensor contraction is of the form: 
           C[indicesC] = alpha * A[indicesA] * B[indicesB] + beta * C[indicesC]

        where alpha and beta are scalors and A, B, and C correspond to arbitrary
        dimensional arrays (i.e., tensors). The dimensionality of A, B, and C
        depends on their indices (which need to be separated by commas).

        For instance, the tensor contraction C[m1,n1,m2] = 1.3 * A[k1,m1,k2,m2] * B[k1,k2,n1]
        would be represented as: tensorMult(1.3, A, "k1,m1,k2,m2", B,
        "k1,k2,n1", 0.0, C, "m1,n1,m2").
    """

    dataA = ctypes.c_void_p(A.ctypes.data)
    sizeA = ctypes.cast(A.ctypes.shape, ctypes.POINTER(ctypes.c_voidp))
    outerSizeA = sizeA
    dataB = ctypes.c_void_p(B.ctypes.data)
    sizeB = ctypes.cast(B.ctypes.shape, ctypes.POINTER(ctypes.c_voidp))
    outerSizeB = sizeB
    dataC = ctypes.c_void_p(C.ctypes.data)
    sizeC = ctypes.cast(C.ctypes.shape, ctypes.POINTER(ctypes.c_voidp))
    outerSizeC = sizeC
    indicesA = ctypes.c_char_p(indicesA)
    indicesB = ctypes.c_char_p(indicesB)
    indicesC = ctypes.c_char_p(indicesC)

    if( A.itemsize == 4 ):
        lib.sTensorMult(ctypes.c_float(alpha), dataA, sizeA, outerSizeA, indicesA,
                                               dataB, sizeB, outerSizeB, indicesB,
                        ctypes.c_float(beta) , dataC, sizeC, outerSizeC, indicesC)
    else:
        lib.dTensorMult(ctypes.c_double(alpha), dataA, sizeA, outerSizeA, indicesA,
                                                dataB, sizeB, outerSizeB, indicesB,
                        ctypes.c_double(beta) , dataC, sizeC, outerSizeC, indicesC)


def equal(A, B):
    """ Ensures that alle elements of A and B are pretty much equal (due to limited machine precision) """
    threshold = 1e-4
    A = np.reshape(A, A.size)
    B = np.reshape(B, B.size)
    error = 0
    for i in range(A.size):
      Aabs = abs(A[i]);
      Babs = abs(B[i]);
      absmax = max(Aabs, Babs);
      diff = Aabs - Babs;
      if( diff < 0 ):
          diff *= -1
      if(diff > 0):
         relError = diff / absmax;
         if(relError > 4e-5 and min(Aabs,Babs) > threshold ):
            error += 1
    return error == 0
