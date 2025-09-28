import cv2
import numpy as np
import os
import random
import string

# Create a sample image (a red square on a black background)
image = np.zeros((300, 300, 3), dtype=np.uint8)
cv2.rectangle(image, (100, 100), (200, 200), (0, 0, 255), -1)
print("Sample image created.")

# Define function to generate a random filename
def generate_random_filename(length=8, extension='.jpg'):
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(length))
    return f"{random_name}{extension}"

# Save the image to a new file with a random name
output_path = generate_random_filename()
cv2.imwrite(output_path, image)
print(f"Image saved to {output_path}")
