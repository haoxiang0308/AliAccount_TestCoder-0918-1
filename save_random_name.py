import random
import string
import os

# Generate a random filename
random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
output_path = f'/workspace/{random_name}.py'

# Read the content of the original OpenCV script
with open('/workspace/opencv_script.py', 'r') as source_file:
    content = source_file.read()

# Write the content to the new randomly named file
with open(output_path, 'w') as dest_file:
    dest_file.write(content)

print(f"OpenCV script saved to randomly named file: {output_path}")