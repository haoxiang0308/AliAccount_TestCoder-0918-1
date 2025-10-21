import cv2
import numpy as np
import random
import string

def load_display_and_save_image():
    # Load an image from file
    image = cv2.imread('sample_image.jpg')
    
    if image is None:
        print("Error: Could not load image. Please check if 'sample_image.jpg' exists.")
        return
    
    # Display the image in a window
    cv2.imshow('Loaded Image', image)
    
    # Wait for a key press (0 means wait indefinitely)
    print("Press any key in the image window to continue...")
    cv2.waitKey(0)
    
    # Close all OpenCV windows
    cv2.destroyAllWindows()
    
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