#!/bin/bash

# Disk usage checker script
# Alerts if disk usage exceeds 80%

# Get disk usage percentage (using / as the root filesystem)
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage exceeds 80%
if [ "$USAGE" -gt 80 ]; then
    echo "WARNING: Disk usage is at ${USAGE}% which exceeds 80% threshold!"
    # You can add additional alerting mechanisms here
    # For example: sending an email, writing to a log file, etc.
else
    echo "Disk usage is at ${USAGE}%. All good."
fi