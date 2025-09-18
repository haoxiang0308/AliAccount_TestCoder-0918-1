#!/bin/bash

# Script to check disk usage and alert if over 80%

# Get disk usage as a percentage (using the root filesystem)
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage is greater than 80
if [ "$USAGE" -gt 80 ]; then
    echo "WARNING: Disk usage is at ${USAGE}% which exceeds 80%!"
    # Optionally, you could send an email or other notification here
else
    echo "Disk usage is at ${USAGE}%. All good."
fi
