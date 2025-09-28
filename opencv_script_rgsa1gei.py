import cv2
import numpy as np
import os

# Load an image from the workspace or create a dummy one if none exists
image_path = '/workspace/sample_image.jpg'  # You can replace this with an actual image path if available
if os.path.exists(image_path):
    image = cv2.imread(image_path)
    print(f"Loaded image from {image_path}")
else:
    # Create a dummy image (a red square) if no image file is found
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    image[:] = [0, 0, 255]  # BGR - Red
    print("Created a dummy red image.")

# Display the image in a window
cv2.imshow('Loaded Image', image)
cv2.waitKey(0)  # Wait for a key press
cv2.destroyAllWindows()  # Close the window
