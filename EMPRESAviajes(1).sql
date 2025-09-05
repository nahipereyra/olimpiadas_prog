-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 05-09-2025 a las 20:25:43
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
-- Estructura de tabla para la tabla `ALOJAMIENTO`
--

CREATE TABLE `ALOJAMIENTO` (
  `id_alojamiento` int(11) NOT NULL,
  `hoteles` text NOT NULL,
  `hostales` text NOT NULL,
  `casa_vacacional` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CARRITOS`
--

CREATE TABLE `CARRITOS` (
  `id_carrito` int(11) NOT NULL,
  `id_paqueviaje` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_pagos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CATEGORIAS`
--

CREATE TABLE `CATEGORIAS` (
  `id_categoria` int(11) NOT NULL,
  `individual` varchar(50) NOT NULL,
  `pareja` varchar(70) NOT NULL,
  `familiar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CLIENTE`
--

CREATE TABLE `CLIENTE` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `correo` text NOT NULL,
  `teléfono` int(11) NOT NULL,
  `id_carrito` int(11) NOT NULL,
  `id_paqueviaje` int(11) NOT NULL,
  `id_pago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `COMENTARIOS`
--

CREATE TABLE `COMENTARIOS` (
  `id_comentario` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `puntuación` int(11) NOT NULL,
  `texto_comentario` text NOT NULL,
  `fecha_comentario` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MOVILIDADES`
--

CREATE TABLE `MOVILIDADES` (
  `id_movilidad` int(11) NOT NULL,
  `vuelos` text NOT NULL,
  `omnibus` text NOT NULL,
  `crucero` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PAGOS`
--

CREATE TABLE `PAGOS` (
  `id_pagos` int(11) NOT NULL,
  `id_carrito` int(11) NOT NULL,
  `valor` enum('transferencia','efectivo','tarjeta','') NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha_cobro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PAQUETEVIAJE`
--

CREATE TABLE `PAQUETEVIAJE` (
  `id_paqueviaje` int(11) NOT NULL,
  `destino` varchar(50) NOT NULL,
  `promos` varchar(50) NOT NULL,
  `ur_caracterización` text NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_carrito` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_comentario` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_limite` date NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `PAQUETEVIAJE`
--

INSERT INTO `PAQUETEVIAJE` (`id_paqueviaje`, `destino`, `promos`, `ur_caracterización`, `id_servicio`, `id_cliente`, `id_carrito`, `id_categoria`, `id_comentario`, `fecha_inicio`, `fecha_fin`, `fecha_limite`, `estado`) VALUES
(1, 'Buenos Aires (AR)', '10% OFF web', 'https://ejemplo.com/paquetes/ba-city', 101, 1001, 2001, 1, 3001, '0000-00-00', '0000-00-00', '0000-00-00', 0),
(2, 'Bariloche (AR)', '2x1 en teleférico', 'https://ejemplo.com/paquetes/bariloche', 102, 1002, 2002, 2, 3002, '0000-00-00', '0000-00-00', '0000-00-00', 0),
(3, 'Iguazú (AR/BR)', 'Early booking -15%', 'https://ejemplo.com/paquetes/iguazu', 103, 1003, 2003, 1, 3003, '0000-00-00', '0000-00-00', '0000-00-00', 0),
(4, 'Cusco & Machu Picchu (PE)', 'Tour gratis de ciudad', 'https://ejemplo.com/paquetes/cusco', 104, 1004, 2004, 3, 3004, '0000-00-00', '0000-00-00', '0000-00-00', 0),
(5, 'Río de Janeiro (BR)', 'Black Friday -20%', 'https://ejemplo.com/paquetes/rio', 105, 1005, 2005, 4, 3005, '0000-00-00', '0000-00-00', '0000-00-00', 0),
(6, 'Cartagena (CO)', 'All inclusive -10%', 'https://ejemplo.com/paquetes/cartagena', 106, 1006, 2006, 4, 3006, '0000-00-00', '0000-00-00', '0000-00-00', 0),
(7, 'Punta Cana (DO)', 'Kids <12 gratis', 'https://ejemplo.com/paquetes/punta-cana', 107, 1007, 2007, 4, 3007, '0000-00-00', '0000-00-00', '0000-00-00', 0),
(8, 'Cancún (MX)', 'Resort credit USD 100', 'https://ejemplo.com/paquetes/cancun', 108, 1008, 2008, 4, 3008, '0000-00-00', '0000-00-00', '0000-00-00', 0),
(9, 'Montevideo (UY)', '2 noches + desayuno', 'https://ejemplo.com/paquetes/montevideo', 101, 1009, 2009, 1, 3009, '0000-00-00', '0000-00-00', '0000-00-00', 0),
(10, 'Santiago de Chile (CL)', 'Upgrade de habitación', 'https://ejemplo.com/paquetes/scl', 102, 1010, 2010, 1, 3010, '0000-00-00', '0000-00-00', '0000-00-00', 0),
(11, 'San Pedro de Atacama (CL)', 'Excursión Valle de la Luna', 'https://ejemplo.com/paquetes/atacama', 103, 1011, 2011, 2, 3011, '0000-00-00', '0000-00-00', '0000-00-00', 0),
(12, 'Lima (PE)', 'City tour incluido', 'https://ejemplo.com/paquetes/lima', 104, 1012, 2012, 1, 3012, '0000-00-00', '0000-00-00', '0000-00-00', 0),
(13, 'Quito (EC)', '-12% pagando con tarjeta', 'https://ejemplo.com/paquetes/quito', 105, 1013, 2013, 1, 3013, '0000-00-00', '0000-00-00', '0000-00-00', 0),
(14, 'Islas Galápagos (EC)', 'Crucero promo -8%', 'https://ejemplo.com/paquetes/galapagos', 106, 1014, 2014, 5, 3014, '0000-00-00', '0000-00-00', '0000-00-00', 0),
(15, 'La Paz (BO)', 'Free walking tour', 'https://ejemplo.com/paquetes/lapaz', 107, 1015, 2015, 1, 3015, '0000-00-00', '0000-00-00', '0000-00-00', 0),
(16, 'Ushuaia (AR)', 'Fin del mundo -10%', 'https://ejemplo.com/paquetes/ushuaia', 108, 1016, 2016, 2, 3016, '0000-00-00', '0000-00-00', '0000-00-00', 0),
(17, 'Salta & Jujuy (AR)', '3x2 en excursiones', 'https://ejemplo.com/paquetes/salta-jujuy', 101, 1017, 2017, 2, 3017, '0000-00-00', '0000-00-00', '0000-00-00', 0),
(18, 'Medellín (CO)', 'Tour de flores incluido', 'https://ejemplo.com/paquetes/medellin', 102, 1018, 2018, 1, 3018, '0000-00-00', '0000-00-00', '0000-00-00', 0),
(19, 'Bogotá (CO)', 'Descuento estudiante -10%', 'https://ejemplo.com/paquetes/bogota', 103, 1019, 2019, 1, 3019, '0000-00-00', '0000-00-00', '0000-00-00', 0),
(20, 'Mendoza (AR)', 'Bodegas + tasting', 'https://ejemplo.com/paquetes/mendoza', 104, 1020, 2020, 2, 3020, '0000-00-00', '0000-00-00', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SEGUROS`
--

CREATE TABLE `SEGUROS` (
  `id_seguro` int(11) NOT NULL,
  `repartición` text NOT NULL,
  `médico` text NOT NULL,
  `responsabilidad_civil` text NOT NULL,
  `cancelación_de_viajes` text NOT NULL,
  `equipaje` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SERVICIOS`
--

CREATE TABLE `SERVICIOS` (
  `id_servicio` int(11) NOT NULL,
  `visado_y_documentación` text NOT NULL,
  `asesoramiento` text NOT NULL,
  `id_movilidad` int(11) NOT NULL,
  `id_seguro` int(11) NOT NULL,
  `id_alojamiento` int(11) NOT NULL,
  `alquiler_de_coche` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ALOJAMIENTO`
--
ALTER TABLE `ALOJAMIENTO`
  ADD PRIMARY KEY (`id_alojamiento`);

--
-- Indices de la tabla `CARRITOS`
--
ALTER TABLE `CARRITOS`
  ADD PRIMARY KEY (`id_carrito`);

--
-- Indices de la tabla `CATEGORIAS`
--
ALTER TABLE `CATEGORIAS`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `CLIENTE`
--
ALTER TABLE `CLIENTE`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `correo` (`correo`) USING HASH;

--
-- Indices de la tabla `COMENTARIOS`
--
ALTER TABLE `COMENTARIOS`
  ADD PRIMARY KEY (`id_comentario`);

--
-- Indices de la tabla `MOVILIDADES`
--
ALTER TABLE `MOVILIDADES`
  ADD PRIMARY KEY (`id_movilidad`);

--
-- Indices de la tabla `PAGOS`
--
ALTER TABLE `PAGOS`
  ADD PRIMARY KEY (`id_pagos`);

--
-- Indices de la tabla `PAQUETEVIAJE`
--
ALTER TABLE `PAQUETEVIAJE`
  ADD PRIMARY KEY (`id_paqueviaje`);

--
-- Indices de la tabla `SEGUROS`
--
ALTER TABLE `SEGUROS`
  ADD PRIMARY KEY (`id_seguro`);

--
-- Indices de la tabla `SERVICIOS`
--
ALTER TABLE `SERVICIOS`
  ADD PRIMARY KEY (`id_servicio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ALOJAMIENTO`
--
ALTER TABLE `ALOJAMIENTO`
  MODIFY `id_alojamiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CARRITOS`
--
ALTER TABLE `CARRITOS`
  MODIFY `id_carrito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CATEGORIAS`
--
ALTER TABLE `CATEGORIAS`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CLIENTE`
--
ALTER TABLE `CLIENTE`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `COMENTARIOS`
--
ALTER TABLE `COMENTARIOS`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MOVILIDADES`
--
ALTER TABLE `MOVILIDADES`
  MODIFY `id_movilidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `PAGOS`
--
ALTER TABLE `PAGOS`
  MODIFY `id_pagos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `PAQUETEVIAJE`
--
ALTER TABLE `PAQUETEVIAJE`
  MODIFY `id_paqueviaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `SEGUROS`
--
ALTER TABLE `SEGUROS`
  MODIFY `id_seguro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `SERVICIOS`
--
ALTER TABLE `SERVICIOS`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
