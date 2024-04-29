import React, { useState, useEffect } from 'react';

function ListaPlacasBase() {
  const [placasBase, setPlacasBase] = useState([]);

  useEffect(() => {
    fetch('http://localhost:5000/placasbase')
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then(data => {
        setPlacasBase(data);
      })
      .catch(error => {
        console.error('Error fetching data: ', error);
      });
  }, []);

  return (
    <div>
      <h1>Placas Base</h1>
      <ul>
        {placasBase.map(placaBase => (
          <li key={placaBase.id}>
            <h2>{placaBase.nombre}</h2>
            <p>Marca: {placaBase.marca}</p>
            <p>Socket: {placaBase.socket}</p>
            <p>Chipset: {placaBase.chipset}</p>
            <p>Formato: {placaBase.formato}</p>
            <p>Precio: {placaBase.precio}</p>
            <p>Stock: {placaBase.stock}</p>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default ListaPlacasBase;
