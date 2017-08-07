#!/usr/bin/env bash

# update / upgrade
sudo apt-get update
sudo apt-get -y upgrade

# install apache 2.5 and php 7
sudo apt-get install -y apache2

##########################################################
#				Install PHP
##########################################################
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ondrej/php

sudo apt-get update

echo -e "\n--- Install PHP ---\n"
sudo apt-get install -y php7.1 php7.1-opcache php7.1-phpdbg php7.1-mbstring php7.1-cli php7.1-imap php7.1-ldap php7.1-pgsql php7.1-pspell php7.1-recode php7.1-snmp php7.1-tidy php7.1-dev php7.1-intl php7.1-gd php7.1-zip php7.1-xml php7.1-curl php7.1-json php7.1-mcrypt
sudo apt-get install php7.1-intl php7.1-xsl
sudo apt-get install -y php7.1-mysql

##########################################################
#				Install Xdebug
##########################################################
echo -e "\n--- Installing Xdebug ---\n"
sudo apt-get install -y php-xdebug

# enable mod_rewrite
sudo a2enmod rewrite

##########################################################
#				Install Extras
##########################################################

sudo apt-get -y install curl git nano
sudo apt-get install snmp

# restart apache
sudo apt-get -y install libapache2-mod-php7.1
sudo a2dismod php5
sudo a2enmod php7.1

sudo apt-get -y autoremove

# install Composer
echo "------------------------------------------ Installing Composer"
curl -s https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

service apache2 restart
