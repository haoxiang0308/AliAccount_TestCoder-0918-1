import cv2
import numpy as np

# This script was randomly generated
def main():
    # Load an image
    image = cv2.imread('sample_image.jpg')
    
    if image is None:
        print("Error: Could not load image.")
        return
    
    print("Image loaded successfully")
    
    # Display the image (this would work in an environment with GUI support)
    # cv2.imshow('Loaded Image', image)
    # print("Press any key to close the image window...")
    # cv2.waitKey(0)
    # cv2.destroyAllWindows()

if __name__ == "__main__":
    main()
