#!/bin/bash

# Script to check system memory usage and save to a randomly named file

# Get memory usage information
memory_info=$(free -h)

# Generate a random filename with .sh extension
random_filename=$(mktemp --suffix=.sh)

# Save the memory information to the random file
echo "$memory_info" > "$random_filename"

echo "Memory usage information saved to: $random_filename"
echo ""
echo "Memory usage:"
echo "$memory_info"

# Make the random file executable
chmod +x "$random_filename"