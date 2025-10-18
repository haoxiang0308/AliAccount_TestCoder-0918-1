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
echo "Memory Usage by Processes (Top 10):"
echo "=================================="
ps aux --sort=-%mem | head -11