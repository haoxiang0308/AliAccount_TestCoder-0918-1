import cv2
import numpy as np
import os

# Load an image from file.
# For this example, we'll create a simple synthetic image if a file isn't provided.
image = np.zeros((300, 300, 3), dtype=np.uint8)
image[:] = [255, 105, 180]  # Pink background

# Draw a simple shape (a blue rectangle)
cv2.rectangle(image, (50, 50), (250, 250), (255, 0, 0), -1)



# Save the image to a file.
output_path = 'output_image.png'
cv2.imwrite(output_path, image)
print(f"Image saved as {output_path}")
