#!/bin/bash

# Function to check disk usage
check_disk_usage() {
    # Get the disk usage percentage (removing the % symbol)
    usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
    
    # Check if usage is greater than 80%
    if [ "$usage" -gt 80 ]; then
        echo "ALERT: Disk usage is at ${usage}% which is above the 80% threshold!"
        # Optionally send an email or write to a log file
        logger "Disk usage alert: ${usage}%"
    else
        echo "Disk usage is at ${usage}%, which is within acceptable limits."
    fi
}

# Run the check
check_disk_usage