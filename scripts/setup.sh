#!/bin/bash
# Using Ubuntu

sudo echo "127.0.1.1 ubuntu-disco-dingo" >> /etc/hosts

#
# Install
#
echo "============    BEGIN SETUP   ============="
echo -e "----------------------------------------"
sudo apt-get install -y language-pack-en-base
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y re2c libpcre3-dev gcc make
sudo apt-get install wget

echo -e "----------------------------------------"
echo "VAGRANT ==> tools (mc, htop, unzip etc...)"
sudo apt-get install -y mc htop unzip grc gcc make libpcre3 libpcre3-dev lsb-core autoconf

#
# Install Nginx
#
echo -e "----------------------------------------"
echo "VAGRANT ==> Nginx"
sudo apt-get install -y nginx

#
# php
#
echo -e "----------------------------------------"
echo "VAGRANT ==> PHP 7.3"
sudo apt-get install -y php7.3-fpm php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-mysql php7.3-phpdbg php7.3-mbstring php7.3-gd php-imagick  php7.3-pgsql php7.3-pspell php7.3-recode php7.3-tidy php7.3-dev php7.3-intl php7.3-gd php7.3-curl php7.3-zip php7.3-xml php-memcached mcrypt memcached phpunit php7.3-bcmath php7.3-soap php7.3-xsl libxml2-dev
sudo apt-get install -y php7.3-dev

#
# PHP Errors
#
echo -e "----------------------------------------"
echo "VAGRANT ==> Setup PHP 7.3"
sudo sed -i 's/short_open_tag = Off/short_open_tag = On/' /etc/php/7.3/fpm/php.ini
sudo sed -i 's/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/' /etc/php/7.3/fpm/php.ini
sudo sed -i 's/display_startup_errors = Off/display_startup_errors = On/' /etc/php/7.3/fpm/php.ini
sudo sed -i 's/display_errors = Off/display_errors = On/' /etc/php/7.3/fpm/php.ini
sudo sed -i 's/listen =/listen = 127.0.0.1:9000 ;/' /etc/php/7.3/fpm/pool.d/www.conf
sudo service php7.3-fpm restart

#
# composer
#
echo -e "----------------------------------------"
echo "VAGRANT ==> Composer"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

#
# Frontend Tools (npm, nodejs, gulp)
#
echo -e "----------------------------------------"
echo "VAGRANT ==> Frontend Tools (nvm, npm, nodejs)"
git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
echo "source /home/vagrant/.nvm/nvm.sh" >> /home/vagrant/.profile
source /home/vagrant/.profile
echo "VAGRANT ==> Installing node.js... (please be patient)"
nvm install stable &> /dev/null
nvm alias default stable

#
# MySQL Server
#
echo -e "----------------------------------------"
echo "VAGRANT ==> MySQL"
sudo apt-get install -y mysql-server
#sudo sed '/\[mysqld\]/askip-grant-tables' -i /etc/mysql/mysql.conf.d/mysqld.cnf
#sudo mysql -u root -e "CREATE DATABASE magento; CREATE USER 'magento'@'localhost' IDENTIFIED BY 'magento'; GRANT ALL PRIVILEGES ON magento.* TO 'magento'@'localhost'; FLUSH PRIVILEGES;"

#
# Reload servers
#
echo -e "----------------------------------------"
echo "VAGRANT ==> Restart Nginx & PHP-FPM"
sudo service nginx restart
sudo service php7.3-fpm restart

#
# Add user to group
#
sudo usermod -a -G www-data vagrant

#
# COMPLETE
#
echo -e "----------------------------------------"
echo "======>  VIRTUAL MACHINE READY"
echo "======>  TYPE 'vagrant ssh"
echo -e "----------------------------------------"
