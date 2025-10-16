#!/bin/bash

# Check disk usage and alert if over 80%
THRESHOLD=80

# Get the disk usage percentage (removing the % sign)
USAGE=$(df / | grep -v Filesystem | awk '{print $5}' | sed 's/%//')

# Convert to integer (remove any potential decimal parts)
USAGE=${USAGE%.*}

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is ${USAGE}% which is above the threshold of ${THRESHOLD}%"
    exit 1
else
    echo "Disk usage is ${USAGE}%, which is within acceptable limits"
    exit 0
fi