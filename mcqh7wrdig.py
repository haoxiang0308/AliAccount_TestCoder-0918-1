import cv2
import numpy as np
import random
import string

# Create a sample image (black image with a white rectangle)
img = np.zeros((400, 400, 3), dtype=np.uint8)
cv2.rectangle(img, (100, 100), (300, 300), (255, 255, 255), -1)

# Generate a random filename for saving
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.jpg'
cv2.imwrite(random_name, img)
print(f"Image saved as {random_name}")