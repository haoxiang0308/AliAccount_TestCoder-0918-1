import cv2
import numpy as np
import os

# Load an image from file
# Note: You need to replace 'path/to/your/image.jpg' with the actual path to an image on your system.
image_path = 'path/to/your/image.jpg'
image = cv2.imread(image_path)

# Check if image is loaded successfully
if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    # Display the image in a window
    cv2.imshow('Loaded Image', image)
    
    # Wait for a key press and close the window
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    # Generate a random filename for the saved image
    # This uses numpy to generate random integers and constructs a filename
    random_name = f"output_{np.random.randint(10000, 99999)}.jpg"
    
    # Save the loaded image with the random name
    success = cv2.imwrite(random_name, image)
    
    if success:
        print(f"Image saved successfully as {random_name}")
    else:
        print("Error saving image.")
