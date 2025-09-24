# Makefile for a generic C++ project

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

# Default target
all: $(TARGET)

# Build the executable
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

# Compile source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target (example)
test:
	@echo "Running tests..."
	# Add your test commands here, e.g., ./run_tests
	# For now, just print a message
	@echo "Tests completed successfully!"

# Clean target
clean:
	rm -f $(OBJECTS) $(TARGET)

.PHONY: all test clean