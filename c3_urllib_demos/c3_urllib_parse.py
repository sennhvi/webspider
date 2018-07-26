from urllib.parse import urlparse, urlunparse, urlsplit, urlunsplit

"""urlparse()"""
# urllib.parse.urlparse(urlstring, scheme='', allow_fragments=True)
# scheme://netloc/path;params?query#fragment
# scheme only works when no scheme specified in URL
# allow_fragments set to False causes it parsed as part of path/para/query
result = urlparse('https://www.baidu.com/index.html;user?id=5#comment')
print(type(result), result)


"""urlunparse()"""
# construct url
# argument length must be 6
data = ['http', 'www.baidu.com', 'index.html', 'user', 'a=6', 'comment']
print(urlunparse(data))


"""urlsplit()"""
# return tuple/SplitResult object
result = urlsplit('http://www.baidu.com/index.html;user?id=5#comment')
print(result, result.scheme, result[0], sep='\n')


"""urlunsplit()"""
# construct url
# argument length must be 5
data = ['http', 'www.baidu.com', 'index.html', 'a=6', 'comment']
print(urlunsplit(data))


"""urljoin()"""
# construct url using base_url and target_url
# base_url only provides: scheme, netloc, path as reference
