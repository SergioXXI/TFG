import React, { useState, useEffect } from 'react';

const ListaUsuarios = () => {
  const [usuarios, setUsuarios] = useState([]);

  useEffect(() => {
    // Realizar la solicitud al servidor para obtener la lista de usuarios
    fetch('http://localhost:5000/usuarios')
      .then(response => response.json())
      .then(data => {
        // Convertir el JSON a una cadena de texto en formato ASCII
        const asciiString = JSON.stringify(data, null, 2);

        // Mostrar la cadena de texto en la consola
        console.log(asciiString);

        // Actualizar el estado con los datos recibidos del servidor
        setUsuarios(data);
      })
      .catch(error => {
        console.error('Error al obtener usuarios:', error);
      });
  }, []); // El segundo argumento de useEffect indica que solo se debe ejecutar una vez al montar el componente

  return (
    <div>
      <h2>Lista de Usuarios</h2>
      {/* Mostrar la lista de usuarios en la interfaz de usuario si es necesario */}
      <ul>
        {usuarios.map(usuario => (
          <li key={usuario.id}>
            <strong>Nombre:</strong> {usuario.nombre}, <strong>Correo:</strong> {usuario.correo_electronico}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ListaUsuarios;
