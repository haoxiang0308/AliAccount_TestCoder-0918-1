#!/bin/bash

# Get the root filesystem usage percentage
usage=$(df / | grep -E '[0-9]+%' | awk '{print $5}' | sed 's/%//')

# Check if usage is greater than 80
if [ "$usage" -gt 80 ]; then
    echo "ALERT: Disk usage is ${usage}%"
    # You could add an exit code or call an external alerting script here
    # exit 1
else
    echo "Disk usage is OK: ${usage}%"
fi