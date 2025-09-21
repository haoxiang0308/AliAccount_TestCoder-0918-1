# Simple C++ Makefile

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -g
INCLUDES = -Iinclude

# Directories
SRC_DIR = src
INC_DIR = include
TEST_DIR = tests
BUILD_DIR = build
BIN_DIR = bin

# Files
SOURCES = $(wildcard $(SRC_DIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRC_DIR)/%.cpp=$(BUILD_DIR)/%.o)
TARGET = $(BIN_DIR)/main

TEST_SOURCES = $(TEST_DIR)/test_main.cpp $(filter-out $(SRC_DIR)/main.cpp,$(SOURCES))
TEST_OBJECTS = $(BUILD_DIR)/test_main.o $(filter-out $(BUILD_DIR)/main.o,$(OBJECTS))
TEST_TARGET = $(BIN_DIR)/tests

# Default target
.PHONY: all
all: build

# Build target
.PHONY: build
build: $(TARGET)

$(TARGET): $(OBJECTS) | $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Test target
.PHONY: test
test: $(TEST_TARGET)
	./$(TEST_TARGET)

$(TEST_TARGET): $(TEST_OBJECTS) | $(BIN_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -o $@ $^

$(BUILD_DIR)/test_main.o: $(TEST_DIR)/test_main.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Clean target
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)

# Create directories
$(BIN_DIR):
	mkdir -p $@

# Run the main program
.PHONY: run
run: build
	./$(TARGET)