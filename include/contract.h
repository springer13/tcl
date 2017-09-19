/*
*   Copyright (C) 2017  Paul Springer (springer@aices.rwth-aachen.de)
*
*   This program is free software: you can redistribute it and/or modify
*   it under the terms of the GNU Lesser General Public License as published by
*   the Free Software Foundation, either version 3 of the License, or
*   (at your option) any later version.
*
*   This program is distributed in the hope that it will be useful,
*   but WITHOUT ANY WARRANTY; without even the implied warranty of
*   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*   GNU General Public License for more details.
*
*   You should have received a copy of the GNU General Public License
*   along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/


#pragma once

/// \page pg_contract Tensor Contraction
///
/// \section sec_contract Tensor Contraction
/// A tensor contraction is the generalization of a matrix-matrix multiplication to multiple dimensions

#include <list>
#include <vector>
#include <string>
#include <memory>
#include <numeric>
#include <functional>
#include <stdio.h>
#include <stdlib.h>

#include "tcl_types.h"
#include "tensor.h"

namespace tcl{

   template<typename floatType>
   error tensorMult(const floatType alpha, const Tensor<floatType> *A,
                                           const Tensor<floatType> *B, 
                    const floatType beta,        Tensor<floatType> *C);
}

extern "C"{
void sTensorMult(const float alpha, const float *A, const long *sizeA, const long *outerSizeA, const char* indA,
                                    const float *B, const long *sizeB, const long *outerSizeB, const char* indB,
                 const float beta ,       float *C, const long *sizeC, const long *outerSizeC, const char* indC, const int useRowMajor = 0);

void dTensorMult(const double alpha, const double *A, const long *sizeA, const long *outerSizeA, const char* indA,
                                     const double *B, const long *sizeB, const long *outerSizeB, const char* indB,
                 const double beta ,       double *C, const long *sizeC, const long *outerSizeC, const char* indC, const int useRowMajor = 0);

void cTensorMult(const float _Complex alpha, const float _Complex *A, const long *sizeA, const long *outerSizeA, const char* indA,
                                            const float _Complex *B, const long *sizeB, const long *outerSizeB, const char* indB,
                 const float _Complex beta ,       float _Complex *C, const long *sizeC, const long *outerSizeC, const char* indC, const int useRowMajor = 0);

void zTensorMult(const double _Complex alpha, const double _Complex *A, const long *sizeA, const long *outerSizeA, const char* indA,
                                            const double _Complex *B, const long *sizeB, const long *outerSizeB, const char* indB,
                 const double _Complex beta ,       double _Complex *C, const long *sizeC, const long *outerSizeC, const char* indC, const int useRowMajor = 0);

void randomNumaAwareInit(float *data, const long *size, int dim);
}

