#!/bin/bash

# Check disk usage and alert if over 80%
THRESHOLD=80

# Get disk usage percentage (removing the % symbol)
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is ${USAGE}% which is above the threshold of ${THRESHOLD}%"
    # Optionally send an email or notification here
else
    echo "Disk usage is ${USAGE}%, which is within acceptable limits"
fi