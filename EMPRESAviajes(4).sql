-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 26-11-2025 a las 15:34:08
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

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
-- Estructura de tabla para la tabla `CARRITOS`
--

CREATE TABLE `CARRITOS` (
  `id_carrito` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `detalle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CATEGORIAS`
--

CREATE TABLE `CATEGORIAS` (
  `id_categoria` int(11) NOT NULL,
  `tipo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `CATEGORIAS`
--

INSERT INTO `CATEGORIAS` (`id_categoria`, `tipo`) VALUES
(1, 'Familiar'),
(2, 'Individual'),
(3, 'Pareja'),
(4, 'Laboral'),
(5, 'Amistad'),
(6, 'Escolar'),
(7, 'Jubilados'),
(8, 'Pet Friendly');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `COMENTARIOS`
--

CREATE TABLE `COMENTARIOS` (
  `id_comentario` int(11) NOT NULL,
  `id_paqueteviaje` int(11) NOT NULL,
  `texto_reseña` text NOT NULL,
  `fecha_reseña` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PAGOS`
--

CREATE TABLE `PAGOS` (
  `id_pago` int(11) NOT NULL,
  `valor_pago` enum('transferencia','efectivo','tarjeta','') NOT NULL,
  `fecha_cobro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PAQUETEVIAJE`
--

CREATE TABLE `PAQUETEVIAJE` (
  `id_paqueteviaje` int(11) NOT NULL,
  `titulo_lugar` varchar(50) NOT NULL,
  `precio` varchar(50) NOT NULL,
  `ur_caracterización` text NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_carrito` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_comentario` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_limite` date NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `ur_imagen` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `PAQUETEVIAJE`
--

INSERT INTO `PAQUETEVIAJE` (`id_paqueteviaje`, `titulo_lugar`, `precio`, `ur_caracterización`, `id_usuario`, `id_carrito`, `id_categoria`, `id_comentario`, `fecha_inicio`, `fecha_fin`, `fecha_limite`, `estado`, `ur_imagen`) VALUES
(101, 'Buenos Aires, Argentina', '120', 'Sumérjase en el corazón vibrante de Argentina. Buenos Aires no solo se visita, se vive. Sienta la intensidad de un tango en San Telmo, deleitándose con el aroma a parrilla que se eleva entre sus majestuosas avenidas de estilo europeo. Explore librerías históricas, la elegancia de Recoleta y la explosión de arte de La Boca. Cada esquina cuenta una historia de pasión, cultura y noches interminables. Su viaje a la metrópolis más porteña de todas le espera.', 1, 1, 1, 1, '2026-01-05', '2026-01-12', '2025-12-20', 1, 'https://example.com/buenosaires.jpg'),
(102, 'Bariloche, Argentina', '150', 'Déjese cautivar por el paisaje suizo en plena Patagonia. Rodeada por el imponente Cerro Catedral y lagos de color turquesa como el Nahuel Huapi, Bariloche es magia pura en cualquier estación. En invierno, es pura nieve y chocolate artesanal; en verano, un paraíso de senderismo y aventuras acuáticas. Prepárese para las vistas más fotogénicas de su vida y el mejor sabor a dulce de leche.', 1, 1, 1, 2, '2026-02-10', '2026-02-17', '2026-01-25', 1, 'https://example.com/bariloche.jpg'),
(103, 'Iguazú, Argentina', '180', 'Venga a presenciar una de las maravillas naturales más impactantes del planeta. Sienta la brisa húmeda y la energía atronadora de las Cataratas del Iguazú, un espectáculo de más de 275 saltos de agua. Desde la Garganta del Diablo hasta los balcones que se adentran en el verde infinito, esta experiencia es una conexión profunda con el poder indomable de la selva. Una aventura que resonará en sus sentidos por siempre.', 1, 1, 1, 3, '2026-03-01', '2026-03-08', '2026-02-10', 1, 'https://example.com/iguazu.jpg'),
(104, 'Cusco y Machu Picchu, Perú', '200', 'Viaje al centro del antiguo Imperio Inca. Cusco, la capital histórica, es un fascinante crisol de arquitectura colonial y cimientos incas milenarios. Desde allí, inicie la travesía mística hacia Machu Picchu. Con cada escalón, sentirá la energía de la ciudadela perdida, flotando entre nubes andinas. Descubra el secreto mejor guardado de los Incas y cambie su perspectiva de la historia.', 1, 1, 1, 4, '2026-03-20', '2026-03-27', '2026-03-01', 1, 'https://example.com/machu.jpg'),
(105, 'Río de Janeiro, Brasil', '220', 'Prepárese para la energía contagiosa de la Cidade Maravilhosa. Desde la cumbre del Cristo Redentor hasta las icónicas arenas de Copacabana e Ipanema, Río es sinónimo de alegría, samba y playas vibrantes. Viva el contraste entre la metrópolis moderna y la exuberancia natural de sus morros. El ritmo de Brasil le está esperando para hacerlo bailar.', 1, 1, 1, 5, '2026-04-05', '2026-04-12', '2026-03-20', 1, 'https://example.com/rio.jpg'),
(106, 'Cartagena, Colombia', '250', 'Camine por las calles empedradas de una ciudad donde el tiempo parece haberse detenido. Cartagena es un sueño colonial vibrante, con balcones floridos, plazas llenas de vida y atardeceres dorados sobre el Mar Caribe. De noche, la ciudad amurallada se ilumina, invitándole a disfrutar de la mejor gastronomía y coctelería. Una Cartagena para enamorarse a primera vista.', 1, 1, 1, 6, '2026-04-20', '2026-04-27', '2026-04-01', 1, 'https://example.com/cartagena.jpg'),
(107, 'Punta Cana, República Dominicana', '275', 'Imagínese: kilómetros de playas de arena fina como talco, mecidos por el suave balanceo de palmeras y un mar en tonalidades de azul turquesa. Punta Cana es el epítome del relax absoluto. Aquí, cada resort es un oasis y cada día es una invitación a desconectar y disfrutar del sol caribeño. Su dosis de vitamina D y tranquilidad garantizada.', 1, 1, 1, 7, '2026-05-05', '2026-05-10', '2026-04-15', 1, 'https://example.com/puntacana.jpg'),
(108, 'Cancún, México', '300', 'Desde las aguas color zafiro de sus playas hasta las ruinas milenarias de Chichén Itzá, Cancún ofrece la combinación perfecta. Disfrute de sus modernos hoteles, explore la mística cultura Maya o sumérjase en los misteriosos cenotes de la Riviera Maya. Una aventura mexicana tan emocionante como relajante.', 1, 1, 1, 8, '2026-05-15', '2026-05-25', '2026-04-25', 1, 'https://example.com/cancun.jpg'),
(109, 'Montevideo, Uruguay', '320', 'Ciudad Descubra la capital uruguaya, un refugio de paz con una historia rica y una vibra bohemia. Recorra la Ciudad Vieja, disfrute de un asado de clase mundial y termine el día en la rambla, viendo la puesta de sol sobre el Río de la Plata. Montevideo es calidad de vida, cultura accesible y el mate compartido en cada esquina. La capital ideal para un viaje con calma y buen gusto.\r\nhistórica y costera', 1, 1, 1, 9, '2026-06-01', '2026-06-10', '2026-05-10', 1, 'https://example.com/montevideo.jpg'),
(110, 'Santiago de Chile, Chile', '350', 'Sienta el pulso de una de las capitales más modernas de Sudamérica, enmarcada por el imponente telón de fondo de la Cordillera de los Andes. Explore barrios históricos, suba al Cerro San Cristóbal para una vista panorámica, y luego piérdase entre sus premiados viñedos a pocos minutos del centro. Santiago es el equilibrio perfecto entre ciudad y naturindomable.', 1, 1, 1, 10, '2026-06-20', '2026-06-30', '2026-06-01', 1, 'https://example.com/santiago.jpg'),
(111, 'San Pedro de Atacama, Chile', '380', 'Cruzará a otro planeta. El Desierto de Atacama, el más árido del mundo, le regala paisajes lunares, géiseres humeantes al amanecer y lagunas de sal donde los flamencos bailan. Al caer la noche, el cielo se abre para revelar una cúpula de estrellas sin igual. Una experiencia cósmica que redefine la belleza natural.', 1, 1, 1, 11, '2026-07-01', '2026-07-10', '2026-06-15', 0, 'https://example.com/atacama.jpg'),
(112, 'Lima, Perú', '400', 'Lima es el epicentro de la revolución culinaria mundial. Déjese seducir por sus sabores innovadores en Miraflores y Barranco, y luego explore el centro histórico declarado Patrimonio de la Humanidad. Desde ceviches frescos hasta vistas al océano, Lima es una inmersión total en la cultura peruana. Venga con apetito, ¡se irá maravillado!', 1, 1, 1, 12, '2026-07-15', '2026-07-25', '2026-07-01', 1, 'https://example.com/lima.jpg'),
(113, 'Quito, Ecuador', '450', 'A más de 2,800 metros de altura, la capital de Ecuador alberga uno de los centros históricos mejor conservados de América. Recorra iglesias doradas y plazas vibrantes. Luego, cruce la línea imaginaria del Ecuador en la Mitad del Mundo y sienta la energía única de estar en dos hemisferios a la vez. Una ciudad de leyendas y altitudes impresionantes.', 1, 1, 1, 13, '2026-08-05', '2026-08-12', '2026-07-20', 1, 'https://example.com/quito.jpg'),
(114, 'Islas Galápagos, Ecuador', '480', 'Sumérjase en el archipiélago que inspiró a Darwin. Aquí, la fauna no teme al hombre. Nadará con lobos marinos juguetones, caminará junto a iguanas marinas y observará tortugas gigantes en su hábitat natural. Una expedición única para los amantes de la naturaleza en su estado más puro.', 1, 1, 1, 14, '2026-08-15', '2026-08-22', '2026-08-01', 1, 'https://example.com/galapagos.jpg'),
(115, 'La Paz, Bolivia', '500', 'Experimente la ciudad que desafía la gravedad. Recorra sus mercados vibrantes, donde la cultura Aymara se revela en cada puesto, y observe el paisaje dramático desde su innovador sistema de teleféricos. La Paz no es solo un destino; es una altura de la que nunca querrá bajar.', 1, 1, 1, 15, '2026-09-01', '2026-09-08', '2026-08-20', 1, 'https://example.com/lapaz.jpg'),
(116, 'Ushuaia, Argentina', '550', 'Prepárese para la aventura polar en la ciudad más austral del planeta. Ubicada entre montañas nevadas y las aguas frías del Canal Beagle, Ushuaia es la puerta de entrada a la Antártida y un paraíso para senderistas y amantes de la naturaleza indómita. Si busca el extremo, lo ha encontrado.', 1, 1, 1, 16, '2026-09-10', '2026-09-17', '2026-09-01', 0, 'https://example.com/ushuaia.jpg'),
(117, 'Jujuy y Salta, Argentina', '600', 'Déjese abrazar por la calidez de la cultura norteña. En Salta, disfrute de sus fiestas y peñas folclóricas. En Jujuy, asómbrese con la Quebrada de Humahuaca, hogar de la icónica Montaña de Siete Colores y valles rojizos. Una inmersión en tradiciones auténticas y paisajes geológicos de otro mundo.', 1, 1, 1, 17, '2026-10-01', '2026-10-10', '2026-09-15', 1, 'https://example.com/jujuy.jpg'),
(118, 'Medellín, Colombia', '650', 'Descubra la transformación de una ciudad que hoy brilla con luz propia. Medellín le recibe con un clima perfecto, gente cálida y una energía creativa palpable. Recorra sus comunas con una nueva perspectiva y disfrute de la cultura paisa. La innovación se une a la belleza natural en el Valle de Aburrá.', 1, 1, 1, 18, '2026-10-20', '2026-10-30', '2026-10-05', 1, 'https://example.com/medellin.jpg'),
(119, 'Bogotá, Colombia', '700', 'A más de 2,600 metros, Bogotá es una metrópolis que fusiona lo antiguo y lo vanguardista. Explore el encanto colonial de La Candelaria, descubra tesoros en el Museo del Oro y admire la ciudad desde Monserrate. Una capital sofisticada con raíces profundas que le invitan a explorar.', 1, 1, 1, 19, '2026-11-05', '2026-11-15', '2026-10-20', 0, 'https://example.com/bogota.jpg'),
(120, 'Mendoza, Argentina', '800', 'Si el buen vino es su destino, ha llegado a casa. Mendoza es sinónimo de viñedos infinitos, donde el sol intenso y el deshielo andino crean algunos de los mejores vinos del mundo. Disfrute de una cabalgata, una degustación o simplemente la majestuosa vista del Aconcagua. Brindemos por su próxima gran aventura.', 1, 1, 1, 20, '2026-12-01', '2026-12-10', '2026-11-15', 1, 'https://example.com/mendoza.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PAQUETE_SERVICIO`
--

CREATE TABLE `PAQUETE_SERVICIO` (
  `id_servicio` int(11) NOT NULL,
  `id_paqueteviaje` int(11) NOT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SERVICIOS`
--

CREATE TABLE `SERVICIOS` (
  `id_servicio` int(11) NOT NULL,
  `tipo` varchar(150) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text NOT NULL,
  `proveedor` varchar(150) NOT NULL,
  `precio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `SERVICIOS`
--

INSERT INTO `SERVICIOS` (`id_servicio`, `tipo`, `nombre`, `descripcion`, `proveedor`, `precio`) VALUES
(1, 'Alojamiento', 'Hotel Gran Paraíso', 'Sumérjase en el corazón vibrante de Argentina. Buenos Aires no solo se visita, se vive. Sienta la intensidad de un tango en San Telmo, deleitándose con el aroma a parrilla que se eleva entre sus majestuosas avenidas de estilo europeo. Explore librerías históricas, la elegancia de Recoleta y la explosión de arte de La Boca. Cada esquina cuenta una historia de pasión, cultura y noches interminables. Su viaje a la metrópolis más porteña de todas le espera.', 'Booking.com', 150000),
(2, 'Transporte', 'Vuelo Buenos Aires - Madrid', 'Déjese cautivar por el paisaje suizo en plena Patagonia. Rodeada por el imponente Cerro Catedral y lagos de color turquesa como el Nahuel Huapi, Bariloche es magia pura en cualquier estación. En invierno, es pura nieve y chocolate artesanal; en verano, un paraíso de senderismo y aventuras acuáticas. Prepárese para las vistas más fotogénicas de su vida y el mejor sabor a dulce de leche.', 'Aerolíneas Argentinas', 450000),
(3, 'Excursión', 'Tour Ciudad Histórica', 'Venga a presenciar una de las maravillas naturales más impactantes del planeta. Sienta la brisa húmeda y la energía atronadora de las Cataratas del Iguazú, un espectáculo de más de 275 saltos de agua. Desde la Garganta del Diablo hasta los balcones que se adentran en el verde infinito, esta experiencia es una conexión profunda con el poder indomable de la selva. Una aventura que resonará en sus sentidos por siempre.', 'CityTours SA', 80000),
(4, 'Gastronomía', 'Cena Gourmet', 'Viaje al centro del antiguo Imperio Inca. Cusco, la capital histórica, es un fascinante crisol de arquitectura colonial y cimientos incas milenarios. Desde allí, inicie la travesía mística hacia Machu Picchu. Con cada escalón, sentirá la energía de la ciudadela perdida, flotando entre nubes andinas. Descubra el secreto mejor guardado de los Incas y cambie su perspectiva de la historia.', 'Sabores del Mundo', 60000),
(5, 'Seguro', 'Seguro de Viaje Internacional', 'Prepárese para la energía contagiosa de la Cidade Maravilhosa. Desde la cumbre del Cristo Redentor hasta las icónicas arenas de Copacabana e Ipanema, Río es sinónimo de alegría, samba y playas vibrantes. Viva el contraste entre la metrópolis moderna y la exuberancia natural de sus morros. El ritmo de Brasil le está esperando para hacerlo bailar.', 'TravelSafe', 50000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARIOS`
--

CREATE TABLE `USUARIOS` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `correo` varchar(155) NOT NULL,
  `teléfono` varchar(20) DEFAULT NULL,
  `id_carrito` int(11) DEFAULT NULL,
  `id_paqueteviaje` int(11) DEFAULT NULL,
  `id_pago` int(11) DEFAULT NULL,
  `contraseña` varchar(255) NOT NULL,
  `rol` varchar(50) DEFAULT 'cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `USUARIOS`
--

INSERT INTO `USUARIOS` (`id_usuario`, `nombre`, `correo`, `teléfono`, `id_carrito`, `id_paqueteviaje`, `id_pago`, `contraseña`, `rol`) VALUES
(1, 'Mariana López', 'mariana.lopez@gmail.com', '3516789023', 1, 101, 5001, 'Mari2025*', 'cliente'),
(2, 'Lucas Fernández', 'lucas.fer.es@gmail.com', '3514597789', 2, 102, 5002, 'Luk1234!', 'cliente'),
(3, 'Carla Rivas', 'carla.rivas@empresa.com', '3544776211', 3, 201, 6001, 'Carla_emp2024', 'empleado'),
(4, 'Pablo Herrera', 'pabloherrera@yahoo.com', '3512248901', 4, 103, 5003, 'Pablo.H2025', 'cliente'),
(5, 'Valentina Sosa', 'vsosa@empresa.com', '3519987342', 5, 202, 6002, 'Valen_Empleado01', 'empleado'),
(6, 'José Martínez', 'jose_mtz@gmail.com', '3516654478', 6, 104, 5004, 'Jose1999$', 'cliente'),
(7, 'Camila Pérez', 'camila.perez@empresa.com', '3543899012', 7, 203, 6003, 'CamiAdmin_01', 'empleado'),
(8, 'Martín Castro', 'martincastro@hotmail.com', '3517102387', 8, 105, 5005, 'Mcastro88#', 'cliente');

--
-- Índices para tablas volcadas
--

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
-- Indices de la tabla `COMENTARIOS`
--
ALTER TABLE `COMENTARIOS`
  ADD PRIMARY KEY (`id_comentario`);

--
-- Indices de la tabla `PAGOS`
--
ALTER TABLE `PAGOS`
  ADD PRIMARY KEY (`id_pago`);

--
-- Indices de la tabla `PAQUETEVIAJE`
--
ALTER TABLE `PAQUETEVIAJE`
  ADD PRIMARY KEY (`id_paqueteviaje`);

--
-- Indices de la tabla `PAQUETE_SERVICIO`
--
ALTER TABLE `PAQUETE_SERVICIO`
  ADD KEY `fk_servicio_paquete` (`id_servicio`),
  ADD KEY `fk_paquete_servicio` (`id_paqueteviaje`);

--
-- Indices de la tabla `SERVICIOS`
--
ALTER TABLE `SERVICIOS`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `USUARIOS`
--
ALTER TABLE `USUARIOS`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `CARRITOS`
--
ALTER TABLE `CARRITOS`
  MODIFY `id_carrito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CATEGORIAS`
--
ALTER TABLE `CATEGORIAS`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `COMENTARIOS`
--
ALTER TABLE `COMENTARIOS`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `PAGOS`
--
ALTER TABLE `PAGOS`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `PAQUETEVIAJE`
--
ALTER TABLE `PAQUETEVIAJE`
  MODIFY `id_paqueteviaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT de la tabla `SERVICIOS`
--
ALTER TABLE `SERVICIOS`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `USUARIOS`
--
ALTER TABLE `USUARIOS`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `PAQUETE_SERVICIO`
--
ALTER TABLE `PAQUETE_SERVICIO`
  ADD CONSTRAINT `fk_paquete_servicio` FOREIGN KEY (`id_paqueteviaje`) REFERENCES `PAQUETEVIAJE` (`id_paqueteviaje`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_servicio_paquete` FOREIGN KEY (`id_servicio`) REFERENCES `SERVICIOS` (`id_servicio`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
