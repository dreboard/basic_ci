#!/usr/bin/env bash

echo -e "\n--- Install Jenkins ---\n"
#commands
#sudo service jenkins start
#sudo service jenkins restart

#https://pkg.jenkins.io/debian-stable/
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
#Then add the following entry in your /etc/apt/sources.list:
echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee -a /etc/apt/sources.list
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt install -y oracle-java8-set-default
sudo apt-get install -y oracle-java8-installer
sudo apt-get install -y jenkins