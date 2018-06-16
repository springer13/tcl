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


#include <algorithm>
#include <iostream>
#include <omp.h>

#include <hptt.h>
      
#include <tensor.h>
#include <tcl.h>

//this macro is merely used to assist the compiler in its efforts to generate good code
#define TCL_DUPLICATE(condition, ...) \
if (condition) { __VA_ARGS__ } \
else           { __VA_ARGS__ }

//#define TIMERS

namespace tcl
{ 
   struct TTGTCandidate{
      bool transA; //! if set, then A is in form A_{k,m}; otherwise: A_{m,k}
      bool transB; //! if set, then B is in form B_{n,k}; otherwise: B_{k,n}
      bool interchangeAB; //! if set, the A and B are interchanged in the GEMM to yield a transposed C
      indicesType indicesA;
      indicesType indicesB;
      indicesType indicesC;

      bool isValid(){
         auto loopIndices = intersect(indicesA, intersect(indicesB, indicesC));
         //! also known as the free indices of A 
         auto mIndices = setMinus(intersect(indicesA, indicesC), loopIndices);
         //! also known as the free indices of B
         auto nIndices = setMinus(intersect(indicesB, indicesC), loopIndices);
         //! also known as the contracted indices 
         auto kIndices = setMinus(intersect(indicesA, indicesB), loopIndices);

         indicesType mIndicesA; sortAccordingTo(mIndices, indicesA, mIndicesA);
         indicesType kIndicesA; sortAccordingTo(kIndices, indicesA, kIndicesA);
         indicesType kIndicesB; sortAccordingTo(kIndices, indicesB, kIndicesB);
         indicesType nIndicesB; sortAccordingTo(nIndices, indicesB, nIndicesB);
         indicesType mIndicesC; sortAccordingTo(mIndices, indicesC, mIndicesC);
         indicesType nIndicesC; sortAccordingTo(nIndices, indicesC, nIndicesC);

         bool mIndicesContiguousC = indicesContiguous(mIndices, indicesC);
         bool nIndicesContiguousC = indicesContiguous(nIndices, indicesC);
         bool mIndicesContiguousA = indicesContiguous(mIndices, indicesA);
         bool kIndicesContiguousA = indicesContiguous(kIndices, indicesA);
         bool nIndicesContiguousB = indicesContiguous(nIndices, indicesB);
         bool kIndicesContiguousB = indicesContiguous(kIndices, indicesB);

         return mIndicesC == mIndicesA && 
            nIndicesC == nIndicesB && 
            kIndicesA == kIndicesB && 
            mIndicesContiguousC && nIndicesContiguousC &&
            mIndicesContiguousA && kIndicesContiguousA &&
            kIndicesContiguousB && nIndicesContiguousB;
      }

      void print(){
         printf("TransA: %d TransB: %d TransC: %d\n", transA, transB, interchangeAB);
         printVector(indicesA, "Indices A");
         printVector(indicesB, "Indices B");
         printVector(indicesC, "Indices C");
      }
   };

   double getTTGTCandidateCost(const indicesType &indicesA, const sizeType totalSizeA, 
                               const indicesType &indicesB, const sizeType totalSizeB,
                               const indicesType &indicesC, const sizeType totalSizeC, const TTGTCandidate &candidate)
   {
      double cost = 0;
      auto permA = getPermutation(indicesA, candidate.indicesA);
      auto permB = getPermutation(indicesB, candidate.indicesB);
      auto permC = getPermutation(indicesC, candidate.indicesC);

      if( !isIdentity(permA) )
      {
         double penalty = (permA[0] == 0 ) ? 1 : 1.1; //favor transpositions for which the first index is unchanged
         cost += penalty * totalSizeA;
      }
      if( !isIdentity(permB) )
      {
         double penalty = (permB[0] == 0 ) ? 1 : 1.1; //favor transpositions for which the first index is unchanged
         cost += penalty * totalSizeB;
      }
      if( !isIdentity(permC) )
      {
         double penalty = (permC[0] == 0 ) ? 1 : 1.1; //favor transpositions for which the first index is unchanged
         cost += penalty * totalSizeC;
      }
      return cost;
   }
   
   /// target indes will be aIndices(sorted w.r.t. orderA) + bIndices(sorted w.r.t. orderB) + loopIndices
   void concatinate_helper(const indicesType &aIndices, const indicesType &orderA, const indicesType &bIndices, const indicesType &orderB, const indicesType &loopIndices, indicesType &target)
   {
      for(auto idx : orderA )
         if( find(idx, aIndices) )
            target.emplace_back(idx);
      for(auto idx : orderB )
         if( find(idx, bIndices) )
            target.emplace_back(idx);
      for(auto idx : loopIndices)
         target.emplace_back(idx);
   }

   /// determine the transpositions required in order to support indices that appear in all tensors
   void findPerm_helper(const indicesType &indicesA, const indicesType &indicesB, const indicesType &indicesC, 
         const indicesType &mIndices, const indicesType &nIndices, const indicesType &kIndices, const indicesType &loopIndices, 
         indicesType &newIndicesA, indicesType &newIndicesB, indicesType &newIndicesC)
   {
      bool transAreq = false;
      bool transBreq = false;
      bool transCreq = false;
      for(auto idx : loopIndices)
      {
         for(auto it = indicesA.rbegin(); it != indicesA.rend() && *it != idx; it++)
            if( not find(*it, loopIndices) ) {
               transAreq = true;
               break;
            }
         for(auto it = indicesB.rbegin(); it != indicesB.rend() && *it != idx; it++)
            if( not find(*it, loopIndices) ) {
               transBreq = true;
               break;
            }
         for(auto it = indicesC.rbegin(); it != indicesC.rend() && *it != idx; it++)
            if( not find(*it, loopIndices) ) {
               transCreq = true;
               break;
            }
      }

      if( transAreq ){
         if( find( indicesA.front(), mIndices ) ) //choose permutation that can presurve the stride-1 index
            concatinate_helper(mIndices, indicesC, kIndices, indicesB, loopIndices, newIndicesA);
         else
            concatinate_helper(kIndices, indicesB, mIndices, indicesC, loopIndices, newIndicesA);
         if( transBreq ){
            if( find( indicesB.front(), nIndices ) ) //choose permutation that can presurve the stride-1 index
               concatinate_helper(nIndices, indicesC, kIndices, indicesB, loopIndices, newIndicesB);
            else
               concatinate_helper(kIndices, indicesB, nIndices, indicesC, loopIndices, newIndicesB);
            if( transCreq )
               if( find( indicesB.front(), mIndices ) ) //choose permutation that can presurve the stride-1 index
                  concatinate_helper(mIndices, indicesC, nIndices, indicesC, loopIndices, newIndicesC);
               else
                  concatinate_helper(nIndices, indicesC, mIndices, indicesC, loopIndices, newIndicesC);
         }else{
            if( transCreq )
               if( find( indicesC.front(), mIndices ) ) //choose permutation that can presurve the stride-1 index
                  concatinate_helper(mIndices, indicesC, nIndices, indicesB, loopIndices, newIndicesC);
               else
                  concatinate_helper(nIndices, indicesB, mIndices, indicesC, loopIndices, newIndicesC);
         }
      }else{
         if( transBreq ){
            if( find( indicesB.front(), nIndices ) ) //choose permutation that can presurve the stride-1 index
               concatinate_helper(nIndices, indicesC, kIndices, indicesA, loopIndices, newIndicesB);
            else
               concatinate_helper(kIndices, indicesA, nIndices, indicesC, loopIndices, newIndicesB);
            if( transCreq )
               if( find( indicesC.front(), mIndices ) ) //choose permutation that can presurve the stride-1 index
                  concatinate_helper(mIndices, indicesA, nIndices, indicesC, loopIndices, newIndicesC);
               else
                  concatinate_helper(nIndices, indicesC, mIndices, indicesA, loopIndices, newIndicesC);
         }else{
            if( transCreq )
               if( find( indicesC.front(), mIndices ) ) //choose permutation that can presurve the stride-1 index
                  concatinate_helper(mIndices, indicesA, nIndices, indicesB, loopIndices, newIndicesC);
               else
                  concatinate_helper(nIndices, indicesB, mIndices, indicesA, loopIndices, newIndicesC);
         }
      }
      if( not transAreq )
         newIndicesA = indicesA;
      if( not transBreq )
         newIndicesB = indicesB;
      if( not transCreq )
         newIndicesC = indicesC;
   }

   static void helperTranspose(const indicesType& loopIndices, const indicesType& aIndices, const indicesType& bIndices, const indicesType& indicesT,
        bool &trans, indicesType& indices )
   {
      if( aIndices.front() == indicesT.front() ) {
         trans = false;
         concatinate(aIndices, bIndices, indices);
      }else{
         trans = true;
         concatinate(bIndices, aIndices, indices);
      }
      for(auto x : loopIndices)
         indices.emplace_back(x);
   }

