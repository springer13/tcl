This project is no longer maintained, please consider to use its GPU counterpart: https://developer.nvidia.com/cutensor

# Tensor Contraction Library (TCL) for C++ (and Python)

TCL is a C++ library for high-performance tensor contractions; TCL also includes
a wrapper for python and can be easily integrated into native python code.

From a computational perspective, tensors
can be interpreted as a generalization of matrices to multiple dimensions or simply as
multidimensional arrays; likewise, tensor contractions
are a generalization of the matrix-matrix multiplication to higher
dimensions. For instance, A[i,k], B[k,j] and C[i,j] denote two-dimensional
tensors (i.e., matrices) and C[i,j] = A[i,k] * B[k,j] represents a tensor
contraction where the sum over 'k' as well as the loops over 'i' and 'j' are
implicit. Further examples of tensor contractions are: 

* C[i0,j0,j1] = A[i0,k0] * B[j1,k0,j0]
* C[i0,j0,j1,i1] = A[i0,k0,i1] * B[j1,k0,j0]
* C[i0,j0,j1,i1] = A[k0,i0,k1,i1] * B[k1,j1,k0,j0]
* C[i1,j1,j0,i0] = A[k0,i0,k1,k2,i1] * B[k1,j1,k0,j0,k2]
* ...

You can find additional information on tensor contractions in the [paper](https://arxiv.org/abs/1607.00145) listed
below.

# Requirements

* A C++ compiler with c++11 support (I've tested it with: g++ 5.1.0, icpc 17.0.2).
* Some BLAS library (e.g., [BLIS](https://github.com/flame/blis), ATLAS, MKL,
  OpenBlas)
* [HPTT](https://github.com/springer13/hptt) for high-performance tensor transpositions

# Install

## C/C++ library

Install TCL's dependencies (see above). Then clone the repository into a desired directory and change to that location:

    git clone https://github.com/springer13/tcl.git
    cd tcl 

You might have to update the Makefile and specify the location of your BLAS and
HPTT library, then continue with:

    make

This should be it and you should see a libtcl.so in the ./lib/ directory.

## Python API

To install the python API you have to:

    cd pythonAPI
    python setup.py install

At this point you can import the tcl module in your python scripts and call the
tcl.tensorMult() function (see ./benchmark/python/benchmark.py for further examples).

Keep in mind that TCL is a multi-threaded and performance critical library.
Thus, it is of great importance that you follow the following steps before you
run your python script:

* Specify the thread affinity (e.g., via environment variable KMP_AFFINITY, via taskset, ...)
* Specify the amount of threads to be used via the OMP_NUM_THREADS environment
  variable.
* Ensure that your python environment links against a multi-threaded BLAS (see
  numpy.\_\_config\_\_.show())

# Getting started

First off, TCL supports any kind of tensor contractions (i.e., it is not limited
to tensor contractions that can be mapped to GEMM). The idea behind TCL is that you only 
have to call a single function for any contraction: tcl::tensorMult(). Once you
have specified the tensor contraction, TCL will _automatically_ map this tensor
contraction to the most efficient kernel.

TCL supports both column-major (default) and row-major data layouts. Column-major: indices are stored
from left to right with the leftmost and rightmost index respectively being
the fastest-varying (stride-1) index and the slowest-varying index; row-major: indices are stored
from right to left.

You can find an self-explanatory example under ./examples/contraction.cpp

    #include <tcl.h>
    ...

    tcl::sizeType m = 5;
    tcl::sizeType n = 4;
    tcl::sizeType k1 = 2;
    tcl::sizeType k2 = 3;

    // Allocation of the Tensors (data is owned by the tensors)
    tcl::Tensor<float> A({k2,m,k1});
    tcl::Tensor<float> B({n,k2,k1});
    tcl::Tensor<float> C({m,n});

    // Data initialization (omitted) ...

    // tensor contarction: C_{m,n} = alpha * A_{k2,m,k1} * B_{n,k2,k1} + beta * C_{m,n}
    auto ret = tcl::tensorMult<float>( alpha, A["k2,m,k1"], B["n,k2,k1"], beta, C["m,n"], 0 );


You just have to include the header (which can be found in ./include/) and link
against tcl; an exemplary Makefile can be found in ./examples/Makefile.

## C-Interface

TCL also provides a C interface:

    void sTensorMult(const float alpha, const float *A, const long *sizeA, const long *outerSizeA, const char* indA,
                                        const float *B, const long *sizeB, const long *outerSizeB, const char* indB,
                     const float beta ,       float *C, const long *sizeC, const long *outerSizeC, const char* indC, int useRowMajor = 0);

    void dTensorMult(const double alpha, const double *A, const long *sizeA, const long *outerSizeA, const char* indA,
                                         const double *B, const long *sizeB, const long *outerSizeB, const char* indB,
                     const double beta ,       double *C, const long *sizeC, const long *outerSizeC, const char* indC, int useRowMajor = 0);

The outerSizes enable the user to operate on subtensors; the outerSize may be NULL, in that
case a dense tensor with size=outerSize is assumed.

## Python-Interface

TCL now also offers a python-interface. The functionality offered by TCL is comparable to that of [numpy.einsum](https://docs.scipy.org/doc/numpy/reference/generated/numpy.einsum.html):

    tensorMult( alpha, A, indicesA, B, indicesB, beta,  C, indicesC)

See docstring for additional information.

Several examples can be found under ./benchmark/python/

# Key Features

* Multi-threading support
* TCL's current implementation is based on the
  Transpose-Transpose-GEMM-Transpose (TTGT) approach (see paper).
* Support for single- and double-precision as well as complex data types.


# Performance Results

![hptt](https://github.com/springer13/tcl/blob/master/misc/tcl_speedup.png)

The above Figure presents the speedup of TCL over the best 
reference among multiple state-of-the-art implementations (i.e., [Eigen](http://eigen.tuxfamily.org), 
[Tensor Toolbox](http://www.sandia.gov/~tgkolda/TensorToolbox), [NumPy](http://www.numpy.org/), [ITensor](http://itensor.org/)) for 1000 random tensor contractions running on a two
socket Intel Haswell-EP E5-2680 v3 utilizing 24 threads. The cases are sorted with respect to the arithmetic
intensity of an equally-sized matrix-matrix multiplication. 

We make the following observations: 

* All speedups are well above 1.0x; phrased differently, TCL exhibits positive speedups across all 1000 random tensor contractions. 
* The speedups are especially high for tensor contractions with a low arithmetic intensity (left side of the plot), reaching up to 18x. 
* The speedups decrease with increasing arithmetic intensity, this is due to the fact that the runtime of those contractions is dominated by a large GEMM, thus attaining close to the theoretical peak floating-point performance of the CPU.

You can run your own benchmarks via:

    ./benchmark/python/benchmark.sh <numThreads>

Notice that the full benchmark may take hours to complete.

# Current limitations

TCL currently requires additional auxiliary memory for the transposed tensors. 
This library should eventually also support the GEMM-like Tensor-Tensor (GETT)
contraction approach (see paper), which yields better performance and does not
require any auxiliary memory.


# License

This project is under LGPLv3 for now. If this license is too restrictive for you,
please feel free to contact me via email (springer@aices.rwth-aachen.de).


# Citation

In case you want to refer to TCL as part of a research paper, please cite the following
article [(pdf)](https://arxiv.org/abs/1607.00145):
```
@article{tccg2016a,
   author      = {Paul Springer and Paolo Bientinesi},
   title       = {{Design of a {H}igh-{P}erformance {GEMM}-like {T}ensor-{T}ensor {M}ultiplication}},
   archivePrefix = "arXiv",
   eprint = {1607.00145},
   primaryClass = {cs.MS, cs.PF},
   journal     = {CoRR},
   year        = {2016},
   issue_date  = {July 2016},
   url         = {http://arxiv.org/abs/1607.00145}
}
``` 


