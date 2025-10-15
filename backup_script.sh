#!/bin/bash

# Function to backup a directory to a timestamped folder
backup_directory() {
    local source_dir="$1"
    local dest_base="$2"
    
    # Check if source directory is provided
    if [ -z "$source_dir" ]; then
        echo "Usage: $0 <source_directory> [destination_base_directory]"
        echo "Example: $0 /path/to/source /path/to/backup/location"
        exit 1
    fi
    
    # Set default destination if not provided
    if [ -z "$dest_base" ]; then
        dest_base="./backups"
    fi
    
    # Validate source directory exists
    if [ ! -d "$source_dir" ]; then
        echo "Error: Source directory '$source_dir' does not exist."
        exit 1
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
    echo "Backing up '$source_dir' to '$backup_dir'..."
    rsync -av --progress "$source_dir/" "$backup_dir/"
    
    echo "Backup completed successfully: $backup_dir"
}

# Call the function with command line arguments
backup_directory "$1" "$2"