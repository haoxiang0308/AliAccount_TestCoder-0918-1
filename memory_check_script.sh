#!/bin/bash

# Script to check system memory usage
echo "Memory Usage Information:"
echo "========================="
free -h
echo ""
echo "Detailed Memory Information:"
echo "------------------------------"
cat /proc/meminfo | grep -E "MemTotal|MemFree|MemAvailable|Buffers|Cached"
echo ""
echo "Memory Usage Percentage:"
echo "------------------------"
# Calculate and display memory usage percentage
total_mem=$(free | grep Mem | awk '{print $2}')
used_mem=$(free | grep Mem | awk '{print $3}')
mem_percentage=$(awk "BEGIN {printf \"%.2f\", ${used_mem}/${total_mem}*100}")
echo "Memory Usage: ${mem_percentage}%"