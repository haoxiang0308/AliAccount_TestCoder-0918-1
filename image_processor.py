import cv2
import numpy as np
import os

# Load an image from file
# For this example, we'll create a simple synthetic image if one doesn't exist.
image_path = 'sample_image.jpg'

if os.path.exists(image_path):
    image = cv2.imread(image_path)
    print(f"Loaded image from {image_path}")
else:
    # Create a simple synthetic image: a 300x300 blue square
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    image[:] = (255, 0, 0)  # BGR for blue
    print("Created a synthetic blue square image.")

# Skip displaying the image as the environment does not support a GUI
print("Skipping image display (GUI not available).")

# Save the image to a new file with a random name
random_filename = f"random_output_{np.random.randint(10000, 99999)}.jpg"
cv2.imwrite(random_filename, image)
print(f"Saved image to {random_filename}")
