# Selenium Test Script
from selenium import webdriver
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.firefox.service import Service
import geckodriver_autoinstaller

def test_open_google():
    firefox_options = Options()
    firefox_options.add_argument("--headless")
    
    geckodriver_autoinstaller.install()
    service = Service()
    driver = webdriver.Firefox(service=service, options=firefox_options)
    try:
        driver.get("https://www.google.com")
        assert "Google" in driver.title
        print("Successfully opened Google.com")
    finally:
        driver.quit()

if __name__ == "__main__":
    test_open_google()
