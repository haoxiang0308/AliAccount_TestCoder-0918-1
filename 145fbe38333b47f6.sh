#!/bin/bash

# Check disk usage and alert if over 80%
THRESHOLD=80

# Get the disk usage percentage (removing the % symbol)
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Compare usage with threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is at ${USAGE}% which is above the threshold of ${THRESHOLD}%!"
    exit 1
else
    echo "Disk usage is at ${USAGE}%, which is acceptable."
    exit 0
fi