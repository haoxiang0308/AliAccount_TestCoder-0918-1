import cv2
import numpy as np

# Create a sample image with shapes
img = np.zeros((400, 600, 3), dtype=np.uint8)
img.fill(255)  # White background

# Draw some shapes to make the image interesting
cv2.rectangle(img, (50, 50), (200, 200), (0, 255, 0), -1)  # Green rectangle
cv2.circle(img, (300, 150), 75, (255, 0, 0), -1)  # Blue circle
cv2.putText(img, 'OpenCV Test Image', (50, 350), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 0), 2)

# Save the sample image
cv2.imwrite('sample_image.jpg', img)
print("Sample image created: sample_image.jpg")