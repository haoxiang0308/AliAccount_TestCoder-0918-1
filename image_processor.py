import cv2
import numpy as np
import random
import string
import os

def generate_random_filename(extension='.py'):
    """Generate a random filename with the given extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}{extension}"

def load_and_display_image(image_path):
    """Load an image, display it if possible, and save this script with a random name."""
    # Load the image
    img = cv2.imread(image_path)
    
    if img is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    # Check if we're in a headless environment by checking display availability
    def is_headless():
        """Check if running in a headless environment."""
        try:
            # Check if DISPLAY environment variable exists (Unix/Linux)
            import os
            if os.environ.get('DISPLAY'):
                return False  # Not headless
            else:
                return True  # Headless
        except:
            return True  # If any error, assume headless
    
    if not is_headless():
        try:
            # Display the image
            cv2.imshow('Loaded Image', img)
            print("Displaying image. Press any key to close the window...")
            cv2.waitKey(0)  # Wait for a key press
            cv2.destroyAllWindows()  # Close the window
        except cv2.error as e:
            print(f"Could not display image: {e}")
            print("Image loaded successfully but not displayed.")
    else:
        print("Running in headless environment - skipping image display.")
        print(f"Image loaded successfully with shape: {img.shape}")
    
    # Save this script with a random name
    random_filename = generate_random_filename('.py')
    
    # Read the current script content
    with open(__file__, 'r') as f:
        script_content = f.read()
    
    # Write to the new random filename
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved as: {random_filename}")

if __name__ == "__main__":
    # For demonstration, we'll create a simple test image if one doesn't exist
    test_image_path = "test_image.jpg"
    
    # Create a test image if it doesn't exist
    if not os.path.exists(test_image_path):
        # Create a simple colored image
        test_img = np.zeros((300, 300, 3), dtype=np.uint8)
        test_img[:] = [255, 100, 50]  # Blue, Green, Red values
        # Add some shapes to make it more interesting
        cv2.rectangle(test_img, (50, 50), (250, 250), (0, 255, 0), 3)
        cv2.circle(test_img, (150, 150), 50, (0, 0, 255), -1)
        cv2.imwrite(test_image_path, test_img)
        print(f"Created test image: {test_image_path}")
    
    load_and_display_image(test_image_path)