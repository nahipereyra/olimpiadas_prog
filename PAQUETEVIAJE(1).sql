-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 25-08-2025 a las 21:56:22
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
-- Base de datos: `EMPRESAviajes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PAQUETEVIAJE`
--

CREATE TABLE `PAQUETEVIAJE` (
  `id_paqueviaje` int(11) NOT NULL,
  `fecha_salida` date NOT NULL,
  `fecha_regreso` date NOT NULL,
  `destino` varchar(50) NOT NULL,
  `promos` varchar(50) NOT NULL,
  `ur_caracterización` text NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_carrito` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_comentario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `PAQUETEVIAJE`
--
ALTER TABLE `PAQUETEVIAJE`
  ADD PRIMARY KEY (`id_paqueviaje`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `PAQUETEVIAJE`
--
ALTER TABLE `PAQUETEVIAJE`
  MODIFY `id_paqueviaje` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
