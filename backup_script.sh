#!/bin/bash

# Function to create a timestamped backup
backup_directory() {
    # Check if source directory is provided
    if [ -z "$1" ]; then
        echo "Usage: $0 <source_directory> [destination_directory]"
        echo "Example: $0 /home/user/documents /backup/location"
        exit 1
    fi

    SOURCE_DIR="$1"
    
    # Set destination directory (default to current directory if not provided)
    DEST_DIR="${2:-.}"
    
    # Check if source directory exists
    if [ ! -d "$SOURCE_DIR" ]; then
        echo "Error: Source directory '$SOURCE_DIR' does not exist."
        exit 1
    fi
    
    # Create timestamp in YYYY-MM-DD_HH-MM-SS format
    TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
    
    # Create destination directory with timestamp
    BACKUP_DIR="$DEST_DIR/backup_$(basename "$SOURCE_DIR")_$TIMESTAMP"
    
    echo "Starting backup from '$SOURCE_DIR' to '$BACKUP_DIR'..."
    
    # Create the backup directory
    mkdir -p "$BACKUP_DIR"
    
    # Copy the directory contents
    cp -r "$SOURCE_DIR"/* "$BACKUP_DIR/" 2>/dev/null
    cp -r "$SOURCE_DIR"/.[^.]* "$BACKUP_DIR/" 2>/dev/null  # This copies hidden files/directories
    
    # Check if copy was successful
    if [ $? -eq 0 ]; then
        echo "Backup completed successfully!"
        echo "Backup location: $BACKUP_DIR"
    else
        echo "Error occurred during backup."
        exit 1
    fi
}

# Call the function with all provided arguments
backup_directory "$@"