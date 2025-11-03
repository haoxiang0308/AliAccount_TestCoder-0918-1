import random
import string
import os

# Create an array with some elements
original_array = [64, 34, 25, 12, 22, 11, 90, 5, 77, 30]
print(f"Original array: {original_array}")

# Sort the array
sorted_array = sorted(original_array)
print(f"Sorted array: {sorted_array}")

# Generate a random filename
random_name = "array_output_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".txt"
print(f"Saving to file: {random_name}")

# Write the sorted array to the file
with open(random_name, 'w') as f:
    f.write(", ".join(map(str, sorted_array)))

print("File saved successfully!")