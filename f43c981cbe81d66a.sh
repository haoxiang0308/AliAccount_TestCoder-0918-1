#!/bin/bash

# Function to create a timestamped backup
backup_directory() {
    local source_dir="$1"
    local dest_base="$2"
    
    # Check if source directory is provided
    if [ -z "$source_dir" ]; then
        echo "Usage: $0 <source_directory> [destination_base_directory]"
        echo "Example: $0 /path/to/source /path/to/backups"
        exit 1
    fi
    
    # Set default destination if not provided
    if [ -z "$dest_base" ]; then
        dest_base="./backups"
    fi
    
    # Create destination directory if it doesn't exist
    mkdir -p "$dest_base"
    
    # Generate timestamp in YYYY-MM-DD_HH-MM-SS format
    timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
    
    # Create destination backup folder with timestamp
    backup_dir="${dest_base}/backup_${timestamp}"
    
    # Create the backup directory
    mkdir -p "$backup_dir"
    
    # Perform the backup using rsync for efficiency
    if command -v rsync >/dev/null 2>&1; then
        echo "Creating backup of '$source_dir' to '$backup_dir' using rsync..."
        rsync -av --progress "$source_dir/" "$backup_dir/"
    else
        echo "Creating backup of '$source_dir' to '$backup_dir' using cp..."
        cp -r "$source_dir" "$backup_dir/"
    fi
    
    echo "Backup completed successfully: $backup_dir"
}

# Call the function with provided arguments
backup_directory "$1" "$2"