from robot.libraries.BuiltIn import BuiltIn
from selenium import webdriver

def setup_libraries():
    BuiltIn().import_library('OperatingSystem')

def setup_webdriver(browser):
    if browser.lower() == 'chrome':
        driver_path = '/usr/local/bin/chromedriver'
        driver = webdriver.Chrome(driver_path)
    else:
        raise ValueError(f'Unsupported browser: {browser}')

    # Register WebDriver instance globally for Robot Framework
    BuiltIn().set_global_variable('${SELENIUM_DRIVER}', driver)
