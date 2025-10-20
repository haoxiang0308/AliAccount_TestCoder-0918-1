# Makefile for C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17 -g

# Target name
TARGET = main

# Source files
SOURCES = $(wildcard *.cpp)

# Object files
OBJECTS = $(SOURCES:.cpp=.o)

# Test target
TEST_TARGET = test

# Default target
all: build

# Build target
build: $(TARGET)
	@echo "Build completed successfully!"

# Link object files to create executable
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

# Compile source files to object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target (example - you'll need to implement actual tests)
test: build
	@echo "Running tests..."
	# Add your test commands here, for example:
	# ./$(TARGET) --test
	# Or if you have a separate test executable:
	# ./$(TEST_TARGET)
	@echo "Tests completed!"

# Clean target
clean:
	rm -f $(OBJECTS) $(TARGET)
	@echo "Clean completed!"

# Additional clean options
distclean: clean
	rm -f *~ *.bak

# Phony targets
.PHONY: all build test clean distclean