from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
import time
import random
import string
import os

# Configure Chrome options
chrome_options = Options()
# Uncomment the next line to run in headless mode, which is often necessary in server environments
# chrome_options.add_argument("--headless")
chrome_options.add_argument("--no-sandbox") # Bypass OS security model
chrome_options.add_argument("--disable-dev-shm-usage") # Overcome limited resource problems
chrome_options.add_argument("--disable-gpu") # Applicable to Windows OS only
chrome_options.add_argument("--remote-debugging-port=9222") # This is another way to bypass issues

# Initialize the Chrome driver with options
# Selenium Manager should handle the driver executable automatically
service = Service() # Use default service, which invokes Selenium Manager
driver = webdriver.Chrome(service=service, options=chrome_options)

try:
    # Open Google
    driver.get("https://www.google.com")
    
    # Add a small delay to ensure the page loads
    time.sleep(2)
    
    # Print title as a simple check
    print(f"Page title is: {driver.title}")

    # Generate a random filename
    random_filename = "selenium_test_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".py"
    print(f"Saving test script as: {random_filename}")

    # Save this script to the random filename
    script_content = '''from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
import time
import random
import string

# Configure Chrome options
chrome_options = Options()
# Uncomment the next line to run in headless mode, which is often necessary in server environments
# chrome_options.add_argument("--headless")
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")
chrome_options.add_argument("--disable-gpu")
chrome_options.add_argument("--remote-debugging-port=9222")

# Initialize the Chrome driver with options
service = Service() # Use default service, which invokes Selenium Manager
driver = webdriver.Chrome(service=service, options=chrome_options)

try:
    # Open Google
    driver.get("https://www.google.com")
    
    # Add a small delay to ensure the page loads
    time.sleep(2)
    
    # Print title as a simple check
    print(f"Page title is: {driver.title}")

finally:
    # Close the browser
    driver.quit()
'''
    with open(random_filename, 'w') as f:
        f.write(script_content)

    print(f"Script saved successfully as {random_filename}.")

finally:
    # Close the browser
    driver.quit()
