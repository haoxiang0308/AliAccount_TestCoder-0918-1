CC = gcc
CFLAGS = -Wall -g

# Default target
all: program

# Rule to compile a C program
program: main.c
	$(CC) $(CFLAGS) -o program main.c

# Clean build files
clean:
	rm -f program

.PHONY: all clean
