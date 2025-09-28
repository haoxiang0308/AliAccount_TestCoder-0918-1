import cv2
import numpy as np
import os

# Load an image from file
# For demonstration, we'll create a simple image if a specific file is not found
image_path = 'sample_image.jpg'
if os.path.exists(image_path):
    image = cv2.imread(image_path)
    print(f"Image loaded from {image_path}")
else:
    # Create a sample image (a red square on a black background)
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    cv2.rectangle(image, (100, 100), (200, 200), (0, 0, 255), -1)
    print("Sample image created.")

# Display the image in a window
cv2.imshow('Image', image)
cv2.waitKey(0)  # Wait for a key press
cv2.destroyAllWindows()  # Close the window

# Save the image to a new file with a random name
import random
import string

def generate_random_filename(length=8, extension='.jpg'):
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(length))
    return f"{random_name}{extension}"

output_path = generate_random_filename()
cv2.imwrite(output_path, image)
print(f"Image saved to {output_path}")
