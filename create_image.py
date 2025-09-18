from PIL import Image
import numpy as np

# Create a simple image with some shapes
img = Image.new('RGB', (200, 200), color=(73, 109, 137))
pixels = img.load()

# Draw a yellow rectangle
for i in range(50, 150):
    for j in range(50, 150):
        pixels[i, j] = (255, 255, 0)

# Draw a red circle
for i in range(200):
    for j in range(200):
        if (i - 100) ** 2 + (j - 100) ** 2 < 30 ** 2:
            pixels[i, j] = (255, 0, 0)

# Save the image
img.save('/workspace/sample_image.png')
print("Sample image created successfully!")