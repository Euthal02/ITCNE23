#!/bin/bash

mysqlpasswd=$(pwgen 40 1)
mysqluser=$(pwgen -0 10 1)
mysql -u root <<EOF
create database wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO "$mysqluser"@"localhost" IDENTIFIED BY "$mysqlpasswd";
EOF
echo $mysqlpasswd>/var/tmp/mysqlpasswd
echo $mysqluser>/var/tmp/mysqluser
