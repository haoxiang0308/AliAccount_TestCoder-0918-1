import cv2
import numpy as np
import os

# Load an image from file
# Using a placeholder path, this should be an existing image
image_path = 'placeholder_image.jpg' # This path needs to be updated to an actual image file
image = cv2.imread(image_path)

if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    # Display the image in a window
    cv2.imshow('Loaded Image', image)
    
    # Wait for a key press and close the window
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    # Generate a random filename for the output script
    import random
    import string
    random_filename = 'script_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
    
    # Save this script under the random filename
    # Since this is a self-replicating action, we just print the name of the new file.
    # In a real scenario, you would write the content of *this* script to a new file named `random_filename`.
    print(f"This script would save itself as: {random_filename}")

    # For demonstration, let's just save a simpler version of the loaded image operation to the random file
    simple_script_content = f'''import cv2
# Load and display image
image = cv2.imread('{image_path}')
if image is not None:
    cv2.imshow('Random Script Image', image)
    cv2.waitKey(0)
    cv2.destroyAllWindows()
'''
    with open(random_filename, 'w') as f:
        f.write(simple_script_content)
    
    print(f"A simple image script has been saved as {random_filename}")
