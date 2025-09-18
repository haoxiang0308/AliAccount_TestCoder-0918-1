import cv2
import uuid
import sys

def main():
    # Load an image from file
    image_path = '/workspace/sample_image.png'
    img = cv2.imread(image_path)
    
    # Check if image was loaded successfully
    if img is None:
        print(f"Error: Could not load image from {image_path}")
        sys.exit(1)
    
    # Display the image (skipped in this environment)
    print("Image loaded successfully.")
    print("Note: Display skipped in this environment (no display available)")
    
    # Generate a random filename for saving
    random_filename = f"/workspace/opencv_image_{uuid.uuid4().hex[:8]}.jpg"
    
    # Save the image with a new filename
    success = cv2.imwrite(random_filename, img)
    
    if success:
        print(f"Image saved successfully as {random_filename}")
    else:
        print("Error: Could not save the image")
        sys.exit(1)

if __name__ == "__main__":
    main()