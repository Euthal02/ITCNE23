#!/bin/bash

mysqluser=$(cat /var/tmp/mysqluser)
mysqlpasswd=$(cat /var/tmp/mysqlpasswd)

cd /var/www/html
cp wp-config-sample.php wp-config.php
sed -i -e 's/database_name_here/wordpress/' wp-config.php
sed -i -e "s/username_here/$mysqluser/" wp-config.php
sed -i -e "s/password_here/$mysqlpasswd/" wp-config.php
sed -i -e "/SECURE_AUTH_KEY/ s/put your unique phrase here/$(pwgen 50 1)/" wp-config.php
sed -i -e "/AUTH_KEY/ s/put your unique phrase here/$(pwgen 50 1)/" wp-config.php
sed -i -e "/LOGGED_IN_KEY/ s/put your unique phrase here/$(pwgen 50 1)/" wp-config.php
sed -i -e "/NONCE_KEY/ s/put your unique phrase here/$(pwgen 50 1)/" wp-config.php
sed -i -e "/SECURE_AUTH_SALT/ s/put your unique phrase here/$(pwgen 50 1)/" wp-config.php
sed -i -e "/AUTH_SALT/ s/put your unique phrase here/$(pwgen 50 1)/" wp-config.php
sed -i -e "/LOGGED_IN_SALT/ s/put your unique phrase here/$(pwgen 50 1)/" wp-config.php
sed -i -e "/NONCE_SALT/ s/put your unique phrase here/$(pwgen 50 1)/" wp-config.php
