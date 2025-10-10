#!/bin/bash

# Check if source file is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <source_file>"
    exit 1
fi

SOURCE_FILE="$1"

# Check if source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: Source file '$SOURCE_FILE' does not exist."
    exit 1
fi

# Generate a random filename for the backup
BACKUP_FILE="/workspace/backup_$(openssl rand -hex 8).bak"

# Copy the source file to the backup file
cp "$SOURCE_FILE" "$BACKUP_FILE"

echo "Backup created: $BACKUP_FILE"