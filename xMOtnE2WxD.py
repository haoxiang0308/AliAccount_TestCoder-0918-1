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

