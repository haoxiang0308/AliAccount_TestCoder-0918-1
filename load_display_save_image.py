import cv2
import numpy as np
import secrets
import string
import os
import sys

def generate_random_filename(extension):
    """Generate a random filename with the given extension."""
    random_name = ''.join(secrets.choice(string.ascii_letters + string.digits) for _ in range(10))
    return f"{random_name}.{extension}"

def main():
    # Create a simple image (black background with a colored rectangle and circle)
    image = np.zeros((400, 400, 3), dtype=np.uint8)
    # Draw a blue rectangle
    cv2.rectangle(image, (50, 50), (200, 200), (255, 0, 0), -1)
    # Draw a green circle
    cv2.circle(image, (300, 300), 50, (0, 255, 0), -1)
    
    # Save the image with a random name
    temp_image_name = generate_random_filename("jpg")
    cv2.imwrite(temp_image_name, image)
    print(f"Created temporary image: {temp_image_name}")
    
    # Load the image
    loaded_image = cv2.imread(temp_image_name)
    if loaded_image is None:
        print("Error loading image")
        sys.exit(1)
        
    print("Image loaded successfully")
    
    # Save the image with another random name
    output_name = generate_random_filename("jpg")
    success = cv2.imwrite(output_name, loaded_image)
    if success:
        print(f"Saved image as: {output_name}")
    else:
        print("Error saving image")
        sys.exit(1)
    
    # Clean up temporary file
    os.remove(temp_image_name)
    print(f"Removed temporary file: {temp_image_name}")
    print("Script completed successfully!")

if __name__ == "__main__":
    main()