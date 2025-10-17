#!/bin/bash

# Script to check system memory usage
echo "Memory Usage Report - $(date)"
echo "================================="

# Show memory usage in a human-readable format
free -h

echo ""
echo "Detailed Memory Information:"
echo "=============================="
cat /proc/meminfo | grep -E "MemTotal|MemFree|MemAvailable|Buffers|Cached"

echo ""
echo "Top 5 processes using the most memory:"
ps aux --sort=-%mem | head -6