#!/bin/bash

# Check disk usage and alert if over 80%
THRESHOLD=80
USAGE=$(df / | grep -v Filesystem | awk '{print $5}' | sed 's/%//g')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is ${USAGE}% which is over the ${THRESHOLD}% threshold!"
    exit 1
else
    echo "Disk usage is ${USAGE}%, which is OK."
    exit 0
fi