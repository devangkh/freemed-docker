#/bin/bash
# install.sh
# @jbuchbinder

# MySQL service start
/usr/bin/mysqld_safe &
sleep 5s

( cd /usr/share/freemed ; php ./scripts/install.php --ni )

