from selenium import webdriver
from selenium.webdriver.firefox.options import Options

options = Options()
options.headless = True  # Run in headless mode
driver = webdriver.Firefox(options=options, executable_path='/usr/local/bin/geckodriver')
driver.get('http://www.google.com')
print(driver.title)
driver.quit()