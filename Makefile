# Makefile for C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Target executable name
TARGET = main

# Source files
SOURCES = main.cpp

# Object files
OBJECTS = $(SOURCES:.cpp=.o)

# Test executable name
TEST_TARGET = test

# Test source files
TEST_SOURCES = test.cpp

# Test object files
TEST_OBJECTS = $(TEST_SOURCES:.cpp=.o)

# Build target
build: $(TARGET)

# Link object files to create executable
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

# Compile source files to object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target
test: $(TEST_TARGET)
	./$(TEST_TARGET)

# Build and run tests
$(TEST_TARGET): $(TEST_OBJECTS)
	$(CXX) $(TEST_OBJECTS) -o $(TEST_TARGET)

# Clean build artifacts
clean:
	rm -f $(OBJECTS) $(TARGET) $(TEST_OBJECTS) $(TEST_TARGET)

# Phony targets
.PHONY: build test clean