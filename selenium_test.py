from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.options import Options
import geckodriver_autoinstaller
import time
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def selenium_test():
    # Install and set up geckodriver for Firefox
    geckodriver_autoinstaller.install()
    service = Service()
    options = Options()
    options.add_argument('--headless')  # Run in headless mode
    driver = webdriver.Firefox(service=service, options=options)
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait for the page to load
        time.sleep(3)
        
        # Verify we're on the Google page by checking the title
        assert "Google" in driver.title
        
        print("Successfully opened Google!")
        
        # Save this test to a randomly named .py file
        random_filename = generate_random_filename()
        
        # The content of the test
        test_content = '''from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.firefox.options import Options
import geckodriver_autoinstaller
import time

def selenium_test():
    # Install and set up geckodriver for Firefox
    geckodriver_autoinstaller.install()
    service = Service()
    options = Options()
    options.add_argument('--headless')  # Run in headless mode
    driver = webdriver.Firefox(service=service, options=options)
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait for the page to load
        time.sleep(3)
        
        # Verify we're on the Google page by checking the title
        assert "Google" in driver.title
        
        print("Successfully opened Google!")
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    selenium_test()
'''
        
        # Write the test content to the randomly named file
        with open(random_filename, 'w') as f:
            f.write(test_content)
        
        print(f"Test saved to {random_filename}")
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    selenium_test()