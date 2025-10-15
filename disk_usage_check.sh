#!/bin/bash

# Check disk usage and alert if over 80%
THRESHOLD=80

# Get the disk usage percentage (taking only the root filesystem)
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage is greater than threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is at ${USAGE}% which is above the ${THRESHOLD}% threshold!"
    # Optionally, you can add more alerting mechanisms here, such as:
    # - Sending an email
    # - Writing to a log file
    # - Sending a notification
else
    echo "Disk usage is at ${USAGE}%, which is within acceptable limits."
fi