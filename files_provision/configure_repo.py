#!/usr/bin/python
lst = ["trusty main restricted universe multiverse\n", \
		"trusty-security main restricted universe multiverse\n", \
		"trusty-updates main restricted universe multiverse\n"]

repo = "deb http://p-repo-app0.surc.kiev.ua/ua.archive.ubuntu.com/14_04/"

with open("/etc/apt/sources.list", "w") as file:
	for i in range(3):
		create_str = repo + ' ' + lst[i]
		file.write(create_str)