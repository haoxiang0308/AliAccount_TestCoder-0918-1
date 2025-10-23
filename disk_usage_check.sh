#!/bin/bash

# Check disk usage and alert if over 80%

# Get the disk usage percentage (removing the % sign)
usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage is greater than 80
if [ "$usage" -gt 80 ]; then
    echo "ALERT: Disk usage is ${usage}% which is over 80%!"
    exit 1
else
    echo "Disk usage is ${usage}%, which is under the 80% threshold."
    exit 0
fi