   void getBestTTGTCandidate(const indicesType &indicesA, const size_t totalSizeA, 
                                      const indicesType &indicesB, const size_t totalSizeB,
                                      const indicesType &indicesC, const size_t totalSizeC,
                                      const indicesType &loopIndices,
                                      const indicesType &mIndices,
                                      const indicesType &nIndices,
                                      const indicesType &kIndices,
                                      TTGTCandidate &candidate)
   {
      bool mIndicesContiguousC = indicesContiguous(mIndices, indicesC);
      bool nIndicesContiguousC = indicesContiguous(nIndices, indicesC);
      bool mIndicesContiguousA = indicesContiguous(mIndices, indicesA);
      bool kIndicesContiguousA = indicesContiguous(kIndices, indicesA);
      bool nIndicesContiguousB = indicesContiguous(nIndices, indicesB);
      bool kIndicesContiguousB = indicesContiguous(kIndices, indicesB);

      bool transposeRequiredA = !kIndicesContiguousA || !mIndicesContiguousA;
      bool transposeRequiredB = !kIndicesContiguousB || !nIndicesContiguousB;
      bool transposeRequiredC = !mIndicesContiguousC || !nIndicesContiguousC;

      indicesType mIndicesA; sortAccordingTo(mIndices, indicesA, mIndicesA);
      indicesType kIndicesA; sortAccordingTo(kIndices, indicesA, kIndicesA);
      indicesType kIndicesB; sortAccordingTo(kIndices, indicesB, kIndicesB);
      indicesType nIndicesB; sortAccordingTo(nIndices, indicesB, nIndicesB);
      indicesType mIndicesC; sortAccordingTo(mIndices, indicesC, mIndicesC);
      indicesType nIndicesC; sortAccordingTo(nIndices, indicesC, nIndicesC);

      // pick the best candidate that avoids as many transpositions as possible
      if( transposeRequiredB ){
         if( transposeRequiredA ){
            if( transposeRequiredC ){
               //all tensors need to be transposed
               if( totalSizeA >= totalSizeB && totalSizeA >= totalSizeC ){
                  // transpose A
                  helperTranspose(loopIndices,mIndicesA, kIndicesA, indicesA, candidate.transA, candidate.indicesA);
                  // transpose C
                  helperTranspose(loopIndices,mIndicesA, nIndicesC, indicesC, candidate.interchangeAB, candidate.indicesC);
                  // transpose B
                  helperTranspose(loopIndices,kIndicesA, nIndicesC, indicesB, candidate.transB, candidate.indicesB);
               } else if( totalSizeC >= totalSizeB && totalSizeC >= totalSizeA ){
                  // transpose C
                  helperTranspose(loopIndices,mIndicesC, nIndicesC, indicesC, candidate.interchangeAB, candidate.indicesC);
                  // transpose A
                  helperTranspose(loopIndices,mIndicesC, kIndicesA, indicesA, candidate.transA, candidate.indicesA);
                  // transpose B
                  helperTranspose(loopIndices,kIndicesA, nIndicesC, indicesB, candidate.transB, candidate.indicesB);
               } else if( totalSizeB >= totalSizeA && totalSizeB >= totalSizeC ){
                  // transpose B
                  helperTranspose(loopIndices,kIndicesB, nIndicesB, indicesB, candidate.transB, candidate.indicesB);
                  // transpose C
                  helperTranspose(loopIndices,mIndicesC, nIndicesB, indicesC, candidate.interchangeAB, candidate.indicesC);
                  // transpose A
                  helperTranspose(loopIndices,mIndicesC, kIndicesB, indicesA, candidate.transA, candidate.indicesA);
               }
            }else{
               if( totalSizeB > totalSizeA ){
                  // transpose B
                  helperTranspose(loopIndices,kIndicesB, nIndicesC, indicesB, candidate.transB, candidate.indicesB);
                  // transpose A
                  helperTranspose(loopIndices,mIndicesC, kIndicesB, indicesA, candidate.transA, candidate.indicesA);
               }else{
                  // transpose A
                  helperTranspose(loopIndices,mIndicesC, kIndicesA, indicesA, candidate.transA, candidate.indicesA);
                  // transpose B
                  helperTranspose(loopIndices,kIndicesA, nIndicesC, indicesB, candidate.transB, candidate.indicesB);
               }
               //dont transpose C
               candidate.indicesC = indicesC;
               candidate.interchangeAB = nIndicesC.front() == indicesC.front();
            }
         }else{
            if( transposeRequiredC ){
               if( totalSizeC > totalSizeB ){
                  // transpose C
                  helperTranspose(loopIndices,mIndicesA, nIndicesC, indicesC, candidate.interchangeAB, candidate.indicesC);
                  // transpose B
                  helperTranspose(loopIndices,kIndicesA, nIndicesC, indicesB, candidate.transB, candidate.indicesB);
               }else{
                  // transpose B
                  helperTranspose(loopIndices,kIndicesA, nIndicesB, indicesB, candidate.transB, candidate.indicesB);
                  // transpose C
                  helperTranspose(loopIndices,mIndicesA, nIndicesB, indicesC, candidate.interchangeAB, candidate.indicesC);
               }
               //dont transpose A
               candidate.indicesA = indicesA;
               candidate.transA = kIndicesA.front() == indicesA.front();
            }else{
               if( mIndicesC != mIndicesA ){
                  // either A or C also needs to be permuted
                  if( totalSizeA > totalSizeC ){
                     //dont transpose A
                     candidate.indicesA = indicesA;
                     candidate.transA = kIndicesA.front() == indicesA.front();
                     // transpose C
                     helperTranspose(loopIndices,mIndicesA, nIndicesC, indicesC, candidate.interchangeAB, candidate.indicesC);
                  }else{
                     //dont transpose C
                     candidate.indicesC = indicesC;
                     candidate.interchangeAB = nIndicesC.front() == indicesC.front();
                     // transpose A
                     helperTranspose(loopIndices,mIndicesC, kIndicesA, indicesA, candidate.transA, candidate.indicesA);
                  }
               }else{
                  //dont transpose A
                  candidate.indicesA = indicesA;
                  candidate.transA = kIndicesA.front() == indicesA.front();
                  //dont transpose C
                  candidate.indicesC = indicesC;
                  candidate.interchangeAB = nIndicesC.front() == indicesC.front();
               }
               // transpose B
               helperTranspose(loopIndices,kIndicesA, nIndicesC, indicesB, candidate.transB, candidate.indicesB);
            }
         } 
      }else{
         if( transposeRequiredA ){
            if( transposeRequiredC ){
               if( totalSizeC > totalSizeA ){
                  // transpose C
                  helperTranspose(loopIndices,mIndicesC, nIndicesB, indicesC, candidate.interchangeAB, candidate.indicesC);
                  // transpose A
                  helperTranspose(loopIndices,mIndicesC, kIndicesB, indicesA, candidate.transA, candidate.indicesA);
               }else{
                  // transpose A
                  helperTranspose(loopIndices,mIndicesA, kIndicesB, indicesA, candidate.transA, candidate.indicesA);
                  // transpose C
                  helperTranspose(loopIndices,mIndicesA, nIndicesB, indicesC, candidate.interchangeAB, candidate.indicesC);
               }
               //dont transpose B
               candidate.indicesB = indicesB;
               candidate.transB = nIndicesB.front() == indicesB.front();
            }else{
               if( nIndicesC != nIndicesB ){
                  // either B or C also needs to be permuted
                  if( totalSizeB > totalSizeC ){
                     //dont transpose B
                     candidate.indicesB = indicesB;
                     candidate.transB = nIndicesB.front() == indicesB.front();
                     // transpose C
                     helperTranspose(loopIndices,mIndicesC, nIndicesB, indicesC, candidate.interchangeAB, candidate.indicesC);
                  }else{
                     //dont transpose C
                     candidate.indicesC = indicesC;
                     candidate.interchangeAB = nIndicesC.front() == indicesC.front();
                     // transpose B
                     helperTranspose(loopIndices,kIndicesB, nIndicesC, indicesB, candidate.transB, candidate.indicesB);
                  }
               }else{
                  //dont transpose B
                  candidate.indicesB = indicesB;
                  candidate.transB = nIndicesB.front() == indicesB.front();
                  //dont transpose C
                  candidate.indicesC = indicesC;
                  candidate.interchangeAB = nIndicesC.front() == indicesC.front();
               }
               // transpose A
               helperTranspose(loopIndices,mIndicesC, kIndicesB, indicesA, candidate.transA, candidate.indicesA);
            }
         }else{ 
            if( transposeRequiredC ){ //not a, not b, c
               if( kIndicesA != kIndicesB ){
                  // either A or B also needs to be permuted
                  if( totalSizeA > totalSizeB ){
                     //dont transpose A
                     candidate.indicesA = indicesA;
                     candidate.transA = kIndicesA.front() == indicesA.front();
                     // transpose B
                     helperTranspose(loopIndices,kIndicesA, nIndicesB, indicesB, candidate.transB, candidate.indicesB);
                  }else{
                     //dont transpose B
                     candidate.indicesB = indicesB;
                     candidate.transB = nIndicesB.front() == indicesB.front();
                     // transpose A
                     helperTranspose(loopIndices,mIndicesA, kIndicesB, indicesA, candidate.transA, candidate.indicesA);
                  }
               }else{
                  //dont transpose A
                  candidate.indicesA = indicesA;
                  candidate.transA = kIndicesA.front() == indicesA.front();
                  //dont transpose B
                  candidate.indicesB = indicesB;
                  candidate.transB = nIndicesB.front() == indicesB.front();
               }
               // transpose C
               helperTranspose(loopIndices,mIndicesA, nIndicesB, indicesC, candidate.interchangeAB, candidate.indicesC);
            }else{
               if( kIndicesA != kIndicesB ){
                  // transpose A or B
                  if( mIndicesA != mIndicesC ){
                     // transpose A or C
                     if( nIndicesC != nIndicesB ){
                        // transpose C or B
                        // transpose atleast two tensors
                        if( totalSizeA >= totalSizeB && totalSizeA >= totalSizeC ){
                           //dont transpose A
                           candidate.indicesA = indicesA;
                           candidate.transA = kIndicesA.front() == indicesA.front();
                           // transpose B
                           helperTranspose(loopIndices,kIndicesA, nIndicesB, indicesB, candidate.transB, candidate.indicesB);
                           // transpose C
                           helperTranspose(loopIndices,mIndicesA, nIndicesB, indicesC, candidate.interchangeAB, candidate.indicesC);
                        }else if( totalSizeC >= totalSizeB && totalSizeC >= totalSizeA ){
                           //dont transpose C
                           candidate.indicesC = indicesC;
                           candidate.interchangeAB = nIndicesC.front() == indicesC.front();
                           // transpose B
                           helperTranspose(loopIndices,kIndicesB, nIndicesC, indicesB, candidate.transB, candidate.indicesB);
                           // transpose A
                           helperTranspose(loopIndices,mIndicesC, kIndicesB, indicesA, candidate.transA, candidate.indicesA);
                        }else{
                           //dont transpose B
                           candidate.indicesB = indicesB;
                           candidate.transB = nIndicesB.front() == indicesB.front();
                           // transpose A
                           helperTranspose(loopIndices,mIndicesA, kIndicesB, indicesA, candidate.transA, candidate.indicesA);
                           // transpose C
                           helperTranspose(loopIndices,mIndicesA, nIndicesB, indicesC, candidate.interchangeAB, candidate.indicesC);
                        }
                     }else{ // A only is possible
                        if( totalSizeA <= totalSizeB + totalSizeC ){
                           // transpose A
                           helperTranspose(loopIndices,mIndicesC, kIndicesB, indicesA, candidate.transA, candidate.indicesA);
                           //dont transpose B
                           candidate.indicesB = indicesB;
                           candidate.transB = nIndicesB.front() == indicesB.front();
                           //dont transpose C
                           candidate.indicesC = indicesC;
                           candidate.interchangeAB = nIndicesC.front() == indicesC.front();
                        }else{
                           //dont transpose A
                           candidate.indicesA = indicesA;
                           candidate.transA = kIndicesA.front() == indicesA.front();
                           // transpose B
                           helperTranspose(loopIndices,kIndicesA, nIndicesB, indicesB, candidate.transB, candidate.indicesB);
                           // transpose C
                           helperTranspose(loopIndices,mIndicesA, nIndicesB, indicesC, candidate.interchangeAB, candidate.indicesC);
                        }
                     }
                  }else{
                     if( nIndicesC != nIndicesB ){
                        // transpose C or B
                        // either only B or A and C
                        if( totalSizeB <= totalSizeA + totalSizeC ){
                           //dont transpose A
                           candidate.indicesA = indicesA;
                           candidate.transA = kIndicesA.front() == indicesA.front();
                           //dont transpose C
                           candidate.indicesC = indicesC;
                           candidate.interchangeAB = nIndicesC.front() == indicesC.front();
                           // transpose B
                           helperTranspose(loopIndices,kIndicesA, nIndicesC, indicesB, candidate.transB, candidate.indicesB);
                        }else{
                           //dont transpose B
                           candidate.indicesB = indicesB;
                           candidate.transB = nIndicesB.front() == indicesB.front();
                           // transpose C
                           helperTranspose(loopIndices,mIndicesC, nIndicesB, indicesC, candidate.interchangeAB, candidate.indicesC);
                           // transpose A
                           helperTranspose(loopIndices,mIndicesC, kIndicesB, indicesA, candidate.transA, candidate.indicesA);
                        }
                     }else{
                        // transpose A or B
                        if( totalSizeA > totalSizeB ){
                           //dont transpose A
                           candidate.indicesA = indicesA;
                           candidate.transA = kIndicesA.front() == indicesA.front();
                           //dont transpose C
                           candidate.indicesC = indicesC;
                           candidate.interchangeAB = nIndicesC.front() == indicesC.front();
                           // transpose B
                           helperTranspose(loopIndices,kIndicesA, nIndicesC, indicesB, candidate.transB, candidate.indicesB);
                        }else{
                           //dont transpose B
                           candidate.indicesB = indicesB;
                           candidate.transB = nIndicesB.front() == indicesB.front();
                           //dont transpose C
                           candidate.indicesC = indicesC;
                           candidate.interchangeAB = nIndicesC.front() == indicesC.front();
                           // transpose A
                           helperTranspose(loopIndices,mIndicesC, kIndicesB, indicesA, candidate.transA, candidate.indicesA);
                        }
                     }
                  }
               }else{
                  if( mIndicesA != mIndicesC ){
                     // transpose A or C
                     if( nIndicesC != nIndicesB ){
                        // transpose C or B
                        if( totalSizeC <= totalSizeA + totalSizeB ){
                           //dont transpose A
                           candidate.indicesA = indicesA;
                           candidate.transA = kIndicesA.front() == indicesA.front();
                           //dont transpose B
                           candidate.indicesB = indicesB;
                           candidate.transB = nIndicesB.front() == indicesB.front();
                           // transpose C
                           helperTranspose(loopIndices,mIndicesA, nIndicesB, indicesC, candidate.interchangeAB, candidate.indicesC);
                        }else{
                           //dont transpose C
                           candidate.indicesC = indicesC;
                           candidate.interchangeAB = nIndicesC.front() == indicesC.front();
                           // transpose A
                           helperTranspose(loopIndices,mIndicesC, kIndicesA, indicesA, candidate.transA, candidate.indicesA);
                           // transpose B
                           helperTranspose(loopIndices,kIndicesA, nIndicesC, indicesB, candidate.transB, candidate.indicesB);
                        }
                     }else{
                        if( totalSizeA > totalSizeC ){
                           //dont transpose A
                           candidate.indicesA = indicesA;
                           candidate.transA = kIndicesA.front() == indicesA.front();
                           //dont transpose B
                           candidate.indicesB = indicesB;
                           candidate.transB = nIndicesB.front() == indicesB.front();
                           // transpose C
                           helperTranspose(loopIndices,mIndicesA, nIndicesB, indicesC, candidate.interchangeAB, candidate.indicesC);
                        }else{
                           //dont transpose B
                           candidate.indicesB = indicesB;
                           candidate.transB = nIndicesB.front() == indicesB.front();
                           //dont transpose C
                           candidate.indicesC = indicesC;
                           candidate.interchangeAB = nIndicesC.front() == indicesC.front();
                           // transpose A
                           helperTranspose(loopIndices,mIndicesC, kIndicesB, indicesA, candidate.transA, candidate.indicesA);
                        }
                     }
                  }else{
                     //dont transpose A
                     candidate.indicesA = indicesA;
                     candidate.transA = kIndicesA.front() == indicesA.front();
                     if( nIndicesC != nIndicesB ){
                        // transpose C or B
                        if( totalSizeC > totalSizeB ){
                           //dont transpose C
                           candidate.indicesC = indicesC;
                           candidate.interchangeAB = nIndicesC.front() == indicesC.front();
                           // transpose B
                           helperTranspose(loopIndices,kIndicesA, nIndicesC, indicesB, candidate.transB, candidate.indicesB);
                        }else{
                           //dont transpose B
                           candidate.indicesB = indicesB;
                           candidate.transB = nIndicesB.front() == indicesB.front();
                           // transpose C
                           helperTranspose(loopIndices,mIndicesA, nIndicesB, indicesC, candidate.interchangeAB, candidate.indicesC);
                        }
                     }else{
                        //dont transpose B
                        candidate.indicesB = indicesB;
                        candidate.transB = nIndicesB.front() == indicesB.front();
                        //dont transpose C
                        candidate.indicesC = indicesC;
                        candidate.interchangeAB = nIndicesC.front() == indicesC.front();
                     }
                  }
               }
            }
         }
      }
#ifdef DEBUG
      if( !candidate.isValid() ){
         std::cerr<< "ERROR: TTGT candidate is invalid.\n";
         std::cout<< transposeRequiredA << transposeRequiredB << transposeRequiredC <<std::endl;
         std::cout << "-------------------\n";
         printVector(candidate.indicesA, "A");
         printVector(candidate.indicesB, "B");
         printVector(candidate.indicesC, "C");
         printf("%ld %ld %ld %d %d %d\n", totalSizeA, totalSizeB, totalSizeC, candidate.transA, candidate.transB, candidate.interchangeAB);
         exit(-1);
      }
#endif
      return;
   }

