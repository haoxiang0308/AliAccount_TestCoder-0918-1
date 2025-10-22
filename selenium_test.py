import random
import string
from selenium import webdriver
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.firefox.service import Service
import geckodriver_autoinstaller

def create_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def selenium_test():
    # Set up Firefox options
    firefox_options = Options()
    firefox_options.add_argument("--headless")  # Run in headless mode for testing
    
    # Install and set up geckodriver
    geckodriver_autoinstaller.install()
    service = Service()
    driver = webdriver.Firefox(service=service, options=firefox_options)
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Verify that the page loaded
        assert "Google" in driver.title
        
        print("Successfully opened Google.com")
        
        # Create a random filename
        random_filename = create_random_filename()
        
        # Create a simple test script content
        test_content = '''# Selenium Test Script
from selenium import webdriver
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.firefox.service import Service
import geckodriver_autoinstaller

def test_open_google():
    firefox_options = Options()
    firefox_options.add_argument("--headless")
    
    geckodriver_autoinstaller.install()
    service = Service()
    driver = webdriver.Firefox(service=service, options=firefox_options)
    try:
        driver.get("https://www.google.com")
        assert "Google" in driver.title
        print("Successfully opened Google.com in randomly named file: """ + random_filename + """")
    finally:
        driver.quit()

if __name__ == "__main__":
    test_open_google()
'''
        
        # Write the content to the randomly named file
        with open(random_filename, 'w') as f:
            f.write(test_content)
        
        print(f"Selenium test saved to randomly named file: {random_filename}")
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    selenium_test()