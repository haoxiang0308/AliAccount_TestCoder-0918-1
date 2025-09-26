import cv2
import numpy as np
import os

# Load an image from file
# Replace 'path/to/your/image.jpg' with the actual path to your image
image_path = 'path/to/your/image.jpg'
image = cv2.imread(image_path)

# Check if image is loaded successfully
if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    # Display the image in a window
    cv2.imshow('Loaded Image', image)
    
    # Wait for a key press and close the window
    print("Press any key on the image window to close it and save the script.")
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    # Save a copy of the image to demonstrate write functionality
    # Using a fixed name for the output as the request was for the script file name to be random
    output_path = 'path/to/your/output_image.jpg'
    cv2.imwrite(output_path, image)
    print(f"Image saved to {output_path}")
