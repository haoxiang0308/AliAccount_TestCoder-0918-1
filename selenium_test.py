from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.firefox.service import Service
import random
import string
import os

def create_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def selenium_test():
    # Set up Firefox options (using headless mode for environments without display)
    options = Options()
    options.add_argument("--headless")  # Run in headless mode
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")
    
    # Initialize the driver
    service = Service("/usr/local/bin/geckodriver")
    driver = webdriver.Firefox(service=service, options=options)
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait for the page to load
        driver.implicitly_wait(10)
        
        # Verify we're on the Google page
        assert "Google" in driver.title
        
        print("Successfully opened Google!")
        
        # Save this test code to a randomly named .py file
        random_filename = create_random_filename()
        
        # Get the current script's content
        script_content = '''from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.firefox.service import Service
import random
import string
import os

def selenium_test():
    # Set up Firefox options (using headless mode for environments without display)
    options = Options()
    options.add_argument("--headless")  # Run in headless mode
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")
    
    # Initialize the driver
    service = Service("/usr/local/bin/geckodriver")
    driver = webdriver.Firefox(service=service, options=options)
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait for the page to load
        driver.implicitly_wait(10)
        
        # Verify we're on the Google page
        assert "Google" in driver.title
        
        print("Successfully opened Google!")
        
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    selenium_test()
'''
        
        # Write the content to the randomly named file
        with open(random_filename, 'w') as f:
            f.write(script_content)
        
        print(f"Test saved to {random_filename}")
        
    except Exception as e:
        print(f"An error occurred: {e}")
    
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    selenium_test()