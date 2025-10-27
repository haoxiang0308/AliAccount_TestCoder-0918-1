from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
import random
import string
import time


def create_selenium_test():
    """Create a Selenium test that opens Google."""
    # Set up Chrome options for headless mode to work in container environments
    chrome_options = Options()
    chrome_options.add_argument("--headless")  # Run in headless mode
    chrome_options.add_argument("--no-sandbox")  # Bypass OS security model
    chrome_options.add_argument("--disable-dev-shm-usage")  # Overcome limited resource problems
    chrome_options.add_argument("--disable-gpu")  # Applicable to Windows OS only
    chrome_options.add_argument("--remote-debugging-port=9222")  # This is important for container environments
    
    # Set up the Chrome driver
    service = Service(ChromeDriverManager().install())
    driver = webdriver.Chrome(service=service, options=chrome_options)
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Verify we're on the Google page by checking the title
        assert "Google" in driver.title
        print("Successfully opened Google and verified the page title.")
        
        # Wait a bit to see the page
        time.sleep(2)
        
        # Find the search box to confirm the page loaded properly
        search_box = driver.find_element(By.NAME, "q")
        print(f"Found Google search box: {search_box.tag_name}")
        
    except Exception as e:
        print(f"Error during test execution: {e}")
    finally:
        # Close the browser
        driver.quit()


def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"


if __name__ == "__main__":
    # Run the Selenium test
    create_selenium_test()
    
    # Generate the content for the randomly named file
    script_content = '''from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
import random
import string
import time


def create_selenium_test():
    """Create a Selenium test that opens Google."""
    # Set up Chrome options for headless mode to work in container environments
    chrome_options = Options()
    chrome_options.add_argument("--headless")  # Run in headless mode
    chrome_options.add_argument("--no-sandbox")  # Bypass OS security model
    chrome_options.add_argument("--disable-dev-shm-usage")  # Overcome limited resource problems
    chrome_options.add_argument("--disable-gpu")  # Applicable to Windows OS only
    chrome_options.add_argument("--remote-debugging-port=9222")  # This is important for container environments
    
    # Set up the Chrome driver
    service = Service(ChromeDriverManager().install())
    driver = webdriver.Chrome(service=service, options=chrome_options)
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Verify we're on the Google page by checking the title
        assert "Google" in driver.title
        print("Successfully opened Google and verified the page title.")
        
        # Wait a bit to see the page
        time.sleep(2)
        
        # Find the search box to confirm the page loaded properly
        search_box = driver.find_element(By.NAME, "q")
        print(f"Found Google search box: {search_box.tag_name}")
        
    except Exception as e:
        print(f"Error during test execution: {e}")
    finally:
        # Close the browser
        driver.quit()


if __name__ == "__main__":
    create_selenium_test()
'''
    
    # Generate a random filename and save this script to it
    random_filename = generate_random_filename()
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to randomly named file: {random_filename}")