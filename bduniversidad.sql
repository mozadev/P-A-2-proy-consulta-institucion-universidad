-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2021 a las 11:19:49
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bduniversidad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `CODDEPA` int(11) NOT NULL,
  `NOMBDEPA` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`CODDEPA`, `NOMBDEPA`) VALUES
(1, 'LIMA'),
(2, 'CALLAO'),
(3, 'ICA'),
(4, 'CUSCO'),
(5, 'AREQUIPA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito`
--

CREATE TABLE `distrito` (
  `CODDEPA` int(11) NOT NULL,
  `CODPROVI` int(11) NOT NULL,
  `CODDISTRI` int(11) NOT NULL,
  `NOMBDISTRI` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `distrito`
--

INSERT INTO `distrito` (`CODDEPA`, `CODPROVI`, `CODDISTRI`, `NOMBDISTRI`) VALUES
(1, 1, 1, 'JESUS MARIA'),
(1, 1, 2, 'BREÑA'),
(1, 1, 3, 'PUEBLO LIBRE'),
(1, 1, 4, 'MIRAFLORES'),
(1, 2, 1, 'AUCALLAMA'),
(1, 2, 2, 'LA HUACA'),
(1, 2, 3, 'JESUS DEL VALLE'),
(1, 2, 4, 'CHANCAY'),
(1, 3, 1, 'HUACHO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucion`
--

CREATE TABLE `institucion` (
  `CODINSTI` int(11) NOT NULL,
  `NOMBINSTI` varchar(50) DEFAULT NULL,
  `SIGLA` varchar(50) DEFAULT NULL,
  `REPRESENTANTE` varchar(200) DEFAULT NULL,
  `DOMICILIO` varchar(200) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `RUC` varchar(50) DEFAULT NULL,
  `SITUACION` varchar(50) DEFAULT NULL,
  `CODTIPO` int(11) DEFAULT NULL,
  `CODDEPA` int(11) DEFAULT NULL,
  `CODPROVI` int(11) DEFAULT NULL,
  `CODDISTRI` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `institucion`
--

INSERT INTO `institucion` (`CODINSTI`, `NOMBINSTI`, `SIGLA`, `REPRESENTANTE`, `DOMICILIO`, `EMAIL`, `RUC`, `SITUACION`, `CODTIPO`, `CODDEPA`, `CODPROVI`, `CODDISTRI`) VALUES
(1, 'FEDERICO VILLARREAL', 'UNFV', 'JOSE TORREZ', 'DOS DE MAYO', 'UNFV.EDU.PE', '543543', 'DISPONIBLE', 1, 1, 1, 1),
(2, 'UNIVERISDAD DEL CALLAO', 'UNAC', 'JOSE MARIA', 'CALLAO', 'UNAC.EDU.PE', 'TTTT', 'DISPONIBLE', 2, 1, 1, 2),
(3, 'NACIONAL DE INGENIERIA', 'UNI', 'RAMOS', 'TUPA AMARU', 'UNI.EDU.PE', '5566', 'DISPONIBLE', 1, 1, 1, 3),
(4, 'SAN MARCOS', 'UNMSM', 'TORRES', 'AV VENEZUELA', 'UNMSM.EDU.PE', '7777777', 'DISPONIBLE', 1, 1, 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `CODDEPA` int(11) NOT NULL,
  `CODPROVI` int(11) NOT NULL,
  `NOMBPROVI` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`CODDEPA`, `CODPROVI`, `NOMBPROVI`) VALUES
(1, 1, 'LIMA'),
(1, 2, 'HUARAL'),
(1, 3, 'SAN VICENTE CAÑETE'),
(1, 4, 'HUAURA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoinstitucion`
--

CREATE TABLE `tipoinstitucion` (
  `CODTIPO` int(11) NOT NULL,
  `NOMBRETIPO` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipoinstitucion`
--

INSERT INTO `tipoinstitucion` (`CODTIPO`, `NOMBRETIPO`) VALUES
(1, 'ONGD'),
(2, 'INIEX'),
(3, 'IPREDA');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`CODDEPA`);

--
-- Indices de la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD PRIMARY KEY (`CODDEPA`,`CODPROVI`,`CODDISTRI`);

--
-- Indices de la tabla `institucion`
--
ALTER TABLE `institucion`
  ADD PRIMARY KEY (`CODINSTI`),
  ADD KEY `FK_DISTRITO` (`CODDEPA`,`CODPROVI`,`CODDISTRI`),
  ADD KEY `FK_TIPOINSTITUCION` (`CODTIPO`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`CODDEPA`,`CODPROVI`);

--
-- Indices de la tabla `tipoinstitucion`
--
ALTER TABLE `tipoinstitucion`
  ADD PRIMARY KEY (`CODTIPO`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD CONSTRAINT `FK_PROVINCIA` FOREIGN KEY (`CODDEPA`,`CODPROVI`) REFERENCES `provincia` (`CODDEPA`, `CODPROVI`);

--
-- Filtros para la tabla `institucion`
--
ALTER TABLE `institucion`
  ADD CONSTRAINT `FK_DISTRITO` FOREIGN KEY (`CODDEPA`,`CODPROVI`,`CODDISTRI`) REFERENCES `distrito` (`CODDEPA`, `CODPROVI`, `CODDISTRI`),
  ADD CONSTRAINT `FK_TIPOINSTITUCION` FOREIGN KEY (`CODTIPO`) REFERENCES `tipoinstitucion` (`CODTIPO`);

--
-- Filtros para la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `FK_DEPARTAMENTO` FOREIGN KEY (`CODDEPA`) REFERENCES `departamento` (`CODDEPA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
