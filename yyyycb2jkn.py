import cv2
import numpy as np
import random
import string
import os

def load_image(image_path):
    """
    Load an image using OpenCV (without displaying)
    """
    # Load the image
    image = cv2.imread(image_path)
    
    if image is None:
        print(f"Error: Could not load image from {image_path}")
        return None
    
    print(f"Image loaded successfully with shape: {image.shape}")
    return image

def save_random_script():
    """Save this script to a randomly named .py file"""
    # Generate a random filename for the Python script
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    random_filename = f"{random_name}.py"
    
    # Get the content of this script
    script_content = 'import cv2\nimport numpy as np\nimport random\nimport string\nimport os\n\ndef load_image(image_path):\n    """\n    Load an image using OpenCV (without displaying)\n    """\n    # Load the image\n    image = cv2.imread(image_path)\n    \n    if image is None:\n        print(f"Error: Could not load image from {image_path}")\n        return None\n    \n    print(f"Image loaded successfully with shape: {image.shape}")\n    return image\n\ndef save_random_script():\n    """Save this script to a randomly named .py file"""\n    # Generate a random filename for the Python script\n    random_name = \'\'.join(random.choices(string.ascii_lowercase + string.digits, k=10))\n    random_filename = f"{random_name}.py"\n    \n    # Get the content of this script\n    script_content = ...\n    \n    # Save this script to a randomly named .py file\n    with open(random_filename, \'w\') as f:\n        f.write(script_content.replace("...", repr(script_content)))\n    \n    print(f"Script saved as: {random_filename}")\n\nif __name__ == "__main__":\n    # Path to the sample image we created\n    image_path = "/workspace/sample_image.jpg"\n    \n    # Check if the image exists\n    if not os.path.exists(image_path):\n        print(f"Image file does not exist: {image_path}")\n    else:\n        image = load_image(image_path)\n        if image is not None:\n            save_random_script()'
    
    # Save this script to a randomly named .py file
    with open(random_filename, 'w') as f:
        f.write(script_content.replace("'import cv2\nimport numpy as np\nimport random\nimport string\nimport os\n\ndef load_image(image_path):\n    """\n    Load an image using OpenCV (without displaying)\n    """\n    # Load the image\n    image = cv2.imread(image_path)\n    \n    if image is None:\n        print(f"Error: Could not load image from {image_path}")\n        return None\n    \n    print(f"Image loaded successfully with shape: {image.shape}")\n    return image\n\ndef save_random_script():\n    """Save this script to a randomly named .py file"""\n    # Generate a random filename for the Python script\n    random_name = \'\'.join(random.choices(string.ascii_lowercase + string.digits, k=10))\n    random_filename = f"{random_name}.py"\n    \n    # Get the content of this script\n    script_content = ...\n    \n    # Save this script to a randomly named .py file\n    with open(random_filename, \'w\') as f:\n        f.write(script_content.replace("...", repr(script_content)))\n    \n    print(f"Script saved as: {random_filename}")\n\nif __name__ == "__main__":\n    # Path to the sample image we created\n    image_path = "/workspace/sample_image.jpg"\n    \n    # Check if the image exists\n    if not os.path.exists(image_path):\n        print(f"Image file does not exist: {image_path}")\n    else:\n        image = load_image(image_path)\n        if image is not None:\n            save_random_script()'", repr(script_content)))
    
    print(f"Script saved as: {random_filename}")

if __name__ == "__main__":
    # Path to the sample image we created
    image_path = "/workspace/sample_image.jpg"
    
    # Check if the image exists
    if not os.path.exists(image_path):
        print(f"Image file does not exist: {image_path}")
    else:
        image = load_image(image_path)
        if image is not None:
            save_random_script()