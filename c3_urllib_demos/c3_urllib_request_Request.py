from urllib import request, parse

# Request API:
"""
data: bytes type. use urllib.parse.urlencode() to generate dict data
headers: request headers, use instance.add_header() for manual addition
origin_req_host: origin ip or host name
unverifiable: False as default
method: string for http method
"""
# Request(url, data=None, headers={}, origin_req_host=None, unverifiable=False, method=None)

url = 'http://httpbin.org/post'
headers = {
    'User-Agent': 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)',
    'Host': 'httpbin.org'
}
dict = {
    'name': 'Germey'
}
data = bytes(parse.urlencode(dict), encoding='utf8')
req = request.Request(url=url, data=data, headers=headers, method='POST')
response = request.urlopen(req)
print(response.read().decode('utf-8'))
