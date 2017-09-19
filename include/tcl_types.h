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


#ifndef TCL_TYPES_H
#define TCL_TYPES_H

#include <cstddef>
#include <vector>
#include <string>
#include <complex>
#include <complex.h>
#include <list>

namespace tcl
{

   typedef int sizeType;
   typedef std::list<std::string> indicesType;

   using FloatComplex = std::complex<float>;
   using DoubleComplex = std::complex<double>;

   enum error { 
      SUCCESS = 0, 
      INVALID_PARAMETER_0 = 1, 
      INVALID_PARAMETER_1 = 2, 
      INVALID_PARAMETER_2 = 3, 
      INVALID_PARAMETER_3 = 4, 
      INVALID_PARAMETER_4 = 5, 
      INVALID_PARAMETER_5 = 6, 
      INVALID_PARAMETER_6 = 7, 
      INVALID_PARAMETER_7 = 8, 
      INVALID_TENSOR_SIZE = 9, 
      LOOP_INDEX_DETECTED = 10, 
      TENSOR_CONTRACTION_UNSUPPORTED = 11,
      INTERNAL_ERROR_DIM_MISMATCH,
      INTERNAL_ERROR,
   };

}

#endif
