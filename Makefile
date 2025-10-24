# Makefile for C++ project
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17
LDFLAGS = 
SOURCES = $(wildcard *.cpp)
OBJECTS = $(SOURCES:.cpp=.o)
TARGET = main

# Default target
all: build

# Build target
build: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET) $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target (assuming you have test files)
test: build
	@echo "Running tests..."
	# Add your test commands here, for example:
	# ./test_runner
	# Or if you're using a testing framework like Google Test:
	# ./run_tests

# Clean target
clean:
	rm -f $(OBJECTS) $(TARGET)

# Phony targets
.PHONY: all build test clean