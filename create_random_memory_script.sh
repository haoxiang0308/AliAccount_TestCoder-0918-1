#!/bin/bash

# Create a random filename with .sh extension
random_name="memory_check_$(date +%s)_$$.sh"

# Content of the memory checking script
memory_script_content="#!/bin/bash

# Script to check system memory usage
echo \"Memory Usage Information:\"
echo \"=========================\"
free -h
echo \"\"
echo \"Detailed Memory Information:\"
echo \"------------------------------\"
cat /proc/meminfo | grep -E \"MemTotal|MemFree|MemAvailable|Buffers|Cached\"
echo \"\"
echo \"Memory Usage Percentage:\"
echo \"------------------------\"
# Calculate and display memory usage percentage
total_mem=\$(free | grep Mem | awk '{print \$2}')
used_mem=\$(free | grep Mem | awk '{print \$3}')
mem_percentage=\$(awk \"BEGIN {printf \\\"%.2f\\\", \${used_mem}/\${total_mem}*100}\")
echo \"Memory Usage: \${mem_percentage}%\""

# Write the content to the randomly named file
echo "$memory_script_content" > "$random_name"

# Make the script executable
chmod +x "$random_name"

echo "Memory checking script created: $random_name"
echo "File location: $(pwd)/$random_name"