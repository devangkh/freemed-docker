#!/bin/bash

/etc/init.d/apache2 start
/etc/init.d/mysql start

# Ensure that our db permissions are okay
echo "CREATE DATABASE IF NOT EXISTS freemed; GRANT ALL ON freemed.* TO freemed@localhost IDENTIFIED BY 'password' WITH GRANT OPTION; GRANT SUPER ON *.* TO freemed@localhost; FLUSH PRIVILEGES;" | mysql -uroot

# Our substitute for going all daemon
read X

