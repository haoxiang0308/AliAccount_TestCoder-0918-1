from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time
import random
import string

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Setup the ChromeDriver using webdriver_manager
service = Service(ChromeDriverManager().install())

# Optional: Add options for headless mode if needed in an environment without a GUI
# from selenium.webdriver.chrome.options import Options
# chrome_options = Options()
# chrome_options.add_argument("--headless")
# driver = webdriver.Chrome(service=service, options=chrome_options)

driver = webdriver.Chrome(service=service)

try:
    # Open Google
    driver.get("https://www.google.com")

    # Wait for the page to load
    time.sleep(2)

    # Get the page title as an example of interaction
    page_title = driver.title
    print(f"Page title: {page_title}")

    # Write a simple script that opens Google to the random file
    with open(random_filename, 'w') as f:
        f.write(f'''# This script opens Google
from selenium import webdriver
driver = webdriver.Chrome()
driver.get("https://www.google.com")
# Remember to call driver.quit() when done
''')

    print(f"Selenium script saved to {random_filename}")

finally:
    # Close the browser
    driver.quit()
