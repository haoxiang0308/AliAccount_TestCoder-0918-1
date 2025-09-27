import random
import string

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Define the content of the Selenium script as a string
selenium_script_content = '''from selenium import webdriver
from selenium.webdriver.common.by import By
import time

# Initialize the Chrome driver
# Note: This script requires ChromeDriver and Chrome browser to run.
# It is saved here as an example.
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
'''

# Save the Selenium script content to the randomly named file
with open(random_filename, 'w') as f:
    f.write(selenium_script_content)

print(f"Selenium test script saved as {random_filename}")

# Save this script to the randomly named file
with open(random_filename, 'w') as f:
    f.write('# Selenium Test Script\n')
    f.write('# This script opens Google and interacts with the search box\n\n')
    f.write('from selenium import webdriver\n')
    f.write('from selenium.webdriver.common.by import By\n')
    f.write('import time\n')
    f.write('import random\n')
    f.write('import string\n\n')
    f.write('# Generate a random filename\n')
    f.write('random_filename = \'\'.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + \'.py\'\n\n')
    f.write('# Initialize the Chrome driver\n')
    f.write('driver = webdriver.Chrome()\n\n')
    f.write('try:\n')
    f.write('    # Open Google\n')
    f.write('    driver.get("https://www.google.com")\n\n')
    f.write('    # Wait for a few seconds to see the page\n')
    f.write('    time.sleep(3)\n\n')
    f.write('    # Example interaction: Find the search box by its name attribute\n')
    f.write('    search_box = driver.find_element(By.NAME, \'q\')\n\n')
    f.write('    # Print the title of the page\n')
    f.write('    print(f"Page title is: {driver.title}")\n\n')
    f.write('    # Optionally, interact with the page (e.g., type in the search box)\n')
    f.write('    # search_box.send_keys("Selenium test")\n\n')
    f.write('finally:\n')
    f.write('    # Close the browser\n')
    f.write('    driver.quit()\n')

print(f"Test script saved as {random_filename}")