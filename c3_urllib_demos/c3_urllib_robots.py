"""Robots protocol: the Robots Exclusion Protocol, stored in root directory in robots.txt"""
# robots.txt sample
# User-agent: *
# Disallow: /
# Allow: /public/

# forbid access to some directory
# User-agent: *
# Disallow: /private/
# Disallow: /tmp/

# allow only one crawler
# User-agent: WebCrawler
# Disallow:
# User-agent:
# Disallow: /


from urllib.robotparser import RobotFileParser
from urllib.request import urlopen

"""some method of RobotFileParser()"""
# set_url(): set url to robots.txt
# read(): read robots.txt and analyse. A MUST DO method
# parse(): parse robots.txt content
# can_fetch(): require 2 args- User-agent, URL. return whether this URL can be crawled
# mtime(): return time span from last crawl to current
# modified(): set current time to last time

rp = RobotFileParser()
rp.set_url('http://www.jianshu.com/robots.txt')
# rp.parse(urlopen('http://www.jianshu.com/robots.txt').read().decode('utf-8').split('\n'))
rp.read()
print(rp.can_fetch('*', 'https://www.jianshu.com/p/64f95b06f6f5'))
