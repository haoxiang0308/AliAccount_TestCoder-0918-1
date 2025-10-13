#!/bin/bash

# Script to check system memory usage and save the report to a file

# Get the current date and time for the output file name
DATE=$(date +%Y%m%d_%H%M%S)
OUTPUT_FILE="/tmp/memory_report_$DATE.txt"

# Use the 'free' command to get memory usage and save it to the output file
free -h > "$OUTPUT_FILE"

# Also print the memory usage to the console
echo "Memory usage report generated at: $OUTPUT_FILE"
cat "$OUTPUT_FILE"
