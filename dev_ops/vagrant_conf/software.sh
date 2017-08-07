#!/usr/bin/env bash

    sudo apt-get -y install curl git nano tofrodos
    sudo apt-get install snmp

    sudo apt-get -y install libapache2-mod-php7.1
    sudo apt-get -y autoremove
    #sudo service apache2 restart