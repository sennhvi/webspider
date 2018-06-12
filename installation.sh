#!/bin/bash
# 1. installation of request library
# requests. blocking io http request library.
sudo pip3 install requests
# automated testing tool.
sudo pip3 install selenium
# use geckodriver to corporate firefox,omitted
# use chromedriver to corporate selenium.
# find corresponding version in https://sites.google.com/a/chromium.org/chromedriver/downloads and download
# to verify installation, you need to run chromedriver first then python
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
# ---

# 2. installation of parser library
# lxml module. support for parsing html/xml and support XPath parsing method.
sudo pip3 install lxml
# Beautiful Soup module. support for parsing html/xml
sudo pip3 install beautifulsoup4
# pyquery module. support for parsing html in jQuery way and CSS selector
sudo pip3 install pyquery
# tesserocr module for recognising captcha,we need to install tesseract as its basis firstly
# https://github.com/tesseract-ocr/tesseract
sudo apt-get install -y tesseract-ocr libtesseract-dev libleptonica-dev
sudo pip3 install tesserocr pillow
# test installation in cli: result as output txt file, -l specify language package
# $ tesseract test.png result -l eng && cat result.txt
# test installation in python:
# import tesserocr
# from PIL import Image
# image = Image.open('image.png')
# print(tesserocr.image_to_text(image))
# ---

# 3. installation of database library


# 4. installation of storage library


# 5. installation of web library


# 6. installation of app crawler library


# 7. installation of crawler framework


# 8. installation of deployment library
