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
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan','Gómez','Pérez','Calle 123','6641234567','GOPJ890101','juan@gmail.com','12345'),(2,'María','López','Sánchez','Avenida 456','6649876543','LOSM901231','maria@hotmail.com','23456'),(3,'Pedro','Ramírez','García','Plaza 789','6864561234','RAGP880511','pedro@yahoo.com','34567'),(4,'Laura','Fernández','Martínez','Callejón 987','6867894561','FAML830619','laura@outlook.com','45678'),(5,'Carlos','Torres','Rojas','Paseo 654','6643217894','TORC910214','carlos@gmail.com','56789'),(6,'Ana','García','Vargas','Avenida 321','6646549873','GAVA900712','ana@hotmail.com','67890'),(7,'Luis','Pérez','Hernández','Calle 654','6869873216','PEHL771225','luis@yahoo.com','78901'),(8,'Marta','González','Jiménez','Plaza 987','6643216549','GOJM900609','marta@outlook.com','89012'),(9,'Javier','Sánchez','Gómez','Callejón 321','6866549872','SAGJ891025','javier@gmail.com','90123'),(10,'Sofía','Martínez','Fernández','Paseo 987','6643216549','MAFS880331','sofia@hotmail.com','01234'),(11,'Pablo','Gómez','López','Avenida 654','6869873216','GOLP800527','pablo@yahoo.com','12345'),(12,'Elena','Rojas','Torres','Calle 987','6643216549','ROTE840708','elena@gmail.com','23456'),(13,'Roberto','Hernández','Pérez','Plaza 654','6869873216','HEPR780804','roberto@hotmail.com','34567'),(14,'Julia','Jiménez','González','Callejón 987','6643216549','JIGJ820307','julia@yahoo.com','45678'),(15,'Diego','Gómez','Sánchez','Paseo 654','6869873216','GOSD790609','diego@gmail.com','56789'),(16,'Isabel','Fernández','Martínez','Avenida 987','6643216549','FEMI760226','isabel@hotmail.com','67890'),(17,'Gabriel','Torres','García','Calle 654','6869873216','TOGG800527','gabriel@yahoo.com','78901'),(18,'Lucía','García','Vargas','Plaza 987','6643216549','GAVL811001','lucia@gmail.com','89012'),(19,'Andrés','Pérez','Hernández','Callejón 654','6869873216','PEHA841127','andres@hotmail.com','90123'),(20,'Marina','González','Jiménez','Paseo 987','6643216549','GOJM790818','marina@gmail.com','01234'),(21,'Manuel','Sánchez','Gómez','Avenida 654','6869873216','SAGM791025','manuel@hotmail.com','12345'),(22,'Olivia','Martínez','Fernández','Calle 987','6643216549','MAFO810717','olivia@yahoo.com','23456'),(23,'Ricardo','Hernández','Pérez','Plaza 654','6869873216','HEPR790412','ricardo@gmail.com','34567'),(24,'Valeria','Jiménez','González','Callejón 987','6643216549','JIGV800207','valeria@hotmail.com','45678'),(25,'Lorenzo','Gómez','Sánchez','Paseo 654','6869873216','GOSL800609','lorenzo@yahoo.com','56789');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Ventas',1),(2,'Servicio al Cliente',1),(3,'Carrocería y pintura',1),(4,'Finanzas',1),(5,'Almacén',1),(6,'Marketing',5),(7,'Eléctrico',5),(8,'Compras',5),(9,'Alineación y Balanceo, suspensión',5),(10,'Logística',5),(11,'Mecánico',10),(12,'Calidad',10),(13,'Refaccionaria',10),(14,'Seguridad',10),(15,'Soporte Técnico',10),(16,'Investigación y Desarrollo',15),(17,'Planificación de Producción',15),(18,'Ventas en Línea',15),(19,'Comunicación',15),(20,'Control de Inventario',15),(21,'Planificación Financiera',20),(22,'Desarrollo Organizacional',20),(23,'Asuntos Legales',20),(24,'Relaciones Públicas',20),(25,'Servicio de Posventa',20);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `diagnostico`
--

