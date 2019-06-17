-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 09-05-2019 a las 21:03:27
-- Versión del servidor: 5.7.17-log
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresatrasportadora`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compañia`
--

CREATE TABLE `compañia` (
  `IdCompañia` int(10) NOT NULL,
  `Nombre` varchar(15) NOT NULL,
  `Direccion` varchar(15) NOT NULL,
  `Telefono` int(15) NOT NULL,
  `Ciudad` varchar(20) NOT NULL,
  `Envio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `NrDocumento` int(10) NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Telefono` int(15) NOT NULL,
  `Cargo` varchar(10) NOT NULL,
  `IdCompañia` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `NrDocumento` int(11) NOT NULL,
  `Nombres` varchar(30) NOT NULL,
  `Apellidos` varchar(30) NOT NULL,
  `Telefono` int(15) NOT NULL,
  `Ciudad` varchar(20) NOT NULL,
  `Envio` varchar(50) NOT NULL,
  `IdCompañia` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `IdVehiculo` int(10) NOT NULL,
  `Placa` varchar(15) NOT NULL,
  `Tipo` int(11) NOT NULL,
  `Conductor` int(11) NOT NULL,
  `IdCompañia` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- �?ndices para tablas volcadas
--

--
-- Indices de la tabla `compañia`
--
ALTER TABLE `compañia`
  ADD PRIMARY KEY (`IdCompañia`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`NrDocumento`),
  ADD KEY `rempleados` (`IdCompañia`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`NrDocumento`),
  ADD KEY `rusuarios` (`IdCompañia`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`IdVehiculo`),
  ADD KEY `rvehiculos` (`IdCompañia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compañia`
--
ALTER TABLE `compañia`
  MODIFY `IdCompañia` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `NrDocumento` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `NrDocumento` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `IdVehiculo` int(10) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `rnumeroempleado` FOREIGN KEY (`IdCompañia`) REFERENCES `compañia` (`IdCompañia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `rnusuarios` FOREIGN KEY (`IdCompañia`) REFERENCES `compañia` (`IdCompañia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `rnvehiculos` FOREIGN KEY (`IdCompañia`) REFERENCES `compañia` (`IdCompañia`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
