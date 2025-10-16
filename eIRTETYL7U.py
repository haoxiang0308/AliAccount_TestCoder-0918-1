import cv2
import numpy as np
import random
import string

# Load an image from file
image_path = '/workspace/sample_image.jpg'
image = cv2.imread(image_path)

# Check if image is loaded successfully
if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    print("Image loaded successfully!")
    
    # Note that the image has been loaded (display skipped in non-GUI environment)
    print("Image loaded successfully (display skipped in non-GUI environment)")
    
    # Generate a random filename for saving
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    output_path = f'/workspace/{random_name}.jpg'
    
    # Save the image with the random name
    success = cv2.imwrite(output_path, image)
    
    if success:
        print(f"Image saved successfully as {output_path}")
    else:
        print("Error saving image")