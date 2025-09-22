import cv2
import numpy as np
import secrets
import string
import os

# Create a simple image (black background with a white rectangle)
image = np.zeros((400, 400, 3), dtype=np.uint8)
cv2.rectangle(image, (100, 100), (300, 300), (255, 255, 255), -1)

# Save the image with a random name
random_name = ''.join(secrets.choice(string.ascii_letters + string.digits) for _ in range(10))
temp_image_name = f"{random_name}.jpg"
cv2.imwrite(temp_image_name, image)
print(f"Created temporary image: {temp_image_name}")

# Now load the image
loaded_image = cv2.imread(temp_image_name)
print("Image loaded successfully")

# Save the image with another random name
output_name = ''.join(secrets.choice(string.ascii_letters + string.digits) for _ in range(10)) + ".jpg"
cv2.imwrite(output_name, loaded_image)
print(f"Saved image as: {output_name}")

# Clean up temporary file
os.remove(temp_image_name)
print(f"Removed temporary file: {temp_image_name}")