   template<typename floatType>
   void batchedGEMM( const floatType alpha, const floatType* A, const floatType *B, const floatType beta, floatType *C, const TTGTCandidate &candidate,
         const sizeType m, const sizeType n, const sizeType k, const std::vector<sizeType> &sizes,  
         const std::vector<sizeType> &stridesA, const std::vector<sizeType> &stridesB, const std::vector<sizeType> &stridesC, const int level)
   {
      if( level >= stridesA.size() )
      {
         if( candidate.interchangeAB )
            if( candidate.transA )
               if( candidate.transB )
                  // n,m <- n,k x k,m
                  gemm<floatType>("N", "N", &n, &m, &k,
                        &alpha, B, &n, A, &k, &beta, C, &n);
               else
                  // n,m <- k,n x k,m
                  gemm<floatType>("T", "N", &n, &m, &k,
                        &alpha, B, &k, A, &k, &beta, C, &n);
            else
               if( candidate.transB )
                  // n,m <- n,k x m,k
                  gemm<floatType>("N", "T", &n, &m, &k,
                        &alpha, B, &n, A, &m, &beta, C, &n);
               else
                  // n,m <- k,n x m,k
                  gemm<floatType>("T", "T", &n, &m, &k,
                        &alpha, B, &k, A, &m, &beta, C, &n);
         else
            if( candidate.transA )
               if( candidate.transB )
                  // m,n <- k,m x n,k
                  gemm<floatType>("T", "T", &m, &n, &k,
                        &alpha, A, &k, B, &n, &beta, C, &m);
               else
                  // m,n <- k,m x k,n
                  gemm<floatType>("T", "N", &m, &n, &k,
                        &alpha, A, &k, B, &k, &beta, C, &m);
            else
               if( candidate.transB )
                  // m,n <- m,k x n,k
                  gemm<floatType>("N", "T", &m, &n, &k,
                        &alpha, A, &m, B, &n, &beta, C, &m);
               else
                  // m,n <- m,k x k,n
                  gemm<floatType>("N", "N", &m, &n, &k,
                        &alpha, A, &m, B, &k, &beta, C, &m);
      } else {
         auto end = sizes[level];
         const auto strideA = stridesA[level];
         const auto strideB = stridesB[level];
         const auto strideC = stridesC[level];
         //TODO call batched GEMM
#pragma omp parallel for if(level==0)
         for(sizeType i=0; i < end; ++i)
            batchedGEMM( alpha, A + i * strideA, B + i * strideB, beta, C + i * strideC, 
                  candidate, m, n, k, sizes, stridesA, stridesB, stridesC, level+1 );
      }
   }
   
