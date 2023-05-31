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
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan','Gómez','Pérez','Calle 123','6641234567'),(2,'María','López','Sánchez','Avenida 456','6649876543'),(3,'Pedro','Ramírez','García','Plaza 789','6864561234'),(4,'Laura','Fernández','Martínez','Callejón 987','6867894561'),(5,'Carlos','Torres','Rojas','Paseo 654','6643217894'),(6,'Ana','García','Vargas','Avenida 321','6646549873'),(7,'Luis','Pérez','Hernández','Calle 654','6869873216'),(8,'Marta','González','Jiménez','Plaza 987','6643216549'),(9,'Javier','Sánchez','Gómez','Callejón 321','6866549872'),(10,'Sofía','Martínez','Fernández','Paseo 987','6643216549'),(11,'Pablo','Gómez','López','Avenida 654','6869873216'),(12,'Elena','Rojas','Torres','Calle 987','6643216549'),(13,'Roberto','Hernández','Pérez','Plaza 654','6869873216'),(14,'Julia','Jiménez','González','Callejón 987','6643216549'),(15,'Diego','Gómez','Sánchez','Paseo 654','6869873216'),(16,'Isabel','Fernández','Martínez','Avenida 987','6643216549'),(17,'Gabriel','Torres','García','Calle 654','6869873216'),(18,'Lucía','García','Vargas','Plaza 987','6643216549'),(19,'Andrés','Pérez','Hernández','Callejón 654','6869873216'),(20,'Marina','González','Jiménez','Paseo 987','6643216549'),(21,'Manuel','Sánchez','Gómez','Avenida 654','6869873216'),(22,'Olivia','Martínez','Fernández','Calle 987','6643216549'),(23,'Ricardo','Hernández','Pérez','Plaza 654','6869873216'),(24,'Valeria','Jiménez','González','Callejón 987','6643216549'),(25,'Lorenzo','Gómez','Sánchez','Paseo 654','6869873216');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,10234567),(2,10234567),(3,10234567),(4,10234567),(5,10234567),(6,12345678),(7,12345678),(8,12345678),(9,12345678),(10,12345678),(11,34567890),(12,34567890),(13,34567890),(14,34567890),(15,34567890),(16,43234567),(17,43234567),(18,43234567),(19,43234567),(20,43234567),(21,90123456),(22,90123456),(23,90123456),(24,90123456),(25,90123456);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (10234567,'Carolina','Soto','Hernández',10),(10901234,'Eduardo','Vargas','Mendoza',19),(12345678,'Juan','González','Pérez',1),(21012345,'Gabriela','Rojas','Torres',20),(21345678,'Roberto','Peña','Martínez',11),(23456789,'María','López','García',2),(32123456,'Mario','Pérez','Luna',21),(32456789,'Isabel','Gutiérrez','Luna',12),(34567890,'Pedro','Hernández','Rodríguez',3),(43234567,'Daniela','López','Castro',22),(43567890,'Fernando','Cruz','López',13),(45678901,'Laura','Martínez','Fernández',4),(54345678,'Sergio','Hernández','Gómez',23),(54678901,'Lorena','Castillo','Pérez',14),(56789012,'Carlos','Gómez','Sánchez',5),(65456789,'Marcela','Martínez','Soto',24),(65789012,'Andrés','Ortega','González',15),(67890123,'Ana','Vargas','Rojas',6),(76567890,'Ricardo','García','Ramírez',25),(76890123,'Patricia','Mendoza','Hernández',16),(78901234,'Luis','Ramírez','Pérez',7),(87901234,'Hugo','Silva','Flores',17),(89012345,'Marta','Torres','López',8),(90123456,'Jorge','Flores','García',9),(98012345,'Lucía','Jiménez','Rojas',18);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Aceite Motor','Lubricantes','100','29.99'),(2,'Filtro de Aire','Filtros','50','12.99'),(3,'Bujías','Encendido','80','7.99'),(4,'Pastillas de Freno','Frenos','30','49.99'),(5,'Filtro de Aceite','Filtros','60','8.99'),(6,'Batería','Eléctrico','20','99.99'),(7,'Amortiguador','Suspensión','25','59.99'),(8,'Aceite Motor','Lubricantes','100','29.99'),(9,'Filtro de Aire','Filtros','50','12.99'),(10,'Bujías','Encendido','80','7.99'),(11,'Pastillas de Freno','Frenos','30','49.99'),(12,'Filtro de Aceite','Filtros','60','8.99'),(13,'Batería','Eléctrico','20','99.99'),(14,'Amortiguador','Suspensión','25','59.99'),(15,'Correa de Distribución','Motor','40','39.99'),(16,'Termostato','Refrigeración','15','19.99'),(17,'Bomba de Agua','Refrigeración','12','79.99'),(18,'Líquido de Frenos','Frenos','70','9.99'),(19,'Radiador','Refrigeración','10','129.99'),(20,'Filtro de Combustible','Filtros','55','14.99'),(21,'Sensor de Oxígeno','Escape','18','39.99'),(22,'Embrague','Transmisión','8','199.99'),(23,'Aceite de Transmisión','Lubricantes','30','19.99'),(24,'Junta de Culata','Motor','5','49.99'),(25,'Escobillas Limpiaparabrisas','Visibilidad','40','9.99'),(26,'Filtro de Habitáculo','Filtros','25','17.99'),(27,'Bomba de Combustible','Combustible','12','89.99'),(28,'Correa de Alternador','Motor','30','24.99'),(29,'Bobina de Encendido','Encendido','20','29.99'),(30,'Filtro de Dirección Asistida','Dirección','15','21.99'),(31,'Bomba de Dirección Asistida','Dirección','10','69.99'),(32,'Kit de Distribución','Motor','8','129.99');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
INSERT INTO `promociones` VALUES (1,'2023-06-01','2023-06-07',10,'Descuento de verano'),(2,'2023-07-15','2023-07-31',15,'Promoción de vacaciones'),(3,'2023-09-01','2023-09-30',20,'Oferta de otoño'),(4,'2023-10-25','2023-11-05',12,'Promoción de Halloween'),(5,'2023-12-01','2023-12-31',18,'Promoción de Navidad'),(6,'2024-02-14','2024-02-14',10,'Descuento de San Valentín'),(7,'2024-04-01','2024-04-30',15,'Oferta de primavera'),(8,'2024-06-15','2024-06-30',20,'Promoción de aniversario'),(9,'2024-08-01','2024-08-31',12,'Promoción de verano'),(10,'2024-10-20','2024-11-05',18,'Promoción de Halloween'),(11,'2024-12-01','2024-12-31',10,'Promoción de Navidad'),(12,'2025-01-01','2025-01-31',15,'Oferta de Año Nuevo'),(13,'2025-03-15','2025-03-31',20,'Promoción de primavera'),(14,'2025-05-01','2025-05-31',12,'Promoción del Día del Trabajo'),(15,'2025-07-04','2025-07-04',18,'Promoción del Día de la Independencia'),(16,'2025-09-01','2025-09-30',10,'Promoción de otoño'),(17,'2025-10-25','2025-11-05',15,'Promoción de Halloween'),(18,'2025-12-01','2025-12-31',20,'Promoción de Navidad'),(19,'2026-02-14','2026-02-14',12,'Descuento de San Valentín'),(20,'2026-04-01','2026-04-30',18,'Oferta de primavera'),(21,'2026-06-15','2026-06-30',10,'Promoción de aniversario'),(22,'2026-08-01','2026-08-31',15,'Promoción de verano'),(23,'2026-10-20','2026-11-05',20,'Promoción de Halloween'),(24,'2026-12-01','2026-12-31',12,'Promoción de Navidad'),(25,'2027-01-01','2027-01-31',18,'Oferta de Año Nuevo');
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trabajo`
--

LOCK TABLES `trabajo` WRITE;
/*!40000 ALTER TABLE `trabajo` DISABLE KEYS */;
INSERT INTO `trabajo` VALUES (1,'ABC1234','50.00',NULL,1),(2,'DEF5678','75.00',NULL,2),(3,'GHI9012','60.00',NULL,3),(4,'JKL3456','120.00',NULL,4),(5,'MNO7890','90.00',NULL,5),(6,'PQR2345','80.00',NULL,6),(7,'STU6789','100.00',NULL,7),(8,'VWX0123','70.00',NULL,8),(9,'YZA4567','110.00',NULL,9),(10,'BCD8901','95.00',NULL,10),(11,'EFG2345','85.00',NULL,11),(12,'HIJ6789','150.00',NULL,12),(13,'KLM0123','55.00',NULL,13),(14,'NOP4567','125.00',NULL,14),(15,'QRS8901','70.00',NULL,15),(16,'TUV2345','90.00',NULL,16),(17,'WXY6789','120.00',NULL,17),(18,'ZAB0123','80.00',NULL,18),(19,'CDE4567','100.00',NULL,19),(20,'EFG8901','75.00',NULL,20),(21,'HIJ2345','65.00',NULL,21),(22,'KLM6789','130.00',NULL,22),(23,'NOP0123','95.00',NULL,23),(24,'QRS4567','115.00',NULL,24),(25,'TUV8901','85.00',NULL,25);
/*!40000 ALTER TABLE `trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trabajoindividual`
--

LOCK TABLES `trabajoindividual` WRITE;
/*!40000 ALTER TABLE `trabajoindividual` DISABLE KEYS */;
INSERT INTO `trabajoindividual` VALUES (12345678,1,1,'Reparación de motor'),(23456789,2,2,'Cambio de frenos'),(34567890,3,3,'Alineación y balanceo'),(45678901,4,4,'Reparación de transmisión'),(56789012,5,5,'Cambio de aceite'),(67890123,6,6,'Reemplazo de batería'),(78901234,7,7,'Reparación de sistema eléctrico'),(89012345,8,8,'Diagnóstico de fallas'),(90123456,9,9,'Reparación de suspensión'),(10234567,10,10,'Cambio de llantas'),(21345678,11,11,'Reparación de sistema de escape'),(32456789,12,12,'Cambio de filtro de aire'),(43567890,13,13,'Reparación de sistema de dirección'),(54678901,14,14,'Cambio de bujías'),(65789012,15,15,'Reparación de sistema de frenos'),(76890123,16,16,'Cambio de correa de distribución'),(87901234,17,17,'Reparación de sistema de climatización'),(98012345,18,18,'Cambio de amortiguadores'),(10901234,19,19,'Reparación de sistema de dirección asistida'),(21012345,20,20,'Cambio de sensor de oxígeno'),(32123456,21,21,'Reparación de sistema de suspensión neumática'),(43234567,22,22,'Cambio de filtro de combustible'),(54345678,23,23,'Reparación de sistema de inyección de combustible'),(65456789,24,24,'Cambio de bomba de agua'),(76567890,25,25,'Reparación de sistema de dirección hidráulica');
/*!40000 ALTER TABLE `trabajoindividual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES ('ABC1234','Toyota','Corolla','2019','Rojo',1,'Activo'),('BCD8901','Nissan','Altima','2021','Azul',10,'Activo'),('CDE4567','Chevrolet','Trax','2018','Rojo',19,'Activo'),('DEF5678','Honda','Civic','2020','Azul',2,'Activo'),('EFG2345','Toyota','Rav4','2020','Blanco',11,'Activo'),('EFG8901','Nissan','Kicks','2021','Negro',20,'Activo'),('GHI9012','Ford','Mustang','2018','Negro',3,'Activo'),('HIJ2345','Toyota','Highlander','2020','Gris',21,'Activo'),('HIJ6789','Honda','Fit','2017','Plata',12,'Activo'),('JKL3456','Chevrolet','Cruze','2021','Blanco',4,'Activo'),('KLM0123','Ford','Fiesta','2022','Rojo',13,'Activo'),('KLM6789','Honda','CR-V','2019','Azul',22,'Activo'),('MNO7890','Nissan','Sentra','2017','Gris',5,'Activo'),('NOP0123','Ford','Edge','2022','Blanco',23,'Activo'),('NOP4567','Chevrolet','Spark','2018','Negro',14,'Activo'),('PQR2345','Toyota','Camry','2020','Plata',6,'Activo'),('QRS4567','Chevrolet','Equinox','2018','Plata',24,'Activo'),('QRS8901','Nissan','Versa','2021','Gris',15,'Activo'),('STU6789','Honda','Accord','2019','Rojo',7,'Activo'),('TUV2345','Toyota','Yaris','2020','Azul',16,'Activo'),('TUV8901','Nissan','Rogue','2021','Rojo',25,'Activo'),('VWX0123','Ford','Escape','2022','Negro',8,'Activo'),('WXY6789','Honda','City','2019','Blanco',17,'Activo'),('YZA4567','Chevrolet','Malibu','2018','Gris',9,'Activo'),('ZAB0123','Ford','Explorer','2022','Plata',18,'Activo');
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,1,'2023-01-15','250.00'),(2,2,'2023-02-05','150.00'),(3,3,'2023-03-20','350.00'),(4,4,'2023-04-10','450.00'),(5,5,'2023-05-01','200.00'),(6,6,'2023-06-25','300.00'),(7,7,'2023-07-15','400.00'),(8,8,'2023-08-10','150.00'),(9,9,'2023-09-05','250.00'),(10,10,'2023-10-20','350.00'),(11,11,'2023-11-10','450.00'),(12,12,'2023-12-25','200.00'),(13,13,'2024-01-15','300.00'),(14,14,'2024-02-05','400.00'),(15,15,'2024-03-20','150.00'),(16,16,'2024-04-10','250.00'),(17,17,'2024-05-01','350.00'),(18,18,'2024-06-25','450.00'),(19,19,'2024-07-15','200.00'),(20,20,'2024-08-10','300.00'),(21,21,'2024-09-05','400.00'),(22,22,'2024-10-20','150.00'),(23,23,'2024-11-10','250.00'),(24,24,'2024-12-25','350.00'),(25,25,'2025-01-15','450.00');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ventaindividual`
--

LOCK TABLES `ventaindividual` WRITE;
/*!40000 ALTER TABLE `ventaindividual` DISABLE KEYS */;
INSERT INTO `ventaindividual` VALUES (1,1,'2',NULL,'29.99'),(2,1,'1',NULL,'12.99'),(3,2,'3',NULL,'7.99'),(4,2,'2',NULL,'49.99'),(5,3,'1',NULL,'8.99'),(6,3,'4',NULL,'99.99'),(7,4,'2',NULL,'59.99'),(8,4,'1',NULL,'39.99'),(9,5,'3',NULL,'19.99'),(10,5,'2',NULL,'79.99'),(11,6,'1',NULL,'9.99'),(12,6,'4',NULL,'129.99'),(13,7,'2',NULL,'14.99'),(14,7,'1',NULL,'39.99'),(15,8,'3',NULL,'199.99'),(16,8,'2',NULL,'19.99'),(17,9,'1',NULL,'49.99'),(18,9,'4',NULL,'9.99'),(19,10,'2',NULL,'9.99'),(20,10,'1',NULL,'17.99'),(21,11,'3',NULL,'89.99'),(22,11,'2',NULL,'24.99'),(23,12,'1',NULL,'29.99'),(24,12,'4',NULL,'21.99'),(25,13,'2',NULL,'69.99');
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

-- Dump completed on 2023-05-24 12:27:30
