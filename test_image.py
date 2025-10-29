import cv2
import numpy as np
import random
import string

# Create a sample image for testing
def create_sample_image():
    # Create a colored image with some shapes
    img = np.zeros((300, 300, 3), dtype=np.uint8)
    
    # Add some shapes and text to make it interesting
    cv2.rectangle(img, (50, 50), (250, 100), (255, 0, 0), -1)  # Blue rectangle
    cv2.circle(img, (150, 200), 50, (0, 255, 0), -1)  # Green circle
    cv2.putText(img, 'OpenCV Test', (80, 180), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)
    
    # Save the sample image
    cv2.imwrite('sample_image.jpg', img)
    print("Sample image created: sample_image.jpg")

# Create the sample image
create_sample_image()

# Main script to load and save an image with a random .py filename
def process_image():
    # Load an image from file
    image = cv2.imread('sample_image.jpg')
    
    # Check if image was loaded successfully
    if image is None:
        print("Error: Could not load image.")
        return
    
    # Generate a random filename with .py extension as requested
    random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
    
    # Save the image data to a .py file (this will be binary data in a .py file)
    success = cv2.imwrite(random_filename, image)
    
    if success:
        print(f"Image data saved to Python file: {random_filename}")
    else:
        print("Error: Could not save image.")
        
    # Let's also create a proper Python script that loads and saves images
    # Generate another random .py filename for the actual script
    script_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
    
    # Create a Python script that can load and save images
    script_content = f'''import cv2
import numpy as np

# Load the original image
image = cv2.imread('sample_image.jpg')

if image is not None:
    print("Image loaded successfully")
    
    # Save it with a new name
    output_name = 'output_' + '{script_filename[:5]}' + '.jpg'
    cv2.imwrite(output_name, image)
    print(f"Image saved as: {{output_name}}")
else:
    print("Could not load image")
'''
    
    # Write the Python script to the randomly named .py file
    with open(script_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Created Python script: {script_filename}")

# Run the image processing function
process_image()