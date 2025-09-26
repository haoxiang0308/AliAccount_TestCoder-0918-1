#!/bin/bash

# Script to check system memory usage and save the report

# Get the current date and time for the filename
timestamp=$(date +"%Y%m%d_%H%M%S")
random_num=$RANDOM
filename="memory_report_${timestamp}_${random_num}.txt"

# Get memory usage information using the 'free' command and save it
free -h > "$filename"

# Append additional memory information from /proc/meminfo
echo -e "\nDetailed Memory Information from /proc/meminfo:\n" >> "$filename"
cat /proc/meminfo >> "$filename"

echo "Memory usage report saved to $filename"