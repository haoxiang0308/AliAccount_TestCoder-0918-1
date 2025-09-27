# Selenium Test Script
# This script opens Google and interacts with the search box

from selenium import webdriver
from selenium.webdriver.common.by import By
import time
import random
import string

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Initialize the Chrome driver
driver = webdriver.Chrome()

try:
    # Open Google
    driver.get("https://www.google.com")

    # Wait for a few seconds to see the page
    time.sleep(3)

    # Example interaction: Find the search box by its name attribute
    search_box = driver.find_element(By.NAME, 'q')

    # Print the title of the page
    print(f"Page title is: {driver.title}")

    # Optionally, interact with the page (e.g., type in the search box)
    # search_box.send_keys("Selenium test")

finally:
    # Close the browser
    driver.quit()
