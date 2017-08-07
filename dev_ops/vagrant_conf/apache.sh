#!/usr/bin/env bash

    # install apache
    sudo apt-get install -y apache2
    sudo a2enmod rewrite
    sudo cp /vagrant/dev_ops/apache/api.conf /etc/apache2/sites-available
    sudo a2ensite api