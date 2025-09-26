from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import time
import random
import string

# Optional: Specify the path to your ChromeDriver if it's not in PATH
# service = Service('/path/to/chromedriver')
# driver = webdriver.Chrome(service=service)

# Initialize the Chrome driver (assuming ChromeDriver is in PATH)
driver = webdriver.Chrome()

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
    # This is a self-replicating step. In a real scenario, you might save a different script.
    with open(random_filename, 'w') as f:
        f.write('''from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import time
import random
import string

# Optional: Specify the path to your ChromeDriver if it's not in PATH
# service = Service('/path/to/chromedriver')
# driver = webdriver.Chrome(service=service)

# Initialize the Chrome driver (assuming ChromeDriver is in PATH)
driver = webdriver.Chrome()

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
''')

finally:
    # Close the browser
    driver.quit()
