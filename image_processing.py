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
    # For demonstration purposes, we'll create a simple image if no image exists
    img = np.zeros((300, 300, 3), dtype=np.uint8)
    img[:] = [255, 100, 50]  # Fill with orange color
    
    # Draw some shapes to make the image more interesting
    cv2.rectangle(img, (50, 50), (250, 250), (0, 255, 0), 3)
    cv2.circle(img, (150, 150), 50, (0, 0, 255), -1)
    
    print("Image loaded and processed successfully")
    
    # Save the image to a randomly named .py file
    random_filename = generate_random_filename()
    
    # Write the image processing code to the random file
    script_content = f'''import cv2
import numpy as np

# Load and display image
img = np.zeros((300, 300, 3), dtype=np.uint8)
img[:] = [255, 100, 50]  # Fill with orange color
cv2.rectangle(img, (50, 50), (250, 250), (0, 255, 0), 3)
cv2.circle(img, (150, 150), 50, (0, 0, 255), -1)

print("Image processed in this script")
'''
    
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to {random_filename}")


if __name__ == "__main__":
    main()