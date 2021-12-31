import { useState } from 'react';

export default function useToken() {
    const getToken = () => {
        let tokenString;
        if (false) { // more strict
            tokenString = sessionStorage.getItem('token');
        } else { // less strict
            tokenString = localStorage.getItem('token');
        }
        let userToken;
        try {
            userToken = JSON.parse(tokenString);
        } catch(e) {
            console.debug(e);
            alert("Token error");
        }
        return userToken?.token;
    };
    const [token, setToken] = useState(getToken());

    const saveToken = userToken => {
        if (false) {
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
