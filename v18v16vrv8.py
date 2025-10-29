import cv2
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
