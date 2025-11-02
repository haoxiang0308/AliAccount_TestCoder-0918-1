import cv2
import numpy as np
import os
import random
import string

def generate_random_filename():
    """Generate a random filename with .jpg extension"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(10)) + '.jpg'

def main():
    # Try to load an image (you would need to provide an actual image path)
    # For demonstration purposes, I'm using a placeholder
    image_path = "sample_image.jpg"  # Replace with actual image path
    
    # Check if image exists
    if os.path.exists(image_path):
        # Load image
        image = cv2.imread(image_path)
        
        if image is not None:
            print(f"Successfully loaded image: {image_path}")
            print(f"Image shape: {image.shape}")
            
            # Skip displaying the image in headless environments
            print("Running in headless environment, skipping image display...")
            
            # Generate random filename and save the image
            random_filename = generate_random_filename()
            cv2.imwrite(random_filename, image)
            print(f"Image saved as: {random_filename}")
        else:
            print(f"Failed to load image: {image_path}")
    else:
        print(f"Image file does not exist: {image_path}")
        print("Creating a sample image instead...")
        
        # Create a sample image if no image exists
        sample_image = np.zeros((300, 300, 3), dtype=np.uint8)
        sample_image[:] = [255, 100, 100]  # Blue color in BGR
        
        # Draw some shapes to make it more interesting
        cv2.rectangle(sample_image, (50, 50), (250, 250), (0, 255, 0), 2)
        cv2.putText(sample_image, 'Sample Image', (70, 150), 
                   cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
        
        # Skip displaying the sample image in headless environments
        print("Running in headless environment, skipping image display...")
        
        # Generate random filename and save the sample image
        random_filename = generate_random_filename()
        cv2.imwrite(random_filename, sample_image)
        print(f"Sample image saved as: {random_filename}")

if __name__ == "__main__":
    main()