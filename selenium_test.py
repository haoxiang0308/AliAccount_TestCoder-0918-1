import random
import string
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager

# Initialize the Chrome driver
from selenium.webdriver.chrome.options import Options
chrome_options = Options()
chrome_options.add_argument("--headless")  # Run in headless mode
chrome_options.add_argument("--no-sandbox") # Bypass OS security model
chrome_options.add_argument("--disable-dev-shm-usage") # Overcome limited resource problems
service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service, options=chrome_options)

try:
    # Open Google
    driver.get("https://www.google.com")

    # Wait for a few seconds to see the page
    driver.implicitly_wait(5)

    # Generate a random filename
    random_filename = "selenium_test_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + ".py"

    # Save the current script as a new file with the random name
    with open(random_filename, 'w') as f:
        f.write('''from selenium import webdriver

driver = webdriver.Chrome()
driver.get("https://www.google.com")
driver.implicitly_wait(5)
driver.quit()
''')

    print(f"Test script saved as {random_filename}")

finally:
    # Close the browser
    driver.quit()