   template<typename floatType>
   error contractTTGT(const floatType alpha, const Tensor<floatType> *A, const Tensor<floatType> *B,  const floatType beta, Tensor<floatType> *C)
   {
#ifdef TIMERS
      auto start = omp_get_wtime();
#endif

      auto indicesA = A->getIndices();
      auto indicesB = B->getIndices();
      auto indicesC = C->getIndices(); 
      auto loopIndices = intersect(indicesA, intersect(indicesB, indicesC));
      //! also known as the free indices of A 
      auto mIndices = setMinus(intersect(indicesA, indicesC), loopIndices);
      //! also known as the free indices of B
      auto nIndices = setMinus(intersect(indicesB, indicesC), loopIndices);
      //! also known as the contracted indices 
      auto kIndices = setMinus(intersect(indicesA, indicesB), loopIndices);

      if( mIndices.size() <= 0 || nIndices.size() <= 0 || kIndices.size() <= 0 ) // TTGT is not applicable; use fallback
         return contract(alpha, A, B, beta, C);

      auto totalSizeA = A->getTotalSize() * sizeof(floatType);
      auto totalSizeB = B->getTotalSize() * sizeof(floatType);
      auto totalSizeC = C->getTotalSize() * sizeof(floatType);
      TTGTCandidate candidate;

      if( loopIndices.size() > 0 )
      {
         // ensure that loop indices are the outermost indices
         indicesType newIndicesA, newIndicesB, newIndicesC;
         findPerm_helper(indicesA, indicesB, indicesC, mIndices, nIndices, kIndices, loopIndices, 
               newIndicesA, newIndicesB, newIndicesC);

         getBestTTGTCandidate(newIndicesA, totalSizeA, 
               newIndicesB, totalSizeB,
               newIndicesC, totalSizeC,
               loopIndices, mIndices, nIndices, kIndices, candidate);

      }else{
         getBestTTGTCandidate(indicesA, totalSizeA, 
               indicesB, totalSizeB,
               indicesC, totalSizeC,
               loopIndices, mIndices, nIndices, kIndices, candidate);
      }
      
#ifdef TIMERS
      start = omp_get_wtime();
#endif
      /*********************
       * Request auxiliary memory form the memory broker
       *********************/
      auto permA = getPermutation(indicesA, candidate.indicesA);
      auto permB = getPermutation(indicesB, candidate.indicesB);
      auto permC = getPermutation(candidate.indicesC, indicesC);

      size_t requestedSize = 0;
      if( !isIdentity(permA) )
         requestedSize += totalSizeA;
      if( !isIdentity(permB) )
         requestedSize += totalSizeB;
      if( !isIdentity(permC) )
         requestedSize += totalSizeC;

      if( requestedSize > memBroker.size() )
      {
         if( memBroker.isInit() )
            memBroker.release();
         memBroker.alloc( requestedSize );
      }

      int numThreads = getNumThreads(); 
#ifdef TIMERS
      auto memTime = omp_get_wtime() - start;
      printf("TCL membroker: %f\n",memTime);
#endif

      floatType *bufferA(nullptr), *bufferB(nullptr), *bufferC(nullptr);
      floatType betaGEMM = beta;

      /*********************
       * Transpose A
       *********************/
#ifdef TIMERS
      start = omp_get_wtime();
#endif
      if( !isIdentity(permA) ) {
         // packing of A is required
         auto sizeA = permute(permA, A->getSize());
         bufferA = (floatType*) memBroker.requestMemory(totalSizeA);
#ifdef DEBUG
         printVector(A->getSize(), "sizeA in");
         printVector(A->getOuterSize(), "outerSizeA in");
         printVector(permA, "permA");
         printVector(sizeA, "sizeA out");
#endif
         // create plan for Transposition
         auto plan = hptt::create_plan( permA, A->getDim(),
               1, A->getData(), A->getSize(), A->getOuterSize(), 
               0, bufferA, sizeA, hptt::ESTIMATE, numThreads);
         plan->execute();
      }else
         bufferA = A->getData();
#ifdef TIMERS
      auto packTimeA = omp_get_wtime() - start;
      printf("TCL A: %f\n",packTimeA);
#endif

      /*********************
       * Transpose B
       *********************/
#ifdef TIMERS
      start = omp_get_wtime();
#endif
      if( !isIdentity(permB) ) 
      {
         auto sizeB = permute(permB, B->getSize());
#ifdef DEBUG
         printVector(B->getSize(), "sizeB in");
         printVector(B->getOuterSize(), "outerSizeB in");
         printVector(permB, "permB");
         printVector(sizeB, "sizeB out");
#endif
         // packing of B is required
         bufferB = (floatType*) memBroker.requestMemory(totalSizeB);
         // create plan for Transposition
         auto plan = hptt::create_plan( permB, B->getDim(),
               1, B->getData(), B->getSize(), B->getOuterSize(), 
               0, bufferB, sizeB, hptt::ESTIMATE, numThreads);
         plan->execute();
      }else
         bufferB = B->getData();
#ifdef TIMERS
      auto packTimeB = omp_get_wtime() - start;
      printf("TCL B: %f\n",packTimeB);
#endif

      if( !isIdentity(permC) ) {
         betaGEMM = 0;
         bufferC = (floatType*) memBroker.requestMemory(totalSizeC);
      }else
         bufferC = C->getData();

      /*********************
       * GEMM 
       *********************/
      std::vector<sizeType> stridesA, stridesB, stridesC, sizes;
      if( loopIndices.size() > 0 ){
         auto m = A->getTotalSize(mIndices);
         auto n = B->getTotalSize(nIndices);
         auto k = A->getTotalSize(kIndices);
         auto strideA = m * k;
         auto strideB = n * k;
         auto strideC = m * n;
         for( auto idx : loopIndices )
            sizes.emplace_back(A->getSize(idx));
         for( auto idx : candidate.indicesA ){
            if( find(idx, loopIndices ) ) {
               stridesA.emplace_back(strideA);
               strideA *= A->getSize(idx);
            }
         }
         for( auto idx : candidate.indicesB ){
            if( find(idx, loopIndices ) ) {
               stridesB.emplace_back(strideB);
               strideB *= B->getSize(idx);
            }
         }
         for( auto idx : candidate.indicesC ){
            if( find(idx, loopIndices ) ) {
               stridesC.emplace_back(strideC);
               strideC *= C->getSize(idx);
            }
         }
      }

#ifdef TIMERS
      start = omp_get_wtime();
#endif

      batchedGEMM( alpha, bufferA, bufferB,  betaGEMM, bufferC, 
            candidate, A->getTotalSize(mIndices), B->getTotalSize(nIndices), A->getTotalSize(kIndices),
            sizes, stridesA, stridesB, stridesC, 0 );

#ifdef TIMERS
      auto gemmTime = omp_get_wtime() - start;
      printf("TCL GEMM: %f\n", gemmTime);
#endif

      /*********************
       * untranspose C
       *********************/
#ifdef TIMERS
      start = omp_get_wtime();
#endif
      if( !isIdentity(permC) ) {
         auto invPermC = getPermutation(indicesC, candidate.indicesC);
         auto sizeC = permute(invPermC, C->getSize());
#ifdef DEBUG
         printVector(C->getSize(), "sizeC out");
         printVector(C->getOuterSize(), "outerSizeC out");
         printVector(permC, "permC");
         printVector(sizeC, "sizeC in");
#endif
         // create plan for Transposition
         auto plan = hptt::create_plan( permC, C->getDim(),
               1, bufferC, sizeC, sizeC, 
               beta, C->getData(), C->getOuterSize(), hptt::ESTIMATE, numThreads);
         plan->execute();
      }
#ifdef TIMERS
      auto packTimeC = omp_get_wtime() - start;
      printf("TCL: %f GFLOPS %f %f\n", totalSizeM*totalSizeN*totalSizeK*2. / 1e9 / (gemmTime+packTimeA+packTimeB+packTimeC), getBestTime / (gemmTime+packTimeA+packTimeB+packTimeC+getBestTime), (gemmTime+packTimeA+packTimeB+packTimeC+getBestTime));
#endif

      //free memory
      memBroker.reset();
      return SUCCESS;
   }

