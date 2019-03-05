import numpy as np
import ctypes
from ctypes import cdll
import os
import random
import re

TCL_ROOT = ""
try:
    TCL_ROOT = os.environ['TCL_ROOT']
except:
    print("[TCL] ERROR: TCL_ROOT environment variable is not set. Point TCL_ROOT to the folder which includes TCL_ROOT/lib/libtcl.so")
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
    indicesA = indicesA.encode('utf-8')
    indicesB = indicesB.encode('utf-8')
    indicesC = indicesC.encode('utf-8')
    indicesA = ctypes.c_char_p(indicesA)
    indicesB = ctypes.c_char_p(indicesB)
    indicesC = ctypes.c_char_p(indicesC)
    useRowMajor = 0
    if( A.flags['C_CONTIGUOUS'] ):
        useRowMajor = 1

    if( A.dtype == np.float32 ):
        lib.sTensorMult(ctypes.c_float(alpha), dataA, sizeA, outerSizeA, indicesA,
                                               dataB, sizeB, outerSizeB, indicesB,
                        ctypes.c_float(beta) , dataC, sizeC, outerSizeC, indicesC, useRowMajor)
    elif( A.dtype == np.float64 ):
        lib.dTensorMult(ctypes.c_double(alpha), dataA, sizeA, outerSizeA, indicesA,
                                                dataB, sizeB, outerSizeB, indicesB,
                        ctypes.c_double(beta) , dataC, sizeC, outerSizeC, indicesC, useRowMajor)
    elif( A.dtype == np.complex64 ):
        lib.cTensorMult(ctypes.c_float(alpha), dataA, sizeA, outerSizeA, indicesA,
                                               dataB, sizeB, outerSizeB, indicesB,
                        ctypes.c_float(beta), dataC, sizeC, outerSizeC, indicesC, useRowMajor)
    elif( A.dtype == np.complex128 ):
        lib.zTensorMult(ctypes.c_double(alpha), dataA, sizeA, outerSizeA, indicesA,
                                                dataB, sizeB, outerSizeB, indicesB,
                        ctypes.c_double(beta) , dataC, sizeC, outerSizeC, indicesC, useRowMajor)
    else:
        raise NotImplementedError

def equal(A, B, numSamples=-1):
    """ Ensures that alle elements of A and B are pretty much equal (due to limited machine precision)

    Parameter:
    numSamples: number of random samples to compare (-1: all). This values is used to approximate this function and speed the result up."
    """
    threshold = 1e-4
    A = np.reshape(A, A.size)
    B = np.reshape(B, B.size)
    error = 0
    samples = list(range(A.size))
    if( numSamples != -1 ):
        samples = random.sample(samples, min(A.size,numSamples))

    for i in samples:
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

def einsum(string, *arg_list):
    """
    A wrapper around np.einsum. We call TensorMult in TCL library if a tensor multiplication is called, i.e. two operands in einsum.
    For all other cases, we return the result of np.einsum.
    For simplicity, we always cast the nd.array to be contiguousarray. One could also choose to cast all nd.array to Fortran array.

    Input Parameters:
        We take exactly the same format as np.einsum function, with a string and the operands.
    """
    if len(list(arg_list)) != 2:
        return np.einsum(string, *arg_list)
    else:
        T_a, T_b = arg_list

    if np.isfortran(T_a) and np.isfortran(T_b):
        order = 'F'
        # or do np.asfortranarray(T_a) (T_b) order ='F'
        # see also https://stackoverflow.com/questions/27567876/copying-array-changes-data-from-c-contiguous-to-f-contiguous
    else:
        # There is some situation when T is not Contiguous nor Fortan
        T_a = np.ascontiguousarray(T_a)
        T_b = np.ascontiguousarray(T_b)
        order = 'C'

    # [TODO] benchmark whether 'C', 'F' affect the result

    # [TODO] casting to higher precesion data type?
    floatType = T_a.dtype
    if floatType != T_b.dtype:
        raise NotImplementedError

    np_indA, np_indB, np_indC = re.split(' , | ,|, |,|->', string)
    # [TODO] implement this ?
    if len(np_indC) == 0:
        return np.einsum(string, *arg_list)

    sizes = {}
    shapeA = T_a.shape
    for idx, ind in enumerate(np_indA):
        sizes[ind] = shapeA[idx]

    shapeB = T_b.shape
    for idx, ind in enumerate(np_indB):
        sizes[ind] = shapeB[idx]

    indA = ','.join(list(np_indA))
    indB = ','.join(list(np_indB))
    indC = ','.join(list(np_indC))
    sizeC = [sizes[idx] for idx in np_indC]

    # For most case this is enough.
    # T_c = np.empty(sizeC, order=order, dtype=floatType)
    # However, it seems like for complex datatype, we need to zeros out T_c
    # such that it would not return wierd value.
    # This should be because of the interface in tensorMult is not written
    # for complex datatype
    T_c = np.zeros(sizeC, order=order, dtype=floatType)

    tensorMult(1, T_a, indA, T_b, indB, 0., T_c, indC)
    return T_c
