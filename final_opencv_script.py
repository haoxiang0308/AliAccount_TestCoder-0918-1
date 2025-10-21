import cv2
import numpy as np
import random
import string
import os

def load_and_display_image(image_path):
    """
    Load an image using OpenCV and display it (if display is available)
    """
    # Load the image
    image = cv2.imread(image_path)
    
    if image is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    print(f"Image loaded successfully with shape: {image.shape}")
    
    # Try to display the image, but handle the case where display is not available
    try:
        # Display the image
        cv2.imshow('Loaded Image', image)
        
        # Wait for a key press
        print("Press any key to close the image window...")
        cv2.waitKey(0)
        cv2.destroyAllWindows()
        print("Image displayed successfully")
    except cv2.error as e:
        print(f"Could not display image (likely running in headless environment): {e}")
        print("Image processing completed without display")

def get_script_content():
    """Return the content of this script as a string"""
    return '''import cv2
import numpy as np
import random
import string
import os

def load_and_display_image(image_path):
    """
    Load an image using OpenCV and display it (if display is available)
    """
    # Load the image
    image = cv2.imread(image_path)
    
    if image is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    print(f"Image loaded successfully with shape: {image.shape}")
    
    # Try to display the image, but handle the case where display is not available
    try:
        # Display the image
        cv2.imshow('Loaded Image', image)
        
        # Wait for a key press
        print("Press any key to close the image window...")
        cv2.waitKey(0)
        cv2.destroyAllWindows()
        print("Image displayed successfully")
    except cv2.error as e:
        print(f"Could not display image (likely running in headless environment): {e}")
        print("Image processing completed without display")

def get_script_content():
    """Return the content of this script as a string"""
    return ''' + "'''" + ''' + get_script_content() + ''' + "'''" + '''

if __name__ == "__main__":
    # Path to the sample image we created
    image_path = "/workspace/sample_image.jpg"
    
    # Check if the image exists
    if not os.path.exists(image_path):
        print(f"Image file does not exist: {image_path}")
    else:
        load_and_display_image(image_path)
        
        # Generate a random filename for the Python script
        random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
        random_filename = f"{random_name}.py"
        
        # Save this script to a randomly named .py file
        with open(random_filename, 'w') as f:
            f.write(get_script_content())
        
        print(f"Script saved as: {random_filename}")'''

if __name__ == "__main__":
    # Path to the sample image we created
    image_path = "/workspace/sample_image.jpg"
    
    # Check if the image exists
    if not os.path.exists(image_path):
        print(f"Image file does not exist: {image_path}")
    else:
        load_and_display_image(image_path)
        
        # Generate a random filename for the Python script
        random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
        random_filename = f"{random_name}.py"
        
        # Save this script to a randomly named .py file
        with open(random_filename, 'w') as f:
            f.write(get_script_content())
        
        print(f"Script saved as: {random_filename}")