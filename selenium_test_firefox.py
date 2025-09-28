import random
import string
from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.firefox.options import Options
from webdriver_manager.firefox import GeckoDriverManager

# Set up Firefox options
firefox_options = Options()
firefox_options.add_argument("--headless")  # Run in headless mode

# Initialize the Firefox driver
service = Service(GeckoDriverManager().install())
driver = webdriver.Firefox(service=service, options=firefox_options)

try:
    # Open Google
    driver.get("https://www.google.com")

    # Wait for a few seconds to see the page
    driver.implicitly_wait(5)

    # Generate a random filename
    random_filename = "selenium_test_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + ".py"

    # Save a simple version of the test script as a new file with the random name
    with open(random_filename, 'w') as f:
        f.write('''from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.firefox.options import Options
from webdriver_manager.firefox import GeckoDriverManager

firefox_options = Options()
firefox_options.add_argument("--headless")
service = Service(GeckoDriverManager().install())
driver = webdriver.Firefox(service=service, options=firefox_options)

driver.get("https://www.google.com")
driver.implicitly_wait(5)
driver.quit()
''')

    print(f"Test script saved as {random_filename}")

finally:
    # Close the browser
    driver.quit()
