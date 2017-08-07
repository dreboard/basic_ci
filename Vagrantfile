# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/xenial64"
  config.vm.network "private_network", ip: "192.168.50.44"
  config.vm.network "forwarded_port", guest: 80, host: 8074

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine for troubleshooting
    vb.gui = true
    vb.memory = "512"
  end

   config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get -y upgrade
    sudo apt-get install -y openssl
    sudo chmod -R 755 /vagrant
	
    echo -e "\n------------------------------------------- Installing Apache\n"
    sudo apt-get install -y apache2
    sudo a2enmod rewrite
    sudo cp /vagrant/dev_ops/apache/site.conf /etc/apache2/sites-available/000-default.conf
    sudo cp /vagrant/dev_ops/apache/site.conf /etc/apache2/sites-available
    sudo a2ensite site
    sudo service apache2 start
	
	echo -e "\n------------------------------------------- Installing PHP\n"
    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:ondrej/php
    sudo apt-get update
    
    sudo apt-get install -y php7.1 php7.1-opcache php7.1-phpdbg php7.1-mbstring php7.1-cli php7.1-imap php7.1-ldap php7.1-pgsql php7.1-pspell php7.1-recode php7.1-snmp php7.1-tidy php7.1-dev php7.1-intl php7.1-gd php7.1-zip php7.1-xml php7.1-curl php7.1-json php7.1-mcrypt
    sudo apt-get install php7.1-intl php7.1-xsl
    sudo apt-get install -y php7.1-mysql
	
    echo -e "\n--- Installing Xdebug ---\n"
    sudo apt-get install -y php-xdebug
    sudo cp /vagrant/dev_ops/apache/20-xdebug.ini /etc/php/7.1/cli/conf.d

    if [ -d "/vagrant/temp/debug" ]; then
        mkdir "/vagrant/temp/debug"
      else
        rm -rf "/vagrant/temp/debug/*"
    fi

    echo -e "\n------------------------------------------- Installing Extras\n"
    sudo apt-get -y install curl git nano tofrodos
    sudo apt-get install snmp
    sudo apt-get -y install libapache2-mod-php7.1
    sudo apt-get -y autoremove
  SHELL

  config.vm.provision "database", type: "shell", path: "./dev_ops/vagrant_conf/database.sh"

  config.vm.provision "shell", inline: <<-SHELL2
    echo -e "\n------------------------------------------- Composer install and config\n"
    curl -s https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
    cd /vagrant && php composer.phar install
    sudo cp /vagrant/dev_ops/git/post-merge.sh /vagrant/.git/hooks
  SHELL2

  config.vm.provision "bootstrap", type: "shell", path: "./dev_ops/vagrant_conf/run_always.sh", run: "always"
end