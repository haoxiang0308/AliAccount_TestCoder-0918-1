import cv2
import numpy as np
import random
import string
import os

def generate_random_filename(extension=".jpg"):
    """Generate a random filename with the specified extension."""
    letters = string.ascii_lowercase + string.digits
    random_string = ''.join(random.choice(letters) for i in range(10))
    return f"{random_string}{extension}"

def load_display_save_image(image_path):
    """Load an image, display it, and save it with a random name."""
    # Load the image
    image = cv2.imread(image_path)
    
    if image is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    # Display the image
    cv2.imshow('Loaded Image', image)
    print("Press any key to close the image window and continue...")
    cv2.waitKey(0)  # Wait for a key press
    cv2.destroyAllWindows()  # Close the image window
    
    # Generate a random filename for saving
    random_filename = generate_random_filename(".jpg")
    
    # Save the image with the random filename
    success = cv2.imwrite(random_filename, image)
    
    if success:
        print(f"Image saved successfully as {random_filename}")
    else:
        print(f"Failed to save image as {random_filename}")

# Example usage
if __name__ == "__main__":
    # For this example, we'll create a simple test image since we don't know what images are available
    # In a real scenario, you would load an existing image
    test_image = np.zeros((300, 300, 3), dtype=np.uint8)
    test_image[:] = [255, 100, 0]  # Blue color in BGR
    
    # Draw some shapes to make the test image more interesting
    cv2.rectangle(test_image, (50, 50), (250, 250), (0, 255, 0), 2)
    cv2.circle(test_image, (150, 150), 50, (0, 0, 255), -1)
    
    # Save the test image temporarily
    temp_filename = "temp_test_image.jpg"
    cv2.imwrite(temp_filename, test_image)
    
    # Now load, display and save with random name
    load_display_save_image(temp_filename)
    
    # Clean up the temporary file
    if os.path.exists(temp_filename):
        os.remove(temp_filename)