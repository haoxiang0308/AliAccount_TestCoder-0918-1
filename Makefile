# Makefile for a generic C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Source directory
SRC_DIR = src

# Build directory
BUILD_DIR = build

# Test directory
TEST_DIR = test

# Main source file (change this to your main file)
MAIN_SRC = $(SRC_DIR)/main.cpp

# Main executable name
TARGET = myapp

# Object files (example, adjust as needed)
SOURCES = $(wildcard $(SRC_DIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRC_DIR)/%.cpp=$(BUILD_DIR)/%.o)

# Test source files
TEST_SOURCES = $(wildcard $(TEST_DIR)/*.cpp)
TEST_TARGET = test_runner
TEST_OBJECTS = $(TEST_SOURCES:$(TEST_DIR)/%.cpp=$(BUILD_DIR)/%_test.o)

# Default target
all: build

# Build the main executable
build: $(BUILD_DIR) $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Run tests (example using a hypothetical test runner)
test: $(BUILD_DIR) $(TEST_TARGET)
	./$(TEST_TARGET)

$(BUILD_DIR)/%_test.o: $(TEST_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(TEST_TARGET): $(OBJECTS) $(TEST_OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Create build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Clean build artifacts
clean:
	rm -rf $(BUILD_DIR)
	rm -f $(TARGET) $(TEST_TARGET)

.PHONY: all build test clean