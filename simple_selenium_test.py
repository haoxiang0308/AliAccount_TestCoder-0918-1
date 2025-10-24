import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def main():
    # Generate a random filename
    random_filename = generate_random_filename()
    print(f"Saving Selenium test to: {random_filename}")
    
    # Content of a basic Selenium test
    selenium_test_content = '''import time
from selenium import webdriver
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.common.by import By

def test_open_google():
    # Set up Firefox options
    firefox_options = Options()
    firefox_options.add_argument("--headless")  # Run in headless mode (no GUI)
    
    # Initialize the Firefox driver
    driver = webdriver.Firefox(options=firefox_options)
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait for page to load
        time.sleep(2)
        
        # Verify we're on Google
        assert "Google" in driver.title
        print("Successfully opened Google!")
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    test_open_google()
'''
    
    # Write the Selenium test content to the randomly named file
    with open(random_filename, 'w') as output_file:
        output_file.write(selenium_test_content)
    
    print(f"Selenium test saved to {random_filename}")

if __name__ == "__main__":
    main()