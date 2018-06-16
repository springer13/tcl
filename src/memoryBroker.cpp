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


#include <assert.h>

#include "memoryBroker.h"

namespace tcl
{
   MemoryBroker memBroker;

   MemoryBroker::MemoryBroker() : ptr(nullptr), totalSize(0), currentOffset(0) {}

   void MemoryBroker::alloc( size_t size )
   {
      int dummy = posix_memalign((void**)&(this->ptr), 4096, size);
      this->totalSize = size;
      this->currentOffset = 0;
   }

   char* MemoryBroker::requestMemory( size_t size )
   {
      assert( this->currentOffset + size <= this->totalSize );

      char* ret = &ptr[currentOffset];
      currentOffset += size;
      return ret;
   }
   void MemoryBroker::reset() { this->currentOffset = 0; }

   void MemoryBroker::release() {
      free(this->ptr);
      this->totalSize = 0;
      this->currentOffset = 0;
   }

   bool MemoryBroker::isInit() const { return totalSize != 0; }
   uint64_t MemoryBroker::size() const { return totalSize; }

}
