import cv2
import numpy as np
import os

def main():
    # Load an image from file. Using a placeholder path, you will need to provide an actual image.
    # For demonstration, we'll create a simple synthetic image if a file is not found.
    image_path = 'example_image.jpg' # Replace with your image path
    
    # Check if the specified image file exists
    if os.path.exists(image_path):
        image = cv2.imread(image_path)
        if image is None:
            print(f"Could not load image from {image_path}. Creating a dummy image.")
            image = np.zeros((300, 300, 3), dtype=np.uint8)
            cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1) # Draw a green square
    else:
        print(f"Image file {image_path} not found. Creating a dummy image.")
        image = np.zeros((300, 300, 3), dtype=np.uint8)
        cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1) # Draw a green square


    # Display the image in a window named 'Image Display'
    cv2.imshow('Image Display', image)
    print("Press any key in the image window to close it and save the script.")
    cv2.waitKey(0) # Wait for a key press
    cv2.destroyAllWindows() # Close the display window

    # Save the script itself to a new file with a random name
    import random
    import string
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
    
    # Read the current script's content
    with open(__file__, 'r') as f:
        script_content = f.read()
    
    # Write the content to the new file
    with open(random_name, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to {random_name}")

if __name__ == "__main__":
    main()
