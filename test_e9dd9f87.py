from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.common.by import By
from webdriver_manager.firefox import GeckoDriverManager
import time

def test_open_google():
    # Set up the Firefox driver
    options = webdriver.FirefoxOptions()
    options.add_argument('--headless')  # Run in background
    
    service = Service(GeckoDriverManager().install())
    driver = webdriver.Firefox(service=service, options=options)
    
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