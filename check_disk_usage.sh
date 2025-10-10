#!/bin/bash

# Check disk usage and alert if over 80%
THRESHOLD=80

# Get the root filesystem usage percentage
USAGE=$(df / | grep -v Filesystem | awk '{print $5}' | sed 's/%//')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is at ${USAGE}%!"
    # You could add an email notification here, e.g.:
    # echo "Disk usage is high: ${USAGE}%" | mail -s "Disk Usage Alert" admin@example.com
else
    echo "Disk usage is normal: ${USAGE}%"
fi