   template<typename floatType>
   floatType contractedLoops(const std::vector<sizeType> &stridesA, const floatType *dataA, 
                             const std::vector<sizeType> &stridesB, const floatType *dataB,
                             const std::vector<sizeType> &sizes, const int loop)
   {
      const auto size = sizes[loop];
      const auto strideA = stridesA[loop];
      const auto strideB = stridesB[loop];
      floatType tmp = 0;
      if( loop < sizes.size() - 1)
         for(int m=0; m < size; ++m)
            tmp += contractedLoops(stridesA, &dataA[m*strideA], stridesB, &dataB[m*strideB], sizes, loop+1);
      else
         TCL_DUPLICATE(strideA==1, // help the compiler to optimize the code
               TCL_DUPLICATE(strideB==1 ,
                  for(int m=0; m < size; ++m)
                     tmp += dataA[m * strideA] * dataB[m*strideB];
               )
         )

      return tmp;
   }

   template<typename floatType, int numParallel, int betaIsZero>
   void freeLoops(floatType alpha, const std::vector<sizeType> &stridesA, const floatType *dataA, 
                                   const std::vector<sizeType> &stridesB, const floatType *dataB, 
                  floatType beta,  const std::vector<sizeType> &stridesC,       floatType *dataC, 
                                   const std::vector<sizeType> &sizes, const int numFreeLoops, const int numContractedLoops, const int loop)
   {
      if( numContractedLoops == 0 )
      {
         if( numParallel == 2)
         {
            const auto s0 = sizes[0];
            const auto s1 = sizes[1];
            const auto stridesC1 = stridesC[1];
            const auto stridesC0 = stridesC[0];
            const auto stridesA1 = stridesA[1];
            const auto stridesA0 = stridesA[0];
            const auto stridesB1 = stridesB[1];
            const auto stridesB0 = stridesB[0];
            if( numParallel == numFreeLoops ){
#pragma omp parallel for collapse(2)
               for(int i=0; i < s0; ++i)
                  for(int j=0; j < s1; ++j)
                    TCL_DUPLICATE(stridesC1==0,
                    TCL_DUPLICATE(stridesC1==1,
                    TCL_DUPLICATE(stridesA1==0,
                    TCL_DUPLICATE(stridesA1==1,
                    TCL_DUPLICATE(stridesB1==0,
                    TCL_DUPLICATE(stridesB1==1,
                     if( betaIsZero )
                        dataC[i*stridesC0 + j*stridesC1] = alpha * dataA[i*stridesA0 + j*stridesA1] * dataB[i*stridesB0 + j*stridesB1];
                     else
                        dataC[i*stridesC0 + j*stridesC1] = alpha * dataA[i*stridesA0 + j*stridesA1] * dataB[i*stridesB0 + j*stridesB1] + beta * dataC[i*stridesC0 + j*stridesC1];
                    ))))))
            }else{
#pragma omp parallel for collapse(2)
               for(int i=0; i < s0; ++i)
                  for(int j=0; j < s1; ++j)
                     freeLoops<floatType, 0, betaIsZero>(alpha, stridesA, &dataA[i*stridesA0 + j*stridesA1], stridesB, &dataB[i*stridesB0 + j*stridesB1], beta, stridesC, &dataC[i*stridesC0 + j*stridesC1], 
                           sizes, numFreeLoops, numContractedLoops, loop+2);
            }
         }else if (numParallel == 1){
            const auto s0 = sizes[0];
            const auto stridesC0 = stridesC[0];
            const auto stridesA0 = stridesA[0];
            const auto stridesB0 = stridesB[0];
#pragma omp parallel for 
            for(int i=0; i < s0; ++i)
              TCL_DUPLICATE(stridesC0==0,
              TCL_DUPLICATE(stridesC0==1,
              TCL_DUPLICATE(stridesA0==0,
              TCL_DUPLICATE(stridesA0==1,
              TCL_DUPLICATE(stridesB0==0,
              TCL_DUPLICATE(stridesB0==1,
               if( betaIsZero )
                  dataC[i * stridesC0] = alpha * dataA[i * stridesA0] * dataB[i * stridesB0];
               else
                  dataC[i * stridesC0] = alpha * dataA[i * stridesA0] * dataB[i * stridesB0] + beta * dataC[i * stridesC0];
              ))))))
         }else{
            // recurse without spawning threads
            for(int i=0; i < sizes[loop]; ++i)
               freeLoops<floatType, 0, betaIsZero>(alpha, stridesA, &dataA[i*stridesA[loop]], stridesB, &dataB[i*stridesB[loop]], beta, stridesC, &dataC[i*stridesC[loop]], 
                     sizes, numFreeLoops, numContractedLoops, loop+1);
         }
      }else{
         if( numParallel == 2)
         {
            const auto s0 = sizes[0];
            const auto s1 = sizes[1];
            const auto stridesC1 = stridesC[1];
            const auto stridesC0 = stridesC[0];
            const auto stridesA1 = stridesA[1];
            const auto stridesA0 = stridesA[0];
            const auto stridesB1 = stridesB[1];
            const auto stridesB0 = stridesB[0];
            if( numParallel == numFreeLoops ){
#pragma omp parallel for collapse(2)
               for(int i=0; i < s0; ++i)
                  for(int j=0; j < s1; ++j)
                    TCL_DUPLICATE(stridesC1==0,
                    TCL_DUPLICATE(stridesC1==1,
                    TCL_DUPLICATE(stridesA1==0,
                    TCL_DUPLICATE(stridesA1==1,
                    TCL_DUPLICATE(stridesB1==0,
                    TCL_DUPLICATE(stridesB1==1,
                     if( betaIsZero )
                        //C[i*stridesC1 + j * stridesC0] = alpha * dataA[i*stridesA1 + j * stridesA0] * dataB[i*stridesB1 + j * stridesB0];
                        dataC[i*stridesC0 + j*stridesC1] = alpha * contractedLoops(stridesA, &dataA[i*stridesA0 + j*stridesA1], 
                              stridesB, &dataB[i*stridesB0 + j*stridesB1], sizes, loop+2);
                     else
                        dataC[i*stridesC0 + j*stridesC1] = alpha * contractedLoops(stridesA, &dataA[i*stridesA0 + j*stridesA1], 
                              stridesB, &dataB[i*stridesB0 + j*stridesB1], sizes, loop+2) + beta * dataC[i*stridesC0 + j * stridesC1];
                    ))))))
            }else{
#pragma omp parallel for collapse(2)
               for(int i=0; i < s0; ++i)
                  for(int j=0; j < s1; ++j)
                     freeLoops<floatType, 0, betaIsZero>(alpha, stridesA, &dataA[i*stridesA0 + j*stridesA1], stridesB, &dataB[i*stridesB0 + j*stridesB1], beta, stridesC, &dataC[i*stridesC0 + j*stridesC1], 
                           sizes, numFreeLoops, numContractedLoops, loop+2);
            }
         }else if (numParallel == 1){
            const auto s0 = sizes[0];
            const auto stridesC0 = stridesC[0];
            const auto stridesA0 = stridesA[0];
            const auto stridesB0 = stridesB[0];
#pragma omp parallel for 
            for(int i=0; i < s0; ++i)
              TCL_DUPLICATE(stridesC0==0,
              TCL_DUPLICATE(stridesC0==1,
              TCL_DUPLICATE(stridesA0==0,
              TCL_DUPLICATE(stridesA0==1,
              TCL_DUPLICATE(stridesB0==0,
              TCL_DUPLICATE(stridesB0==1,
               if( betaIsZero )
                  dataC[i*stridesC0] = alpha * contractedLoops(stridesA, &dataA[i*stridesA0], 
                        stridesB, &dataB[i*stridesB0], sizes, loop+1);
               else
                  dataC[i*stridesC0] = alpha * contractedLoops(stridesA, &dataA[i*stridesA0], 
                        stridesB, &dataB[i*stridesB0], sizes, loop+1) + beta * dataC[i*stridesC0];
              ))))))
         }else if(loop < numFreeLoops){
            // recurse without spawning threads

            const auto stridesC0 = stridesC[loop];
            const auto stridesA0 = stridesA[loop];
            const auto stridesB0 = stridesB[loop];
            for(int i=0; i < sizes[loop]; ++i)
               freeLoops<floatType, 0, betaIsZero>(alpha, stridesA, &dataA[i*stridesA0], stridesB, &dataB[i*stridesB0], beta, stridesC, &dataC[i*stridesC0], 
                     sizes, numFreeLoops, numContractedLoops, loop+1);
         }else{
            // recurse without spawning threads
            if( betaIsZero )
               (*dataC) = alpha * contractedLoops(stridesA, dataA, stridesB, dataB, sizes, loop);
            else
               (*dataC) = alpha * contractedLoops(stridesA, dataA, stridesB, dataB, sizes, loop) + beta * (*dataC);
         }
      }
   }

