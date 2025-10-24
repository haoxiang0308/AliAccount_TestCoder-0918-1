#!/bin/bash

# Script to check disk usage and alert if over 80%

# Get disk usage percentage (using df command and extracting the usage number)
usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage is greater than 80
if [ "$usage" -gt 80 ]; then
    echo "ALERT: Disk usage is ${usage}% which is over 80%!"
    exit 1
else
    echo "Disk usage is ${usage}%, which is acceptable."
    exit 0
fi