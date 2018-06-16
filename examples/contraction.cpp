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


#include <stdlib.h>
#include <iostream>

#include <tcl.h>

int main(int argc, char** argv)
{
   tcl::sizeType m = 5;
   tcl::sizeType n = 4;
   tcl::sizeType k1 = 2;
   tcl::sizeType k2 = 3;
   tcl::sizeType l1 = 6;

   float *dataA, *dataB, *dataC;
   posix_memalign((void**) &dataA, 64, sizeof(float) * ((size_t)k2)*m*k1*l1);
   posix_memalign((void**) &dataB, 64, sizeof(float) * ((size_t)n)*k2*k1*l1);
   posix_memalign((void**) &dataC, 64, sizeof(float) * ((size_t)m)*n*l1);

   // Initialize tensors (data is not owned by the tensors)
   tcl::Tensor<float> A({k1,m,k2,l1}, dataA);
   tcl::Tensor<float> B({n,k2,k1,l1}, dataB);
   tcl::Tensor<float> C({m,n,l1}, dataC);

   // Data initialization
#pragma omp parallel for
   for(int i=0; i < A.getTotalSize(); ++i)
      dataA[i] = (i+1)*7% 100;
#pragma omp parallel for
   for(int i=0; i < B.getTotalSize(); ++i)
      dataB[i] = (i+1)*13% 100;
#pragma omp parallel for
   for(int i=0; i < C.getTotalSize(); ++i)
      dataC[i] = (i+1)*5% 100;

   float alpha = 2;
   float beta = 4;

   // tensor contarction: C_{m,n} = alpha * A_{k2,m,k1} * B_{n,k2,k1} + beta * C_{m,n}
   auto err = tcl::tensorMult<float>( alpha, A["k1,m,k2,l1"], B["n,k2,k1,l1"], beta, C["m,n,l1"] );
   if( err != tcl::SUCCESS ){
      printf("ERROR: %s\n", tcl::getErrorString(err));
      exit(-1);
   }

   for(int i=0; i < m; ++i){
      for(int j=0; j < n; ++j)
         std::cout<< dataC[j * m + i] << " ";
      std::cout<< "\n";
   }

   return 0;
}
