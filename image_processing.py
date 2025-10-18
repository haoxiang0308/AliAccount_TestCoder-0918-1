import cv2
import numpy as np
import os
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def main():
    # Load an image (using a placeholder - you can replace this with your image path)
    # For demonstration purposes, I'll create a simple image if no image exists
    img_path = "sample_image.jpg"
    
    # Check if the sample image exists, if not create one
    if not os.path.exists(img_path):
        print("Sample image not found. Creating a sample image...")
        # Create a sample image with OpenCV
        sample_img = np.zeros((300, 300, 3), dtype=np.uint8)
        sample_img[:] = [255, 100, 0]  # Blue background
        cv2.rectangle(sample_img, (50, 50), (250, 250), (0, 255, 0), -1)  # Green square
        cv2.putText(sample_img, 'Sample', (100, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 0), 2)
        cv2.imwrite(img_path, sample_img)
        print(f"Sample image created: {img_path}")
    
    # Load the image
    image = cv2.imread(img_path)
    
    if image is None:
        print("Error: Could not load image.")
        return
    
    print(f"Image loaded successfully. Shape: {image.shape}")
    
    # Display the image
    cv2.imshow('Loaded Image', image)
    print("Displaying image. Press any key to continue...")
    cv2.waitKey(0)  # Wait for a key press
    cv2.destroyAllWindows()  # Close the window
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Create the Python script that loads and displays the image
    script_content = f'''import cv2
import numpy as np

# This script was randomly generated
def main():
    # Load an image
    image = cv2.imread('{img_path}')
    
    if image is None:
        print("Error: Could not load image.")
        return
    
    print("Image loaded successfully")
    
    # Display the image
    cv2.imshow('Loaded Image', image)
    print("Press any key to close the image window...")
    cv2.waitKey(0)
    cv2.destroyAllWindows()

if __name__ == "__main__":
    main()
'''
    
    # Write the script to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Python script saved to: {random_filename}")

if __name__ == "__main__":
    main()