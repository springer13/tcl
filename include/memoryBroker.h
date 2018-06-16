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
#include <stdlib.h>
#include <stdint.h>

namespace tcl
{

class MemoryBroker {
   public:
      MemoryBroker();

      void alloc( size_t size );
      char* requestMemory( size_t size );
      void reset();
      void release();
      bool isInit() const;
      uint64_t size() const;

   private:

      char *ptr;
      size_t totalSize;
      size_t currentOffset;
};

}
