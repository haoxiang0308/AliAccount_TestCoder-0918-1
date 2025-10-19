import random
import string
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import time

def run_selenium_test():
    # Set up Chrome options
    chrome_options = Options()
    chrome_options.add_argument("--headless")  # Run in headless mode for server environments
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")
    
    # Initialize the Chrome driver
    driver = webdriver.Chrome(options=chrome_options)
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait for page to load
        time.sleep(2)
        
        # Verify we're on the Google page
        assert "Google" in driver.title
        
        print("Successfully opened Google and verified the page title.")
        
    except Exception as e:
        print(f"An error occurred: {e}")
        
    finally:
        # Close the browser
        driver.quit()

# Generate a random filename
def generate_random_filename():
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

# Save this script to a randomly named file
import os

# Content of the Selenium test
selenium_script_content = '''import random
import string
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import time

def run_selenium_test():
    # Set up Chrome options
    chrome_options = Options()
    chrome_options.add_argument("--headless")  # Run in headless mode for server environments
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")
    
    # Initialize the Chrome driver
    driver = webdriver.Chrome(options=chrome_options)
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait for page to load
        time.sleep(2)
        
        # Verify we're on the Google page
        assert "Google" in driver.title
        
        print("Successfully opened Google and verified the page title.")
        
    except Exception as e:
        print(f"An error occurred: {e}")
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    run_selenium_test()
'''

# Generate random filename and save the script
random_filename = generate_random_filename()
with open(random_filename, 'w') as f:
    f.write(selenium_script_content)

print(f"Selenium test saved to: {random_filename}")

if __name__ == "__main__":
    run_selenium_test()