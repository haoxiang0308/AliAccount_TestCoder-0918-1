import uuid
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

# Create a random filename
random_filename = f"test_{str(uuid.uuid4())[:8]}.py"

# Selenium test code to open Google
selenium_test_code = '''
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import time

def test_open_google():
    # Set up the Chrome driver
    options = webdriver.ChromeOptions()
    options.add_argument('--headless')  # Run in background
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    
    driver = webdriver.Chrome(options=options)
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait a bit to ensure page loads
        time.sleep(2)
        
        # Verify we're on the Google page by checking the title
        assert "Google" in driver.title
        
        print("Successfully opened Google and verified the page title!")
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    test_open_google()
'''

# Write the test code to the randomly named file
with open(random_filename, 'w') as f:
    f.write(selenium_test_code.strip())

print(f"Selenium test saved to: {random_filename}")