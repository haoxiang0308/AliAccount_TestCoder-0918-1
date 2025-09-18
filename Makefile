# A Makefile for a C++ project with build, test, and clean targets

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -g
INCLUDES = -Isrc

# Directories
SRC_DIR = src
TEST_DIR = test
BUILD_DIR = build
BIN_DIR = bin

# Source files
SRCS = $(SRC_DIR)/main.cpp $(SRC_DIR)/utils.cpp
TEST_SRCS = $(TEST_DIR)/test_main.cpp

# Object files
OBJS = $(SRCS:$(SRC_DIR)/%.cpp=$(BUILD_DIR)/%.o)
TEST_OBJS = $(TEST_SRCS:$(TEST_DIR)/%.cpp=$(BUILD_DIR)/%.o)

# Executables
TARGET = $(BIN_DIR)/main
TEST_TARGET = $(BIN_DIR)/test_main

# Default target
.PHONY: all
all: build

# Build target - creates the main executable
.PHONY: build
build: $(TARGET)

# Test target - builds and runs tests
.PHONY: test
test: $(TEST_TARGET)
	@echo "Running tests..."
	@./$(TEST_TARGET)

# Clean target - removes build artifacts
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)
	@echo "Cleaned build artifacts."

# Link the main executable
$(TARGET): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Link the test executable
$(TEST_TARGET): $(TEST_OBJS)
	@mkdir -p $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compile source files to object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Compile test files to object files
$(BUILD_DIR)/%.o: $(TEST_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Debug target to print variables
.PHONY: debug
debug:
	@echo "SRCS: $(SRCS)"
	@echo "OBJS: $(OBJS)"
	@echo "TEST_SRCS: $(TEST_SRCS)"
	@echo "TEST_OBJS: $(TEST_OBJS)"
	@echo "TARGET: $(TARGET)"
	@echo "TEST_TARGET: $(TEST_TARGET)"