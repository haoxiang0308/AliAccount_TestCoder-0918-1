#!/bin/bash

# Check disk usage and alert if over 80%

# Get the disk usage percentage for the root filesystem, removing the % sign
usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if the usage is greater than 80
if [ "$usage" -gt 80 ]; then
    echo "ALERT: Disk usage is ${usage}%!"
    # You can add more alerting logic here, like sending an email
else
    echo "Disk usage is OK: ${usage}%."
fi