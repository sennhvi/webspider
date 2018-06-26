import urllib.request

response = urllib.request.urlopen('http://www.python.org')
print(type(response))  # <class 'http.client.HTTPResponse'> object
print(response.status)
print(response.getheaders())
print(response.getheader('Server'))
print(response.read().decode('utf-8'))  # crawl source code of python homepage and print
