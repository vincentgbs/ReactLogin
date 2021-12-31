#!/usr/bin/bash
## USAGE
## cd /vagrant/
## chmod 700 setup.sh
## ./setup.sh

## https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-18-04
sudo apt update
sudo apt install nodejs -y
sudo apt install npm -y
sudo npm install -g n ## update node
sudo n stable

## https://www.digitalocean.com/community/tutorials/how-to-manage-state-on-react-class-components#step-1-—-creating-an-empty-project
npx create-react-app auth-tutorial ## requires user intervention -y
cd auth-tutorial ## cd /vagrant/auth-tutorial/
mkdir src/components
mkdir src/components/App
mv src/App.* src/components/App
# cp src/index.js src/index.js.bak
sed -i "s#import App from './App';#import App from './components/App/App';#g" src/index.js
# npm start ## to preview
## preview at: 192.168.33.50:3000

## https://www.digitalocean.com/community/tutorials/how-to-add-login-authentication-to-react-applications
npm install react-router-dom
mkdir src/components/Dashboard
mkdir src/components/Preferences

echo "import React from 'react';

export default function Dashboard() {
  return(
    <h2>Dashboard</h2>
  );
}" > src/components/Dashboard/Dashboard.js

echo "import React from 'react';

export default function Preferences() {
  return(
    <h2>Preferences</h2>
  );
}" > src/components/Preferences/Preferences.js
