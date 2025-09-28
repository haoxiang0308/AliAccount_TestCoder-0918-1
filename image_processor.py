import cv2
import numpy as np
import os

# Load an image from the workspace or use a placeholder if it doesn't exist
image_path = 'placeholder_image.jpg'  # This file might not exist, we'll handle it
image = None

# Try to load an existing image or create a blank one
if os.path.exists(image_path):
    image = cv2.imread(image_path)
    print(f"Loaded image from {image_path}")
else:
    # Create a blank white image if the file doesn't exist
    image = 255 * np.ones(shape=(512, 512, 3), dtype=np.uint8)
    print("Created a blank white image.")

# Display the image in a window
cv2.imshow('Processed Image', image)
cv2.waitKey(0) # Wait for a key press
cv2.destroyAllWindows() # Close the window

# Save the (potentially processed) image with a random filename
random_filename = f"output_{np.random.randint(10000, 99999)}.jpg"
cv2.imwrite(random_filename, image)
print(f"Saved image as {random_filename}")