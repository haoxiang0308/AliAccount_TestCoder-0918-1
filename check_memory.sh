#!/bin/bash

# Script to check system memory usage and save the output to a randomly named file.

# Get the memory usage information
memory_info=$(free -h)

# Generate a random filename with .txt extension
random_filename=$(mktemp --suffix=.txt)

# Save the memory information to the randomly named file
echo "$memory_info" > "$random_filename"

# Print the result to the terminal
echo "Memory usage information saved to: $random_filename"
echo
echo "$memory_info"
