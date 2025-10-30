#!/bin/bash

# Create an array with some elements
array=(64 34 25 12 22 11 90 5)

# Print original array
echo "Original array: ${array[@]}"

# Sort the array
sorted_array=($(printf '%s\n' "${array[@]}" | sort -n))

# Print sorted array
echo "Sorted array: ${sorted_array[@]}"

# Generate a random filename
random_filename="array_output_$(date +%s)_$((RANDOM + 10000)).txt"

# Write the sorted array to the file
echo "Sorted array: ${sorted_array[@]}" > "$random_filename"

echo "Sorted array saved to file: $random_filename"