from urllib.parse import urlparse, urlunparse, urlsplit, urlunsplit, urljoin, urlencode, parse_qs, parse_qsl, quote, \
    unquote

"""1. urlparse()"""
# urllib.parse.urlparse(urlstring, scheme='', allow_fragments=True)
# scheme://netloc/path;params?query#fragment
# scheme only works when no scheme specified in URL
# allow_fragments set to False causes it parsed as part of path/para/query
result = urlparse('https://www.baidu.com/index.html;user?id=5#comment')
print(type(result), result)

"""2. urlunparse()"""
# construct url
# argument length must be 6
data = ['http', 'www.baidu.com', 'index.html', 'user', 'a=6', 'comment']
print(urlunparse(data))

"""3. urlsplit()"""
# return tuple/SplitResult object
result = urlsplit('http://www.baidu.com/index.html;user?id=5#comment')
print(result, result.scheme, result[0], sep='\n')

"""4. urlunsplit()"""
# construct url
# argument length must be 5
data = ['http', 'www.baidu.com', 'index.html', 'a=6', 'comment']
print(urlunsplit(data))

"""5. urljoin()"""
# construct url using base_url and target_url
# base_url only provides: scheme, netloc, path as reference
print(urljoin('http://www.baidu.com', 'FAQ.html'))
print(urljoin('http://www.baidu.com/about.html', 'https://sb.com/FAQ.html'))
print(urljoin('http://www.baidu.com?wd=abc', 'https://sb.com/FAQ.html?question=2'))
print(urljoin('http://www.baidu.com', '?category=2#comment'))
print(urljoin('http://www.baidu.com#comment', '?category=2'))

"""6. urlencode()"""
# construct request args of GET method
params = {
    'name': 'germey',
    'age': 22
}
base_url = 'http://www.baidu.com?'
url = base_url + urlencode(params)
print(url)

"""7. parse_qs()"""
# deserialization
query = 'name=germey&age=22'
print(parse_qs(query))

"""8. parse_qsl()"""
# convert to tuple list
query = 'name=germey&age=22'
print(parse_qsl(query))

"""9. quote()"""
# convert content to URL encoded format
keyword = '壁纸'
url = 'https://www.baidu.com/s?wd=' + quote(keyword)
print(url)

"""10. unquote()"""
# decode URL
url = "https://www.baidu.com/s?wd=%E5%A3%81%E7%BA%B8"
print(unquote(url))
