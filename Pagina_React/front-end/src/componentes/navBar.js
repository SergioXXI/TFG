import React from 'react';
import { Link } from 'react-router-dom';

function Navbar() {
   return (
       <nav>
           <ul>
               <li><a href="/">Inicio</a></li>
               <li><a href="/about">Acerca de</a></li>
               <li><a href="https://www.ejemplo.com" target="_blank" rel="noopener noreferrer">Página Externa</a></li>
           </ul>
       </nav>
   );
}

export default Navbar;
