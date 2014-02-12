#/bin/bash
# init-mysqld.sh
# @jbuchbinder
#
# Handle MySQL initialization and user setup, since single RUN commands will
# fail to properly maintain running services.

# Bind MySQL to *everything*
sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# If our dpkg install doesn't initialize properly, run manually
if [ ! -f /var/lib/mysql/ibdata1 ]; then
	mysql_install_db
fi

# Service start
/usr/bin/mysqld_safe &
sleep 5s

# Permission queries
echo "CREATE DATABASE IF NOT EXISTS freemed; GRANT ALL ON freemed.* TO freemed@localhost IDENTIFIED BY 'password' WITH GRANT OPTION; GRANT SUPER ON *.* TO freemed@localhost; FLUSH PRIVILEGES;" | mysql -uroot

