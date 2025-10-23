import cv2
import numpy as np
import random
import string
import os

def generate_random_filename(extension='.jpg'):
    """Generate a random filename with the specified extension."""
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_name}{extension}"

def main():
    # Create a sample image (since we don't know if a specific image exists)
    # This creates a colorful test image
    height, width = 400, 600
    sample_image = np.zeros((height, width, 3), dtype=np.uint8)
    
    # Add some color patterns to the image
    sample_image[:, :width//3] = [255, 0, 0]      # Blue left third
    sample_image[:, width//3:2*width//3] = [0, 255, 0]  # Green middle third
    sample_image[:, 2*width//3:] = [0, 0, 255]   # Red right third
    
    # Add some text
    cv2.putText(sample_image, 'OpenCV Test Image', (50, height//2), 
                cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
    
    # Check if running in a headless environment
    import os
    display_success = False
    
    # Try to display the image, but handle headless environments
    if os.getenv('DISPLAY') or os.name == 'nt':  # On Windows or if DISPLAY is set
        try:
            # Display the image
            cv2.imshow('Sample Image', sample_image)
            print("Displaying image. Press any key to continue...")
            cv2.waitKey(0)
            cv2.destroyAllWindows()
            display_success = True
        except cv2.error as e:
            print(f"Could not display image: {e}")
    else:
        print("Running in headless environment, skipping image display...")
    
    # Generate a random filename for saving
    random_filename = generate_random_filename('.jpg')
    
    # Save the image with the random filename
    success = cv2.imwrite(random_filename, sample_image)
    
    if success:
        print(f"Image saved as: {random_filename}")
    else:
        print("Failed to save image")
    
    if display_success:
        print("Image was displayed successfully.")
    else:
        print("Image was not displayed (likely running in headless environment).")

if __name__ == "__main__":
    main()