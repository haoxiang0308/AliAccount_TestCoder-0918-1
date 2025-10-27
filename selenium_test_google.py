import unittest
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import random
import string
import os


class GoogleTest(unittest.TestCase):
    def setUp(self):
        """Set up the Chrome driver with automatic driver management."""
        service = Service(ChromeDriverManager().install())
        self.driver = webdriver.Chrome(service=service)
        self.driver.implicitly_wait(10)

    def test_open_google(self):
        """Test that opens Google and verifies the title."""
        driver = self.driver
        driver.get("https://www.google.com")
        
        # Verify we're on the Google page by checking the title
        self.assertIn("Google", driver.title)
        print("Successfully opened Google and verified the page title.")
        
        # Wait a bit to see the page
        driver.implicitly_wait(3)

    def tearDown(self):
        """Close the browser after the test."""
        self.driver.quit()


def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"


if __name__ == "__main__":
    # Run the test
    unittest.main()
    
    # Generate a random filename and save this script to it
    random_filename = generate_random_filename()
    script_content = '''import unittest
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager


class GoogleTest(unittest.TestCase):
    def setUp(self):
        """Set up the Chrome driver with automatic driver management."""
        service = Service(ChromeDriverManager().install())
        self.driver = webdriver.Chrome(service=service)
        self.driver.implicitly_wait(10)

    def test_open_google(self):
        """Test that opens Google and verifies the title."""
        driver = self.driver
        driver.get("https://www.google.com")
        
        # Verify we're on the Google page by checking the title
        self.assertIn("Google", driver.title)
        print("Successfully opened Google and verified the page title.")
        
        # Wait a bit to see the page
        driver.implicitly_wait(3)

    def tearDown(self):
        """Close the browser after the test."""
        self.driver.quit()


if __name__ == "__main__":
    unittest.main()
'''
    
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to randomly named file: {random_filename}")