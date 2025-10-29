from selenium import webdriver
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
