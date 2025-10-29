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
    
    print("Image loaded successfully")
    
    # Generate a random filename with .py extension as requested
    random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
    
    # Create the content for the Python script that uses OpenCV to load and save images
    script_content = '''import cv2
import numpy as np

# Load an image from file
image = cv2.imread('sample_image.jpg')

# Check if image was loaded successfully
if image is not None:
    print("Image loaded successfully")
    
    # Since we can't display in this environment, we'll just save it with a new name
    # In a proper environment, you would use cv2.imshow('Loaded Image', image)
    # followed by cv2.waitKey(0) and cv2.destroyAllWindows()
    
    # Save the image with a new name
    cv2.imwrite('processed_image.jpg', image)
    print("Image saved as processed_image.jpg")
else:
    print("Error: Could not load image.")
'''
    
    # Write the Python script to the randomly named .py file
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Python script saved to: {random_filename}")

# Run the image processing function
process_image()