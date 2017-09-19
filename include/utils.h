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


#ifndef TCL_UTILS_H
#define TCL_UTILS_H

#include <string>
#include <sstream>
#include <iostream>
#include <vector>
#include <list>

#include "tcl_types.h"

extern "C"
{
   void sgemm_(const char *transa, const char *transb,
         const int *m, const int *n, const int *k,
         const float *alpha, const float *a,
         const int *lda, const float *b, const int *ldb,
         const float *beta, float *c, const int *ldc);
   void dgemm_(const char *transa, const char *transb,
         const int *m, const int *n, const int *k,
         const double *alpha, const double *a,
         const int *lda, const double *b, const int *ldb,
         const double *beta, double *c, const int *ldc);
   void cgemm_(const char *transa, const char *transb,
         const int *m, const int *n, const int *k,
         const float _Complex *alpha, const float _Complex *a,
         const int *lda, const float _Complex *b, const int *ldb,
         const float _Complex *beta, float _Complex *c, const int *ldc);
   void zgemm_(const char *transa, const char *transb,
         const int *m, const int *n, const int *k,
         const double _Complex *alpha, const double _Complex *a,
         const int *lda, const double _Complex *b, const int *ldb,
         const double _Complex *beta, double _Complex *c, const int *ldc);
}

namespace tcl
{

   template<typename floatType>
   static double getZeroThreshold();
   template<>
   double getZeroThreshold<double>() { return 1e-16;}
   template<>
   double getZeroThreshold<DoubleComplex>() { return 1e-16;}
   template<>
   double getZeroThreshold<float>() { return 1e-6;}
   template<>
   double getZeroThreshold<FloatComplex>() { return 1e-6;}

   const char* getErrorString( error err );

   /**
    * concatinates the two vectors a and b and stores the result into c
    */
   template<typename T>
   void concatinate(const T &a, 
                    const T &b,
                    T &c)
   {
      auto endA = a.end();
      for(auto it = a.begin(); it != endA; it++)
         c.emplace_back(*it);
      auto endB = b.end();
      for(auto it = b.begin(); it != endB; it++)
         c.emplace_back(*it);
   }
   /**
    * intersects the two vectors a and b and stores the result into c
    */
   template<typename T>
   T intersect(const T &a, const T &b)
   {
      T c;
      for(auto x1 : a)
         for(auto x2 : b)
            if( x1 == x2 )
               c.emplace_back(x1);
      return c;
   }

   /**
    * find x in l
    */
   template<typename T, typename L>
   bool find(const T &x, const L &l) //TODO templetize L?
   {
      for( auto a : l )
         if( a == x )
            return true;
      return false;
   }

   /**
    * find x in l
    */
   template<typename T, typename L>
   bool findPos(const T &x, const L &l) //TODO templetize L?
   {
      int count = 0;
      for( auto a : l )
         if( a == x )
            return count;
         else
            count++;
      return -1;
   }

   /**
    * remove all elements of b from a
    */
   template<typename T>
   T setMinus(const T &a, const T &b)
   {
      T c;
      for(auto item : a)
         if( !find(item, b) )
            c.emplace_back(item);
      return c;
   }

   /**
    * \return elements of 'toBeSorted' sorted according to their order in 'order'
    */
   template<typename T>
   void sortAccordingTo(const T &toBeSorted, const T &order, T &sorted )
   {
      sorted.clear();
      for( auto elem : order )
         if( find(elem, toBeSorted) )
            sorted.emplace_back(elem);
      assert( sorted.size() == toBeSorted.size() );
   }

   /**
    * \return true iff all indices of 'subset' appear contiguously in 'indices'
    */
   template<typename T>
   bool indicesContiguous(const T &subset, const T &indices)
   {
      if( subset.size() <= 0 ) 
         return true;
      int contiguousCount = 0;
      for( auto a : indices ){
         if( find(a, subset) ){
            contiguousCount++;
         }else if( contiguousCount == subset.size() )
            return true;
         else if( contiguousCount > 0 )
            return false;
      }
      return contiguousCount == subset.size();
   }

   //! return the number of threads used within TCL
   int getNumThreads();

   /**
    * checks if the provided permutation is the identity
    */
   bool isIdentity(const std::vector<int> &perm);

   /**
    * permute the input according to the permutation perm.
    */
   template<typename T>
   std::vector<T> permute(const std::vector<int> &perm, const std::vector<T> &input)
   {
      assert( input.size() == perm.size() );

      std::vector<T> output;
      for(int i=0; i < perm.size(); ++i){
         assert( perm[i] >= 0 && perm[i] < input.size() );
         output.emplace_back(input[perm[i]]);
      }
      return output;
   }

   /**
    * Split the input string by the delimiter
    *
    * \param[in] str input string
    * \param[in] delim delimiter
    * \return output vector cotainign all tokens
    */
   template<typename T>
   void split( const std::string &str, char delim, T &output )
   {
      output.clear();
      std::string token;
      std::stringstream stream;
      stream.str(str);
      while ( std::getline(stream, token, delim) )
         output.emplace_back(token);
   }
   /**
    * \param[in] input Indices of the input tensor
    * \param[in] output Indices of the output tensor
    * \return the permutation that is required to rearange the indices of input to match the order of the indices specified by 'output'.
    */
   template<typename T>
   std::vector<int> getPermutation( const T &input, const T &output)
   {
      assert( input.size() == output.size() );

      std::vector<int> perm;
      for(auto b : output)
      {
         int pos = 0;
         for(auto a : input)
         {
            if( b == a ){
               perm.emplace_back(pos);
               break;
            }
            pos++;
         }
      }
      assert( perm.size() == output.size() );

      return perm;
   }

   template<typename T>
   void printVector(const T &vec, std::string label)
   {
      std::cout<< label << ": ";
      for( auto a : vec)
         std::cout<< a << " ";
      std::cout<< "\n";
   }

   template<typename floatType>
   void gemm(const char *transa, const char *transb,
         const sizeType *m, const sizeType *n, const sizeType *k,
         const floatType *alpha, const floatType *a,
         const sizeType *lda, const floatType *b, const sizeType *ldb,
         const floatType *beta, floatType *c, const sizeType *ldc);
}

#endif
