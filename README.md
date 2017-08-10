# Tensor Contraction Library (TCL) for C++

TCL is a C++ library for high-performance tensor contractions.

From a computational perspective, tensors
can be interpreted as a generalization of matrices to multiple dimensions or simply as
multidimensional arrays; likewise, tensor contractions
are a generalization of the matrix-matrix multiplication to higher
dimensions. For instance, A[i,k], B[k,j] and C[i,j] denote two-dimensional
tensors (i.e., matrices) and C[i,j] = A[i,k] * B[k,j] represents a tensor
contraction where the sum over 'k' as well as the loops over 'i' and 'j' are
implicit. Further examples of tensor contractions are: C[i0,j0,j1] = A[i0,k0] * B[j1,k0,j0];
C[i0,j0,j1,i1] = A[i0,k0,i1] * B[j1,k0,j0]; C[i0,j0,j1,i1] = A[k0,i0,k1,i1] * B[k1,j1,k0,j0] ...

You can find additional information on tensor contractions in the paper listed
below.


# Requirements

* A C++ compiler with c++11 support (I've tested it with g++ 5.1.0).
* Some BLAS library (e.g., [BLIS](https://github.com/flame/blis), ATLAS, MKL,
  OpenBlas)
* [HPTT](https://github.com/springer13/hptt) for high-performance tensor transpositions

# Install

Install TCL's dependencies (see above). Then clone the repository into a desired directory and change to that location:

    git clone https://github.com/springer13/tcl.git
    cd tcl 
    make

This should be it and you should see a libtcl.so in the ./lib/ directory.


# Getting started

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
    auto ret = tcl::multiply<float>( alpha, A["k2,m,k1"], B["n,k2,k1"], beta, C["m,n"], 0 );


You just have to include the header (which can be found in ./include/) and link
against tcl; an exemplary Makefile can be found in ./examples/Makefile.


# Key Features

* Multi-threading support
* TCL's current implementation is based on the
  Transpose-Transpose-GEMM-Transpose (TTGT) approach (see paper).
* Support for single- and double-precision. Support for single- and
  double-complex could be added easily.


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
   title       = {{Design of a high-performance GEMM-like Tensor-Tensor Multiplication}},
   archivePrefix = "arXiv",
   eprint = {1607.00145},
   primaryClass = "quant-ph",
   journal     = {CoRR},
   year        = {2016},
   issue_date  = {July 2016},
   url         = {http://arxiv.org/abs/1607.00145}
}
``` 


