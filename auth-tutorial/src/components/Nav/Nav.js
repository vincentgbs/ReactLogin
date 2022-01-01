import React from 'react';
import { Link } from 'react-router-dom';

export default function Nav() {
    return(
        <div>
            <h2>Navigation</h2>
            <Link to='/'>home</Link><br/>
            <Link to='/dashboard'>dashboard</Link><br/>
            <Link to='/preferences'>preferences</Link><br/>
        </div>
    );
}
