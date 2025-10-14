import random
import string
from selenium import webdriver
from selenium.webdriver.chrome.service import Service

def generate_random_filename():
    """Generates a random filename with a .py extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def create_selenium_test(filename):
    """Creates a Python file with a basic Selenium test."""
    test_code = '''from selenium import webdriver
from selenium.webdriver.common.by import By
import time

driver = webdriver.Chrome()
try:
    driver.get("https://www.google.com")
    print(f"Page title is: {driver.title}")
    time.sleep(2)  # Let the user actually see something!
finally:
    driver.quit()
'''
    with open(filename, 'w') as f:
        f.write(test_code)
    print(f"Selenium test script created: {filename}")

if __name__ == "__main__":
    random_filename = generate_random_filename()
    create_selenium_test(random_filename)
