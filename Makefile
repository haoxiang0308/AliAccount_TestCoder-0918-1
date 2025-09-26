# Makefile for a C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Source files
SOURCES = main.cpp

# Object files
OBJECTS = $(SOURCES:.cpp=.o)

# Executable name
TARGET = my_program

# Build the executable
build: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

# Compile source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Run tests (this is a placeholder, adjust as needed)
test:
	@echo "Running tests..."
	# Add your test commands here, for example:
	# ./run_tests

# Clean up generated files
clean:
	rm -f $(OBJECTS) $(TARGET)

.PHONY: build test clean