import urllib.parse
import urllib.request

# urlopen API:
# urlopen(url, data=None, timeout=socket._GLOBAL_DEFAULT_TIMEOUT,
#             *, cafile=None, capath=None, cadefault=False, context=None):
response = urllib.request.urlopen('http://www.python.org')
print(type(response))  # <class 'http.client.HTTPResponse'> object
print(response.status)
print(response.getheaders())
print(response.getheader('Server'))
print(response.read().decode('utf-8'))  # crawl source code of python homepage and print

# args:
# data: if its type is bytes stream, you will need bytes() method, then it becomes POST method
data = bytes(urllib.parse.urlencode({'word':'hello'}), encoding='utf8')
response = urllib.request.urlopen('http://httpbin.org/post', data=data)
print(response.read())
