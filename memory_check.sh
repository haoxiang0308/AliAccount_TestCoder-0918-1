#!/bin/bash

# Script to check system memory usage
echo "Memory Usage Report"
echo "==================="
echo "Date: $(date)"
echo ""
echo "Memory information:"
free -h
echo ""
echo "Memory usage by process (top 10):"
ps aux --sort=-%mem | head -11
echo ""
echo "Memory usage complete."