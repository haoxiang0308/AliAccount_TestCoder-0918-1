from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import time

# Set up Chrome options
chrome_options = Options()
chrome_options.add_argument("--headless")  # Run in headless mode for testing
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")

# Initialize the driver
driver = webdriver.Chrome(options=chrome_options)

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
