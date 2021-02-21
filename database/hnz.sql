-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-02-2020 a las 04:16:26
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hnz`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_est` int(150) NOT NULL,
  `estado` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_est`, `estado`) VALUES
(1, 'activo'),
(2, 'inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `codigo` varchar(7) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `unidad` varchar(20) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_user` int(3) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_user` int(3) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_est` int(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`codigo`, `nombre`, `unidad`, `stock`, `created_user`, `created_date`, `updated_user`, `updated_date`, `id_est`) VALUES
('B000362', 'Dulvanex', 'cajas', 4, 1, '2019-09-24 16:43:20', 1, '2019-11-09 16:24:16', 1),
('B000363', 'Controlip', 'cajas', 13, 1, '2019-07-24 16:56:58', 1, '2019-11-03 03:09:24', 1),
('B000364', 'Quetiazic', 'cajas', 30, 1, '2019-07-25 02:59:48', 1, '2019-11-03 03:09:24', 1),
('B000367', 'Acetaminofen', 'caja', 14, 1, '2019-10-21 16:18:30', 1, '2019-11-03 03:09:24', 1),
('B000368', 'birogrip', 'caja', 25, 3, '2019-10-21 16:29:34', 3, '2019-11-09 17:03:51', 1),
('B000369', 'dimenhidrinato', 'caja', 2, 3, '2019-10-21 17:29:01', 3, '2019-11-03 03:09:24', 1),
('B000371', 'iboprofeno', 'cajas', 23, 1, '2019-11-08 15:03:06', 1, '2019-11-08 15:03:53', 1),
('B000372', 'acido acestilsalicilico', 'botellas', 12, 1, '2019-11-09 16:31:35', 1, '2019-11-09 17:03:03', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion_medicamentos`
--

CREATE TABLE `transaccion_medicamentos` (
  `codigo_transaccion` varchar(15) NOT NULL,
  `fecha` date NOT NULL,
  `codigo` varchar(7) NOT NULL,
  `numero` int(11) NOT NULL,
  `created_user` int(3) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tipo_transaccion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `transaccion_medicamentos`
--

INSERT INTO `transaccion_medicamentos` (`codigo_transaccion`, `fecha`, `codigo`, `numero`, `created_user`, `created_date`, `tipo_transaccion`) VALUES
('TM-2019-0000001', '2019-10-21', 'B000362', 2, 3, '2019-10-21 00:13:00', 'Entrada'),
('TM-2019-0000002', '2019-10-21', 'B000363', 10, 3, '2019-10-21 00:13:24', 'Entrada'),
('TM-2019-0000005', '2019-10-21', 'B000367', 14, 1, '2019-10-21 16:19:10', 'Entrada'),
('TM-2019-0000006', '2019-10-21', 'B000368', 44, 3, '2019-10-21 16:30:06', 'Entrada'),
('TM-2019-0000007', '2019-10-21', 'B000368', 12, 3, '2019-10-21 16:30:26', 'Salida'),
('TM-2019-0000008', '2019-10-21', 'B000369', 7, 3, '2019-10-21 17:29:28', 'Entrada'),
('TM-2019-0000009', '2019-10-21', 'B000369', 5, 3, '2019-10-21 17:30:04', 'Salida'),
('TM-2019-0000013', '2019-11-08', 'B000371', 23, 1, '2019-11-08 15:03:53', 'Entrada'),
('TM-2019-0000014', '2019-11-09', 'B000368', 10, 1, '2019-11-09 16:21:42', 'Entrada'),
('TM-2019-0000015', '2019-11-09', 'B000362', 12, 1, '2019-11-09 16:23:57', 'Entrada'),
('TM-2019-0000016', '2019-11-09', 'B000362', 22, 1, '2019-11-09 16:24:16', 'Salida'),
('TM-2019-0000017', '2019-11-09', 'B000372', 12, 1, '2019-11-09 16:32:31', 'Entrada'),
('TM-2019-0000018', '2019-11-09', 'B000368', 40, 1, '2019-11-09 16:42:33', 'Salida'),
('TM-2019-0000019', '2019-11-09', 'B000368', 23, 1, '2019-11-09 17:03:51', 'Entrada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_user` int(3) NOT NULL,
  `username` varchar(50) NOT NULL,
  `name_user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` varchar(13) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `permisos_acceso` enum('Super Admin','Gerente','Almacen') NOT NULL,
  `status` enum('activo','bloqueado') NOT NULL DEFAULT 'activo',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_user`, `username`, `name_user`, `password`, `email`, `telefono`, `foto`, `permisos_acceso`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', '21232f297a57a5a743894a0e4a801fc3', 'ejemplo@ejemplo.com', '77213529', 'user-default.png', 'Super Admin', 'activo', '2017-04-01 08:15:15', '2019-10-21 16:25:37'),
(3, 'juan', 'juan carlos', '3d81ce8c68f69bf6c36057b9b668b2ba', '', '', NULL, 'Almacen', 'activo', '2019-10-21 00:03:48', '2019-10-21 17:43:11'),
(4, 'ricardo', 'Ricardo', '250ab81b53ede16bee305d7ca7262b93', NULL, NULL, NULL, 'Super Admin', 'activo', '2019-10-21 15:36:10', '2019-10-21 15:36:10'),
(5, 'kelvin', 'kelvin ramos', '81dc9bdb52d04dc20036dbd8313ed055', '', '', NULL, 'Almacen', 'activo', '2019-10-21 17:44:31', '2019-10-21 17:45:09'),
(6, 'ricardo', 'ricardo', '202cb962ac59075b964b07152d234b70', '', '', NULL, 'Super Admin', 'bloqueado', '2019-11-07 01:32:19', '2019-11-09 16:44:39'),
(7, 'tania', 'tania', '250cf8b51c773f3f8dc8b4be867a9a02', NULL, NULL, NULL, 'Almacen', 'activo', '2019-11-08 15:07:08', '2019-11-08 15:13:26'),
(8, 'hola', 'hola', '4d186321c1a7f0f354b297e8914ab240', NULL, NULL, NULL, 'Almacen', 'activo', '2019-11-08 15:14:05', '2019-11-08 15:14:05');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_est`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `created_user` (`created_user`),
  ADD KEY `updated_user` (`updated_user`),
  ADD KEY `id_est` (`id_est`);

--
-- Indices de la tabla `transaccion_medicamentos`
--
ALTER TABLE `transaccion_medicamentos`
  ADD PRIMARY KEY (`codigo_transaccion`),
  ADD KEY `id_barang` (`codigo`),
  ADD KEY `created_user` (`created_user`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `level` (`permisos_acceso`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_user` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD CONSTRAINT `estado_fk` FOREIGN KEY (`id_est`) REFERENCES `estado` (`id_est`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medicamentos_ibfk_1` FOREIGN KEY (`created_user`) REFERENCES `usuarios` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medicamentos_ibfk_2` FOREIGN KEY (`updated_user`) REFERENCES `usuarios` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `transaccion_medicamentos`
--
ALTER TABLE `transaccion_medicamentos`
  ADD CONSTRAINT `transaccion_medicamentos_ibfk_1` FOREIGN KEY (`codigo`) REFERENCES `medicamentos` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaccion_medicamentos_ibfk_2` FOREIGN KEY (`created_user`) REFERENCES `usuarios` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
