SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


CREATE TABLE IF NOT EXISTS `clientes` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `dniCliente` varchar(9) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nombreCliente` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellidosCliente` varchar(150) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `direccionCliente` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `telefonoCliente` varchar(9) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `correoElectronicoCliente` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci AUTO_INCREMENT=3 ;

INSERT INTO `clientes` (`idCliente`, `dniCliente`, `nombreCliente`, `apellidosCliente`, `direccionCliente`, `telefonoCliente`, `correoElectronicoCliente`) VALUES
(1, '00000001A', 'Pedro', 'Garcia Lopez', 'Calle principal, 32, 50004, Zaragoza', '600000001', 'pedro_gl@gmail.com'),
(2, '00000002A', 'Maria', 'Gonzalez Martin', 'Calle pamplona escudero, 24, 1-E, 50005, Zaragoza', '600000002', 'maria_gm@gmail.com');

CREATE TABLE IF NOT EXISTS `comerciales` (
  `idComercial` int(11) NOT NULL AUTO_INCREMENT,
  `comisionComercial` decimal(15,2) NOT NULL,
  `idEmpleadoFK` int(11) NOT NULL,
  PRIMARY KEY (`idComercial`),
  KEY `idEmpleadoFK` (`idEmpleadoFK`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci AUTO_INCREMENT=3 ;

INSERT INTO `comerciales` (`idComercial`, `comisionComercial`, `idEmpleadoFK`) VALUES
(1, '3.00', 1),
(2, '5.00', 2);

CREATE TABLE IF NOT EXISTS `compras` (
  `idCompra` int(11) NOT NULL AUTO_INCREMENT,
  `fechaCompra` date NOT NULL,
  `montoTotalCompra` decimal(15,2) NOT NULL,
  `idClienteFK` int(11) NOT NULL,
  `idComercialFK` int(11) NOT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `idClienteFK` (`idClienteFK`),
  KEY `idComercialFK` (`idComercialFK`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci AUTO_INCREMENT=3 ;

INSERT INTO `compras` (`idCompra`, `fechaCompra`, `montoTotalCompra`, `idClienteFK`, `idComercialFK`) VALUES
(1, '2022-04-02', '5.70', 1, 1),
(2, '2022-04-02', '6.45', 2, 1);

CREATE TABLE IF NOT EXISTS `directivos` (
  `idDirectivo` int(11) NOT NULL AUTO_INCREMENT,
  `dptosDirectivo` int(11) NOT NULL,
  `personasDirectivo` int(11) NOT NULL,
  `idEmpleadoFK` int(11) NOT NULL,
  PRIMARY KEY (`idDirectivo`),
  KEY `idEmpleadoFK` (`idEmpleadoFK`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci AUTO_INCREMENT=3 ;

INSERT INTO `directivos` (`idDirectivo`, `dptosDirectivo`, `personasDirectivo`, `idEmpleadoFK`) VALUES
(1, 5, 50, 1),
(2, 2, 10, 2);

CREATE TABLE IF NOT EXISTS `empleados` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `dniEmpleado` varchar(9) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nombreEmpleado` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellidosEmpleado` varchar(150) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `telefonoEmpleado` varchar(9) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `direccionEmpleado` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `idJefeFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `idJefeFK` (`idJefeFK`),
  KEY `idJefeFK_2` (`idJefeFK`),
  KEY `idJefeFK_3` (`idJefeFK`),
  KEY `idJefeFK_4` (`idJefeFK`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci AUTO_INCREMENT=3 ;

INSERT INTO `empleados` (`idEmpleado`, `dniEmpleado`, `nombreEmpleado`, `apellidosEmpleado`, `telefonoEmpleado`, `direccionEmpleado`, `idJefeFK`) VALUES
(1, '00000001E', 'Maria Pilar', 'Ruiz Diaz', '600000001', 'Calle pedro cerbuna, 18, izq 1A, 50009, Zaragoza', NULL),
(2, '00000002E', 'Juan', 'Muñoz Moreno', '600000002', 'Calle pamplona escudero, 35 5E, 50005, Zaragoza', 1);

CREATE TABLE IF NOT EXISTS `lineas_compras` (
  `idLineaCompra` int(11) NOT NULL AUTO_INCREMENT,
  `cantidadLineaCompra` int(11) NOT NULL,
  `idCompraFK` int(11) NOT NULL,
  `idProductoFK` int(11) NOT NULL,
  PRIMARY KEY (`idLineaCompra`),
  KEY `idCompraFK` (`idCompraFK`),
  KEY `idProductoFK` (`idProductoFK`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci AUTO_INCREMENT=3 ;

INSERT INTO `lineas_compras` (`idLineaCompra`, `cantidadLineaCompra`, `idCompraFK`, `idProductoFK`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2);

CREATE TABLE IF NOT EXISTS `productos` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `codigoProducto` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nombreProducto` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `fechaFabricacionProducto` date NOT NULL,
  `fechaCaducidadProducto` date NOT NULL,
  `pesoProducto` decimal(15,2) NOT NULL,
  `precioProducto` decimal(15,2) NOT NULL,
  `stockProducto` decimal(15,2) NOT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci AUTO_INCREMENT=3 ;

INSERT INTO `productos` (`idProducto`, `codigoProducto`, `nombreProducto`, `fechaFabricacionProducto`, `fechaCaducidadProducto`, `pesoProducto`, `precioProducto`, `stockProducto`) VALUES
(1, 'PTO0001', 'Jamon de Pavo', '2022-04-01', '2022-05-28', '120.00', '2.70', '100.00'),
(2, 'PTO0002', 'Jamon de Pollo', '2022-04-02', '2022-05-29', '250.00', '4.70', '70.00');


ALTER TABLE `comerciales`
  ADD CONSTRAINT `comerciales_ibfk_1` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `directivos` (`idEmpleadoFK`);

ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`idComercialFK`) REFERENCES `comerciales` (`idComercial`),
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idClienteFK`) REFERENCES `clientes` (`idCliente`);

ALTER TABLE `directivos`
  ADD CONSTRAINT `directivos_ibfk_1` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `empleados` (`idEmpleado`);

ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`idJefeFK`) REFERENCES `empleados` (`idEmpleado`);

ALTER TABLE `lineas_compras`
  ADD CONSTRAINT `lineas_compras_ibfk_2` FOREIGN KEY (`idProductoFK`) REFERENCES `productos` (`idProducto`),
  ADD CONSTRAINT `lineas_compras_ibfk_1` FOREIGN KEY (`idCompraFK`) REFERENCES `compras` (`idCompra`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
