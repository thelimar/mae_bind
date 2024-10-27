CXX=g++

CXXFLAGS=-std=c++11 -O3 -march=native -Wall -I$(SRC_DIR) $(shell python3 -m pybind11 --includes)

PY_LDFLAGS=-shared -fPIC

SRC_DIR=mae/src
PYTHON_DIR=mae/python

all: mae

mae: $(PYTHON_DIR)/bindings.o $(SRC_DIR)/mae.o
	$(CXX) $^ -o $(PYTHON_DIR)/mae`python3-config --extension-suffix` $(PY_LDFLAGS) $(CXXFLAGS)

$(PYTHON_DIR)/bindings.o: $(PYTHON_DIR)/bindings.cpp $(SRC_DIR)/mae.hpp
	$(CXX) $(CXXFLAGS) -fPIC -c $< -o $@

$(SRC_DIR)/mae.o: $(SRC_DIR)/mae.cpp $(SRC_DIR)/mae.hpp
	$(CXX) $(CXXFLAGS) -fPIC -c $< -o $@

clean:
	rm -f $(PYTHON_DIR)/*.o $(SRC_DIR)/*.o $(PYTHON_DIR)/cosin_distance`python3-config --extension-suffix`