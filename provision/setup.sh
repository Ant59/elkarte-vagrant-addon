#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

shopt -s extglob

echo "Provisioning virtual machine..."
apt-get update > /dev/null

# Unzip
echo "Installing Unzip"
apt-get install unzip -y > /dev/null

# Nginx
echo "Installing Nginx"
apt-get install nginx -y > /dev/null

# PHP
echo "Updating PHP repository"
apt-get install python-software-properties -y > /dev/null
add-apt-repository ppa:ondrej/php5-5.6 -y > /dev/null 2>&1
apt-get update > /dev/null

echo "Installing PHP"
apt-get install php5-common php5-dev php5-cli php5-fpm -y > /dev/null

echo "Installing PHP extensions"
apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql -y > /dev/null

echo "Configuring PHP"
cp -f /vagrant/provision/php.ini /etc/php5/fpm/php.ini

# MySQL 
echo "Preparing MySQL"
apt-get install debconf-utils -y > /dev/null
debconf-set-selections <<< "mysql-server mysql-server/root_password password 1234"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password 1234"

echo "Installing MySQL"
apt-get install mysql-server -y > /dev/null

# Getting Elkarte
echo "Fetching Elkarte"
rm -rf Elkarte-development/
wget https://github.com/elkarte/Elkarte/archive/development.zip > /dev/null 2>&1
unzip development.zip > /dev/null

# Setup Elkarte
echo "Setting up Elkarte"
cat /vagrant/provision/database.sql | mysql -u root -p1234
rm -rf /var/www/!(addons)
mv Elkarte-development/!(tests|install) /var/www/
cp -f /vagrant/provision/Settings.php /var/www/

# Install PHPUnit
echo "Installing PHPUnit"
wget https://phar.phpunit.de/phpunit.phar > /dev/null 2>&1
chmod +x phpunit.phar
mv phpunit.phar /usr/bin/phpunit

# Install xdebug
echo "Installing Xdebug"
apt-get install php5-xdebug -y > /dev/null
cp -f /vagrant/provision/20-xdebug.ini /etc/php5/fpm/conf.d/20-xdebug.ini

# Install Webgrind
echo "Installing Webgrind"
rm -rf webgrind-master/
wget https://github.com/jokkedk/webgrind/archive/master.zip > /dev/null 2>&1
unzip master.zip > /dev/null
mkdir /var/www/webgrind
mv webgrind-master/* /var/www/webgrind/
apt-get install python graphviz -y > /dev/null
cp -f /vagrant/provision/config.php /var/www/webgrind/config.php

# Add phpinfo.php
echo "<?php phpinfo(); ?>" > /var/www/phpinfo.php

# Restart PHP-FPM
service php5-fpm restart > /dev/null

# Nginx Configuration
echo "Configuring Nginx"
cp -f /vagrant/provision/nginx_vhost /etc/nginx/sites-available/nginx_vhost > /dev/null
ln -s /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/ > /dev/null 2>&1

rm -f /etc/nginx/sites-available/default

# Restart Nginx for the config to take effect
service nginx restart > /dev/null

# Fix permissions
chown -R www-data:www-data /var/www/!(addons)
chmod -R 755 /var/www/!(addons)

echo "Finished provisioning"
