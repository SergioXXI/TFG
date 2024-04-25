const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const mysql = require('mysql');

const app = express();
const port = 5000;
app.use(cors());

// Configurar la conexión a la base de datos
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'prueba'
});

/*
const connection = mysql.createConnection({
  host: 'database', // nombre del servicio de la base de datos en docker-compose.yml
  user: 'root', // usuario definido en docker-compose.yml
  password: 'example', // contraseña definida en docker-compose.yml
  database: 'mydatabase' // nombre de la base de datos definida en docker-compose.yml
});
*/
connection.connect();

// Middleware para parsear el cuerpo de las solicitudes
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Ruta para obtener todos los usuarios
app.get('/usuarios', (req, res) => {
  connection.query('SELECT * FROM usuarios', (error, results) => {
    if (error) throw error;
    res.json(results);
  });
});
// Ruta para obtener todos las placas base
app.get('/placasbase', (req, res) => {
  connection.query('SELECT * FROM placasbase', (error, results) => {
    if (error) throw error;
    res.json(results);
  });
});

// Ruta para obtener un usuario por su ID
app.get('/usuarios/:id', (req, res) => {
  const { id } = req.params;
  connection.query('SELECT * FROM usuarios WHERE id = ?', [id], (error, results) => {
    if (error) throw error;
    res.json(results[0]);
  });
});

// Ruta para crear un nuevo usuario
app.post('/usuarios', (req, res) => {
  const { nombre, correo } = req.body;
  connection.query('INSERT INTO usuarios (nombre, correo) VALUES (?, ?)', [nombre, correo], (error, results) => {
    if (error) throw error;
    res.json({ message: 'Usuario creado correctamente', id: results.insertId });
  });
});

// Ruta para actualizar un usuario existente
app.put('/usuarios/:id', (req, res) => {
  const { id } = req.params;
  const { nombre, correo } = req.body;
  connection.query('UPDATE usuarios SET nombre = ?, correo = ? WHERE id = ?', [nombre, correo, id], (error, results) => {
    if (error) throw error;
    res.json({ message: 'Usuario actualizado correctamente' });
  });
});

// Ruta para eliminar un usuario
app.delete('/usuarios/:id', (req, res) => {
  const { id } = req.params;
  connection.query('DELETE FROM usuarios WHERE id = ?', [id], (error, results) => {
    if (error) throw error;
    res.json({ message: 'Usuario eliminado correctamente' });
  });
});

// Iniciar el servidor
app.listen(port, () => {
  console.log(`Servidor API REST corriendo en http://localhost:${port}`);
});
