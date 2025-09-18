#!/bin/bash

# Check if a filename was provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename>"
    echo "Please provide the name of the file to backup."
    exit 1
fi

# Get the filename from the first argument
filename="$1"

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' not found."
    exit 1
fi

# Get the current timestamp
timestamp=$(date +"%Y%m%d_%H%M%S")

# Create the backup filename
backup_filename="${filename}_backup_${timestamp}"

# Copy the file to create the backup
cp "$filename" "$backup_filename"

# Check if the copy was successful
if [ $? -eq 0 ]; then
    echo "Backup created successfully: $backup_filename"
else
    echo "Error: Failed to create backup."
    exit 1
fi