import cv2
import numpy as np
import os

# Load an image from file.
# For demonstration, we'll create a simple synthetic image if a file isn't found.
image_path = 'sample_image.jpg'
if os.path.exists(image_path):
    image = cv2.imread(image_path)
    if image is None:
        print(f"Could not load image from {image_path}. Creating a sample image instead.")
        image = np.zeros((300, 300, 3), dtype=np.uint8)
        cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1) # Draw a green square
        cv2.putText(image, 'Hello OpenCV!', (70, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
else:
    print(f"Image file {image_path} not found. Creating a sample image instead.")
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1) # Draw a green square
    cv2.putText(image, 'Hello OpenCV!', (70, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)



# Save the (potentially modified) image to a new file.
output_path = 'output_image.jpg'
cv2.imwrite(output_path, image)
print(f"Image saved as {output_path}")
