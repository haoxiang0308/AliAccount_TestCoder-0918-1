import cv2
import numpy as np
import random
import string
import os

def generate_random_filename(extension=".py"):
    """Generate a random filename with the specified extension."""
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return random_name + extension

def load_display_save_image(image_path=None):
    """
    Load an image, display it, and save this script with a random name.
    If no image is provided, creates a simple test image.
    """
    # If no image path provided, create a test image
    if image_path is None:
        # Create a simple test image
        img = np.zeros((300, 300, 3), dtype=np.uint8)
        img[:] = [255, 100, 0]  # Blue background
        # Add some shapes
        cv2.rectangle(img, (50, 50), (250, 250), (0, 255, 0), 2)
        cv2.putText(img, 'Test Image', (100, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
    else:
        # Load the image from file
        img = cv2.imread(image_path)
        if img is None:
            print(f"Error: Could not load image from {image_path}")
            return
    
    # Display the image
    cv2.imshow('Image', img)
    print("Press any key to close the image window...")
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    
    # Save this script with a random name
    random_filename = generate_random_filename(".py")
    
    # Read the current script
    with open(__file__, 'r') as f:
        script_content = f.read()
    
    # Write to the new random filename
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved as: {random_filename}")

if __name__ == "__main__":
    # Run the function (with no image, so it creates a test image)
    load_display_save_image()