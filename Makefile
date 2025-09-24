# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Target executable name
TARGET = my_program

# Source directory
SRCDIR = src

# Test directory
TESTDIR = test

# Source files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)

# Object files
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(SRCDIR)/%.o)

# Test source files
TEST_SOURCES = $(wildcard $(TESTDIR)/*.cpp)

# Test object files
TEST_OBJECTS = $(TEST_SOURCES:$(TESTDIR)/%.cpp=$(TESTDIR)/%.o)

# Default target
all: build

# Build the main target
build: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $@

# Compile source files into object files
$(SRCDIR)/%.o: $(SRCDIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Run tests (this is a simple example, adjust as needed for your test framework)
test: $(TARGET) $(TEST_OBJECTS)
	@echo "Running tests..."
	@for test_file in $(TEST_SOURCES); do \
		echo "Testing $$test_file..."; \
		$(CXX) $(CXXFLAGS) $$test_file $(OBJECTS) -o test_run && ./test_run || exit 1; \
	done
	@echo "All tests passed!"

# Clean build artifacts
clean:
	rm -f $(OBJECTS) $(TEST_OBJECTS) $(TARGET) test_run

.PHONY: all build test clean