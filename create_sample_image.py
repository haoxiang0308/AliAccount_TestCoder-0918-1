import numpy as np

# Create a simple image (white background with a black rectangle)
image = np.ones((300, 300, 3), dtype=np.uint8) * 255  # White background
image[100:200, 100:200] = [0, 0, 0]  # Black square in the middle

# Save the image
import cv2
cv2.imwrite('sample_image.png', image)
print("Sample image created successfully!")