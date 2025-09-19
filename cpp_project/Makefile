# Makefile for C++ project

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -g
LDLIBS = 

# Directories
SRCDIR = src
TESTDIR = tests
BUILDDIR = build
BINDIR = bin

# Source files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)

# Test files
TEST_SOURCES = $(wildcard $(TESTDIR)/*.cpp)
TEST_OBJECTS = $(TEST_SOURCES:$(TESTDIR)/%.cpp=$(BUILDDIR)/%.o)
TEST_EXECUTABLES = $(TEST_SOURCES:$(TESTDIR)/%.cpp=$(BINDIR)/%)

# Main executable name
TARGET = $(BINDIR)/main

# Default target
all: build

# Build target - compiles the main executable
build: $(TARGET)

# Link the main executable
$(TARGET): $(OBJECTS) | $(BINDIR)
	$(CXX) $(OBJECTS) -o $@ $(LDLIBS)

# Compile source files
$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp | $(BUILDDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target - builds and runs all tests
test: $(TEST_EXECUTABLES)
	@for test_exec in $(TEST_EXECUTABLES); do \
		echo "Running $$test_exec"; \
		./$$test_exec || exit 1; \
	done

# Build test executables
$(BINDIR)/%: $(BUILDDIR)/%.o $(filter-out $(BUILDDIR)/main.o,$(OBJECTS)) | $(BINDIR)
	$(CXX) $^ -o $@ $(LDLIBS)

# Compile test files
$(BUILDDIR)/%.o: $(TESTDIR)/%.cpp | $(BUILDDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Create necessary directories
$(BUILDDIR):
	mkdir -p $(BUILDDIR)

$(BINDIR):
	mkdir -p $(BINDIR)

# Clean target - removes build artifacts
clean:
	rm -rf $(BUILDDIR) $(BINDIR)

# Phony targets
.PHONY: all build test clean