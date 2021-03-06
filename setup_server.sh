#!/bin/bash

##Latest patches etc
sudo apt-get update
sudo apt-get upgrade

## Services
for i in apache2 openssh-server mysql-server php libapache2-mod-php php-mysql monit;
do
sudo apt-get -y --ignore-missing install $i
done


## Firewall stuff
sudo ufw allow 2201
systemctl enable ssh
sudo ufw allow 2812 # monit


## Admin accounts w/ pw Linux4Ever
for i in `cat userlist.txt`;
    do
    sudo adduser $i --gecos "$i" --disabled-password
    echo "$i:Linux4Ever" | sudo chpasswd
    sudo adduser $i sudo
done