   //! generic muliply method
   template<typename floatType>
   error contract(const floatType alpha, const Tensor<floatType> *A, const Tensor<floatType> *B,  const floatType beta, Tensor<floatType> *C)
   {
      /*******************
       * Determine Loop Order
       ********************/
      auto loopIndices = intersect(A->getIndices(), intersect(B->getIndices(), C->getIndices()));
      //! also known as the free indices of A 
      auto mIndices = setMinus(intersect(A->getIndices(), C->getIndices()), loopIndices); // avoid loop indices
      //! also known as the free indices of B
      auto nIndices = setMinus(intersect(B->getIndices(), C->getIndices()), loopIndices);
      //! also known as the contracted indices 
      auto kIndices = setMinus(intersect(A->getIndices(), B->getIndices()), loopIndices);
      
      if( loopIndices.size() > 0 )
         return TENSOR_CONTRACTION_UNSUPPORTED;

      //ensure that a stride-1 indx is the innermost loop if it belongs to the kIndices
      auto posB = findPos(B->getIndices().front(), kIndices);
      auto posA = findPos(A->getIndices().front(), kIndices);
      if( kIndices.size() > 1 && posA == -1 && posB != 0 )
      {
         int count = 0;
         while(count != posB){
            auto idx = kIndices.front(); kIndices.pop_front();
            kIndices.push_back(idx);
            count++;
         }
      }

      const int numIndices = loopIndices.size() + mIndices.size() + nIndices.size() + kIndices.size();
      std::vector<sizeType> sizes(numIndices);
      std::vector<sizeType> stridesA(numIndices);
      std::vector<sizeType> stridesB(numIndices);
      std::vector<sizeType> stridesC(numIndices);
      std::list<std::string> loopOrder;

      auto itA = A->getIndices().cbegin();
      auto itB = B->getIndices().cbegin();
      auto itC = C->getIndices().cbegin();
      int countIndices = 0;
      // keep kIndices as innermost loops
      for( auto idx : kIndices ){
         loopOrder.push_front(idx);
         sizes[numIndices - countIndices - 1] = A->getSize(idx);
         stridesA[numIndices - countIndices - 1] = A->getStride(idx);
         stridesB[numIndices - countIndices - 1] = B->getStride(idx);
         stridesC[numIndices - countIndices - 1] = 0;
         countIndices++;
      }
      while(itA != A->getIndices().cend() || itB != B->getIndices().cend() || itC != C->getIndices().cend() )
      {
         // add one index of C
         for(; itC != C->getIndices().cend(); itC++)
         {
            if( !find(*itC, loopOrder) ){
               loopOrder.push_front(*itC);
               sizes[numIndices-1 - countIndices] = C->getSize(*itC);
               stridesA[numIndices - countIndices - 1] = A->getStride(*itC);
               stridesB[numIndices - countIndices - 1] = B->getStride(*itC);
               stridesC[numIndices - countIndices - 1] = C->getStride(*itC);
               countIndices++;
               break;
            }
         }
         // add one index of A
         for(; itA != A->getIndices().cend(); itA++)
         {
            if( !find(*itA, loopOrder) ){
               loopOrder.push_front(*itA);
               sizes[numIndices - countIndices - 1] = A->getSize(*itA);
               stridesA[numIndices - countIndices - 1] = A->getStride(*itA);
               stridesB[numIndices - countIndices - 1] = B->getStride(*itA);
               stridesC[numIndices - countIndices - 1] = C->getStride(*itA);
               countIndices++;
               break;
            }
         }
         // add one index of B
         for(; itB != B->getIndices().cend(); itB++)
         {
            if( !find(*itB, loopOrder) ){
               loopOrder.push_front(*itB);
               sizes[numIndices - countIndices - 1] = B->getSize(*itB);
               stridesA[numIndices - countIndices - 1] = A->getStride(*itB);
               stridesB[numIndices - countIndices - 1] = B->getStride(*itB);
               stridesC[numIndices - countIndices - 1] = C->getStride(*itB);
               countIndices++;
               break;
            }
         }
      } 
      assert( countIndices == mIndices.size() + nIndices.size() + kIndices.size() + loopIndices.size() );
//      printVector(loopOrder, "Loop Order");
      /***************************************/

      int numParallelizableLoops = mIndices.size() + nIndices.size() + loopIndices.size();
      if( numParallelizableLoops >= 2 )
         if( std::abs(beta) < getZeroThreshold<floatType>())
            freeLoops<floatType, 2, 1>(alpha, stridesA, A->getData(), 
                  stridesB, B->getData(), 
                  beta,  stridesC, C->getData(), 
                  sizes, numParallelizableLoops, kIndices.size(), 0);
         else
            freeLoops<floatType, 2, 0>(alpha, stridesA, A->getData(), 
                  stridesB, B->getData(), 
                  beta,  stridesC, C->getData(), 
                  sizes, numParallelizableLoops, kIndices.size(), 0);
      else if( numParallelizableLoops == 1 )
         if( std::abs(beta) < getZeroThreshold<floatType>())
            freeLoops<floatType, 1, 1>(alpha, stridesA, A->getData(), 
                  stridesB, B->getData(), 
                  beta,  stridesC, C->getData(), 
                  sizes, numParallelizableLoops, kIndices.size(), 0);
         else
            freeLoops<floatType, 1, 0>(alpha, stridesA, A->getData(), 
                  stridesB, B->getData(), 
                  beta,  stridesC, C->getData(), 
                  sizes, numParallelizableLoops, kIndices.size(), 0);
      else
         if( std::abs(beta) < getZeroThreshold<floatType>())
            freeLoops<floatType, 0, 1>(alpha, stridesA, A->getData(), 
                  stridesB, B->getData(), 
                  beta,  stridesC, C->getData(), 
                  sizes, numParallelizableLoops, kIndices.size(), 0);
         else
            freeLoops<floatType, 0, 0>(alpha, stridesA, A->getData(), 
                  stridesB, B->getData(), 
                  beta,  stridesC, C->getData(), 
                  sizes, numParallelizableLoops, kIndices.size(), 0);
      return SUCCESS;
   }


