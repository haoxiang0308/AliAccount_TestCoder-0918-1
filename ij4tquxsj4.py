import cv2
import numpy as np

# Create a sample image (black image with a white rectangle)
img = np.zeros((400, 400, 3), dtype=np.uint8)
cv2.rectangle(img, (100, 100), (300, 300), (255, 255, 255), -1)

# Save the image
cv2.imwrite('sample_image.jpg', img)

# Load the image
loaded_img = cv2.imread('sample_image.jpg')

# Save a modified version of the image
loaded_img[:, :, 0] = 0  # Remove blue channel
cv2.imwrite('modified_image.jpg', loaded_img)

print("Image processing complete. Check the saved images.")
print("Original image saved as 'sample_image.jpg'")
print("Modified image saved as 'modified_image.jpg'")