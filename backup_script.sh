#!/bin/bash

# Function to create a backup of a file with a random name
create_backup() {
    local source_file="$1"
    
    # Check if source file is provided
    if [[ -z "$source_file" ]]; then
        echo "Usage: $0 <file_to_backup>"
        exit 1
    fi
    
    # Check if source file exists
    if [[ ! -f "$source_file" ]]; then
        echo "Error: File '$source_file' does not exist."
        exit 1
    fi
    
    # Generate a random filename for the backup
    local random_name=$(openssl rand -hex 8)
    local backup_name="${source_file%.*}_${random_name}.${source_file##*.}"
    
    # If the original file has no extension, just add the random part
    if [[ "$source_file" == "$backup_name" ]]; then
        backup_name="${source_file}_${random_name}"
    fi
    
    # Create the backup
    cp "$source_file" "$backup_name"
    
    echo "Backup created: $backup_name"
}

# Call the function with the provided argument
create_backup "$1"