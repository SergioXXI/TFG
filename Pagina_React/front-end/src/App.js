import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import './App.css';
import ListaUsuarios from './componentes/ListaUsuarios';
import ListaPlacasBase from './componentes/placas_base/ListaPlacasBase';
function App() {
  
  return (
    <div className="App">
      <header className="App-header">
        <h1>Bienvenido a GenioComponentes</h1>
        <p>¡Aquí puedes empezar tu viaje!</p>
    
      </header>
      <main>
      <ListaUsuarios />
        <section>
          <h2>Sobre Nosotros</h2>
          <p>Somos una empresa comprometida con...</p>
        </section>
        <section>
          <h2>Nuestros Servicios</h2>
          <ul>
            <li>Servicio 1</li>
            <li>Servicio 2</li>
            <li>Servicio 3</li>
          </ul>
        </section>
        <section>
          <h2>Contacto</h2>
          <p>Puedes contactarnos en:</p>
          <address>
            Dirección: 123 Calle Principal, Ciudad
            Teléfono: 555-1234
            Email: info@ejemplo.com
          </address>
        </section>
      </main>
      <footer>
        <p>&copy; 2024 Mi Empresa</p>
      </footer>
    </div>
    
  );
}

export default App;
