#!/bin/bash

# Script to check system memory usage
echo "Memory Usage Information"
echo "========================"
echo "Date: $(date)"
echo ""
echo "Memory usage details:"
free -h
echo ""
echo "Memory usage by process:"
ps aux --sort=-%mem | head -10
echo ""
echo "Swap usage:"
swapon --show