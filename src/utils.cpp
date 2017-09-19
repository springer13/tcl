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


#include <string>
#include <sstream>
#include <iostream>
#include <vector>
#include <assert.h>

#include <utils.h>

namespace tcl
{ 

   const char* getErrorString( error err ){
      switch (err){
         case SUCCESS:
            return "SUCCESS";
         case INVALID_PARAMETER_0:
            return "Parameter 0 is invalid.";
         case INVALID_PARAMETER_1:
            return "Parameter 1 is invalid.";
         case INVALID_PARAMETER_2:
            return "Parameter 2 is invalid.";
         case INVALID_PARAMETER_3:
            return "Parameter 3 is invalid.";
         case INVALID_PARAMETER_4:
            return "Parameter 4 is invalid.";
         case INVALID_PARAMETER_5:
            return "Parameter 5 is invalid.";
         case INVALID_PARAMETER_6:
            return "Parameter 6 is invalid.";
         case INVALID_PARAMETER_7:
            return "Parameter 7 is invalid.";
         case INVALID_TENSOR_SIZE:
            return "Tensor size invalid. Mismatch between the sizes of two indices.";
         case INTERNAL_ERROR:
            return "Internal error.";
         case TENSOR_CONTRACTION_UNSUPPORTED:
            return "The specified tensor contraction is not yet supported. Please open a ticket saying that you need this type of tensor contraction.";
         default:
            return "Unkown error.";
      }
   }
   int getNumThreads(){
      auto tmp = std::getenv("OMP_NUM_THREADS");
      if( tmp ) 
         return std::max(1, atoi(tmp));
      else
         return 1;
   }

   bool isIdentity(const std::vector<int> &perm){
      for(int i=0; i < perm.size(); ++i)
         if( i != perm[i] )
            return false;
      return true;
   }

   template<> 
   void gemm<float>(const char *transa, const char *transb,
         const sizeType *m, const sizeType *n, const sizeType *k,
         const float *alpha, const float *a,
         const sizeType *lda, const float *b, const sizeType *ldb,
         const float *beta, float *c, const sizeType *ldc)
   {
#ifdef DEBUG
      std::cout<< "GEMM: " << transa+'\0' << " "<< transb+'\0' << " "<< *m << " " << *n << " " << *k << std::endl;
#endif
      sgemm_(transa, transb, m, n, k,
            alpha, a, lda, b, ldb,
            beta, c, ldc);
   }

   template<> 
   void gemm<double>(const char *transa, const char *transb,
         const sizeType *m, const sizeType *n, const sizeType *k,
         const double *alpha, const double *a,
         const sizeType *lda, const double *b, const sizeType *ldb,
         const double *beta, double *c, const sizeType *ldc)
   {
#ifdef DEBUG
      std::cout<< "GEMM: " << transa+'\0' << " "<< transb+'\0' << " "<< *m << " " << *n << " " << *k << std::endl;
#endif
      dgemm_(transa, transb, m, n, k,
            alpha, a, lda, b, ldb,
            beta, c, ldc);
   }

   template<> 
   void gemm<FloatComplex>(const char *transa, const char *transb,
         const sizeType *m, const sizeType *n, const sizeType *k,
         const FloatComplex *alpha, const FloatComplex *a,
         const sizeType *lda, const FloatComplex *b, const sizeType *ldb,
         const FloatComplex *beta, FloatComplex *c, const sizeType *ldc)
   {
#ifdef DEBUG
      std::cout<< "GEMM: " << transa+'\0' << " "<< transb+'\0' << " "<< *m << " " << *n << " " << *k << std::endl;
#endif
      cgemm_(transa, transb, m, n, k,
            (const float _Complex*) alpha, (const float _Complex*)a, lda, (const float _Complex*)b, ldb,
            (const float _Complex*) beta, (float _Complex*)c, ldc);
   }

   template<> 
   void gemm<DoubleComplex>(const char *transa, const char *transb,
         const sizeType *m, const sizeType *n, const sizeType *k,
         const DoubleComplex *alpha, const DoubleComplex *a,
         const sizeType *lda, const DoubleComplex *b, const sizeType *ldb,
         const DoubleComplex *beta, DoubleComplex *c, const sizeType *ldc)
   {
#ifdef DEBUG
      std::cout<< "GEMM: " << transa+'\0' << " "<< transb+'\0' << " "<< *m << " " << *n << " " << *k << std::endl;
#endif
      zgemm_(transa, transb, m, n, k,
            (const double _Complex*) alpha, (const double _Complex*)a, lda, (const double _Complex*)b, ldb,
            (const double _Complex*) beta, (double _Complex*)c, ldc);
   }
}
