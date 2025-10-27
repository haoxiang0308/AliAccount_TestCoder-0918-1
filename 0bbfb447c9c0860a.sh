#!/bin/bash

# Script to check disk usage and alert if over 80%

# Get disk usage percentage (removing the % sign)
usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage is greater than 80
if [ "$usage" -gt 80 ]; then
    echo "ALERT: Disk usage is at ${usage}%!"
    # You could add additional alert mechanisms here (email, logging, etc.)
else
    echo "Disk usage is at ${usage}% - within acceptable range."
fi

exit 0