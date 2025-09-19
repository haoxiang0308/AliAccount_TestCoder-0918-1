# Makefile for C++ project

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -g
INCLUDES = -Iinclude

# Directories
SRCDIR = src
INCDIR = include
TESTDIR = tests
BUILDDIR = build

# Source files
SOURCES = $(SRCDIR)/main.cpp $(SRCDIR)/calculator.cpp
TEST_SOURCES = $(TESTDIR)/test_calculator.cpp $(SRCDIR)/calculator.cpp

# Object files
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)
TEST_OBJECTS = $(TEST_SOURCES:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)
TEST_OBJECTS := $(TEST_OBJECTS:$(TESTDIR)/%.cpp=$(BUILDDIR)/%.o)

# Executables
TARGET = $(BUILDDIR)/calculator
TEST_TARGET = $(BUILDDIR)/test_calculator

# Default target
all: $(TARGET)

# Build the main executable
$(TARGET): $(OBJECTS) | $(BUILDDIR)
	$(CXX) $(OBJECTS) -o $@

# Build object files
$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp | $(BUILDDIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Build the test executable
test: $(TEST_TARGET)

$(TEST_TARGET): $(TEST_OBJECTS) | $(BUILDDIR)
	$(CXX) $(TEST_OBJECTS) -o $@

# Build test object files
$(BUILDDIR)/%.o: $(TESTDIR)/%.cpp | $(BUILDDIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Create build directory
$(BUILDDIR):
	mkdir -p $(BUILDDIR)

# Clean build artifacts
clean:
	rm -rf $(BUILDDIR)

# Run the main program
run: $(TARGET)
	./$(TARGET)

# Run tests
run_tests: $(TEST_TARGET)
	./$(TEST_TARGET)

.PHONY: all test clean run run_tests