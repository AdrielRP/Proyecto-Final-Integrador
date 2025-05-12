-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-05-2025 a las 19:06:51
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
-- Base de datos: `integradrobd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `ID_Cita` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `costo` int(11) DEFAULT NULL,
  `Estado` varchar(255) DEFAULT NULL,
  `Estado_pago` varchar(50) DEFAULT NULL,
  `FK_ID_Empleado` int(11) DEFAULT NULL,
  `FK_ID_Cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`ID_Cita`, `Fecha`, `Hora`, `costo`, `Estado`, `Estado_pago`, `FK_ID_Empleado`, `FK_ID_Cliente`) VALUES
(80, '2025-05-14', '12:00:00', 50, '1', '2', 1, 10),
(83, '2025-05-12', '12:00:00', 50, '1', '2', 6, 9),
(84, '2025-05-25', '12:00:00', 50, '1', '2', 5, 9),
(85, '2025-05-22', '15:00:00', 50, '1', '2', 1, 7),
(86, '2025-05-15', '16:00:00', 50, '1', '2', 6, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `ID_Empleado` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `DNI` varchar(20) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `ID_Usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`ID_Empleado`, `Nombre`, `DNI`, `Direccion`, `Telefono`, `ID_Usuario`) VALUES
(1, 'Livia', '77123122', 'livia@gmail.com', '910666918', 6),
(5, 'Iris', '77777777', '', '', 7),
(6, 'Andrea', '66666666', '', '', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `falta`
--

CREATE TABLE `falta` (
  `ID_Falta` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Tipo_falta` varchar(255) DEFAULT NULL,
  `FK_ID_Empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_cita`
--

CREATE TABLE `historial_cita` (
  `ID_Historial` int(11) NOT NULL,
  `Fecha_registro` date DEFAULT NULL,
  `Estado_cita` varchar(255) DEFAULT NULL,
  `FK_ID_Cita` int(11) DEFAULT NULL,
  `FK_ID_Servicio` int(11) DEFAULT NULL,
  `FK_ID_Pago` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcacion`
--

CREATE TABLE `marcacion` (
  `ID_Marcacion` int(11) NOT NULL,
  `Fecha_marcacion` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Tipo_marcacion` varchar(255) DEFAULT NULL,
  `FK_ID_Empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `ID_Pago` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `Subtotal` decimal(10,2) DEFAULT NULL,
  `IGV` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`ID_Pago`, `Fecha`, `hora`, `Subtotal`, `IGV`, `Total`) VALUES
(45, '2025-05-12', '10:30:21', 100.00, 18.00, 118.00),
(46, '2025-05-12', '10:51:32', 100.00, 18.00, 118.00),
(47, '2025-05-12', '10:51:45', 100.00, 18.00, 118.00),
(48, '2025-05-12', '10:52:07', 100.00, 18.00, 118.00),
(49, '2025-05-12', '10:52:21', 100.00, 18.00, 118.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_empleado`
--

CREATE TABLE `pago_empleado` (
  `ID_Pago_Empleado` int(11) NOT NULL,
  `Sueldo_base` decimal(10,2) DEFAULT NULL,
  `Total_tardanzas` int(11) DEFAULT NULL,
  `Total_faltas` int(11) DEFAULT NULL,
  `Descuento_tardanzas` decimal(10,2) DEFAULT NULL,
  `Descuento_faltas` decimal(10,2) DEFAULT NULL,
  `Sueldo_final` decimal(10,2) DEFAULT NULL,
  `FK_ID_Empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `ID_Servicio` int(11) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `Duracion` int(11) DEFAULT NULL,
  `FK_ID_Tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sueldo`
--

CREATE TABLE `sueldo` (
  `ID_Sueldo` int(11) NOT NULL,
  `Monto` decimal(10,2) DEFAULT NULL,
  `FK_ID_Empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tardanza`
--

CREATE TABLE `tardanza` (
  `ID_Tardanza` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Minutos_tarde` int(11) DEFAULT NULL,
  `FK_ID_Empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_Usuario` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `DNI` varchar(50) DEFAULT NULL,
  `Correo` varchar(255) DEFAULT NULL,
  `Contraseña` varchar(255) DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_Usuario`, `Nombre`, `DNI`, `Correo`, `Contraseña`, `Tipo`) VALUES
(6, 'Livia', '77123122', 'livia@gmail.com', '123', '2'),
(7, 'Iris', '77777777', 'iris@gmail.com', '123', '2'),
(8, 'Andrea', '66666666', 'andrea@gmail.com', '123', '2'),
(9, 'Matias', '55555555', 'matias@gmail.com', '123', '1'),
(10, 'Jorge', '22222222', 'jorge@gmail.com', '123', '1'),
(12, 'Angel', '33333333', 'angel@gmail.com', '123', '1'),
(13, 'Adriel', '72715978', 'adriel@gmail.com', '123', '3');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`ID_Cita`),
  ADD KEY `FK_ID_Cliente` (`FK_ID_Cliente`),
  ADD KEY `FK_ID_Empleado` (`FK_ID_Empleado`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`ID_Empleado`),
  ADD KEY `FK_ID_Usuario` (`ID_Usuario`);

--
-- Indices de la tabla `falta`
--
ALTER TABLE `falta`
  ADD PRIMARY KEY (`ID_Falta`),
  ADD KEY `FK_ID_Empleado` (`FK_ID_Empleado`);

--
-- Indices de la tabla `historial_cita`
--
ALTER TABLE `historial_cita`
  ADD PRIMARY KEY (`ID_Historial`),
  ADD KEY `FK_ID_Cita` (`FK_ID_Cita`),
  ADD KEY `FK_ID_Servicio` (`FK_ID_Servicio`),
  ADD KEY `FK_ID_Pago` (`FK_ID_Pago`);

--
-- Indices de la tabla `marcacion`
--
ALTER TABLE `marcacion`
  ADD PRIMARY KEY (`ID_Marcacion`),
  ADD KEY `FK_ID_Empleado` (`FK_ID_Empleado`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`ID_Pago`);

--
-- Indices de la tabla `pago_empleado`
--
ALTER TABLE `pago_empleado`
  ADD PRIMARY KEY (`ID_Pago_Empleado`),
  ADD KEY `FK_ID_Empleado` (`FK_ID_Empleado`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`ID_Servicio`),
  ADD KEY `FK_ID_Tipo` (`FK_ID_Tipo`);

--
-- Indices de la tabla `sueldo`
--
ALTER TABLE `sueldo`
  ADD PRIMARY KEY (`ID_Sueldo`),
  ADD KEY `FK_ID_Empleado` (`FK_ID_Empleado`);

--
-- Indices de la tabla `tardanza`
--
ALTER TABLE `tardanza`
  ADD PRIMARY KEY (`ID_Tardanza`),
  ADD KEY `FK_ID_Empleado` (`FK_ID_Empleado`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `ID_Cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `ID_Empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `falta`
--
ALTER TABLE `falta`
  MODIFY `ID_Falta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_cita`
--
ALTER TABLE `historial_cita`
  MODIFY `ID_Historial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marcacion`
--
ALTER TABLE `marcacion`
  MODIFY `ID_Marcacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `ID_Pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `pago_empleado`
--
ALTER TABLE `pago_empleado`
  MODIFY `ID_Pago_Empleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `ID_Servicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sueldo`
--
ALTER TABLE `sueldo`
  MODIFY `ID_Sueldo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tardanza`
--
ALTER TABLE `tardanza`
  MODIFY `ID_Tardanza` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`FK_ID_Cliente`) REFERENCES `usuario` (`ID_Usuario`),
  ADD CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`FK_ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `FK_ID_Usuario` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`);

--
-- Filtros para la tabla `falta`
--
ALTER TABLE `falta`
  ADD CONSTRAINT `falta_ibfk_1` FOREIGN KEY (`FK_ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`);

--
-- Filtros para la tabla `historial_cita`
--
ALTER TABLE `historial_cita`
  ADD CONSTRAINT `historial_cita_ibfk_1` FOREIGN KEY (`FK_ID_Cita`) REFERENCES `cita` (`ID_Cita`),
  ADD CONSTRAINT `historial_cita_ibfk_2` FOREIGN KEY (`FK_ID_Servicio`) REFERENCES `servicio` (`ID_Servicio`),
  ADD CONSTRAINT `historial_cita_ibfk_3` FOREIGN KEY (`FK_ID_Pago`) REFERENCES `pago` (`ID_Pago`);

--
-- Filtros para la tabla `marcacion`
--
ALTER TABLE `marcacion`
  ADD CONSTRAINT `marcacion_ibfk_1` FOREIGN KEY (`FK_ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`);

--
-- Filtros para la tabla `pago_empleado`
--
ALTER TABLE `pago_empleado`
  ADD CONSTRAINT `pago_empleado_ibfk_1` FOREIGN KEY (`FK_ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`);

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`FK_ID_Tipo`) REFERENCES `tipo_servicio` (`ID_Tipo`);

--
-- Filtros para la tabla `sueldo`
--
ALTER TABLE `sueldo`
  ADD CONSTRAINT `sueldo_ibfk_1` FOREIGN KEY (`FK_ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`);

--
-- Filtros para la tabla `tardanza`
--
ALTER TABLE `tardanza`
  ADD CONSTRAINT `tardanza_ibfk_1` FOREIGN KEY (`FK_ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
