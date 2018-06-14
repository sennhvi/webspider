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
sudo apt-get update
sudo apt-get install -y mysql-server mysql-client

# mongodb https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
sudo apt-get update
sudo apt-get install -y mongodb-org
# start mongodb
sudo service mongod start
# verify its status
cat /var/log/mongodb/mongod.log
# stop mongodb
sudo service mongod stop
# restart mongodb
sudo service mongod restart
# use mongodb shell, use ctrl+c to quit
mongo --host 127.0.0.1:27017
# then:
# > use admin
# > db.createUser({user:'admin', pwd:'admin123', roles:[{role:'root', db:'admin'}]})
# modify mongodb configuration file in /etc/mongod.conf
# net:
#   port: 27017
#   bindIp: 0.0.0.0
# security:
#   authorization: enabled
# then restart mongodb service
# $ sudo service mongod restart
# download robo 3T for visualization in https://robomongo.org/download

# redis, based on memory, effective non-relational db
sudo apt-get install -y redis-server
# verify installation
# $ redis-cli
# > set 'name' 'sennhvi'
# > get 'name'
# modify redis configuration file in /etc/redis/redis.conf
# comment bind 127.0.0.1 to disable it
# uncomment requirepass foobared and modify it to requirepass YOURPASSWORD
# then restart redis
# $ sudo /etc/init.d/redis-server restart


# 4. installation of storage library
# pymysql
sudo pip3 install pymysql
# pymongo
sudo pip3 install pymongo
# redis-py
sudo pip3 install redis
# redisdump based on ruby
sudo apt-get install -y ruby-full
sudo gem install redis-dump
# verify installation redis-dump / redis-load


# 5. installation of web library
sudo pip3 install flask
# verify installation:
# from flask import Flask
# app = Flask(__name__)
# @app.route("/")
# def hello():
#     return "Hello World"
# if __name__ == "__main__":
#     app.run()


# 6. installation of app crawler library


# 7. installation of crawler framework


# 8. installation of deployment library
