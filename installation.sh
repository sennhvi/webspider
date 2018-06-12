#!/bin/bash
# 1. installation of request library
# requests. blocking io http request library.
sudo pip3 install requests
# automated testing tool.
sudo pip3 install selenium
# use geckodriver to corporate firefox,omitted
# use chromedriver to corporate selenium.
# find corresponding version in https://sites.google.com/a/chromium.org/chromedriver/downloads and download
cd /tmp
wget https://chromedriver.storage.googleapis.com/2.40/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
sudo mv chromedriver /usr/bin/
# WARNING: PhantomJS is deprecated, use headless.
# from selenium import webdriver
# from selenium.webdriver.chrome.options import Options
# chrome_options = Options()
# chrome_options.add_argument('--headless')
# chrome_options.add_argument('--disable-gpu')
# driver = webdriver.Chrome(chrome_options=chrome_options)
# driver.get("https://cnblogs.com/")
# print(driver.current_url)

# aiohttp. asynchronized io http request library.
# cchardet for charset encoding detection, aiodns for accelerating dns parse
sudo pip3 install aiohttp cchardet aiodns

# 2. installation of parser library


# 3. installation of database library


# 4. installation of storage library


# 5. installation of web library


# 6. installation of app crawler library


# 7. installation of crawler framework


# 8. installation of deployment library