LOCK TABLES `diagnostico` WRITE;
/*!40000 ALTER TABLE `diagnostico` DISABLE KEYS */;
INSERT INTO `diagnostico` VALUES (1,'ABC1234','2023-01-01','El motor presenta un ruido extraño y falta de potencia',1,NULL),(2,'DEF5678','2023-01-02','Los frenos están desgastados y producen chirridos al frenar',1,NULL),(3,'GHI9012','2023-01-03','Las llantas presentan desgaste irregular y falta de alineación',1,NULL),(4,'JKL3456','2023-01-04','La transmisión tiene dificultades para cambiar de marcha',1,NULL),(5,'MNO7890','2023-01-05','El aceite del motor muestra signos de contaminación',1,NULL),(6,'PQR2345','2023-01-06','La batería no retiene carga adecuadamente',1,NULL),(7,'STU6789','2023-01-07','Se presentan fallos eléctricos en diferentes sistemas del vehículo',1,NULL),(8,'ABC1234','2023-01-08','El vehículo experimenta fallas intermitentes y pérdida de potencia',1,NULL),(9,'YZA4567','2023-01-09','La suspensión está desgastada y produce ruidos al pasar por baches',1,NULL),(10,'BCD8901','2023-01-10','Las llantas presentan desgaste excesivo en los bordes',1,NULL),(11,'EFG2345','2023-01-11','Se observan fugas en el sistema de escape',1,NULL),(12,'HIJ6789','2023-01-12','El filtro de aire está obstruido y requiere reemplazo',1,NULL),(13,'KLM0123','2023-01-13','La dirección del vehículo es difícil de maniobrar',1,NULL),(14,'NOP4567','2023-01-14','Las bujías están desgastadas y no generan chispa adecuada',1,NULL),(15,'QRS8901','2023-01-15','El sistema de frenos muestra desgaste en las pastillas y pérdida de eficiencia',1,NULL),(16,'TUV2345','2023-01-16','La correa de distribución está desgastada y presenta grietas',1,NULL),(17,'WXY6789','2023-01-17','El sistema de climatización no enfría correctamente',1,NULL),(18,'ZAB0123','2023-01-18','Los amortiguadores presentan fugas y pérdida de efectividad',1,NULL),(19,'CDE4567','2023-01-19','El sistema de dirección asistida tiene dificultades al girar',1,NULL),(20,'EFG8901','2023-01-20','El sensor de oxígeno muestra señales irregulares',1,NULL),(21,'HIJ2345','2023-01-21','La suspensión neumática presenta fugas de aire y no se ajusta correctamente',1,NULL),(22,'KLM6789','2023-01-22','El filtro de combustible está obstruido y reduce el flujo de combustible',1,NULL),(23,'NOP0123','2023-01-23','El sistema de inyección de combustible presenta fallos y consumo excesivo',1,NULL),(24,'QRS4567','2023-01-24','La bomba de agua tiene fugas y debe ser reemplazada',1,NULL),(25,'TUV8901','2023-01-25','El sistema de dirección hidráulica presenta pérdida de líquido y dificultades al girar',1,NULL),(26,'ABC1234','2023-01-25','Ningun problema encontrado',1,'50'),(27,'KLM6789','2023-01-26','Ningun problema encontrado',1,'50');
/*!40000 ALTER TABLE `diagnostico` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'SOCH950516MDFLNR','Carolina','Soto','Hernández','5500',3),(2,'VAMF951103HDFRDR','Eduardo','Vargas','Mendoza','7000',3),(3,'GOPJ950703HDFNNG','Juan','González','Pérez','4500',3),(4,'ROTG950717HDFRRB','Gabriela','Rojas','Torres','8000',3),(5,'PEMR961006HDFPBR','Roberto','Peña','Martínez','6000',3),(6,'LOMG960627HDFPCR','María','López','García','2500',7),(7,'PELM970127HDFSMR','Mario','Pérez','Luna','3500',7),(8,'GUIL970729HDFGZB','Isabel','Gutiérrez','Luna','5000',7),(9,'HERP980809HDFRRD','Pedro','Hernández','Rodríguez','4000',7),(10,'LOCD981219HDFSPR','Daniela','López','Castro','9000',7),(11,'CULF990330HDFCNR','Fernando','Cruz','López','6000',9),(12,'MAFL990731HDFRNN','Laura','Martínez','Fernández','4500',9),(13,'HEGS000117HDFRZM','Sergio','Hernández','Gómez','8000',9),(14,'CAPL000420HDFGZL','Lorena','Castillo','Pérez','5500',9),(15,'GOSG000926HDFSNC','Carlos','Gómez','Sánchez','3000',9),(16,'MASM010105HDFTRM','Marcela','Martínez','Soto','9000',11),(17,'OGRG010528HDFNND','Andrés','Ortega','González','7000',11),(18,'VARR011112HDFRJS','Ana','Vargas','Rojas','3500',11),(19,'GARR011228HDFMRR','Ricardo','García','Ramírez','10000',11),(20,'MEHP020209HDFNDT','Patricia','Mendoza','Hernández','5500',11),(21,'RARL020623HDFMSR','Luis','Ramírez','Pérez','4000',13),(22,'SIFH021101HDFSLV','Hugo','Silva','Flores','7000',13),(23,'TOTL030305HDFRRR','Marta','Torres','López','3500',13),(24,'FLOG030905HDFCRJ','Jorge','Flores','García','4500',13),(25,'JILJ031229HDFMCL','Lucía','Jiménez','Rojas','8000',13);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `garantia`
--

LOCK TABLES `garantia` WRITE;
/*!40000 ALTER TABLE `garantia` DISABLE KEYS */;
INSERT INTO `garantia` VALUES (1,1,'2023-01-01','2023-07-01',1,'Reparación de motor con garantía de 6 meses'),(2,2,'2023-01-02','2024-02-15',1,'Cambio de frenos sin garantía aplicada'),(3,3,'2023-01-03','2024-03-10',1,'Alineación y balanceo con garantía de 1 año'),(4,4,'2023-01-04','2023-10-20',1,'Reparación de transmisión con garantía de 6 meses'),(5,5,'2023-01-05','2024-05-05',1,'Cambio de aceite sin garantía aplicada'),(6,6,'2023-01-06','2024-06-30',1,'Reemplazo de batería con garantía de 1 año'),(7,7,'2023-01-07','2023-10-15',1,'Reparación de sistema eléctrico sin garantía aplicada'),(8,8,'2023-01-08','2024-02-10',1,'Diagnóstico de fallas con garantía de 6 meses'),(9,9,'2023-01-09','2024-09-25',1,'Reparación de suspensión sin garantía aplicada'),(10,10,'2023-01-10','2024-04-05',1,'Cambio de llantas con garantía de 6 meses'),(11,11,'2023-01-11','2024-11-20',1,'Reparación de sistema de escape con garantía de 1 año'),(12,12,'2023-01-12','2024-06-15',1,'Cambio de filtro de aire sin garantía aplicada'),(13,13,'2023-01-13','2024-07-10',1,'Reparación de sistema de dirección con garantía de 6 meses'),(14,14,'2023-01-14','2025-02-25',1,'Cambio de bujías sin garantía aplicada'),(15,15,'2023-01-15','2024-09-01',1,'Reparación de sistema de frenos con garantía de 6 meses'),(16,16,'2023-01-16','2024-10-10',1,'Cambio de correa de distribución con garantía de 1 año'),(17,17,'2023-01-17','2025-05-15',1,'Reparación de sistema de climatización sin garantía aplicada'),(18,18,'2023-01-18','2024-12-20',1,'Cambio de amortiguadores con garantía de 6 meses'),(19,19,'2023-01-19','2025-07-05',1,'Reparación de sistema de dirección asistida con garantía de 1 año'),(20,20,'2023-01-20','2025-08-15',1,'Cambio de sensor de oxígeno sin garantía aplicada'),(21,21,'2023-01-21','2025-03-10',1,'Reparación de sistema de suspensión neumática con garantía de 6 meses'),(22,22,'2023-01-22','2025-10-25',1,'Cambio de filtro de combustible sin garantía aplicada'),(23,23,'2023-01-23','2025-05-05',1,'Reparación de sistema de inyección de combustible con garantía de 6 meses'),(24,24,'2023-01-24','2025-12-15',1,'Cambio de bomba de agua con garantía de 1 año'),(25,25,'2023-01-25','2025-07-20',1,'Reparación de sistema de dirección hidráulica sin garantía aplicada');
/*!40000 ALTER TABLE `garantia` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `historialref`
--

LOCK TABLES `historialref` WRITE;
/*!40000 ALTER TABLE `historialref` DISABLE KEYS */;
INSERT INTO `historialref` VALUES (1,'2023-02-01',NULL,'5','24.99'),(1,'2023-01-01','2023-02-01','1','29.99'),(2,'2023-01-01','2023-01-01','10','12.99'),(2,'2023-01-01',NULL,'15','15.99'),(3,'2023-01-01','2023-03-01','20','7.99'),(3,'2023-03-01',NULL,'1','9.99'),(4,'2023-02-01',NULL,'10','39.99'),(4,'2023-01-01','2023-02-01','5','49.99'),(5,'2023-01-01',NULL,'20','11.99'),(5,'2023-01-01','2023-01-01','15','8.99'),(6,'2023-02-01',NULL,'5','89.99'),(6,'2023-01-01','2023-02-01','1','99.99'),(7,'2023-01-01','2023-03-01','10','59.99'),(7,'2023-03-01',NULL,'15','64.99'),(8,'2023-02-01',NULL,'1','34.99'),(8,'2023-01-01','2023-02-01','20','39.99'),(9,'2023-01-01','2023-01-01','5','19.99'),(9,'2023-01-01',NULL,'10','22.99'),(10,'2023-02-01',NULL,'20','69.99'),(10,'2023-01-01','2023-02-01','15','79.99'),(11,'2023-03-01',NULL,'5','14.99'),(11,'2023-01-01','2023-03-01','1','9.99'),(12,'2023-02-01',NULL,'15','119.99'),(12,'2023-01-01','2023-02-01','10','129.99'),(13,'2023-01-01','2023-03-01','20','14.99'),(13,'2023-03-01',NULL,'1','19.99'),(14,'2023-02-01',NULL,'10','79.99'),(14,'2023-01-01','2023-02-01','5','89.99'),(15,'2023-01-01','2023-03-01','15','49.99'),(15,'2023-03-01',NULL,'20','54.99');
/*!40000 ALTER TABLE `historialref` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
INSERT INTO `promociones` VALUES (1,'2023-06-01','2023-06-07',10,'Descuento de verano'),(2,'2023-07-15','2023-07-31',15,'Promoción de vacaciones'),(3,'2023-09-01','2023-09-30',20,'Promoción de otoño '),(4,'2023-10-25','2023-11-05',12,'Promoción de Halloween 3'),(5,'2023-12-01','2023-12-31',18,'Promoción de Navidad'),(6,'2023-02-14','2023-02-14',10,'Descuento de San Valentín'),(7,'2023-04-01','2023-04-30',15,'Oferta de primavera'),(8,'2023-06-15','2023-06-30',20,'Promoción de aniversario'),(9,'2023-08-01','2023-08-31',12,'Promoción de verano'),(10,'2023-10-20','2023-11-05',18,'Promoción de Halloween'),(11,'2023-12-01','2023-12-31',10,'Promoción de Navidad 2'),(12,'2023-01-01','2023-01-31',15,'Oferta de Año Nuevo'),(13,'2023-03-15','2023-03-31',20,'Promoción de primavera'),(14,'2023-05-01','2023-05-31',12,'Promoción del Día del Trabajo'),(15,'2023-07-04','2023-07-04',18,'Promoción del Día de la Independencia'),(16,'2023-09-01','2023-09-30',10,'Promoción de otoño 2'),(17,'2023-10-25','2023-11-05',15,'Promoción de Halloween 4'),(18,'2023-12-01','2023-12-31',20,'Promoción de Navidad 3'),(19,'2023-02-14','2023-02-14',12,'Descuento de San Valentín 2'),(20,'2023-04-01','2023-04-30',18,'Oferta de primavera 2'),(21,'2023-06-15','2023-06-30',10,'Promoción de aniversario 2 '),(22,'2023-08-01','2023-08-31',15,'Promoción de verano 2'),(23,'2023-10-20','2023-11-05',20,'Promoción de Halloween 2'),(24,'2023-12-01','2023-12-31',12,'Promoción de Navidad 4'),(25,'2023-01-01','2023-01-31',18,'Oferta de Año Nuevo 2'),(26,NULL,NULL,20,'Promocion clientes recurrentes');
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `refacciones`
--

LOCK TABLES `refacciones` WRITE;
/*!40000 ALTER TABLE `refacciones` DISABLE KEYS */;
INSERT INTO `refacciones` VALUES (1,'Aceite Motor','Lubricantes','100','29.99','Aceite de motor Mobil 1, de alta calidad y rendimiento.'),(2,'Filtro de Aire','Filtros','50','12.99','Filtro de aire K&N, con diseño de alto flujo y excelente filtración.'),(3,'Bujías','Encendido','80','7.99','Bujías NGK, con tecnología de encendido rápido y durabilidad.'),(4,'Pastillas de Freno','Frenos','30','49.99','Pastillas de freno Brembo, de alto rendimiento y gran capacidad de frenado.'),(5,'Filtro de Aceite','Filtros','60','8.99','Filtro de aceite Bosch, con capacidad de retención de impurezas y protección del motor.'),(6,'Batería','Eléctrico','20','99.99','Batería Exide, de larga duración y alto rendimiento.'),(7,'Amortiguador','Suspensión','25','59.99','Amortiguador Monroe, para una conducción suave y confortable.'),(8,'Aceite Motor','Lubricantes','100','29.99','Aceite de motor Castrol, con fórmula sintética de protección avanzada.'),(9,'Filtro de Aire','Filtros','50','12.99','Filtro de aire Mann-Filter, para un óptimo rendimiento del motor.'),(10,'Bujías','Encendido','80','7.99','Bujías Denso, con tecnología de encendido eficiente y menor consumo de combustible.'),(11,'Pastillas de Freno','Frenos','30','49.99','Pastillas de freno Akebono, de alta calidad y bajo nivel de ruido.'),(12,'Filtro de Aceite','Filtros','60','8.99','Filtro de aceite WIX Filters, para una filtración eficiente y protección del motor.'),(13,'Batería','Eléctrico','20','99.99','Batería Optima, con tecnología SpiralCell para una mayor vida útil.'),(14,'Amortiguador','Suspensión','25','59.99','Amortiguador KYB, para un control de la suspensión excepcional.'),(15,'Correa de Distribución','Motor','40','39.99','Correa de distribución Gates, para una transmisión eficiente de potencia.'),(16,'Termostato','Refrigeración','15','19.99','Termostato Stant, para regular la temperatura del motor de manera precisa.'),(17,'Bomba de Agua','Refrigeración','12','79.99','Bomba de agua GMB, con alta capacidad de flujo y durabilidad.'),(18,'Líquido de Frenos','Frenos','70','9.99','Líquido de frenos ATE, de alto rendimiento y punto de ebullición elevado.'),(19,'Radiador','Refrigeración','10','129.99','Radiador Nissens, con excelente capacidad de disipación térmica y resistencia.'),(20,'Filtro de Combustible','Filtros','55','14.99','Filtro de combustible Mann-Filter, para una filtración eficiente y protección del sistema de combustible.'),(21,'Sensor de Oxígeno','Escape','18','39.99','Sensor de oxígeno Bosch, para un monitoreo preciso de la mezcla de combustible y aire.'),(22,'Embrague','Transmisión','8','199.99','Kit de embrague Luk, con componentes de alta calidad y excelente durabilidad.'),(23,'Aceite de Transmisión','Lubricantes','30','19.99','Aceite de transmisión Valvoline, formulado para una lubricación óptima y protección.'),(24,'Junta de Culata','Motor','5','49.99','Junta de culata Victor Reinz, para un sellado hermético y resistencia a altas temperaturas.'),(25,'Escobillas Limpiaparabrisas','Visibilidad','40','9.99','Escobillas limpiaparabrisas Bosch, con un diseño aerodinámico y alto rendimiento.');
/*!40000 ALTER TABLE `refacciones` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `trabajo`
--

LOCK TABLES `trabajo` WRITE;
/*!40000 ALTER TABLE `trabajo` DISABLE KEYS */;
INSERT INTO `trabajo` VALUES (1,1,1),(2,2,5),(3,3,15),(4,4,10),(5,5,20),(6,6,1),(7,7,10),(8,8,5),(9,9,15),(10,10,1),(11,11,20),(12,12,5),(13,13,10),(14,14,15),(15,15,20),(16,16,1),(17,17,10),(18,18,5),(19,19,15),(20,20,20),(21,21,1),(22,22,10),(23,23,5),(24,24,15),(25,25,20);
/*!40000 ALTER TABLE `trabajo` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `trabajoindividual`
--

LOCK TABLES `trabajoindividual` WRITE;
/*!40000 ALTER TABLE `trabajoindividual` DISABLE KEYS */;
INSERT INTO `trabajoindividual` VALUES (2,1,1,'Reparación de motor',1,'2023-01-01',1,NULL,'50.00'),(6,2,2,'Cambio de frenos',2,'2023-01-02',2,26,'75.00'),(18,3,3,'Alineación y balanceo',3,'2023-01-03',3,26,'60.00'),(9,4,4,'Reparación de transmisión',4,'2023-01-04',4,NULL,'120.00'),(15,5,5,'Cambio de aceite',5,'2023-01-05',5,26,'90.00'),(25,6,6,'Reemplazo de batería',6,'2023-01-06',6,NULL,'80.00'),(1,7,7,'Reparación de sistema eléctrico',7,'2023-01-07',7,NULL,'100.00'),(22,8,8,'Diagnóstico de fallas',8,'2023-01-08',8,NULL,'70.00'),(19,9,9,'Reparación de suspensión',9,'2023-01-09',9,NULL,'110.00'),(8,10,10,'Cambio de llantas',10,'2023-01-10',10,NULL,'95.00'),(23,11,11,'Reparación de sistema de escape',11,'2023-01-11',11,NULL,'85.00'),(4,12,12,'Cambio de filtro de aire',12,'2023-01-12',12,NULL,'150.00'),(11,13,13,'Reparación de sistema de dirección',13,'2023-01-13',13,NULL,'55.00'),(16,14,14,'Cambio de bujías',14,'2023-01-14',14,NULL,'125.00'),(14,15,15,'Reparación de sistema de frenos',15,'2023-01-15',15,NULL,'70.00'),(7,16,16,'Cambio de correa de distribución',16,'2023-01-16',16,NULL,'90.00'),(20,17,17,'Reparación de sistema de climatización',17,'2023-01-17',17,NULL,'120.00'),(24,18,18,'Cambio de amortiguadores',18,'2023-01-18',18,NULL,'80.00'),(21,19,19,'Reparación de sistema de dirección asistida',19,'2023-01-19',19,NULL,'100.00'),(10,20,20,'Cambio de sensor de oxígeno',20,'2023-01-20',20,NULL,'75.00'),(17,21,21,'Reparación de sistema de suspensión neumática',21,'2023-01-21',21,NULL,'65.00'),(3,22,22,'Cambio de filtro de combustible',22,'2023-01-22',22,NULL,'130.00'),(12,23,23,'Reparación de sistema de inyección de combustible',23,'2023-01-23',23,NULL,'95.00'),(5,24,24,'Cambio de bomba de agua',24,'2023-01-24',24,26,'115.00'),(13,25,25,'Reparación de sistema de dirección hidráulica',25,'2023-01-25',25,26,'85.00');
/*!40000 ALTER TABLE `trabajoindividual` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES ('ABC1234','Toyota','Corolla','2019','Rojo',1,'Activo',NULL),('BCD8901','Nissan','Altima','2021','Azul',10,'Activo',NULL),('CDE4567','Chevrolet','Trax','2018','Rojo',19,'Activo',NULL),('DEF5678','Honda','Civic','2020','Azul',2,'Activo',NULL),('EFG2345','Toyota','Rav4','2020','Blanco',11,'Activo',NULL),('EFG8901','Nissan','Kicks','2021','Negro',20,'Activo',NULL),('GHI9012','Ford','Mustang','2018','Negro',3,'Activo',NULL),('HIJ2345','Toyota','Highlander','2020','Gris',21,'Activo',NULL),('HIJ6789','Honda','Fit','2017','Plata',12,'Activo',NULL),('JKL3456','Chevrolet','Cruze','2021','Blanco',4,'Activo',NULL),('KLM0123','Ford','Fiesta','2022','Rojo',13,'Activo',NULL),('KLM6789','Honda','CR-V','2019','Azul',22,'Activo',NULL),('MNO7890','Nissan','Sentra','2017','Gris',5,'Activo',NULL),('NOP0123','Ford','Edge','2022','Blanco',23,'Activo',NULL),('NOP4567','Chevrolet','Spark','2018','Negro',14,'Activo',NULL),('PQR2345','Toyota','Camry','2020','Plata',6,'Activo',NULL),('QRS4567','Chevrolet','Equinox','2018','Plata',24,'Activo',NULL),('QRS8901','Nissan','Versa','2021','Gris',15,'Activo',NULL),('STU6789','Honda','Accord','2019','Rojo',7,'Activo',NULL),('TUV2345','Toyota','Yaris','2020','Azul',16,'Activo',NULL),('TUV8901','Nissan','Rogue','2021','Rojo',25,'Activo',NULL),('VWX0123','Ford','Escape','2022','Negro',8,'Activo',NULL),('WXY6789','Honda','City','2019','Blanco',17,'Activo',NULL),('YZA4567','Chevrolet','Malibu','2018','Gris',9,'Activo',NULL),('ZAB0123','Ford','Explorer','2022','Plata',18,'Activo',NULL);
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,1,'2023-01-15','70.63'),(2,2,'2023-02-05','339.95'),(3,3,'2023-03-20','407.87'),(4,4,'2023-04-10','149.97'),(5,5,'2023-05-01','51.75'),(6,6,'2023-06-25','85.95'),(7,7,'2023-07-15','259.97'),(8,8,'2023-08-10','159.95'),(9,9,'2023-09-05','119.95'),(10,10,'2023-10-20','272.72'),(11,11,'2023-11-10','295.96'),(12,12,'2023-12-25','219.95'),(13,13,'2023-01-15','19.98'),(14,14,'2023-02-05','12.99'),(15,15,'2023-03-20','49.99'),(16,16,'2023-04-10','99.99'),(17,17,'2023-05-01','29.99'),(18,18,'2023-06-25','14.99'),(19,19,'2023-07-15','8.99'),(20,20,'2023-08-10','59.99'),(21,21,'2023-09-05','19.99'),(22,22,'2023-10-20','9.99'),(23,23,'2023-11-10','14.99'),(24,24,'2023-12-25','39.99'),(25,25,'2023-01-15','199.99');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping data for table `ventaindividual`
--

LOCK TABLES `ventaindividual` WRITE;
/*!40000 ALTER TABLE `ventaindividual` DISABLE KEYS */;
INSERT INTO `ventaindividual` VALUES (1,1,'2',NULL,'29.99'),(2,1,'1',25,'12.99'),(2,14,'1',NULL,'12.99'),(3,2,'3',NULL,'7.99'),(4,2,'2',NULL,'49.99'),(4,15,'1',NULL,'49.99'),(5,3,'1',14,'8.99'),(6,3,'4',NULL,'99.99'),(6,16,'1',NULL,'99.99'),(7,4,'2',NULL,'59.99'),(8,4,'1',NULL,'29.99'),(8,17,'1',NULL,'29.99'),(9,5,'3',NULL,'12.99'),(10,5,'2',23,'7.99'),(11,6,'1',NULL,'49.99'),(12,6,'4',NULL,'8.99'),(12,19,'1',NULL,'8.99'),(13,7,'2',NULL,'99.99'),(14,7,'1',NULL,'59.99'),(14,20,'2',NULL,'59.99'),(15,8,'3',NULL,'39.99'),(16,8,'2',NULL,'19.99'),(16,21,'2',NULL,'19.99'),(17,9,'1',NULL,'79.99'),(18,9,'4',NULL,'9.99'),(18,22,'2',NULL,'9.99'),(19,10,'2',NULL,'129.99'),(20,10,'1',22,'14.99'),(20,18,'1',NULL,'14.99'),(20,23,'1',NULL,'14.99'),(21,11,'3',3,'39.99'),(21,24,'1',NULL,'39.99'),(22,11,'2',NULL,'199.99'),(22,25,'2',NULL,'199.99'),(23,12,'1',NULL,'19.99'),(24,12,'4',NULL,'49.99'),(25,13,'2',NULL,'9.99');
/*!40000 ALTER TABLE `ventaindividual` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-31 16:59:39
