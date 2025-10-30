# Makefile with compile and clean targets

# Compiler
CC = gcc
# Compiler flags
CFLAGS = -Wall -g
# Source files
SOURCES = main.c
# Object files
OBJECTS = $(SOURCES:.c=.o)
# Executable name
TARGET = program

# Default target
all: $(TARGET)

# Compile target
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET)

# Object compilation
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean target
clean:
	rm -f $(OBJECTS) $(TARGET)

# Clean all (including dependencies)
clean-all: clean
	rm -f *.d

# Phony targets
.PHONY: all clean clean-all