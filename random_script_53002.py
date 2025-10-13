import cv2
import numpy as np
import os

# Load an image from file
image_path = 'placeholder_image.jpg'
image = cv2.imread(image_path)

# Check if image is loaded successfully
if image is None:
    print(f"Error: Could not load image from {image_path}")
else:


    # Save the loaded image to a new file with a random name
    # Generate a random filename
    random_filename = f"random_image_{np.random.randint(10000, 99999)}.jpg"
    success = cv2.imwrite(random_filename, image)

    if success:
        print(f"Image saved successfully as {random_filename}")
    else:
        print("Failed to save the image.")
