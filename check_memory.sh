#!/bin/bash

# Function to check memory usage
check_memory_usage() {
    echo "Memory Usage Information:"
    echo "-------------------------"
    
    # Display memory information using free command
    free -h
    
    echo ""
    echo "Detailed Memory Information:"
    echo "----------------------------"
    
    # Display more detailed memory information
    cat /proc/meminfo | grep -E "MemTotal|MemFree|MemAvailable|Buffers|Cached"
    
    echo ""
    echo "Memory Usage Percentage:"
    echo "------------------------"
    
    # Calculate and display memory usage percentage
    total_mem=$(free | awk 'NR==2{print $2}')
    used_mem=$(free | awk 'NR==2{print $3}')
    mem_percentage=$(awk "BEGIN {printf \"%.2f\", ($used_mem/$total_mem) * 100}")
    
    echo "Memory Usage: $mem_percentage%"
    
    # Provide a warning if memory usage is high
    if (( $(echo "$mem_percentage > 80" | bc -l) )); then
        echo "WARNING: Memory usage is high!"
    elif (( $(echo "$mem_percentage > 60" | bc -l) )); then
        echo "INFO: Memory usage is moderate."
    else
        echo "INFO: Memory usage is normal."
    fi
}

# Call the function
check_memory_usage