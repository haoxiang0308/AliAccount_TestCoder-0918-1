# Define the compiler
CXX = g++

# Define any compiler flags (e.g., -Wall for warnings, -g for debug info)
CXXFLAGS = -Wall -g

# Define the name of the executable
TARGET = my_program

# Define the source files
SOURCES = main.cpp utils.cpp

# Define object files based on source files
OBJECTS = $(SOURCES:.cpp=.o)

# Default target
all: $(TARGET)

# Rule to link the executable
$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Rule to compile source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target (example: run an executable called 'test_runner')
.PHONY: test
test:
	@echo "Running tests..."
	# Add your test command here, for example:
	# ./test_runner

# Clean target to remove generated files
.PHONY: clean
clean:
	rm -f $(OBJECTS) $(TARGET)

# Phony targets for convenience
.PHONY: all