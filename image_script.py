import cv2
import numpy as np
import os

# Load an image from the system (using a common default image path or a generated one)
# For this example, we'll create a simple synthetic image if a specific one isn't provided.
image = np.zeros((300, 300, 3), dtype=np.uint8)
image[:] = [255, 100, 0]  # Fill with a blue color (BGR format)

# Display the image in a window
cv2.imshow('Generated Image', image)
cv2.waitKey(0)  # Wait for a key press
cv2.destroyAllWindows()  # Close the window

# Save the script itself to a randomly named .py file
script_content = '''import cv2
import numpy as np
import os

# Load an image from the system (using a common default image path or a generated one)
# For this example, we'll create a simple synthetic image if a specific one isn't provided.
image = np.zeros((300, 300, 3), dtype=np.uint8)
image[:] = [255, 100, 0]  # Fill with a blue color (BGR format)

# Display the image in a window
cv2.imshow('Generated Image', image)
cv2.waitKey(0)  # Wait for a key press
cv2.destroyAllWindows()  # Close the window
'''

# Generate a random filename
random_filename = np.random.choice(list('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'), size=10)
random_filename = ''.join(random_filename) + '.py'

# Write the script content to the new file
with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"Script saved as {random_filename}")
