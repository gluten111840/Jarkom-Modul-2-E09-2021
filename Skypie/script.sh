#!/bin/bash
echo "nameserver 192.168.122.1" | tee /etc/resolv.conf > /dev/null
apt-get update
apt-get install nano -y
apt-get install apache2 -y
apt-get install php -y
apt-get install libapache2-mod-php7.0 -y
service apache2 start

cp ~/backup/apache2/ports.conf /etc/apache2/ports.conf
cp -r ~/backup/apache2/sites-available/ /etc/apache2/
cp -r ~/backup/var/www/ /var/
cp ~/backup/apache2/.htpasswd /etc/apache2/.htpasswd

cd /var/www
rm -r html/

cd /etc/apache2/sites-available
rm 000-default.conf
a2ensite franky.e09.com
a2ensite super.franky.e09.com
a2ensite general.mecha.franky.e09.com-15000
a2ensite general.mecha.franky.e09.com-15500

a2enmod rewrite

cp ~/backup/franky.e09.com/.htaccess /var/www/franky.e09.com/.htaccess
cp ~/backup/super.franky.e09.com/.htaccess /var/www/super.franky.e09.com/.htaccess
cp ~/backup/super.franky.e09.com/.htaccess /var/www/super.franky.e09.com/public/images/.htaccess

service apache2 restart

cd ~
