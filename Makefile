# Makefile for a C++ project

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
TEST_TARGET = test_runner

# Test source files
TEST_SOURCES = test_main.cpp

# All test files
ALL_TEST_SOURCES = $(wildcard test_*.cpp)

# Object files for tests
TEST_OBJECTS = $(ALL_TEST_SOURCES:.cpp=.o)

# Default target
all: build

# Build the main executable
build: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compile source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Run tests (this is a placeholder, adapt to your test framework)
test: $(ALL_TEST_SOURCES)
	@echo "Running tests..."
	@if [ -n "$(ALL_TEST_SOURCES)" ]; then \
		$(CXX) $(CXXFLAGS) -o $(TEST_TARGET) $(ALL_TEST_SOURCES) && \
		./$(TEST_TARGET); \
	else \
		echo "No test files found."; \
	fi

# Clean build artifacts
clean:
	rm -f $(OBJECTS) $(TARGET) $(TEST_OBJECTS) $(TEST_TARGET)

.PHONY: all build test clean