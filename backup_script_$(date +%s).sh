#!/bin/bash

# Check if source directory is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <source_directory> [destination_directory]"
  echo "  source_directory: The directory to backup (required)"
  echo "  destination_directory: The directory to store the backup (optional, defaults to ./backups)"
  exit 1
fi

SOURCE_DIR="$1"
DEST_BASE="${2:-./backups}"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory '$SOURCE_DIR' does not exist."
  exit 1
fi

# Create destination base directory if it doesn't exist
mkdir -p "$DEST_BASE"

# Generate timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Define destination directory name
DEST_DIR="$DEST_BASE/backup_$(basename "$SOURCE_DIR")_$TIMESTAMP"

# Perform the backup using rsync
echo "Starting backup of '$SOURCE_DIR' to '$DEST_DIR'..."
rsync -av --exclude='*.tmp' "$SOURCE_DIR/" "$DEST_DIR/"

# Check if rsync was successful
if [ $? -eq 0 ]; then
  echo "Backup completed successfully: $DEST_DIR"
else
  echo "Backup failed!"
  exit 1
fi