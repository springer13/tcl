CXX_FLAGS=-O0 -g -std=c++11
CXX_LINK= -L../lib/ -ltcl

ifeq ($(CXX),icpc)
CXX_FLAGS += -qopenmp -xhost 
else
ifeq ($(CXX),g++)
CXX_FLAGS += -fopenmp -mcpu=native 
else
ifeq ($(CXX),clang++)
CXX_FLAGS += -fopenmp -march=native
endif
endif
endif

scalar: 
	${MAKE} clean 
	${MAKE} all 

all: contraction.o
	${CXX} contraction.o ${CXX_FLAGS} -o contraction.exe ${CXX_LINK}

%.o: %.cpp
	${CXX} ${CXX_FLAGS} -I../include/ -c $< -o $@

clean:
	rm -rf ./*.o ./*.exe
