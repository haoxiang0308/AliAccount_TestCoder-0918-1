import cv2
import numpy as np
import os

# Load an image from file.
# For demonstration, we'll create a simple image if a file isn't found.
image_path = 'sample_image.jpg' # You can change this to your image path
image = cv2.imread(image_path)

if image is None:
    print(f"Image not found at {image_path}. Creating a sample image...")
    # Create a sample image: a white canvas with a black rectangle
    image = 255 * np.ones((400, 400, 3), dtype=np.uint8)
    cv2.rectangle(image, (100, 100), (300, 300), (0, 0, 0), -1)

# Display the image in a window named 'Image'.
cv2.imshow('Image', image)

# Wait for a key press indefinitely.
cv2.waitKey(0)

# Close all OpenCV windows.
cv2.destroyAllWindows()

# Save the script to a randomly named .py file.
script_content = '''import cv2
import numpy as np

# Load an image from file.
# For demonstration, we'll create a simple image if a file isn't found.
image_path = 'sample_image.jpg' # You can change this to your image path
image = cv2.imread(image_path)

if image is None:
    print(f"Image not found at {image_path}. Creating a sample image...")
    # Create a sample image: a white canvas with a black rectangle
    image = 255 * np.ones((400, 400, 3), dtype=np.uint8)
    cv2.rectangle(image, (100, 100), (300, 300), (0, 0, 0), -1)

# Display the image in a window named 'Image'.
cv2.imshow('Image', image)

# Wait for a key press indefinitely.
cv2.waitKey(0)

# Close all OpenCV windows.
cv2.destroyAllWindows()
'''

import random
import string

random_filename = 'random_script_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=6)) + '.py'
with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"Script saved as {random_filename}")
