#!/usr/bin/env python3
"""
OpenCV Image Processing Script
This script creates a sample image, displays it, and saves it to a file.
"""

import cv2
import numpy as np

def create_sample_image():
    """Create a sample image with shapes and text."""
    # Create a black image
    img = np.zeros((400, 600, 3), dtype=np.uint8)
    
    # Draw a blue rectangle
    cv2.rectangle(img, (50, 50), (250, 150), (255, 0, 0), -1)
    
    # Draw a green circle
    cv2.circle(img, (400, 100), 50, (0, 255, 0), -1)
    
    # Draw a red line
    cv2.line(img, (0, 300), (600, 300), (0, 0, 255), 5)
    
    # Add some text
    cv2.putText(img, 'OpenCV Demo', (150, 350), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
    
    return img

def main():
    # Create a sample image
    image = create_sample_image()
    
    # Save the image
    output_filename = 'output_image.png'
    cv2.imwrite(output_filename, image)
    print(f"Image saved as {output_filename}")
    
    # Display image info
    print(f"Image shape: {image.shape}")
    print("Note: Display functionality is disabled in this headless environment")

if __name__ == "__main__":
    main()