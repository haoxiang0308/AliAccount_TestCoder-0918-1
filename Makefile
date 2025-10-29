# Makefile for C++ project

CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++11 -O2
TARGET = max_finder
SOURCE = max_finder.cpp
OBJECTS = $(SOURCE:.cpp=.o)

# Default target
all: build

# Build target
build: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target (example test - you can customize this based on your needs)
test: build
	@echo "Running tests..."
	./$(TARGET)
	@echo "Tests completed."

# Clean target
clean:
	rm -f $(OBJECTS) $(TARGET)

# Phony targets
.PHONY: all build test clean