# Makefile for C++ project
# Standard name for Makefiles is 'Makefile' or 'makefile'

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17 -g

# Source directory
SRCDIR = src

# Build directory
BUILDDIR = build

# Test directory
TESTDIR = test

# Source files (adjust these based on your actual source files)
SOURCES = $(wildcard $(SRCDIR)/*.cpp)

# Object files
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)

# Executable name
TARGET = main

# Test executable name
TEST_TARGET = test_main

# Default target
.PHONY: all
all: build

# Build target
.PHONY: build
build: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)
	@echo "Build completed: $(TARGET)"

$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(BUILDDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@
	@echo "Compiled $<"

# Test target
.PHONY: test
test: $(TEST_TARGET)
	@echo "Running tests..."
	./$(TEST_TARGET)

$(TEST_TARGET): $(BUILDDIR)/test_%.o
	@echo "Building tests..."
	@mkdir -p $(BUILDDIR)
	# This is a placeholder - you would adjust this based on your test structure
	# For now, we'll just create a simple test executable if test files exist
	$(CXX) $(CXXFLAGS) $(wildcard $(TESTDIR)/*.cpp) -o $(TEST_TARGET) || echo "No test files found or test compilation failed"

# Clean target
.PHONY: clean
clean:
	rm -rf $(BUILDDIR) $(TARGET) $(TEST_TARGET)
	@echo "Clean completed"

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  build  - Compile the project"
	@echo "  test   - Run tests"
	@echo "  clean  - Remove build artifacts"
	@echo "  all    - Build the project (default)"
	@echo "  help   - Show this help message"