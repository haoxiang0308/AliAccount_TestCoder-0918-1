#!/bin/bash

# Check disk usage and alert if over 80%
THRESHOLD=80

# Get the disk usage percentage (removing the % sign)
USAGE=$(df / | grep -v Filesystem | awk '{print $5}' | sed 's/%//')

# Compare the usage to the threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is ${USAGE}% which is over the ${THRESHOLD}% threshold!"
    exit 1
else
    echo "Disk usage is ${USAGE}%, which is within acceptable limits."
    exit 0
fi