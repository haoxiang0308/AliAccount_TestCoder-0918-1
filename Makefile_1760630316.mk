# Makefile for C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17 -O2

# Target executable name
TARGET = main

# Source files (excluding test files)
SOURCES = $(filter-out test.cpp, $(wildcard *.cpp))

# Object files
OBJECTS = $(SOURCES:.cpp=.o)

# Test executable name
TEST_TARGET = run_tests

# Build target
build: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target
$(TEST_TARGET): test.cpp $(filter-out main.o, $(OBJECTS))
	$(CXX) $(CXXFLAGS) $^ -o $(TEST_TARGET)

test: $(TEST_TARGET)
	./$(TEST_TARGET)

# Clean target
clean:
	rm -f *.o $(TARGET) $(TEST_TARGET)

# Phony targets
.PHONY: build test clean