BLAS_LIB=-L${BLIS_ROOT}/lib -lblis

INCLUDE_FLAGS=-I./include/ -I${HPTT_ROOT}/include/
CXX_LINK=-L${HPTT_ROOT}/lib -lhptt ${BLAS_LIB}
CXX_FLAGS=-O3 -std=c++11 -fPIC ${INCLUDE_FLAGS} -fopenmp -march=native

scalar: 
	${MAKE} clean 
	${MAKE} scalar2

scalar2: all

SRC=$(wildcard ./src/*.cpp)
OBJ=$(SRC:.cpp=.o)

all: ${OBJ}
	mkdir -p lib
	${CXX} ${OBJ} ${CXX_FLAGS} -o lib/libtcl.so -shared ${CXX_LINK}
	ar rvs lib/libtcl.a ${OBJ}

%.o: %.cpp
	${CXX} ${CXX_FLAGS} ${INCLUDE_PATH} -c $< -o $@

clean:
	rm -rf src/*.o lib/libtcl.so lib/libtcl.a
