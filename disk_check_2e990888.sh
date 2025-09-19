#!/bin/bash

# Script to check disk usage and alert if over 80%

# Get disk usage percentage (using / as the root filesystem)
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage is greater than 80
if [ "$USAGE" -gt 80 ]; then
    echo "WARNING: Disk usage is at ${USAGE}% which exceeds 80% threshold!"
    # Optionally, you could add email notification or other alerting mechanisms here
    exit 1
else
    echo "Disk usage is at ${USAGE}%. All good."
    exit 0
fi