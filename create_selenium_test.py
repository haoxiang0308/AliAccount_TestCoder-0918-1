import random
import string
import os

def create_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

# Create the selenium test code as a string
test_code = '''from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service
import time

# Set up Chrome options
chrome_options = Options()
chrome_options.add_argument("--headless")  # Run in headless mode for testing
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")

# Setup Chrome driver with webdriver-manager
service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service, options=chrome_options)

try:
    # Open Google
    driver.get("https://www.google.com")
    
    # Wait a bit to ensure the page loads
    time.sleep(2)
    
    # Verify we're on the Google page
    assert "Google" in driver.title
    
    print("Successfully opened Google!")
    print(f"Page title: {driver.title}")
    
finally:
    # Close the browser
    driver.quit()
'''

# Generate a random filename
random_filename = create_random_filename()

# Write the test code to the randomly named file
with open(random_filename, 'w') as f:
    f.write(test_code)

print(f"Selenium test saved to: {random_filename}")