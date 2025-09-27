#!/bin/bash

# Script to check disk usage and alert if over 80%

THRESHOLD=80

# Get the disk usage percentage for the root filesystem
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage is greater than the threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
  echo "ALERT: Disk usage is at ${USAGE}%"
else
  echo "Disk usage is at ${USAGE}%"
fi

