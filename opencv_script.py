import cv2
import uuid
import os

# Load an image from file
image_path = 'sample_image.jpg'
image = cv2.imread(image_path)

# Check if image was loaded successfully
if image is None:
    print(f"Error: Could not load image from {image_path}")
    exit()

print("Skipping image display as this environment doesn't support it.")

# Generate a random filename for saving
random_filename = f"processed_image_{uuid.uuid4().hex[:8]}.jpg"

# Save the image with a random name
success = cv2.imwrite(random_filename, image)
if success:
    print(f"Image saved as {random_filename}")
else:
    print("Failed to save the image")

# Verify the saved image
if os.path.exists(random_filename):
    saved_image = cv2.imread(random_filename)
    if saved_image is not None:
        print(f"Successfully verified saved image at {random_filename}")
        print(f"Saved image dimensions: {saved_image.shape}")
    else:
        print(f"Failed to verify saved image at {random_filename}")
else:
    print(f"File {random_filename} does not exist")