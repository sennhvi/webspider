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
echo '-----------'


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
echo '-----------'


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
echo '-----------'


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
echo '-----------'


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
echo '-----------'


# 6. installation of app crawler library
# sniffer tools: Charles, mitmproxy, mitmdump, Appium
# TBD
echo '-----------'


# 7. installation of crawler framework
# before installing pyspider, you need to install phantomJS
sudo pip3 install pyspider
# verification
pyspider all

# scrapy framework: dependencies-twisted,lxml,pyopenssl
sudo pip3 install pyopenssl
sudo pip3 install twisted
sudo apt-get install -y build-essential python3-dev libssl-dev libffi-dev libxml2 libxml2-dev libxslt1-dev zlib1g-dev
sudo pip3 install scrapy

# scrapy-splash support js render, you need to install docker first, then python module
sudo pip3 install scrapy-splash

# scrapy-redis
sudo pip3 install scrapy-redis
echo '-----------'


# 8. installation of deployment library

# docker
# check http://splash.readthedocs.io/en/latest/install.html for more information about installing docker
cd ~/Downloads/software/
sudo apt-get install -y docker
sudo apt install -y docker.io
# for better speed, use:  curl --sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet | sh -
# pull image and test, all pulled images can be found in /var/lib/docker/image/aufs/repositories.json
sudo docker pull scrapinghub/splash
# verification:
# $ sudo docker run -p 8050:8050 scrapinghub/splash

# scrapyd, a tool to deploy and run scrapy project
sudo pip3 install scrapyd
sudo mkdir /etc/scrapyd # and vim /etc/scrapyd/scrapyd.conf
# refer to http://scrapyd.readthedocs.io/en/latest/config.html for configuration file details
# and change max_proc_per_cpu = 4 to 10, bind_address = 127.0.0.1 to 0.0.0.0
# to run scrapyd in daemon: (use supervisor for better experience)
# $ scrapyd > /dev/null & or $ scrapyd > ~/log/scrapyd/scrapyd.log &

# nginx
sudo apt-get install nginx
# modify nginx configuration file:
# add text below to nginx.conf file in http section
#    server {
#           listen 6801;
#           location / {
#               proxy_pass      http://127.0.0.1:6800/;
#               auth_basic      "Restricted";
#               auth_basic_user_file    /etc/nginx/conf.d/.htpasswd;
#           }
#   }
# to use htpasswd to generate id and password, you need to install apache2-utils:
sudo apt install apache2-utils
cd /etc/nginx/conf.d/
sudo htpasswd -c .htpasswd admin # create a file .htpasswd in working directory and admin as user name
# then you can restart nginx service by typing:
sudo nginx -s reload
# verification:
# go to website localhost:6801 and input your username and password, then nginx site shows,
# which means we can use reverse proxy in nginx to enable access authentication
# once scrapyd runs, go to localhost:6801, it leads to scrapyd homepage rather than nginx homepage

# scrapyd-client, a tool to help deploying scrapy code to remote scrapyd(pack code to egg file and upload it)
sudo pip3 install scrapyd-client
# use scrapyd-deploy to verify installation
# $ scrapyd-deploy -h

# after installing scrapyd, we can use api to access status of all scrapy tasks when scrapyd runs
# $ sudo curl http://localhost:6800/listproject.json
# scrapyd-api, a tool for easy access to status of all scrapy jobs
sudo pip3 install python-scrapyd-api
# verify installation, make sure scrapyd is running
# from scrapyd_api import ScrapydAPI
# scrapyd = ScrapydAPI('http://localhost:6800')
# print(scrapyd.list_projects())

# scrapyrt, a tool to schedule http interface for scrapy, we can request a http interface to schedule scrapy jobs
# rather than run scrapy commands. It's suggested to be used in non-distributed jobs for its lightweight.
sudo pip3 install scrapyrt
# you can verify installation by running $ scrapyrt in any scrapy project and it starts a http service in port 9080
# install using docker
# docker run -p 9080:9080 -tid -v /home/sennhvi/scrapy_project:/scrapyrt/project scrapinghub/scrapyrt

# gerapy module, a distributed management module, verify installation by import it
sudo pip3 install gerapy
