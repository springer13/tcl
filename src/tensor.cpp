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


#include <tensor.h>

namespace tcl
{
   template<typename floatType>
   Tensor<floatType> Tensor<floatType>::getSubTensor( 
         const indicesType &indices,  
         const std::vector<sizeType> &size) const
   {
      if( size.size() > 0 && indices.size() != size.size() )
         throw std::invalid_argument( 
               "The size of the first and second paramter does not match." );
      if( indices.size() <= 0 || indices.size() > _indices.size() )
         throw std::invalid_argument( 
               "The first parameter does not match the size of the parent tensor." );

      std::vector<sizeType> subSize(_size);
      int j = 0;
      auto itSub = indices.begin();
      int i = 0;
      for( auto idx : _indices ) 
      {
         if(itSub != indices.end() && idx == *itSub)
         {
            if( size.size() > 0 && (size[j] > _size[i] || size[j] <= 0) )
               throw std::invalid_argument( 
                     "Specified size of the subtensor is invalid. It must be smaller than the size of the parent tensor." );

            if( size.size() > 0 )
               subSize[i] = size[j];
            ++j;
            itSub++;
         } else
            subSize[i] = 1;
         ++i;
      }
      if( j != indices.size() )
         throw std::invalid_argument( "Some indices could not be found." );

      return Tensor<floatType>(subSize, _data, _outerSize, _indices, _offsets);
   }

   template<typename floatType>
   size_t Tensor<floatType>::getTotalSize( const indicesType &indices ) const
   {
      size_t product = 1;
      if( indices.size() == 0 )
      {
         for(int i=0; i < _size.size(); ++i)
            product *= _size[i]; 
      } else {
         assert( _size.size() == _indices.size() );

         int i = 0;
         for(auto idx : _indices)
         {
            if( find(idx, indices) )
               product *= _size[i]; //only multiply if the dimsion was found in indices
            i++;
         }
      }
      return product;
   }


   template<typename floatType>
   sizeType Tensor<floatType>::getStride( const std::string &idx ) const
   {
      sizeType stride = 1;
      int i =0;
      for(auto a : _indices)
      {
         if( a == idx )
            return stride;
         else
            stride *= _outerSize[i];
         ++i;
      }

      return 0; // not found, this tensor does not depend on the given index
   }

   template<typename floatType>
   sizeType Tensor<floatType>::getSize( const std::string &idx ) const
   {
      int i =0;
      for(auto a : _indices)
      {
         if( a == idx )
            return _size[i];
         ++i;
      }

      return 0; // not found
   }

   template<typename floatType>
   Tensor<floatType>::Tensor( const std::vector<sizeType> &size, 
                              floatType *data,
                              const std::vector<sizeType> &outerSize,
                              const indicesType &indices,
                              const std::vector<sizeType> &offsets
                              ) : 
                                 _data(data),
                                 _size(size),
                                 _outerSize(outerSize),
                                 _indices(indices),
                                 _offsets(offsets)
   { 
      if( _outerSize.size() == 0 )
         _outerSize = _size;
      if( _offsets.size() == 0 )
         _offsets = std::vector<sizeType>(_size.size(),0);

      if( _data == nullptr ){
         size_t totalSize = 1;
         for(auto s : _outerSize)
				totalSize *= s;
         int dummy = posix_memalign((void**) &_data, 64, sizeof(floatType) * totalSize);
      }
   } 


   template<typename floatType>
   void Tensor<floatType>::print() const
   {
      std::cout<< "---------------------\n";
      printVector(_indices, "Indices");
      printVector(_size, "Size");
      printVector(_outerSize, "Outer size");
      printVector(_offsets, "Offsets");
      std::cout<< "---------------------\n";
   }

   template class Tensor<float>;
   template class Tensor<double>;
   template class Tensor<FloatComplex>;
   template class Tensor<DoubleComplex>;
}

