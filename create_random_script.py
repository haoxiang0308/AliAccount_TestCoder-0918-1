import random
import string
import os

def generate_random_filename(extension=".py"):
    """Generate a random filename with the specified extension."""
    letters = string.ascii_lowercase + string.digits
    random_string = ''.join(random.choice(letters) for i in range(10))
    return f"{random_string}{extension}"

# Read the content of the image processor script
with open('image_processor.py', 'r') as f:
    script_content = f.read()

# Generate a random filename
random_filename = generate_random_filename(".py")

# Write the content to the new file with random name
with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"Python script saved to randomly named file: {random_filename}")