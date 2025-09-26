#!/bin/bash

# Define the threshold percentage
THRESHOLD=80

# Get the root filesystem usage percentage
USAGE=$(df / | grep -v Filesystem | awk '{print $5}' | sed 's/%//')

# Check if usage is greater than threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is ${USAGE}% which is above the ${THRESHOLD}% threshold!"
    # Optionally, send an email or log to a file here
else
    echo "Disk usage is ${USAGE}%, which is OK."
fi