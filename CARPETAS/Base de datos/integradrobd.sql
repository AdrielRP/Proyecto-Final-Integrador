-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2025 a las 17:41:36
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
-- Estructura de tabla para la tabla `boleta_de_pago`
--

CREATE TABLE `boleta_de_pago` (
  `ID_Boleta` int(11) NOT NULL,
  `RUC_Empresa` varchar(20) DEFAULT NULL,
  `Razon_Social` varchar(255) DEFAULT NULL,
  `ID_Empleado` int(11) NOT NULL,
  `Horas_Totales` decimal(5,2) NOT NULL,
  `Sueldo_Total` decimal(10,2) NOT NULL,
  `Descuento` decimal(10,2) DEFAULT 0.00,
  `Horas_Extra` decimal(5,2) DEFAULT 0.00,
  `Periodo` varchar(20) NOT NULL,
  `Aportes_Sociales` decimal(10,2) DEFAULT NULL,
  `Descuento_AFP_ONP` decimal(10,2) DEFAULT NULL,
  `Descuento_Renta` decimal(10,2) DEFAULT NULL,
  `Descuento_Otros` decimal(10,2) DEFAULT NULL,
  `Vida_Ley` decimal(10,2) DEFAULT NULL,
  `Neto_Pagar` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `boleta_de_pago`
--

INSERT INTO `boleta_de_pago` (`ID_Boleta`, `RUC_Empresa`, `Razon_Social`, `ID_Empleado`, `Horas_Totales`, `Sueldo_Total`, `Descuento`, `Horas_Extra`, `Periodo`, `Aportes_Sociales`, `Descuento_AFP_ONP`, `Descuento_Renta`, `Descuento_Otros`, `Vida_Ley`, `Neto_Pagar`) VALUES
(1, '20481234567', 'LOANA SALON Y SPA', 10, 0.02, 200.12, 376.23, 0.00, '6/2025', 20.71, 26.36, 0.00, 349.88, 2.70, -176.11),
(2, '20481234567', 'LOANA SALON Y SPA', 11, 0.00, 100.00, 363.17, 0.00, '6/2025', 1.35, 13.17, 0.00, 350.00, 1.35, -263.17),
(3, '20481234567', 'LOANA SALON Y SPA', 10, 0.02, 200.12, 376.23, 0.00, '6/2025', 20.71, 26.36, 0.00, 349.88, 2.70, -176.11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `ID_Cita` int(11) NOT NULL,
  `FK_ID_Empleado` int(11) DEFAULT NULL,
  `FK_ID_Cliente` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `costo` int(11) DEFAULT NULL,
  `Estado` varchar(255) DEFAULT NULL,
  `Estado_pago` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`ID_Cita`, `FK_ID_Empleado`, `FK_ID_Cliente`, `Fecha`, `Hora`, `costo`, `Estado`, `Estado_pago`) VALUES
(95, 12, 6, '2025-06-10', '14:00:00', 50, '1', '2'),
(96, 11, 6, '2025-06-10', '17:00:00', 50, '1', '2'),
(104, 10, 8, '2025-06-10', '12:00:00', 65, '1', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `ID_Empleado` int(11) NOT NULL,
  `ID_Usuario` int(11) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Apellidos` varchar(255) DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Regimen_Pensionario` varchar(20) DEFAULT NULL,
  `Fecha_Ingreso` date DEFAULT NULL,
  `Unidad` varchar(100) DEFAULT NULL,
  `Puesto` varchar(100) DEFAULT NULL,
  `Categoria_Laboral` varchar(100) DEFAULT NULL,
  `Tipo_Doc` varchar(20) DEFAULT NULL,
  `Seguro_Salud` varchar(20) DEFAULT NULL,
  `Cantidad_Hijos` int(11) DEFAULT NULL,
  `DNI` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`ID_Empleado`, `ID_Usuario`, `Nombre`, `Apellidos`, `Fecha_Nacimiento`, `Regimen_Pensionario`, `Fecha_Ingreso`, `Unidad`, `Puesto`, `Categoria_Laboral`, `Tipo_Doc`, `Seguro_Salud`, `Cantidad_Hijos`, `DNI`) VALUES
(10, 6, 'Livia', 'Marocho', '2003-06-10', 'AFP', '2025-06-08', '1', 'Estilista', 'Atencion al cliente', 'DNI', 'ESSALUD', 2, '77123122'),
(11, 7, 'Iris', 'Ramirez', '2004-02-10', 'AFP', '2025-06-08', '1', 'Estilista', 'Atencion al cliente', 'DNI', 'SIS', 0, '77777777'),
(12, 8, 'Andrea', 'Alejos', '2009-01-08', 'ONP', '2025-06-08', '1', 'Masajista', 'Atención al cliente', 'DNI', 'SIS', 0, '66666666');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_cita`
--

CREATE TABLE `historial_cita` (
  `ID_Historial` int(11) NOT NULL,
  `FK_ID_Cita` int(11) DEFAULT NULL,
  `FK_ID_Servicio` int(11) DEFAULT NULL,
  `FK_ID_Pago` int(11) DEFAULT NULL,
  `Fecha_registro` date DEFAULT NULL,
  `Estado_cita` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_cita`
--

INSERT INTO `historial_cita` (`ID_Historial`, `FK_ID_Cita`, `FK_ID_Servicio`, `FK_ID_Pago`, `Fecha_registro`, `Estado_cita`) VALUES
(4, 104, 2, 64, '2025-06-09', 'reservada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcacion`
--

CREATE TABLE `marcacion` (
  `ID_Marcacion` int(11) NOT NULL,
  `ID_Empleado` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora_Entrada` time NOT NULL,
  `Hora_Salida` time DEFAULT NULL,
  `Horas_Trabajadas` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcacion`
--

INSERT INTO `marcacion` (`ID_Marcacion`, `ID_Empleado`, `Fecha`, `Hora_Entrada`, `Hora_Salida`, `Horas_Trabajadas`) VALUES
(5, 10, '2025-06-08', '12:37:39', '12:39:16', 0.02),
(6, 12, '2025-06-08', '23:09:53', '23:10:31', 0.00),
(7, 12, '2025-06-08', '23:11:16', '08:40:04', 9.00),
(8, 12, '2025-06-09', '08:39:35', '08:40:04', 0.00);

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
(64, '2025-06-09', '10:33:06', 65.00, 11.70, 76.70);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `ID_Servicio` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`ID_Servicio`, `Nombre`, `Precio`, `Descripcion`) VALUES
(2, 'Corte Pelo', 50.00, 'Corte INSAO WAZAAAA 👻👻👻');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_Usuario` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `DNI` int(50) DEFAULT NULL,
  `Correo` varchar(255) DEFAULT NULL,
  `Contraseña` varchar(255) DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_Usuario`, `Nombre`, `DNI`, `Correo`, `Contraseña`, `Tipo`) VALUES
(6, 'Livia', 77123122, 'livia@gmail.com', '123', '2'),
(7, 'Iris', 77777777, 'iris@gmail.com', '123', '2'),
(8, 'Andrea', 66666666, 'andrea@gmail.com', '123', '2'),
(9, 'Matias', 55555555, 'matias@gmail.com', '123', '1'),
(10, 'Jorge', 22222222, 'jorge@gmail.com', '123', '1'),
(12, 'Angel', 33333333, 'angel@gmail.com', '123', '1'),
(13, 'Adriel', 72715978, 'adriel@gmail.com', '123', '3');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `boleta_de_pago`
--
ALTER TABLE `boleta_de_pago`
  ADD PRIMARY KEY (`ID_Boleta`),
  ADD KEY `ID_Empleado` (`ID_Empleado`);

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
  ADD KEY `ID_Empleado` (`ID_Empleado`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`ID_Pago`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`ID_Servicio`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `boleta_de_pago`
--
ALTER TABLE `boleta_de_pago`
  MODIFY `ID_Boleta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `ID_Cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `ID_Empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `historial_cita`
--
ALTER TABLE `historial_cita`
  MODIFY `ID_Historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `marcacion`
--
ALTER TABLE `marcacion`
  MODIFY `ID_Marcacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `ID_Pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `ID_Servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `boleta_de_pago`
--
ALTER TABLE `boleta_de_pago`
  ADD CONSTRAINT `boleta_de_pago_ibfk_1` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`);

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
  ADD CONSTRAINT `marcacion_ibfk_1` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
