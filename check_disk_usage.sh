#!/bin/bash
# Script to check disk usage and alert if over 80%

# Get the root filesystem usage percentage
usage=$(df / | grep -v Filesystem | awk '{print $5}' | sed 's/%//')

# Check if usage is greater than 80
if [ "$usage" -gt 80 ]; then
  echo "ALERT: Disk usage is ${usage}%!"
else
  echo "Disk usage is ${usage}%."
fi