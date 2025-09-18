import cv2
import numpy as np
import uuid
import os

# Generate a sample image (a blue square with red and green patterns)
def generate_sample_image():
    # Create a 300x300 image with 3 color channels (BGR)
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    
    # Fill the image with a blue background
    image[:, :] = (255, 0, 0)  # Blue in BGR format
    
    # Draw a green circle in the center
    center_coordinates = (150, 150)
    radius = 100
    color = (0, 255, 0)  # Green in BGR format
    thickness = -1  # Fill the circle
    cv2.circle(image, center_coordinates, radius, color, thickness)
    
    # Draw a red rectangle
    start_point = (50, 50)
    end_point = (250, 250)
    color = (0, 0, 255)  # Red in BGR format
    thickness = 3
    cv2.rectangle(image, start_point, end_point, color, thickness)
    
    return image

# Generate the sample image
img = generate_sample_image()

print("Skipping image display in headless environment.")

# Generate a random filename
random_filename = str(uuid.uuid4()) + ".jpg"

# Save the image
cv2.imwrite(random_filename, img)
print(f"Image saved as: {random_filename}")

# Verify by loading the image back
loaded_img = cv2.imread(random_filename)
if loaded_img is not None:
    print(f"Successfully loaded the saved image: {random_filename}")
    print(f"Saved image shape: {loaded_img.shape}")
else:
    print(f"Failed to load the saved image: {random_filename}")