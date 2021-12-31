import React from 'react';
import './App.css';
import { BrowserRouter, Route, Routes, Link } from 'react-router-dom';
import Dashboard from '../Dashboard/Dashboard';
import Login from '../Login/Login';
import Preferences from '../Preferences/Preferences';
import useToken from './useToken';
import 'bootstrap/dist/css/bootstrap.min.css';

function App() {
    const { token, setToken } = useToken();

    if(!token) {
        return <Login setToken={setToken} />
    }

    return (
        <div className="App">
            <h1>Application</h1>
            <BrowserRouter>
                <div>
                    <Link to='/'>home</Link><br/>
                    <Link to='/dashboard'>dashboard</Link><br/>
                    <Link to='/preferences'>preferences</Link><br/>
                </div>
                <Routes>
                    <Route path="/dashboard" element={<Dashboard />} />
                    <Route path="/preferences" element={<Preferences />} />
                </Routes>
            </BrowserRouter>
        </div>
    );
}

export default App;
