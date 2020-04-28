-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-04-2020 a las 01:35:42
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_master`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(255) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Manga corta'),
(2, 'Manga larga'),
(5, 'Gorras'),
(6, 'Polos'),
(8, 'Camisa'),
(9, 'Camiseta'),
(12, 'Medias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineas_pedidos`
--

CREATE TABLE `lineas_pedidos` (
  `id` int(255) NOT NULL,
  `pedido_id` int(255) NOT NULL,
  `producto_id` int(255) NOT NULL,
  `unidades` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `lineas_pedidos`
--

INSERT INTO `lineas_pedidos` (`id`, `pedido_id`, `producto_id`, `unidades`) VALUES
(1, 1, 1, 2),
(2, 1, 4, 1),
(3, 1, 2, 1),
(4, 2, 4, 2),
(5, 2, 2, 1),
(10, 5, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(255) NOT NULL,
  `usuario_id` int(255) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `localidad` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `coste` float(200,2) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `usuario_id`, `provincia`, `localidad`, `direccion`, `coste`, `estado`, `fecha`, `hora`) VALUES
(1, 17, 'Lima', 'Lima', 'Jr. Los nectandros 1668', 230.00, 'ready', '2020-04-05', '15:10:57'),
(2, 19, 'Lima', 'Lima', 'Jr. las luciernagas 1225', 190.00, 'preparation', '2020-04-05', '15:21:39'),
(3, 1, 'sadasd', 'sadsad', 'asdsadsda', 135.00, 'confirm', '2020-04-24', '17:19:13'),
(4, 1, 'aaaaas', 'sdssa', 'sssssa', 135.00, 'confirm', '2020-04-24', '17:19:38'),
(5, 1, 'lima', 'lima', 'lima', 100.00, 'confirm', '2020-04-24', '17:20:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(255) NOT NULL,
  `categoria_id` int(255) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` float(100,2) NOT NULL,
  `stock` int(255) NOT NULL,
  `oferta` varchar(2) DEFAULT NULL,
  `fecha` date NOT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `categoria_id`, `nombre`, `descripcion`, `precio`, `stock`, `oferta`, `fecha`, `imagen`) VALUES
(1, 6, 'Polo adidas negro', 'Polo adidas negro', 50.00, 23, NULL, '2020-03-27', 'adidas-polo.jpg'),
(2, 6, 'Polo Adidas Blanco', 'Polo Adidas Blanco', 70.00, 43, NULL, '2020-03-27', 'adidas1.jpg'),
(3, 9, 'Camiseta Adidas', 'Camiseta Adidas azulito', 100.00, 55, NULL, '2020-03-27', 'adidas2.jpg'),
(4, 6, 'Polo Puma', 'polo puma color white', 60.00, 50, NULL, '2020-03-28', 'puma.jpg'),
(6, 5, 'Gorra New Era', 'Gorra New era talla S', 60.00, 100, NULL, '2020-04-01', ''),
(7, 6, 'Power Girl', 'polo para chicas', 20.00, 50, NULL, '2020-04-20', 'polo-powergirl.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(255) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(20) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellidos`, `email`, `password`, `rol`, `imagen`) VALUES
(1, 'Admin', 'Admin', 'admin@admin.com', 'contraseña', 'admin', NULL),
(2, 'harold', 'alfaro', 'prueba@gmail.com', '$2y$04$FdZEuGQWnH4tdxjSjW3ezeFCRV7PgsGgWfRc.hXGh8w88s.eRyCTe', 'user', NULL),
(3, 'crisa', 'alfaro', 'pruesaba@gmail.com', '$2y$04$3hKy45Y0uszor3CmX8MryuGENCv/omRoWqh/l9Gv7LHj44ddfdonq', 'user', NULL),
(4, 'pedro', 'collantes', 'pedrito@gmail.com', '$2y$04$wBOiBMR.WWEj8Aa/Jgnw3OzoPNWLw4GAvbaID164GdkIpeEpVJfjO', 'user', NULL),
(5, 'afasfas', '123asd', 'pasda@gmail.com', '$2y$04$VkMd.d6S.f.r5s3AX2TcTuRLCQ599lgjukWiaeWcyvVVjGwuLVP2W', 'user', NULL),
(7, 'sdadsa', 'sadasas', 'asdasd@gmail.com', '$2y$04$MBjMfX8q6He101Fd1S/I4.X3vur/Y2LjhyDtFDfELt05GL03YZKQm', 'user', NULL),
(9, 'hola', 'hola', 'hola@gmail.com', '$2y$04$qAgKKsOPA3OXlQebQSWvLejcdBQbQ1t265qPWIttCMtW5fPM3Hrrm', 'user', NULL),
(10, 'hdp', 'hdp', 'hdp@gmail.com', '$2y$04$YsQKjTmVwvB9I5yky8rHbe0BS6pxPrBvE6GicBT/H/U1F9/QKtphm', 'user', NULL),
(11, 'Esteven', 'Adrianazen', 'steven@gmail.com', '$2y$04$eKD/iuDOHfrZ/aBqYobjBOcrHOcrx.n9YVQRKWeAsPv7DfHiDUdnO', 'user', NULL),
(12, 'Yesabela', 'Flores', 'yesabela@gmail.com', '$2y$04$fnXx.Wj/7QJQEfhMeJArJerMpo1C24eO1BWThuHE7nNR5tbFhjK1e', 'user', NULL),
(13, 'asdad123', 'sdasd12312', 'harold13_98@hotmail.com', '$2y$04$3HjezU3RVl4hFQDpkYXfwepa9KcYvSycIXXCA2M3ZNHy3leRsHQ4u', 'user', NULL),
(14, 'Angie', 'Chacon', 'angie@gmail.com', '$2y$04$GVTcWymFIoBaL.lWCPMzoOUw1fCUdKBcG.7MfTnn/J4QqyKwhcPJS', 'user', NULL),
(15, 'harold', 'panta', 'harolcito@gmail.com', '$2y$04$UQFFHrNB8V0sPtBcFm3n9OIUD2FfD0xPniIbhvlULuxcr4TD6GkGS', 'user', NULL),
(16, 'corta', 'labocha', 'wachin@gmail.com', '$2y$04$DcWGezXHdBPSV167hQw1QOLvlsK1QPYktXp3oB/BL/62iEKgGPhUO', 'user', NULL),
(17, 'diego', 'alfaro', 'diego@gmail.com', '$2y$04$YPNEQPAi4KdgG85EO6suLeuwB2XhdoRpPWUfUBcnTqx4XO0ERCNLa', 'admin', NULL),
(18, 'lolito', 'fernandez', 'lolito@gmail.com', '$2y$04$zk6/Al.GTnPQoo4Frep66e8mHJD2kANMaVNxkHQnd0ke9ovc0JDXO', 'user', NULL),
(19, 'fabiana', 'lopez', 'fabia@fabiana.com', '$2y$04$6X1YEkUap4QxuOo4bqeGceqdMXHgKA/d9ut1cQOG4JOhbPxObKVyS', 'user', NULL),
(20, 'franco', 'dominguez', 'franco@gmail.com', '$2y$04$/KwOdd5Q7loydWz.c160ZulrDbYCsueO7P.mlxyHvD51eI/CoevM.', 'user', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lineas_pedidos`
--
ALTER TABLE `lineas_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_linea_pedido_` (`pedido_id`),
  ADD KEY `fk_linea_producto` (`producto_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pedido_usuario` (`usuario_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_categoria` (`categoria_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `lineas_pedidos`
--
ALTER TABLE `lineas_pedidos`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `lineas_pedidos`
--
ALTER TABLE `lineas_pedidos`
  ADD CONSTRAINT `fk_linea_pedido_` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `fk_linea_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedido_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
