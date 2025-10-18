import cv2
import numpy as np
import os
import sys
from datetime import datetime
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def main():
    # Create a sample image for demonstration (since we don't know if user has a specific image)
    # In a real scenario, you would load an actual image file
    sample_image = np.zeros((300, 300, 3), dtype=np.uint8)
    sample_image[:] = [255, 100, 50]  # Blue, Green, Red values (orange color)
    
    # Draw some shapes to make the image more interesting
    cv2.rectangle(sample_image, (50, 50), (250, 250), (0, 255, 0), 2)
    cv2.putText(sample_image, 'OpenCV Image', (70, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
    
    # Check if we're in a headless environment (no display)
    import os
    display_available = os.environ.get('DISPLAY') is not None
    
    if display_available:
        try:
            # Display the image
            cv2.imshow('Sample Image', sample_image)
            print("Displaying image. Press any key to continue...")
            cv2.waitKey(0)
            cv2.destroyAllWindows()
            print("Image was displayed successfully")
        except cv2.error as e:
            print(f"Could not display image: {e}")
    else:
        print("Running in headless environment, skipping image display")
    
    # Save the script to a randomly named .py file
    random_script_name = generate_random_filename()
    
    # Read this script's content
    with open(__file__, 'r') as f:
        script_content = f.read()
    
    # Write to the randomly named file
    with open(random_script_name, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to randomly named file: {random_script_name}")
    
    # If you want to work with an actual image file, uncomment and modify the following:
    # 
    # # Load an actual image file (replace 'image.jpg' with your image path)
    # # image = cv2.imread('image.jpg')
    # 
    # # if image is not None:
    # #     cv2.imshow('Loaded Image', image)
    # #     print("Displaying loaded image. Press any key to continue...")
    # #     cv2.waitKey(0)
    # #     cv2.destroyAllWindows()
    # #     
    # #     # Save the loaded image to a randomly named .py file (just the script)
    # #     random_script_name = generate_random_filename()
    # #     with open(random_script_name, 'w') as f:
    # #         f.write("# This script was saved with a random name\n")
    # #         f.write("# It would normally process an image\n")
    # #         f.write("print('Randomly named script executed')\n")
    # #     
    # #     print(f"Script saved to randomly named file: {random_script_name}")
    # # else:
    # #     print("Could not load image. Using sample image instead.")
    # #     # Use the sample image as fallback

if __name__ == "__main__":
    main()