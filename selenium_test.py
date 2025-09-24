from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager
import time
import random
import string

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Set Chrome options for headless operation
from selenium.webdriver.chrome.options import Options
chrome_options = Options()
chrome_options.add_argument("--headless")  # Run in headless mode
chrome_options.add_argument("--no-sandbox") # Bypass OS security model
chrome_options.add_argument("--disable-dev-shm-usage") # Overcome limited resource problems

# Initialize the Chrome driver using webdriver_manager and options
service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service, options=chrome_options)

try:
    # Open Google
    driver.get("https://www.google.com")

    # Wait for the page to load
    time.sleep(2)

    # Get the page title
    title = driver.title
    print(f"Page title is: {title}")

    # Save the current URL and title to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(f"URL: {driver.current_url}\n")
        f.write(f"Title: {title}\n")
    
    print(f"Selenium test completed. Results saved to {random_filename}")

finally:
    # Close the browser
    driver.quit()
