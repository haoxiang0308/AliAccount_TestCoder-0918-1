# Makefile for C++ project
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17
LDFLAGS = 
TARGET = main
SOURCES = $(wildcard *.cpp)
OBJECTS = $(SOURCES:.cpp=.o)

# Default target
all: build

# Build target
build: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET) $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target
test: build
	@echo "Running tests..."
	# Add your test commands here, for example:
	# ./$(TARGET) --test
	# Or run a separate test executable
	@echo "Tests completed."

# Clean target
clean:
	rm -f $(OBJECTS) $(TARGET)

# Phony targets
.PHONY: all build test clean