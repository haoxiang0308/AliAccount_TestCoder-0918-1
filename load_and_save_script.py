import cv2
import numpy as np
import os

# Load an image from the filesystem
image_path = 'placeholder_image.jpg'
image = cv2.imread(image_path)

if image is not None:
    print(f"Image loaded successfully from {image_path}. Shape: {image.shape}")
else:
    print(f"Error: Could not load image from {image_path}. Creating a simple image instead.")
    image = np.zeros((100, 100, 3), dtype=np.uint8)
    image[:] = [128, 0, 128]  # Purple color

# Define the content of the script itself
script_content = '''import cv2
import numpy as np
import os

# Load an image from the filesystem
image_path = 'placeholder_image.jpg'
image = cv2.imread(image_path)

if image is not None:
    print(f"Image loaded successfully from {image_path}. Shape: {image.shape}")
else:
    print(f"Error: Could not load image from {image_path}. Creating a simple image instead.")
    image = np.zeros((100, 100, 3), dtype=np.uint8)
    image[:] = [128, 0, 128]  # Purple color

'''

# Generate a random filename consisting of 10 alphanumeric characters
random_chars = np.random.choice(list('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'), size=10, replace=True)
random_filename = ''.join(random_chars) + '.py'

# Write the script content to the new file
with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"Script content saved to randomly named file: {random_filename}")
