#!/bin/bash

# Disk usage alert script
# Checks if disk usage exceeds 80% and sends an alert

# Get disk usage percentage (using / as the root filesystem)
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage is above threshold (80%)
THRESHOLD=80

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "WARNING: Disk usage is at ${USAGE}% which exceeds the threshold of ${THRESHOLD}%"
    # Additional actions could be added here, like sending an email
    # mail -s "Disk Usage Alert" admin@example.com <<< "Disk usage is at ${USAGE}%"
else
    echo "Disk usage is at ${USAGE}%, which is below the threshold of ${THRESHOLD}%"
fi