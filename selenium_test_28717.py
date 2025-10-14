from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import time

# Optional: Specify the path to your ChromeDriver if it's not in PATH
# service = Service('/path/to/chromedriver')
# driver = webdriver.Chrome(service=service)

# Initialize the Chrome driver
driver = webdriver.Chrome()

try:
    # Open Google
    driver.get("https://www.google.com")

    # Wait for a few seconds to see the page load
    time.sleep(5)

    # Print the title of the page
    print("Page title:", driver.title)

finally:
    # Close the browser
    driver.quit()