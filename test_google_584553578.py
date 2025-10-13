from selenium import webdriver
from selenium.webdriver.common.by import By
import time

# Initialize the Chrome WebDriver
driver = webdriver.Chrome()

try:
    # Open Google
    driver.get("https://www.google.com")

    # Optional: Wait a bit to see the page load
    time.sleep(2)

    print("Successfully opened Google.")

finally:
    # Close the browser
    driver.quit()
