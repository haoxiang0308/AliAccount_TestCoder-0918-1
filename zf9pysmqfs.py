from selenium import webdriver
from selenium.webdriver.common.by import By
import time

driver = webdriver.Chrome()
try:
    driver.get("https://www.google.com")
    print(f"Page title is: {driver.title}")
    time.sleep(2)  # Let the user actually see something!
finally:
    driver.quit()
