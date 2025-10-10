import cv2
import numpy as np
import os
import random
import string

# Load an image from file
# For demonstration, we'll use the sample image created previously.
image_path = 'sample_image.jpg'

# Check if the sample image exists
if not os.path.exists(image_path):
    print(f"Sample image {image_path} not found.")
    # Create a simple 300x300 BGR image with a rectangle
    sample_img = np.zeros((300, 300, 3), dtype=np.uint8)
    cv2.rectangle(sample_img, (50, 50), (250, 250), (0, 255, 0), -1) # Green rectangle
    cv2.imwrite(image_path, sample_img)
    print(f"Created sample image {image_path}.")

# Load the image
image = cv2.imread(image_path)

if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    # Save the loaded image to a new file with a random name
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.jpg'
    cv2.imwrite(random_name, image)
    print(f"Image loaded from '{image_path}' and saved with a new random name: {random_name}")
