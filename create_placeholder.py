import cv2
import numpy as np

# Create a simple placeholder image (a red rectangle)
height, width = 300, 300
placeholder_image = np.zeros((height, width, 3), dtype=np.uint8)
placeholder_image[:] = [0, 0, 255]  # BGR for red

# Save the placeholder image
cv2.imwrite('placeholder_image.jpg', placeholder_image)
print("Placeholder image 'placeholder_image.jpg' created.")