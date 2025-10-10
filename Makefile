# Variables
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -g
SRC_DIR = src
BUILD_DIR = build
TEST_DIR = test
INCLUDE_DIR = include

# Find all source files
SOURCES = $(wildcard $(SRC_DIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRC_DIR)/%.cpp=$(BUILD_DIR)/%.o)
TARGET = app
TEST_TARGET = test_runner

# Default target
.PHONY: all
all: build

# Build target
.PHONY: build
build: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

# Test target
.PHONY: test
test: $(TEST_TARGET)
	./$(TEST_TARGET)

$(TEST_TARGET): $(wildcard $(TEST_DIR)/*.cpp) $(OBJECTS)
	$(CXX) $(CXXFLAGS) -I$(INCLUDE_DIR) -o $@ $^

# Clean target
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR) $(TARGET) $(TEST_TARGET)

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  build  - Compiles the project"
	@echo "  test   - Runs the tests"
	@echo "  clean  - Removes build artifacts and executables"
	@echo "  help   - Shows this help message"