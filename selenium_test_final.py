from selenium import webdriver
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