   template<typename floatType>
   error processLoopedIndices(const floatType alpha, const Tensor<floatType> *A, 
                                                     const Tensor<floatType> *B, 
                              const floatType beta,        Tensor<floatType> *C,
                              indicesType::iterator it, const indicesType::iterator &end) 
   {
      if( it != end ){
         auto loopIdx = *it;
         auto loopSize = A->getSize(loopIdx);
         auto loopStrideA = A->getStride(loopIdx);
         auto loopStrideB = B->getStride(loopIdx);
         auto loopStrideC = C->getStride(loopIdx);

         const floatType *dataA = A->getData();
         const floatType *dataB = B->getData();
         floatType *dataC = C->getData();

         for(int l=0; l < loopSize; ++l){
            A->setData(dataA + loopStrideA * l);
            B->setData(dataB + loopStrideB * l);
            C->setData(dataC + loopStrideC * l);

            processLoopedIndices(alpha, A, B, beta, C, it++, end);
         }
      }else{
         contractTTGT(alpha, A, B, beta, C);
      }
      return SUCCESS;
   }

   template<typename floatType>
   error tensorMult(const floatType alpha, const Tensor<floatType> *A,
                                         const Tensor<floatType> *B, 
                  const floatType beta,        Tensor<floatType> *C) 
   {
#ifdef TIMERS
      auto start = omp_get_wtime();
#endif
      auto indicesA = A->getIndices();
      auto indicesB = B->getIndices();
      auto indicesC = C->getIndices();

      // error checking
      if( A->getDim() <= 0 || A->getDim() != indicesA.size() )
         return INVALID_PARAMETER_2;
      if( B->getDim() <= 0 || B->getDim() != indicesB.size() )
         return INVALID_PARAMETER_4;
      if( C->getDim() <= 0 || C->getDim() != indicesC.size() )
         return INVALID_PARAMETER_7;

      // TODO merge indices
      
      // check for duplicates
      for(auto it = indicesA.begin(); it != indicesA.end(); it++)
         for(auto itt = std::next(it); itt != indicesA.end(); itt++)
            if( *it == *itt )
               return INVALID_PARAMETER_2;
      for(auto it = indicesB.begin(); it != indicesB.end(); it++)
         for(auto itt = std::next(it); itt != indicesB.end(); itt++)
            if( *it == *itt )
               return INVALID_PARAMETER_4;
      for(auto it = indicesC.begin(); it != indicesC.end(); it++)
         for(auto itt = std::next(it); itt != indicesC.end(); itt++)
            if( *it == *itt )
               return INVALID_PARAMETER_7;

      // check for correct sizes
      {
         int i = 0;
         for(auto it = indicesC.begin(); it != indicesC.end(); it++, i++){
            int j = 0;
            for(auto itt = indicesA.begin(); itt != indicesA.end(); itt++, j++)
               if( *it == *itt && A->getSize()[j] != C->getSize()[i] )
                  return INVALID_TENSOR_SIZE;
         }
         i = 0;
         for(auto it = indicesC.begin(); it != indicesC.end(); it++, i++){
            int j = 0;
            for(auto itt = indicesB.begin(); itt != indicesB.end(); itt++, j++)
               if( *it == *itt && B->getSize()[j] != C->getSize()[i] )
                  return INVALID_TENSOR_SIZE;
         }
         i = 0;
         for(auto it = indicesB.begin(); it != indicesB.end(); it++, i++){
            int j = 0;
            for(auto itt = indicesA.begin(); itt != indicesA.end(); itt++, j++)
               if( *it == *itt && A->getSize()[j] != B->getSize()[i] )
                  return INVALID_TENSOR_SIZE;
         }
      }

      // swap A and B if the stride-1 index of C appears in B
      if( find(indicesC.front(), indicesB) && !find(indicesC.front(), indicesA) )
         std::swap(A, B);

      return contractTTGT(alpha, A, B, beta, C);
   } 

   template error contract<float>(const float alpha, const Tensor<float> *A, const Tensor<float> *B,  const float beta, Tensor<float> *C);
   template error contractTTGT<float>(const float alpha, const Tensor<float> *A, const Tensor<float> *B,  const float beta, Tensor<float> *C);
   template error tensorMult<float>(const float alpha, const Tensor<float> *A, const Tensor<float> *B, 
                                    const float beta,        Tensor<float> *C);

   template error contract<double>(const double alpha, const Tensor<double> *A, const Tensor<double> *B,  const double beta, Tensor<double> *C);
   template error contractTTGT<double>(const double alpha, const Tensor<double> *A, const Tensor<double> *B,  const double beta, Tensor<double> *C);
   template error tensorMult<double>(const double alpha, const Tensor<double> *A, const Tensor<double> *B, 
                                     const double beta,        Tensor<double> *C);

   template error contract<FloatComplex>(const FloatComplex alpha, const Tensor<FloatComplex> *A, const Tensor<FloatComplex> *B,  const FloatComplex beta, Tensor<FloatComplex> *C);
   template error contractTTGT<FloatComplex>(const FloatComplex alpha, const Tensor<FloatComplex> *A, const Tensor<FloatComplex> *B,  const FloatComplex beta, Tensor<FloatComplex> *C);
   template error tensorMult<FloatComplex>(const FloatComplex alpha, const Tensor<FloatComplex> *A, const Tensor<FloatComplex> *B, 
                                     const FloatComplex beta,        Tensor<FloatComplex> *C);

   template error contract<DoubleComplex>(const DoubleComplex alpha, const Tensor<DoubleComplex> *A, const Tensor<DoubleComplex> *B,  const DoubleComplex beta, Tensor<DoubleComplex> *C);
   template error contractTTGT<DoubleComplex>(const DoubleComplex alpha, const Tensor<DoubleComplex> *A, const Tensor<DoubleComplex> *B,  const DoubleComplex beta, Tensor<DoubleComplex> *C);
   template error tensorMult<DoubleComplex>(const DoubleComplex alpha, const Tensor<DoubleComplex> *A, const Tensor<DoubleComplex> *B, 
                                     const DoubleComplex beta,        Tensor<DoubleComplex> *C);
}

