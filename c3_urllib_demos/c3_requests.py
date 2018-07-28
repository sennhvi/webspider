import requests

r = requests.get('https://www.baidu.com')
print(type(r))
print(r.status_code)
print(type(r.text))
print(r.text)
print(r.cookies)

"""GET request"""
# basic instance
data = {
    'name': 'germey',
    'age': 22
}
r = requests.get('http://httpbin.org/get', params=data)
print(r.text)
print(r.json())  # output type is str type in json format, use json() method to convert str to dict
print(type(r.json()))
