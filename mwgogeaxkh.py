import cv2
import numpy as np

# Load and display image
img = np.zeros((300, 300, 3), dtype=np.uint8)
img[:] = [255, 100, 50]  # Fill with orange color
cv2.rectangle(img, (50, 50), (250, 250), (0, 255, 0), 3)
cv2.circle(img, (150, 150), 50, (0, 0, 255), -1)

print("Image processed in this script")
