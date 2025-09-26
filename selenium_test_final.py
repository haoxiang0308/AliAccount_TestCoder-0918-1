from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
import time
import random
import string

# Configure Chrome options for headless operation, which is more likely to succeed in server environments
chrome_options = Options()
chrome_options.add_argument("--headless")
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")
chrome_options.add_argument("--disable-gpu")
chrome_options.add_argument("--remote-debugging-port=9222")

# Initialize the Chrome driver with options
# This assumes ChromeDriver is available in PATH or handled by selenium-manager
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

# Generate a random filename
random_filename = "selenium_test_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".py"

# Save this script to the random filename
# The source code of the current script is captured here as a string
current_script_source = '''from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
import time
import random
import string

# Configure Chrome options for headless operation, which is more likely to succeed in server environments
chrome_options = Options()
chrome_options.add_argument("--headless")
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")
chrome_options.add_argument("--disable-gpu")
chrome_options.add_argument("--remote-debugging-port=9222")

# Initialize the Chrome driver with options
# This assumes ChromeDriver is available in PATH or handled by selenium-manager
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

# Generate a random filename
random_filename = "selenium_test_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".py"

# Save this script to the random filename
# The source code of the current script is captured here as a string
current_script_source = \"\"\"<CURRENT_SCRIPT_CONTENT_PLACEHOLDER>\"\"\"

with open(random_filename, 'w') as f:
    f.write(current_script_source)

print(f"Script saved successfully as {random_filename}.")

'''
# The actual script content needs to be written here, replacing the placeholder.
# This is a simplified version for demonstration. In a real scenario, you'd use inspect or similar.
final_script_content = current_script_source.replace('\"\"\"<CURRENT_SCRIPT_CONTENT_PLACEHOLDER>\"\"\"', repr(current_script_source))

with open(random_filename, 'w') as f:
    f.write(final_script_content)

print(f"Script saved successfully as {random_filename}.")
