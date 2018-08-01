import requests
import re
import logging
from requests.packages import urllib3
from requests_oauthlib import OAuth1
from requests import Request, Session

# r = requests.get('https://www.baidu.com')
# print(type(r))
# print(r.status_code)
# print(type(r.text))
# print(r.text)
# print(r.cookies)
#
# """GET request"""
# # basic instance
# data = {
#     'name': 'germey',
#     'age': 22
# }
# r = requests.get('http://httpbin.org/get', params=data)
# print(r.text)
# print(r.json())  # output type is str type in json format, use json() method to convert str to dict
# print(type(r.json()))
#
# """crawl source data of website with headers"""
# # re.S = DOTALL = sre_compile.SRE_FLAG_DOTALL # make dot match newline
# headers = {
#     'User-Agent': "Mozilla/5.0 (X11; Linux x86_64)"
#                   " AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36"
# }
# r = requests.get('https://www.zhihu.com/explore', headers=headers)
# pattern = re.compile('explore-feed.*?question_link.*?>(.*?)</a>', re.S)
# titles = re.findall(pattern, r.text)
# print(titles)
#
# """crawl binary data and save to file"""
# r = requests.get('https://github.com/favicon.ico')
# with open('favicon.ico', 'wb') as f:
#     f.write(r.content)
#
# """POST method"""
# data = {'name': 'germey', 'age': 22}
# r = requests.post("http://httpbin.org/post", data=data)
# print(r.text)  # r.status_code, r.headers, r.cookies, r.url, r.history
#
# """decide if request successfully"""
# r = requests.get('http://www.jianshu.com')
# print(r.status_code)
# print("Request Fail") if not r.status_code == requests.codes.ok else print('Request Successfully')
#
# #
# # Advanced Usage
# #
# """upload file"""
# files = {'file': open('favicon.ico', 'rb')}
# r = requests.post("http://httpbin.org/post", files=files)
# print(r.text)
#
# """cookies"""
# # use cookies to simulate login status, add 'Cookie' segment in headers
# # or
# # use requests.cookies.RequestsCookieJar() to create a cookie object, and use set() method to set its attributes
# r = requests.get("https://www.baidu.com")
# print(r.cookies)  # get cookie attributes
# for key, value in r.cookies.items():
#     print(key + '=' + value)
#
# """maintain session"""
# # wrong demo
# requests.get('http://httpbin.org/cookies/set/number/123456789')
# r = requests.get('http://httpbin.org/cookies')
# print(r.text)  # {"cookies": {}} no cookies received
# # right demo
# s = requests.Session()
# s.get('http://httpbin.org/cookies/set/number/123456789')
# r = s.get('http://httpbin.org/cookies')
# print(r.text)
#
# """SSL certificate authentication"""
# # fail to validate certificate
# response = requests.get('https://www.12306.cn', verify=False)
# print(response.status_code)
#
# # ignore waring
# urllib3.disable_warnings()  # logging.captureWarnings(True)
# response = requests.get('https://www.12306.cn', verify=False)
# print(response.status_code)
#
# # use certificate
# response = requests.get('https://www.12306.cn', cert=('/path/server.crt', '/path/key'))
# print(response.status_code)
#
# """Proxy Setting"""
# # demo
# proxies = {
#     'http': 'http...',
#     'https': 'https...'
# }
# # use HTTP Basic Auth
# proxies = {
#     'http': 'http://user:password@...',
#     'https': '...'
# }
# # use socks
# # pip3 install requests[socks]
# proxies = {
#     'http': 'socks5://user:password@...',
#     'https': 'socks5://...'
# }
# requests.get("https://www.taobao.com", proxies=proxies)
#
# """Timeout Setting"""
# r = requests.get("https://www.baidu.com", timeout=1)  # timeout compares with sum of connection time and read time
# print(r.status_code)
# r = requests.get("https://www.baidu.com", timeout=(5.11, 30))  # timeout
#
# """id authentication"""
# # for HTTPBasicAuth
# r = requests.get("http://localhost:5000", auth=('username', 'password'))
# print(r.status_code)
#
# """OAuth authentication"""
# # pip3 install requests_oauthlib
# url = 'https://api.twitter.com/1.1/account/...'
# auth = OAuth1('YOUR_APP_KEY', 'YOUR_APP_SECRET', 'USER_OAUTH_TOKEN', "USER_OAUTH_TOKEN_SECRET")
# requests.get(url, auth=auth)

"""Prepared Request"""
# construct a request data structure, regarded as a individual object convenient for queue scheduling
url = 'http://httpbin.org/post'
data = {
    'name': 'germey'
}
headers = {
    'User-Agent': "Mozilla/5.0 (X11; Linux x86_64)"
                  " AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36"
}
s = Session()
req = Request('POST', url, data=data, headers=headers)
prepped = s.prepare_request(req)
r = s.send(prepped)
print(r.text)
