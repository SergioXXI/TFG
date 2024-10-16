-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-05-2024 a las 11:31:53
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba`
--
CREATE DATABASE IF NOT EXISTS `prueba` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `prueba`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `memoriaram`
--

CREATE TABLE `memoriaram` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `capacidad` varchar(20) DEFAULT NULL,
  `frecuencia` varchar(20) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `memoriaram`
--

INSERT INTO `memoriaram` (`id`, `nombre`, `marca`, `tipo`, `capacidad`, `frecuencia`, `precio`, `stock`) VALUES
(1, 'Corsair Vengeance LPX', 'Corsair', 'DDR4', '16GB (2 x 8GB)', '3200MHz', 89.99, 50),
(2, 'G.Skill Ripjaws V Series', 'G.Skill', 'DDR4', '32GB (2 x 16GB)', '3600MHz', 149.99, 30),
(3, 'Crucial Ballistix RGB', 'Crucial', 'DDR4', '8GB (1 x 8GB)', '2666MHz', 49.99, 40),
(4, 'Kingston HyperX Fury', 'Kingston', 'DDR4', '64GB (2 x 32GB)', '3200MHz', 299.99, 20),
(5, 'Team T-FORCE DARK Z', 'Team', 'DDR4', '16GB (2 x 8GB)', '4000MHz', 129.99, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `placasbase`
--

CREATE TABLE `placasbase` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `socket` varchar(50) DEFAULT NULL,
  `chipset` varchar(50) DEFAULT NULL,
  `formato` varchar(20) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `placasbase`
--

INSERT INTO `placasbase` (`id`, `nombre`, `marca`, `socket`, `chipset`, `formato`, `precio`, `stock`) VALUES
(1, 'ASUS ROG Strix Z390-E Gaming', 'ASUS', 'LGA 1151', 'Intel Z390', 'ATX', 239.99, 50),
(2, 'GIGABYTE B450M DS3H', 'GIGABYTE', 'AM4', 'AMD B450', 'Micro ATX', 89.99, 30),
(3, 'MSI MPG Z490 GAMING PLUS', 'MSI', 'LGA 1200', 'Intel Z490', 'ATX', 189.99, 20),
(4, 'ASRock B550M Steel Legend', 'ASRock', 'AM4', 'AMD B550', 'Micro ATX', 139.99, 15),
(5, 'ASUS Prime X570-Pro', 'ASUS', 'AM4', 'AMD X570', 'ATX', 249.99, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesadores`
--

CREATE TABLE `procesadores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `socket` varchar(50) DEFAULT NULL,
  `nucleos` int(11) DEFAULT NULL,
  `frecuencia_base` decimal(5,2) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `procesadores`
--

INSERT INTO `procesadores` (`id`, `nombre`, `marca`, `socket`, `nucleos`, `frecuencia_base`, `precio`, `stock`) VALUES
(1, 'Intel Core i9-10900K', 'Intel', 'LGA 1200', 10, 3.70, 529.99, 20),
(2, 'AMD Ryzen 9 5900X', 'AMD', 'AM4', 12, 3.70, 549.99, 30),
(3, 'Intel Core i5-11600K', 'Intel', 'LGA 1200', 6, 3.90, 269.99, 40),
(4, 'AMD Ryzen 5 5600X', 'AMD', 'AM4', 6, 3.70, 299.99, 35),
(5, 'Intel Core i3-10100', 'Intel', 'LGA 1200', 4, 3.60, 119.99, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetasgraficas`
--

CREATE TABLE `tarjetasgraficas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `chipset` varchar(50) DEFAULT NULL,
  `memoria` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tarjetasgraficas`
--

INSERT INTO `tarjetasgraficas` (`id`, `nombre`, `marca`, `chipset`, `memoria`, `precio`, `stock`) VALUES
(1, 'NVIDIA GeForce RTX 3080', 'NVIDIA', 'RTX 3080', '10GB GDDR6X', 799.99, 30),
(2, 'AMD Radeon RX 6800 XT', 'AMD', 'RX 6800 XT', '16GB GDDR6', 649.99, 25),
(3, 'MSI GeForce RTX 3060 Ti GAMING X', 'MSI', 'RTX 3060 Ti', '8GB GDDR6', 449.99, 40),
(4, 'ASUS TUF Gaming GeForce GTX 1660 SUPER', 'ASUS', 'GTX 1660 SUPER', '6GB GDDR6', 279.99, 20),
(5, 'GIGABYTE Radeon RX 6700 XT GAMING OC', 'GIGABYTE', 'RX 6700 XT', '12GB GDDR6', 579.99, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `correo_electronico`, `edad`) VALUES
(1, 'Juan', 'Pérez', 'juan@example.com', 30),
(2, 'María', 'González', 'maria@example.com', 25),
(3, 'Carlos', 'López', 'carlos@example.com', 35),
(4, 'Ana', 'Martínez', 'ana@example.com', 28);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `memoriaram`
--
ALTER TABLE `memoriaram`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `placasbase`
--
ALTER TABLE `placasbase`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `procesadores`
--
ALTER TABLE `procesadores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tarjetasgraficas`
--
ALTER TABLE `tarjetasgraficas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `memoriaram`
--
ALTER TABLE `memoriaram`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `placasbase`
--
ALTER TABLE `placasbase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `procesadores`
--
ALTER TABLE `procesadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tarjetasgraficas`
--
ALTER TABLE `tarjetasgraficas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
