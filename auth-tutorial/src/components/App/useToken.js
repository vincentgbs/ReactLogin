import { useState } from 'react';

export default function useToken() {
    const getToken = () => {
        let tokenString;
        if (true) {
            tokenString = sessionStorage.getItem('token');
        } else {
            tokenString = localStorage.getItem('token');
        }
        const userToken = JSON.parse(tokenString);
        return userToken?.token
    };
    const [token, setToken] = useState(getToken());

    const saveToken = userToken => {
        if (true) {
            sessionStorage.setItem('token', JSON.stringify(userToken));
        } else {
            localStorage.setItem('token', JSON.stringify(userToken));
        }
        setToken(userToken.token);
    };

    return {
        setToken: saveToken,
        token
    }
}
