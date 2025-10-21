import cv2
import numpy as np
import random
import string
import os

def is_gui_available():
    # Check if we're in a headless environment
    return os.environ.get('DISPLAY') is not None

def load_display_and_save_image():
    # Load an image from file
    image = cv2.imread('sample_image.jpg')
    
    if image is None:
        print("Error: Could not load image. Please check if 'sample_image.jpg' exists.")
        return
    
    # Display the image in a window only if GUI is available
    if is_gui_available():
        try:
            cv2.imshow('Loaded Image', image)
            print("Press any key in the image window to continue...")
            cv2.waitKey(0)
            cv2.destroyAllWindows()
            print("Image displayed successfully")
        except Exception as e:
            print(f"Could not display image in window (headless environment): {e}")
    else:
        print("Running in headless environment - skipping image display")
    
    # Generate a random filename for the saved image
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    output_filename = f"output_{random_name}.jpg"
    
    # Save the image with the random filename
    success = cv2.imwrite(output_filename, image)
    
    if success:
        print(f"Image successfully saved as: {output_filename}")
    else:
        print("Error: Failed to save image.")

if __name__ == "__main__":
    load_display_and_save_image()
