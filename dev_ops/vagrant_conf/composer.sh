#!/usr/bin/env
  echo -e "\n------------------------------------------- Installing Composer\n"
  fromdos /vagrant/composer.sh
  curl -s https://getcomposer.org/installer | php
  sudo mv composer.phar /usr/local/bin/composer
  cd /vagrant && php composer.phar install