#!/bin/bash

# Script to check system memory usage
echo "Memory Usage Information:"
echo "========================="
free -h
echo ""
echo "Detailed Memory Information:"
echo "============================"
cat /proc/meminfo
echo ""
echo "Memory Usage Percentage:"
echo "========================"
# Calculate and display memory usage percentage
total_mem=$(free -m | awk 'NR==2{print $2}')
used_mem=$(free -m | awk 'NR==2{print $3}')
mem_percentage=$(awk "BEGIN {printf \"%.2f\", ($used_mem/$total_mem) * 100}")
echo "Memory Usage: $mem_percentage%"