# Makefile rule to compile a C program

# Define the target executable name
TARGET = my_program

# Define the source file(s)
SOURCE = main.c

# Define the compiler
CC = gcc

# Define compiler flags
CFLAGS = -Wall -Wextra -std=c99

# Default target
all: $(TARGET)

# Rule to build the target executable
$(TARGET): $(SOURCE)
	$(CC) $(CFLAGS) -o $(TARGET) $(SOURCE)

# Rule to clean the generated files
clean:
	rm -f $(TARGET)

# Help target
help:
	@echo "Available targets:"
	@echo "  all     - Build the program (default)"
	@echo "  clean   - Remove the compiled executable"
	@echo "  help    - Show this help message"