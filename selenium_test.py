import random
import string
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import time

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def create_selenium_test():
    """Create the Selenium test code"""
    selenium_code = '''
from selenium import webdriver
from selenium.webdriver.common.by import By
import time

def test_open_google():
    # Initialize the Chrome driver
    driver = webdriver.Chrome()
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait for page to load
        time.sleep(3)
        
        # Verify we're on the Google page by checking the title
        assert "Google" in driver.title
        
        print("Successfully opened Google!")
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    test_open_google()
'''
    return selenium_code

def save_test_to_random_file():
    """Save the Selenium test to a randomly named .py file"""
    selenium_code = create_selenium_test()
    random_filename = generate_random_filename()
    
    with open(random_filename, 'w') as f:
        f.write(selenium_code)
    
    print(f"Selenium test saved to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    save_test_to_random_file()