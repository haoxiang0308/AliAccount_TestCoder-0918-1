import cv2
import uuid
import os

# Generate a random filename for saving
random_filename = f"processed_image_{uuid.uuid4().hex}.png"

# Load the image
image = cv2.imread('sample_image.png')

# Check if image was loaded successfully
if image is None:
    print("Error: Could not load image. Please check the file path.")
else:
    print("Image loaded successfully.")
    
    # Save the image with a random filename
    cv2.imwrite(random_filename, image)
    print(f"Image saved as {random_filename}")
    
    # Also save a modified version (e.g., grayscale)
    gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    gray_filename = f"gray_{random_filename}"
    cv2.imwrite(gray_filename, gray_image)
    print(f"Grayscale image saved as {gray_filename}")