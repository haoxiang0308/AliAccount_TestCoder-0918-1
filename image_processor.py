import cv2
import numpy as np
import os

def load_and_display_image(image_path):
    """
    Loads an image from the given path, displays it, and saves a copy.
    """
    # Load the image
    img = cv2.imread(image_path)

    # Check if image is loaded successfully
    if img is None:
        print(f"Error: Could not load image from {image_path}")
        return

    # Display the image in a window named 'Image'
    cv2.imshow('Image', img)

    # Wait for a key press and then close the window
    print("Press any key on the image window to close it and save the image.")
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    # Generate a random filename for the saved image
    base_name, ext = os.path.splitext(image_path)
    random_suffix = np.random.randint(1000, 9999)
    new_filename = f"{base_name}_copy_{random_suffix}{ext}"
    cv2.imwrite(new_filename, img)
    print(f"Image saved as {new_filename}")

if __name__ == "__main__":
    # Example usage: You need to provide the path to your image
    image_path = input("Enter the path to the image you want to load: ")
    load_and_display_image(image_path)
