# Makefile for C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17 -O2

# Source directory
SRC_DIR = src

# Build directory
BUILD_DIR = build

# Test directory
TEST_DIR = test

# Main executable name
TARGET = main

# Source files (adjust these based on your project)
SOURCES = $(wildcard $(SRC_DIR)/*.cpp)

# Object files
OBJECTS = $(SOURCES:$(SRC_DIR)/%.cpp=$(BUILD_DIR)/%.o)

# Test source files
TEST_SOURCES = $(wildcard $(TEST_DIR)/*.cpp)
TEST_TARGET = test_runner

# Default target
.PHONY: all
all: build

# Build target
.PHONY: build
build: $(TARGET)
	@echo "Build completed successfully."

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(BUILD_DIR)/$(TARGET)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target
.PHONY: test
test: $(TEST_TARGET)
	@echo "Running tests..."
	./$(BUILD_DIR)/$(TEST_TARGET)

$(BUILD_DIR)/$(TEST_TARGET): $(OBJECTS) $(TEST_DIR)/test_runner.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(OBJECTS) $(TEST_DIR)/test_runner.cpp -o $(BUILD_DIR)/$(TEST_TARGET)

# Clean target
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
	@echo "Clean completed."

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  build  - Compile the project"
	@echo "  test   - Run tests"
	@echo "  clean  - Remove build artifacts"
	@echo "  help   - Show this help message"