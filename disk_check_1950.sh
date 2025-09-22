#!/bin/bash

# Script to check disk usage and alert if over 80%
# Generated on: $(date)

# Get disk usage percentage (using / partition as example)
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage is over 80%
if [ "$USAGE" -gt 80 ]; then
    echo "WARNING: Disk usage is at ${USAGE}% which exceeds the 80% threshold!"
    # You can add more actions here like sending an email or logging to a file
else
    echo "Disk usage is at ${USAGE}%. All good."
fi