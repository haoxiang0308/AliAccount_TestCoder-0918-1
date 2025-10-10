import cv2
import numpy as np
import os

# Load an image from file
# For demonstration, we'll create a simple image if a specific file is not provided.
# Replace 'path/to/your/image.jpg' with an actual image path if needed.
image_path = 'sample_image.jpg'

# Check if the sample image exists, if not, create one
if not os.path.exists(image_path):
    print(f"Sample image {image_path} not found. Creating a simple one.")
    # Create a simple 300x300 BGR image with a rectangle
    sample_img = np.zeros((300, 300, 3), dtype=np.uint8)
    cv2.rectangle(sample_img, (50, 50), (250, 250), (0, 255, 0), -1)  # Green rectangle
    cv2.imwrite(image_path, sample_img)

# Load the image
image = cv2.imread(image_path)

if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    # Display the image in a window
    cv2.imshow('Loaded Image', image)
    print("Displaying image. Press any key in the image window to continue...")

    # Wait for a key press
    cv2.waitKey(0)

    # Close all OpenCV windows
    cv2.destroyAllWindows()

    # Save the loaded image to a new file with a random name
    import random
    import string
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.jpg'
    cv2.imwrite(random_name, image)
    print(f"Image saved with random name: {random_name}")
