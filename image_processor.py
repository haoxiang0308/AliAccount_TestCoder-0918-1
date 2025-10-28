import cv2
import numpy as np
import random
import string
import os

def generate_random_filename(extension='.py'):
    """Generate a random filename with the specified extension."""
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return random_name + extension

def load_display_save_image(image_path=None):
    """
    Load an image, display it, and save this script with a random name.
    If no image is provided, create a simple test image.
    """
    # If no image path provided, create a simple test image
    if image_path is None or not os.path.exists(image_path):
        print("No image provided, creating a test image...")
        img = np.zeros((300, 300, 3), dtype=np.uint8)
        # Create a simple pattern
        img[50:150, 50:150] = [255, 0, 0]  # Blue square
        img[150:250, 150:250] = [0, 255, 0]  # Green square
        img[100:200, 100:200] = [0, 0, 255]  # Red square (overlapping)
        image_loaded = False
    else:
        # Load the image
        img = cv2.imread(image_path)
        if img is None:
            print(f"Could not load image from {image_path}")
            # Create a test image instead
            img = np.zeros((300, 300, 3), dtype=np.uint8)
            img[50:150, 50:150] = [255, 0, 0]  # Blue square
            img[150:250, 150:250] = [0, 255, 0]  # Green square
            img[100:200, 100:200] = [0, 0, 255]  # Red square (overlapping)
            image_loaded = False
        else:
            print(f"Loaded image from {image_path}")
            image_loaded = True
    
    # Check if we're in a headless environment by checking environment variables
    import os
    display_env = os.environ.get('DISPLAY')
    headless = (display_env is None or display_env == '')
    
    if not headless:
        try:
            # Try to create a window to see if display is available
            cv2.imshow('Test', np.ones((10, 10, 3), dtype=np.uint8) * 255)
            cv2.waitKey(1)
            cv2.destroyWindow('Test')
            
            # Display the image if GUI is available
            cv2.imshow('Image', img)
            print("Displaying image. Press any key to continue...")
            cv2.waitKey(0)
            cv2.destroyAllWindows()
        except:
            # If GUI is not available, save image to file instead
            print("GUI not available, saving image to file instead...")
            output_img_name = generate_random_filename('.jpg')
            cv2.imwrite(output_img_name, img)
            print(f"Image saved as {output_img_name}")
    else:
        # Definitely in headless mode, save image to file
        print("Running in headless environment, saving image to file instead...")
        output_img_name = generate_random_filename('.jpg')
        cv2.imwrite(output_img_name, img)
        print(f"Image saved as {output_img_name}")
    
    # Generate a random filename with .py extension
    random_filename = generate_random_filename('.py')
    
    # Read the current script content
    with open(__file__, 'r') as f:
        script_content = f.read()
    
    # Write the script content to the new random filename
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved with random name: {random_filename}")
    
    return random_filename

if __name__ == "__main__":
    # Run the function without specifying an image path (will create a test image)
    load_display_save_image()