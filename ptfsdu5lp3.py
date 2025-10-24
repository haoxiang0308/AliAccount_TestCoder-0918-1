import time
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
