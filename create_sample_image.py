from PIL import Image, ImageDraw
import random

# Create a simple image with some shapes
width, height = 400, 300
img = Image.new('RGB', (width, height), color='skyblue')
draw = ImageDraw.Draw(img)

# Draw some shapes
draw.rectangle([50, 50, 150, 150], fill='red')
draw.ellipse([200, 100, 300, 200], fill='green')
draw.polygon([(100, 200), (150, 250), (50, 250)], fill='yellow')

# Save the image
img.save('/workspace/sample_image.jpg')
print("Sample image created successfully!")