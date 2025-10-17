import cv2
import numpy as np
import os
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def main():
    try:
        # Create a simple test image
        test_image = np.zeros((300, 300, 3), dtype=np.uint8)
        test_image[:] = [255, 100, 100]  # Blue color background
        
        # Draw some shapes to make the test image more interesting
        cv2.rectangle(test_image, (50, 50), (250, 250), (0, 255, 0), 2)
        cv2.putText(test_image, 'Test Image', (80, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
        
        print("Created test image successfully")
        
        # Try to display the image (this might fail in headless environments)
        try:
            cv2.imshow('Test Image', test_image)
            cv2.waitKey(1)  # Small wait to allow window to initialize
            print("Displaying test image. Press any key to close the window.")
            cv2.waitKey(0)  # Wait for a key press
            cv2.destroyAllWindows()  # Close the window
        except cv2.error as e:
            print(f"Could not display image (this is expected in headless environments): {e}")
        
        # Save the image to a file (as an additional feature)
        cv2.imwrite('test_output.jpg', test_image)
        print("Image saved as test_output.jpg")
        
    except Exception as e:
        print(f"Error creating or displaying image: {e}")
    
    # Generate a random filename for the script
    random_filename = generate_random_filename()
    
    # Save this script to the randomly named file
    script_content = '''import cv2
import numpy as np
import os
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def main():
    try:
        # Create a simple test image
        test_image = np.zeros((300, 300, 3), dtype=np.uint8)
        test_image[:] = [255, 100, 100]  # Blue color background
        
        # Draw some shapes to make the test image more interesting
        cv2.rectangle(test_image, (50, 50), (250, 250), (0, 255, 0), 2)
        cv2.putText(test_image, 'Test Image', (80, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
        
        print("Created test image successfully")
        
        # Try to display the image (this might fail in headless environments)
        try:
            cv2.imshow('Test Image', test_image)
            cv2.waitKey(1)  # Small wait to allow window to initialize
            print("Displaying test image. Press any key to close the window.")
            cv2.waitKey(0)  # Wait for a key press
            cv2.destroyAllWindows()  # Close the window
        except cv2.error as e:
            print(f"Could not display image (this is expected in headless environments): {{e}}")
        
        # Save the image to a file (as an additional feature)
        cv2.imwrite('test_output.jpg', test_image)
        print("Image saved as test_output.jpg")
        
    except Exception as e:
        print(f"Error creating or displaying image: {{e}}")
    
    # Generate a random filename for the script
    random_filename = generate_random_filename()
    
    # This is where the script would save itself to a randomly named file
    print(f"Random filename would be: {{random_filename}}")

if __name__ == "__main__":
    main()
'''
    
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to: {random_filename}")

if __name__ == "__main__":
    main()