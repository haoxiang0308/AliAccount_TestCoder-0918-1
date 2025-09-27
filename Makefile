# Define the compiler
CXX = g++

# Define any compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Define the executable name
TARGET = my_app

# Define source files
SOURCES = main.cpp src/utils.cpp

# Define object files
OBJECTS = $(SOURCES:.cpp=.o)

# Default target
all: $(TARGET)

# Link the executable
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

# Compile source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target (example)
test:
	@echo "Running tests..."
	# Add your test commands here, e.g., ./test_runner

# Clean target
clean:
	rm -f $(OBJECTS) $(TARGET)

# Phony targets
.PHONY: all test clean