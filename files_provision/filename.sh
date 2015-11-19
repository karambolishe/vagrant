#!/bin/bash
rootPass="Metallica21"
trigger="/var/log/databasesetup"
if [ ! -f "$trigger" ];
then
	echo $PATH
#	echo "CREATE USER 'wp'@'localhost' IDENTIFIED BY '12345'" | mysql -uroot -p"$rootPass"
#	echo "CREATE DATABASE wordpress" | mysql -uroot -p"$rootPass"
#	echo "GRANT ALL ON wordpress.* TO 'wp'@'localhost'" | mysql -uroot -p"$rootPass"
#	echo "FLUSH PRIVILEGES" | mysql -uroot -p"$rootPass"
#	touch "$trigger" && chmod 400 "$trigger"
fi
