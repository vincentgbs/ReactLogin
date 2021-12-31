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

## https://www.digitalocean.com/community/tutorials/how-to-manage-state-on-react-class-components
npx create-react-app auth-tutorial -y
cd /vagrant/auth-tutorial/
mkdir src/components
mkdir src/components/App
mv src/App.* src/components/App
# cp src/index.js src/index.js.bak
sed -i "s#import App from './App';#import App from './components/App/App';#g" src/index.js
sed -i "s#import logo from './logo.svg';#import logo from '../../logo.svg';#g" src/components/App/App.js
# npm start ## to preview
## preview at: 192.168.33.50:3000

## https://www.digitalocean.com/community/tutorials/how-to-add-login-authentication-to-react-applications
cd /vagrant/auth-tutorial/
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

# in react-router-dom v6, "Switch" is replaced by routes "Routes"
echo "import React from 'react';
import './App.css';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import Dashboard from '../Dashboard/Dashboard';
import Preferences from '../Preferences/Preferences';

function App() {
  return (
    <div className=\"wrapper\">
      <h1>Application</h1>
      <BrowserRouter>
        <Routes>
          <Route path=\"/dashboard\" element={<Dashboard />} />
          <Route path=\"/preferences\" element={<Preferences />} />
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;" > src/components/App/App.js

echo "

.wrapper {
    padding: 20px;
}" >> src/components/App/App.css

mkdir src/components/Login

echo "import React from 'react';
import './Login.css';

export default function Login() {
  return(
    <div className=\"login-wrapper\">
      <h1>Please Log In</h1>
      <form>
        <label>
          <p>Username</p>
          <input type=\"text\" />
        </label>
        <label>
          <p>Password</p>
          <input type=\"password\" />
        </label>
        <div>
          <button type=\"submit\">Submit</button>
        </div>
      </form>
    </div>
  )
}" > src/components/Login/Login.js

echo ".login-wrapper {
    display: flex;
    flex-direction: column;
    align-items: center;
}" > src/components/Login/Login.css

npm install --save-dev express cors
echo "const express = require('express');
const cors = require('cors')
const app = express();

app.use(cors());

app.use('/login', (req, res) => {
  res.send({
    token: 'test123'
  });
});

app.listen(8080, () => console.log('API is running on http://localhost:8080/login'));" > server.js
# node server.js

echo "import { useState } from 'react';

export default function useToken() {
  const getToken = () => {
    const tokenString = sessionStorage.getItem('token');
    const userToken = JSON.parse(tokenString);
    return userToken?.token
  };
  const [token, setToken] = useState(getToken());

}" > src/components/App/useToken.js
