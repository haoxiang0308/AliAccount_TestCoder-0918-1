import cv2
import numpy as np

# Create a sample image (black background with a colored rectangle and circle)
image = np.zeros((400, 600, 3), dtype=np.uint8)

# Draw a blue rectangle
cv2.rectangle(image, (50, 50), (300, 200), (255, 0, 0), -1)

# Draw a green circle
cv2.circle(image, (450, 150), 75, (0, 255, 0), -1)

# Add some text
cv2.putText(image, 'OpenCV Demo', (100, 300), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)

# Display the image (if possible)
# In environments without a display, we'll skip this step
print("Skipping image display as no display environment is available.")

# Save the image
output_filename = 'output_image.png'
success = cv2.imwrite(output_filename, image)
if success:
    print(f"Image saved as {output_filename}")
else:
    print("Failed to save the image")