extern "C"
{
void sTensorMult(const float alpha, const float *dataA, const long *sizeA, const long *outerSizeA, const char* indA,
                                    const float *dataB, const long *sizeB, const long *outerSizeB, const char* indB,
                 const float beta ,       float *dataC, const long *sizeC, const long *outerSizeC, const char* indC, const int useRowMajor )
{
   tcl::indicesType indicesA, indicesB, indicesC;
   tcl::split(std::string(indA), ',', indicesA);
   tcl::split(std::string(indB), ',', indicesB);
   tcl::split(std::string(indC), ',', indicesC);
   if( useRowMajor ){
      indicesA.reverse();
      indicesB.reverse();
      indicesC.reverse();
   }
   int dimA = indicesA.size();
   int dimB = indicesB.size();
   int dimC = indicesC.size();
   std::vector<tcl::sizeType> sizeA_, outerSizeA_;
   std::vector<tcl::sizeType> sizeB_, outerSizeB_;
   std::vector<tcl::sizeType> sizeC_, outerSizeC_;
   for(int i=0; i < dimA; ++i){
      int idx = i;
      if( useRowMajor )
         idx = dimA - i - 1;
      sizeA_.emplace_back(sizeA[idx]);
      if( outerSizeA == nullptr )
         outerSizeA_.emplace_back(sizeA[idx]);
      else
         outerSizeA_.emplace_back(outerSizeA[idx]);
   }
   for(int i=0; i < dimB; ++i){
      int idx = i;
      if( useRowMajor )
         idx = dimB - i - 1;
      sizeB_.emplace_back(sizeB[idx]);
      if( outerSizeB == nullptr )
         outerSizeB_.emplace_back(sizeB[idx]);
      else
         outerSizeB_.emplace_back(outerSizeB[idx]);
   }
   for(int i=0; i < dimC; ++i){
      int idx = i;
      if( useRowMajor )
         idx = dimC - i - 1;
      sizeC_.emplace_back(sizeC[idx]);
      if( outerSizeC == nullptr )
         outerSizeC_.emplace_back(sizeC[idx]);
      else
         outerSizeC_.emplace_back(outerSizeC[idx]);
   }
   std::vector<tcl::sizeType> offsets;

   tcl::Tensor<float> A( sizeA_, const_cast<float*>(dataA), outerSizeA_, indicesA, offsets);
   tcl::Tensor<float> B( sizeB_, const_cast<float*>(dataB), outerSizeB_, indicesB, offsets);
   tcl::Tensor<float> C( sizeC_,                    dataC , outerSizeC_, indicesC, offsets);

   if( tcl::tensorMult(alpha, &A, &B, beta, &C) != tcl::SUCCESS )
     printf("[TCL] ERROR: some error occured in tensorMult()\n"); 
}

void dTensorMult(const double alpha, const double *dataA, const long *sizeA, const long *outerSizeA, const char* indA,
                                     const double *dataB, const long *sizeB, const long *outerSizeB, const char* indB,
                 const double beta ,       double *dataC, const long *sizeC, const long *outerSizeC, const char* indC, const int useRowMajor )
{
   tcl::indicesType indicesA, indicesB, indicesC;
   tcl::split(std::string(indA), ',', indicesA);
   tcl::split(std::string(indB), ',', indicesB);
   tcl::split(std::string(indC), ',', indicesC);
   if( useRowMajor ){
      indicesA.reverse();
      indicesB.reverse();
      indicesC.reverse();
   }
   int dimA = indicesA.size();
   int dimB = indicesB.size();
   int dimC = indicesC.size();
   std::vector<tcl::sizeType> sizeA_, outerSizeA_;
   std::vector<tcl::sizeType> sizeB_, outerSizeB_;
   std::vector<tcl::sizeType> sizeC_, outerSizeC_;
   for(int i=0; i < dimA; ++i){
      int idx = i;
      if( useRowMajor )
         idx = dimA - i - 1;
      sizeA_.emplace_back(sizeA[idx]);
      if( outerSizeA == nullptr )
         outerSizeA_.emplace_back(sizeA[idx]);
      else
         outerSizeA_.emplace_back(outerSizeA[idx]);
   }
   for(int i=0; i < dimB; ++i){
      int idx = i;
      if( useRowMajor )
         idx = dimB - i - 1;
      sizeB_.emplace_back(sizeB[idx]);
      if( outerSizeB == nullptr )
         outerSizeB_.emplace_back(sizeB[idx]);
      else
         outerSizeB_.emplace_back(outerSizeB[idx]);
   }
   for(int i=0; i < dimC; ++i){
      int idx = i;
      if( useRowMajor )
         idx = dimC - i - 1;
      sizeC_.emplace_back(sizeC[idx]);
      if( outerSizeB == nullptr )
         outerSizeC_.emplace_back(sizeC[idx]);
      else
         outerSizeC_.emplace_back(outerSizeC[idx]);
   }
   std::vector<tcl::sizeType> offsets;

   tcl::Tensor<double> A( sizeA_, const_cast<double*>(dataA), outerSizeA_, indicesA, offsets);
   tcl::Tensor<double> B( sizeB_, const_cast<double*>(dataB), outerSizeB_, indicesB, offsets);
   tcl::Tensor<double> C( sizeC_,                    dataC , outerSizeC_, indicesC, offsets);

   if( tcl::tensorMult(alpha, &A, &B, beta, &C) != tcl::SUCCESS )
     printf("[TCL] ERROR: some error occured in tensorMult()\n"); 
}

void cTensorMult(const float _Complex alpha, const float _Complex *dataA, const long *sizeA, const long *outerSizeA, const char* indA,
                                     const float _Complex *dataB, const long *sizeB, const long *outerSizeB, const char* indB,
                 const float _Complex beta ,       float _Complex *dataC, const long *sizeC, const long *outerSizeC, const char* indC, const int useRowMajor )
{
   tcl::indicesType indicesA, indicesB, indicesC;
   tcl::split(std::string(indA), ',', indicesA);
   tcl::split(std::string(indB), ',', indicesB);
   tcl::split(std::string(indC), ',', indicesC);
   if( useRowMajor ){
      indicesA.reverse();
      indicesB.reverse();
      indicesC.reverse();
   }
   int dimA = indicesA.size();
   int dimB = indicesB.size();
   int dimC = indicesC.size();
   std::vector<tcl::sizeType> sizeA_, outerSizeA_;
   std::vector<tcl::sizeType> sizeB_, outerSizeB_;
   std::vector<tcl::sizeType> sizeC_, outerSizeC_;
   for(int i=0; i < dimA; ++i){
      int idx = i;
      if( useRowMajor )
         idx = dimA - i - 1;
      sizeA_.emplace_back(sizeA[idx]);
      if( outerSizeA == nullptr )
         outerSizeA_.emplace_back(sizeA[idx]);
      else
         outerSizeA_.emplace_back(outerSizeA[idx]);
   }
   for(int i=0; i < dimB; ++i){
      int idx = i;
      if( useRowMajor )
         idx = dimB - i - 1;
      sizeB_.emplace_back(sizeB[idx]);
      if( outerSizeB == nullptr )
         outerSizeB_.emplace_back(sizeB[idx]);
      else
         outerSizeB_.emplace_back(outerSizeB[idx]);
   }
   for(int i=0; i < dimC; ++i){
      int idx = i;
      if( useRowMajor )
         idx = dimC - i - 1;
      sizeC_.emplace_back(sizeC[idx]);
      if( outerSizeB == nullptr )
         outerSizeC_.emplace_back(sizeC[idx]);
      else
         outerSizeC_.emplace_back(outerSizeC[idx]);
   }
   std::vector<tcl::sizeType> offsets;

   tcl::Tensor<tcl::FloatComplex> A( sizeA_, const_cast<tcl::FloatComplex*>((const tcl::FloatComplex*)dataA), outerSizeA_, indicesA, offsets);
   tcl::Tensor<tcl::FloatComplex> B( sizeB_, const_cast<tcl::FloatComplex*>((const tcl::FloatComplex*)dataB), outerSizeB_, indicesB, offsets);
   tcl::Tensor<tcl::FloatComplex> C( sizeC_,           (tcl::FloatComplex*) dataC , outerSizeC_, indicesC, offsets);

   if( tcl::tensorMult((const tcl::FloatComplex) alpha, &A, &B, (const tcl::FloatComplex)beta, &C) != tcl::SUCCESS )
     printf("[TCL] ERROR: some error occured in tensorMult()\n"); 
}

void zTensorMult(const double _Complex alpha, const double _Complex *dataA, const long *sizeA, const long *outerSizeA, const char* indA,
                                     const double _Complex *dataB, const long *sizeB, const long *outerSizeB, const char* indB,
                 const double _Complex beta ,       double _Complex *dataC, const long *sizeC, const long *outerSizeC, const char* indC, const int useRowMajor )
{
   tcl::indicesType indicesA, indicesB, indicesC;
   tcl::split(std::string(indA), ',', indicesA);
   tcl::split(std::string(indB), ',', indicesB);
   tcl::split(std::string(indC), ',', indicesC);
   if( useRowMajor ){
      indicesA.reverse();
      indicesB.reverse();
      indicesC.reverse();
   }
   int dimA = indicesA.size();
   int dimB = indicesB.size();
   int dimC = indicesC.size();
   std::vector<tcl::sizeType> sizeA_, outerSizeA_;
   std::vector<tcl::sizeType> sizeB_, outerSizeB_;
   std::vector<tcl::sizeType> sizeC_, outerSizeC_;
   for(int i=0; i < dimA; ++i){
      int idx = i;
      if( useRowMajor )
         idx = dimA - i - 1;
      sizeA_.emplace_back(sizeA[idx]);
      if( outerSizeA == nullptr )
         outerSizeA_.emplace_back(sizeA[idx]);
      else
         outerSizeA_.emplace_back(outerSizeA[idx]);
   }
   for(int i=0; i < dimB; ++i){
      int idx = i;
      if( useRowMajor )
         idx = dimB - i - 1;
      sizeB_.emplace_back(sizeB[idx]);
      if( outerSizeB == nullptr )
         outerSizeB_.emplace_back(sizeB[idx]);
      else
         outerSizeB_.emplace_back(outerSizeB[idx]);
   }
   for(int i=0; i < dimC; ++i){
      int idx = i;
      if( useRowMajor )
         idx = dimC - i - 1;
      sizeC_.emplace_back(sizeC[idx]);
      if( outerSizeB == nullptr )
         outerSizeC_.emplace_back(sizeC[idx]);
      else
         outerSizeC_.emplace_back(outerSizeC[idx]);
   }
   std::vector<tcl::sizeType> offsets;

   tcl::Tensor<tcl::DoubleComplex> A( sizeA_, const_cast<tcl::DoubleComplex*>((const tcl::DoubleComplex*)dataA), outerSizeA_, indicesA, offsets);
   tcl::Tensor<tcl::DoubleComplex> B( sizeB_, const_cast<tcl::DoubleComplex*>((const tcl::DoubleComplex*)dataB), outerSizeB_, indicesB, offsets);
   tcl::Tensor<tcl::DoubleComplex> C( sizeC_,           (tcl::DoubleComplex*) dataC , outerSizeC_, indicesC, offsets);

   if( tcl::tensorMult((const tcl::DoubleComplex) alpha, &A, &B, (const tcl::DoubleComplex)beta, &C) != tcl::SUCCESS )
     printf("[TCL] ERROR: some error occured in tensorMult()\n"); 
}

void randomNumaAwareInit(float *data, const long *size, int dim)
{
   long totalSize = 1;
   for(int i = 0; i < dim; i++)
      totalSize *= size[i];
#pragma omp parallel for
   for(int i=0; i < totalSize; ++i)
      data[i] = (i+1)%1000 - 500;


}
}

