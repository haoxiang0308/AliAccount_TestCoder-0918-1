import cv2
import numpy as np
import os

def load_and_save_image(input_path, output_dir="./"):
    """
    Loads an image using OpenCV, displays it, and saves it with a random name.

    Args:
        input_path (str): Path to the input image file.
        output_dir (str): Directory to save the processed image. Defaults to current directory.

    Returns:
        str: Path to the saved image file, or None if operation failed.
    """
    # Load the image
    image = cv2.imread(input_path)

    # Check if the image was loaded successfully
    if image is None:
        print(f"Error: Could not load image from {input_path}")
        return None

    # Display the image in a window named 'Image'
    cv2.imshow('Image', image)
    print("Displaying image. Press any key on the image window to continue...")
    cv2.waitKey(0)  # Wait for a key press
    cv2.destroyAllWindows()  # Close the display window

    # Generate a random filename for the output
    random_filename = f"processed_image_{np.random.randint(10000, 99999)}.jpg"
    output_path = os.path.join(output_dir, random_filename)

    # Save the image to the new file
    success = cv2.imwrite(output_path, image)
    if success:
        print(f"Image saved successfully as {output_path}")
        return output_path
    else:
        print("Error: Could not save the image.")
        return None

# Example usage:
# Define the path to your input image. This example uses a placeholder 'input.jpg'.
# Make sure the file 'input.jpg' exists in the /workspace directory or update the path.
input_image_path = "/workspace/input.jpg"

# Check if the input file exists before processing
if os.path.exists(input_image_path):
    saved_file = load_and_save_image(input_image_path)
else:
    print(f"Input image file does not exist: {input_image_path}")
