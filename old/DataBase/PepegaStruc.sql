CREATE DATABASE  IF NOT EXISTS `pepega_autoshop` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pepega_autoshop`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: pepega_autoshop
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(15) DEFAULT NULL,
  `Apellido1` varchar(15) DEFAULT NULL,
  `Apellido2` varchar(15) DEFAULT NULL,
  `Direccion` varchar(75) DEFAULT NULL,
  `Telefono` varchar(12) DEFAULT NULL,
  `RFC` varchar(20) DEFAULT NULL,
  `Correo` varchar(85) DEFAULT NULL,
  `codigoPostal` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `idDepartamento` int NOT NULL AUTO_INCREMENT,
  `NombreDepartamento` varchar(70) DEFAULT NULL,
  `idSupervisor` int DEFAULT NULL,
  PRIMARY KEY (`idDepartamento`),
  KEY `SupervisorDepa_idx` (`idSupervisor`),
  CONSTRAINT `SupervisorDepa` FOREIGN KEY (`idSupervisor`) REFERENCES `empleado` (`Matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diagnostico`
--

DROP TABLE IF EXISTS `diagnostico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostico` (
  `idDiagnostico` int NOT NULL AUTO_INCREMENT,
  `Placa` varchar(7) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Aplicado` tinyint DEFAULT NULL,
  `Costo` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idDiagnostico`),
  KEY `PlacaDiagnostico_idx` (`Placa`),
  CONSTRAINT `PlacaDiagnostico` FOREIGN KEY (`Placa`) REFERENCES `vehiculo` (`Placa`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `Matricula` int NOT NULL AUTO_INCREMENT,
  `CURP` varchar(20) NOT NULL,
  `Nombre` varchar(15) DEFAULT NULL,
  `Apellido1` varchar(15) DEFAULT NULL,
  `Apellido2` varchar(15) DEFAULT NULL,
  `Salario` varchar(10) DEFAULT NULL,
  `idDepartamento` int NOT NULL,
  PRIMARY KEY (`Matricula`,`CURP`),
  KEY `DepartamentoEmp_idx` (`idDepartamento`),
  CONSTRAINT `DepartamentoEmp` FOREIGN KEY (`idDepartamento`) REFERENCES `departamento` (`idDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `garantia`
--

DROP TABLE IF EXISTS `garantia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garantia` (
  `idGarantia` int NOT NULL AUTO_INCREMENT,
  `idTrabajo` int DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `Aplicada` tinyint DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idGarantia`),
  KEY `TrabajoGarantia_idx` (`idTrabajo`),
  CONSTRAINT `TrabajoGarantia` FOREIGN KEY (`idTrabajo`) REFERENCES `trabajo` (`idTrabajo`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `historialref`
--

DROP TABLE IF EXISTS `historialref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historialref` (
  `idProducto` int NOT NULL,
  `FechaInicio` date NOT NULL,
  `fechaEliminacion` date DEFAULT NULL,
  `idAutorizador` varchar(20) DEFAULT NULL,
  `nuevoPrecio` varchar(15) NOT NULL,
  PRIMARY KEY (`idProducto`,`nuevoPrecio`,`FechaInicio`),
  CONSTRAINT `ProductoHistorial` FOREIGN KEY (`idProducto`) REFERENCES `refacciones` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `idPromo` int NOT NULL AUTO_INCREMENT,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `Descuento` int DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idPromo`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `refacciones`
--

DROP TABLE IF EXISTS `refacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refacciones` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `NombreProducto` varchar(255) DEFAULT NULL,
  `Clase` varchar(70) DEFAULT NULL,
  `Inventario` varchar(5) DEFAULT NULL,
  `PrecioUnitario` varchar(15) DEFAULT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `Precio` (`PrecioUnitario`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trabajo`
--

DROP TABLE IF EXISTS `trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajo` (
  `idTrabajo` int NOT NULL,
  `idDiagnostico` int DEFAULT NULL,
  `idEmpleadoS` int DEFAULT NULL,
  PRIMARY KEY (`idTrabajo`),
  KEY `EmpleadoTrabajo_idx` (`idEmpleadoS`),
  KEY `DiagnosticoTrabajo_idx` (`idDiagnostico`),
  CONSTRAINT `DiagnosticoTrabajo` FOREIGN KEY (`idDiagnostico`) REFERENCES `diagnostico` (`idDiagnostico`),
  CONSTRAINT `EmpleadoTrabajo` FOREIGN KEY (`idEmpleadoS`) REFERENCES `empleado` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trabajoindividual`
--

DROP TABLE IF EXISTS `trabajoindividual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajoindividual` (
  `idEmpleadoR` int DEFAULT NULL,
  `idTrabajo` int DEFAULT NULL,
  `idTrabajoIndividual` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Garantia` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `idVenta` int DEFAULT NULL,
  `idPromo` int DEFAULT NULL,
  `Costo` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idTrabajoIndividual`),
  KEY `TrabajoTI_idx` (`idTrabajo`),
  KEY `EmpeadoTI_idx` (`idEmpleadoR`),
  KEY `VentaTI_idx` (`idVenta`),
  KEY `PromoTI_idx` (`idPromo`),
  CONSTRAINT `EmpeadoTI` FOREIGN KEY (`idEmpleadoR`) REFERENCES `empleado` (`Matricula`),
  CONSTRAINT `PromoTI` FOREIGN KEY (`idPromo`) REFERENCES `promociones` (`idPromo`),
  CONSTRAINT `TrabajoTI` FOREIGN KEY (`idTrabajo`) REFERENCES `trabajo` (`idTrabajo`),
  CONSTRAINT `VentaTI` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculo` (
  `Placa` varchar(7) NOT NULL,
  `Marca` varchar(15) DEFAULT NULL,
  `Modelo` varchar(45) DEFAULT NULL,
  `Año` varchar(45) DEFAULT NULL,
  `Color` varchar(45) DEFAULT NULL,
  `idCliente` int NOT NULL,
  `Estado` varchar(10) DEFAULT NULL,
  `fechaRegistro` date DEFAULT NULL,
  PRIMARY KEY (`Placa`),
  KEY `ClienteVehiculo_idx` (`idCliente`),
  CONSTRAINT `ClienteVehiculo` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `idCliente` int NOT NULL,
  `idVenta` int NOT NULL AUTO_INCREMENT,
  `Fecha` date DEFAULT NULL,
  `Total` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `ClienteVenta_idx` (`idCliente`),
  CONSTRAINT `ClienteVenta` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ventaindividual`
--

DROP TABLE IF EXISTS `ventaindividual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventaindividual` (
  `idProducto` int NOT NULL,
  `idVenta` int NOT NULL,
  `Cantidad` varchar(45) DEFAULT NULL,
  `idPromo` int DEFAULT NULL,
  `Precio` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idProducto`,`idVenta`),
  KEY `ProductoVI_idx` (`idProducto`),
  KEY `VentaVI_idx` (`idVenta`),
  KEY `PromoVI_idx` (`idPromo`),
  KEY `PrecioUnitarioVI_idx` (`Precio`),
  CONSTRAINT `PrecioUnitarioVI` FOREIGN KEY (`Precio`) REFERENCES `refacciones` (`PrecioUnitario`),
  CONSTRAINT `ProductoVI` FOREIGN KEY (`idProducto`) REFERENCES `refacciones` (`idProducto`),
  CONSTRAINT `PromoVI` FOREIGN KEY (`idPromo`) REFERENCES `promociones` (`idPromo`),
  CONSTRAINT `VentaVI` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-30 23:16:31
