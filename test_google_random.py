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
    # Navigate to Google
    driver.get("https://www.google.com")

    # Wait a bit to ensure the page loads
    time.sleep(2)

    # Example assertion to check if the title contains 'Google'
    assert "Google" in driver.title

    print(f"Successfully opened Google. Title: {driver.title}")

finally:
    # Close the browser
    driver.quit()
