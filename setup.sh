#!/usr/bin/bash
## USAGE
## cd /vagrant/
## chmod 700 setup.sh
## ./setup.sh

## https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-18-04
sudo apt update
sudo apt install nodejs -y
sudo apt install npm -y ## 8.1.2
sudo npm install -g n ## update node
sudo n stable ## v16.13.1

## https://www.digitalocean.com/community/tutorials/how-to-add-login-authentication-to-react-applications
cd /vagrant/auth-tutorial/
npm install react-router-dom
npm install react-bootstrap bootstrap@5.1.3
npm install bootstrap
npm install axios
npm install react-validation validator

# npm start ## preview at: 192.168.33.50:3000
