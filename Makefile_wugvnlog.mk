# Makefile for C++ project

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -g
LDFLAGS = 

# Directories
SRCDIR = src
INCDIR = include
OBJDIR = obj
BINDIR = bin

# Target executable name
TARGET = $(BINDIR)/main

# Find all .cpp files in the source directory
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
# Create object file names from source files
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)

# Default target
all: $(TARGET)

# Link the object files to create the executable
$(TARGET): $(OBJECTS) | $(BINDIR)
	$(CXX) $(OBJECTS) -o $@ $(LDFLAGS)

# Compile source files into object files
$(OBJDIR)/%.o: $(SRCDIR)/%.cpp | $(OBJDIR)
	$(CXX) $(CXXFLAGS) -I$(INCDIR) -c $< -o $@

# Create necessary directories
$(OBJDIR) $(BINDIR):
	mkdir -p $@

# Test target
test: $(TARGET)
	./$(TARGET) --test

# Clean target
clean:
	rm -rf $(OBJDIR) $(BINDIR)

# Phony targets
.PHONY: all clean test