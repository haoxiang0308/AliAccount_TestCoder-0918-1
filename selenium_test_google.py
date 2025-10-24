import random
import string
from selenium import webdriver
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.firefox.service import Service
import geckodriver_autoinstaller
import time

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def main():
    try:
        # Set up Firefox options
        firefox_options = Options()
        firefox_options.add_argument("--headless")  # Run in headless mode (no GUI)
        
        # Install and set up the Firefox driver
        geckodriver_autoinstaller.install()
        service = Service()
        driver = webdriver.Firefox(service=service, options=firefox_options)
        
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait for page to load
        time.sleep(2)
        
        # Verify we're on Google
        assert "Google" in driver.title
        
        print("Successfully opened Google!")
        
    except Exception as e:
        print(f"Error occurred: {e}")
        # Continue with saving the file even if there's an issue with the browser
        pass
    finally:
        try:
            driver.quit()
        except:
            pass  # Ignore errors when quitting if driver wasn't initialized properly
    
    # Generate a random filename
    random_filename = generate_random_filename()
    print(f"Saving this test to: {random_filename}")
    
    # Get the current script content and save to random filename
    with open(__file__, 'r') as source_file:
        content = source_file.read()
    
    with open(random_filename, 'w') as output_file:
        output_file.write(content)
    
    print(f"Test saved to {random_filename}")

if __name__ == "__main__":
    main()