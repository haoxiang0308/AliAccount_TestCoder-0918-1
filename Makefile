# Makefile for C++ project
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17
TARGET = app
SOURCES = $(wildcard *.cpp)
OBJECTS = $(SOURCES:.cpp=.o)
TEST_TARGET = test
TEST_SOURCES = $(wildcard test_*.cpp)
TEST_OBJECTS = $(TEST_SOURCES:.cpp=.o)

# Default target
all: build

# Build target
build: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target
test: $(TEST_TARGET)

$(TEST_TARGET): $(TEST_OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Clean target
clean:
	rm -f $(OBJECTS) $(TEST_OBJECTS) $(TARGET) $(TEST_TARGET)

.PHONY: all build test clean