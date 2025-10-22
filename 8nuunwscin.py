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
        
        # Verify that we're on the Google page by checking the title
        assert "Google" in driver.title
        
        print("Successfully opened Google and verified the page title")
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    test_open_google()