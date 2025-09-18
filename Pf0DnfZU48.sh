#!/bin/bash

# Disk usage alert script
# Checks if disk usage exceeds 80% and sends an alert

# Get disk usage percentage (using / partition as an example)
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage exceeds 80%
if [ $USAGE -gt 80 ]; then
    echo "WARNING: Disk usage is at ${USAGE}% which exceeds the 80% threshold!"
    # Additional actions could be added here, like sending an email
    # mail -s "Disk Usage Alert" admin@example.com <<< "Disk usage is at ${USAGE}%"
else
    echo "Disk usage is at ${USAGE}%. All good."
fi