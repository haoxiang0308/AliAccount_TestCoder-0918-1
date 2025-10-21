import cv2
import numpy as np
import random
import string
import os

def load_and_display_image(image_path):
    """
    Load an image using OpenCV, display it, and save it with a random filename
    """
    # Load the image
    image = cv2.imread(image_path)
    
    if image is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    print(f"Image loaded successfully with shape: {image.shape}")
    
    # Display the image
    cv2.imshow('Loaded Image', image)
    
    # Wait for a key press
    print("Press any key to close the image window...")
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    
    # Generate a random filename
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    random_filename = f"{random_name}.jpg"
    
    # Save the image with the random filename
    success = cv2.imwrite(random_filename, image)
    
    if success:
        print(f"Image saved as: {random_filename}")
    else:
        print("Failed to save image")

if __name__ == "__main__":
    # Path to the sample image we created
    image_path = "/workspace/sample_image.jpg"
    
    # Check if the image exists
    if not os.path.exists(image_path):
        print(f"Image file does not exist: {image_path}")
    else:
        load_and_display_image(image_path)