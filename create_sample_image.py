from PIL import Image
import numpy as np

# Create a sample image
width, height = 300, 300
image_array = np.zeros((height, width, 3), dtype=np.uint8)

# Create a simple pattern
for i in range(height):
    for j in range(width):
        image_array[i, j] = [(i * 255 // height) % 256, (j * 255 // width) % 256, 128]

# Create and save the image
img = Image.fromarray(image_array, 'RGB')
img.save('/workspace/sample_image.jpg')
print("Sample image created: /workspace/sample_image.jpg")