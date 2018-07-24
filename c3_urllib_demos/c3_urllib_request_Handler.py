# HTTPDefaultErrorHandler
# HTTPRedirectHandler
# HTTPCookieProcessor
# ProxyHandler
# HTTPPasswordMgr
# HTTPBasicAuthHandler


# Authorization
from urllib.request import HTTPPasswordMgrWithDefaultRealm, HTTPBasicAuthHandler, build_opener
from urllib.error import URLError
# Proxy
from urllib.request import ProxyHandler, build_opener
# Cookies
import http.cookiejar
from urllib.request import HTTPCookieProcessor

"""Authorization Sample"""
username = 'username'
password = 'password'
url = 'http://localhost:5000'

p = HTTPPasswordMgrWithDefaultRealm()
p.add_password(None, url, username, password)
auth_handler = HTTPBasicAuthHandler(p)
opener = build_opener(auth_handler)

try:
    result = opener.open(url)
    html = result.read().decode('utf-8')
    print(html)
except URLError as e:
    print(e.reason)

"""ProxyHandler Sample"""
proxy_handler = ProxyHandler(
    {
        'http': 'http://127.0.0.1:9743',
        'https': 'https://127.0.0.1:9743'
    }
)
opener = build_opener(proxy_handler)
try:
    response = opener.open('https://www.baidu.com')
    print(response.read().decode('utf-8'))
except URLError as e:
    print(e.reason)

"""Cookie Sample: access cookie, save cookie"""
cookie = http.cookiejar.CookieJar()
handler = HTTPCookieProcessor(cookie)
opener = build_opener(handler)
response = opener.open('http://www.baidu.com')
for item in cookie:
    print(item.name + "=" + item.value)

# dump to file
filename = 'cookies.txt'
cookie = http.cookiejar.MozillaCookieJar(filename)  # http.cookiejar.LWPCookieJar(filename), in different format
handler = HTTPCookieProcessor(cookie)
opener = build_opener(handler)
response = opener.open('http://www.baidu.com')
cookie.save(ignore_discard=True, ignore_expires=True)

# load from file
cookie = http.cookiejar.LWPCookieJar()  # dump and load in same format(LWP or Mozilla)
cookie.load('cookies.txt', ignore_discard=True, ignore_expires=True)
handler = HTTPCookieProcessor(cookie)
opener = build_opener(handler)
response = opener.open('http://www.baidu.com')
print(response.read().decode('utf-8'))
