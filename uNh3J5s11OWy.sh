#!/bin/bash

# Function to backup a directory to a timestamped folder
backup_directory() {
    local source_dir="$1"
    local dest_base="$2"
    
    # Check if source directory is provided
    if [ -z "$source_dir" ]; then
        echo "Usage: $0 <source_directory> [destination_base_directory]"
        echo "Example: $0 /home/user/documents /backups"
        exit 1
    fi
    
    # Set default destination if not provided
    if [ -z "$dest_base" ]; then
        dest_base="/tmp"
    fi
    
    # Validate source directory exists
    if [ ! -d "$source_dir" ]; then
        echo "Error: Source directory '$source_dir' does not exist."
        exit 1
    fi
    
    # Create destination base directory if it doesn't exist
    mkdir -p "$dest_base"
    
    # Generate timestamp for backup folder name
    timestamp=$(date +"%Y%m%d_%H%M%S")
    backup_name="backup_$(basename "$source_dir")_$timestamp"
    dest_dir="$dest_base/$backup_name"
    
    # Create destination directory
    mkdir -p "$dest_dir"
    
    # Perform the backup using rsync for efficiency
    echo "Backing up '$source_dir' to '$dest_dir'..."
    rsync -av --progress "$source_dir/" "$dest_dir/"
    
    echo "Backup completed successfully!"
    echo "Backup location: $dest_dir"
}

# Call the function with command line arguments
backup_directory "$1" "$2"