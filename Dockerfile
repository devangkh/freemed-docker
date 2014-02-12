# FreeMED
#
# VERSION       1.0

# use the debian base image provided by dotCloud
FROM debian
MAINTAINER Jeffrey Buchbinder, freemed@gmail.com

# Fix initialization startup
RUN dpkg-divert --local --rename --add /sbin/initctl
#RUN ln -s /bin/true /sbin/initctl

# make sure the package repository is up to date
RUN apt-get update

# install dependencies
RUN ( echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections )
RUN ( export DEBIAN_FRONTEND=noninteractive ; apt-get -y install git mysql-client mysql-server php5-mysql apache2 libapache2-mod-php5 libxml-parser-perl libtext-iconv-perl djvulibre-bin netpbm graphicsmagick-imagemagick-compat cups-common cups-client gsfonts php5-cgi php5-gd php5-curl xpdf-utils bzip2 pdfjam php5-cli ghostscript dcmtk gettext texinfo openjdk-6-jdk ant make maven2 )

# Remove Suhosin
RUN apt-get --purge remove php5-suhosin

# MySQL u/p
ADD ./init-mysqld.sh /tmp/init-mysqld.sh
RUN /bin/bash /tmp/init-mysqld.sh
#RUN echo "CREATE DATABASE IF NOT EXISTS freemed; GRANT ALL ON freemed.* TO freemed@localhost IDENTIFIED BY 'password' WITH GRANT OPTION; GRANT SUPER ON *.* TO freemed@localhost; FLUSH PRIVILEGES;" | mysql -uroot

# FreeMED GIT code
RUN ( cd /usr/share/ ; git clone git://github.com/freemed/freemed.git )
# REMITT GIT code
RUN ( cd /usr/share/ ; git clone git://github.com/freemed/remitt.git )

RUN chown -Rf www-data:www-data /usr/share/freemed
RUN ( cd /etc/apache2/conf.d; ln -s /usr/share/freemed/doc/freemed.apache.conf . )

# FreeMED Configuration
RUN echo -e "FreeMED Installation\n127.0.0.1\nfreemed\nfreemed\npassword\nen_US\n" | php /usr/share/freemed/scripts/configure-settings.php
# ... and installation
ADD ./settings.php /usr/share/freemed/lib/settings.php
ADD ./install.php /usr/share/freemed/scripts/install.php
RUN ( cd /usr/share/freemed ; php ./scripts/install.php --ni )

# Build translations for FreeMED 0.9.x+
RUN ( cd /usr/share/freemed/locale; make )

# Enable PHP5 for Apache 2.x
RUN /usr/sbin/a2enmod php5

# gsdjvu download and install
RUN apt-get -y install build-essential libjpeg62-dev libpng12-dev zlib1g-dev wget
RUN /usr/share/freemed/scripts/build_gsdjvu.sh

# Restart Apache HTTPD
RUN /etc/init.d/apache2 restart

# Expose Apache port
EXPOSE 80

