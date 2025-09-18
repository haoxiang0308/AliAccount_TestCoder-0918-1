#!/bin/bash

# Script to check disk usage and alert if over 80%
# Author: Assistant
# Date: $(date)

# Get the disk usage percentage (using / as the root filesystem)
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage is over 80%
if [ "$USAGE" -gt 80 ]; then
    echo "WARNING: Disk usage is at ${USAGE}% which exceeds 80% threshold!"
    # You can add email notification or other alerting mechanisms here
    # Example: mail -s "Disk Usage Alert" admin@example.com <<< "Disk usage is at ${USAGE}%"
else
    echo "Disk usage is at ${USAGE}%. All good."
fi