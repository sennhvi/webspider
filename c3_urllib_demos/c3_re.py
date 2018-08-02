import re

"""match"""
# return result if match successfully, otherwise None
content = 'Hello 123 4567 World_This is a Regex Demo'
print(len(content))
result = re.match('^Hello\s\d{3}\s\d{4}\s\w{10}', content)
print(result.group())  # result content
print(result.span())  # result span
