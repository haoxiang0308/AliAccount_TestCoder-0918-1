# Makefile for C++ project
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17
LDFLAGS = 
TARGET = main
SOURCES = $(wildcard *.cpp src/*.cpp)
OBJECTS = $(SOURCES:.cpp=.o)

# Default target
all: build

# Build target
build: $(TARGET)
	@echo "Build completed successfully!"

# Link object files to create executable
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET) $(LDFLAGS)

# Compile source files to object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target (placeholder - customize as needed)
test:
	@echo "Running tests..."
	# Add your test commands here, for example:
	# ./test_runner
	# Or use a testing framework like Google Test
	@echo "Tests completed!"

# Clean target
clean:
	@echo "Cleaning build artifacts..."
	rm -f $(OBJECTS) $(TARGET)
	@echo "Clean completed!"

# Additional clean options
distclean: clean
	rm -f *.out *.log

.PHONY: all build test clean distclean