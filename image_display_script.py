import cv2
import numpy as np
import os

# Load an image from the current directory. Replace 'input.jpg' with your image filename.
# For this example, we'll try to load a common test image or create a blank one if not found.
image_path = 'input.jpg' # Change this to your image file
if os.path.exists(image_path):
    image = cv2.imread(image_path)
    if image is None:
        print(f"Could not load image from {image_path}. Creating a blank test image.")
        image = np.zeros((300, 300, 3), dtype=np.uint8)
        cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1) # Draw a green square
else:
    print(f"Image file {image_path} not found. Creating a blank test image.")
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1) # Draw a green square

# Display the image in a window
cv2.imshow('Loaded Image', image)
cv2.waitKey(0) # Wait for a key press
cv2.destroyAllWindows() # Close the window

# Save the script with a random name
import random
import string

def generate_random_filename(ext='.py'):
    """Generates a random filename with the given extension."""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(10)) + ext
    return random_name

# As the script is already in Python, we can write its own content to the new random file
script_content = '''import cv2
import numpy as np
import os

# Load an image from the current directory. Replace 'input.jpg' with your image filename.
# For this example, we'll try to load a common test image or create a blank one if not found.
image_path = 'input.jpg' # Change this to your image file
if os.path.exists(image_path):
    image = cv2.imread(image_path)
    if image is None:
        print(f"Could not load image from {image_path}. Creating a blank test image.")
        image = np.zeros((300, 300, 3), dtype=np.uint8)
        cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1) # Draw a green square
else:
    print(f"Image file {image_path} not found. Creating a blank test image.")
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1) # Draw a green square

# Display the image in a window
cv2.imshow('Loaded Image', image)
cv2.waitKey(0) # Wait for a key press
cv2.destroyAllWindows() # Close the window
'''

random_filename = generate_random_filename()
with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"Script saved to {random_filename}")
