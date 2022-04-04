-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: lavadospring
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apaterno` varchar(50) NOT NULL,
  `amaterno` varchar(50) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `fecha_registro` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Mauricio','Ramírez','López','Zaragoza Sur #238, Nuevo Necaxa, Juan Galindo, Puebla.','7641208520','12345678mauricio12345678@gmail.com','2022-03-31',1),(2,'Miguel','Ramírez','Santos','Zaragoza Sur #238, Nuevo Necaxa, Juan Galindo, Puebla.','7641122940','Miguel@gmail.com','2022-03-30',1),(9,'Montserrat','Ramírez','López','Zaragoza Sur #238, Nuevo Necaxa, Juan Galindo, Puebla.','7761234567','Montse@gmail.com','2022-03-31',1),(10,'Rosalia','López','Cruz','Zaragoza Sur #238, Nuevo Necaxa, Juan Galindo, Puebla.','76452978967','Rosa@gmail.com','2022-03-29',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio` (
  `idservicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `costo` double NOT NULL,
  `fecha_registro` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`idservicio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'Lavado de Motor Mamalon',120.5,'2022-03-31',1),(2,'Encerado',249.99,'2022-03-30',1),(5,'Lavado de Motor',120.5,'2022-03-25',1);
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajador`
--

DROP TABLE IF EXISTS `trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trabajador` (
  `idtrabajador` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `aparterno` varchar(50) NOT NULL,
  `amaterno` varchar(50) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `contrasena` varchar(25) NOT NULL,
  `tipo` enum('Cajero','Lavador','') NOT NULL,
  `fecha_registro` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`idtrabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajador`
--

LOCK TABLES `trabajador` WRITE;
/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
INSERT INTO `trabajador` VALUES (1,'Sandra','Aguilar','Santos','Xicotepec de Juarez, Puebla.','7641589812','Sandra@gmail.com','root','Cajero','2022-03-31',1),(5,'Arely','Aguilar','Farias','La Uno, Puebla.','7645897365','Are@gmail.com','12345','Cajero','2022-03-30',1);
/*!40000 ALTER TABLE `trabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo` (
  `idvehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` varchar(10) NOT NULL,
  `tipo` enum('Sedan','Deportivo','Camioneta Cerrada','Tractor','Camioneta de Batea','Camion','Autobus') NOT NULL,
  `marca` enum('WV','FORD','TOYOTA','BMW','NISSAN','CHEVROLET','TESLA') NOT NULL,
  `modelo` enum('1985','1986','1987','1988','1989','1990','1991') NOT NULL,
  `color` varchar(25) NOT NULL,
  `fecha_registro` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `idcliente` int(11) NOT NULL,
  PRIMARY KEY (`idvehiculo`),
  KEY `FK_id_cliente` (`idcliente`) USING BTREE,
  CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES (1,'ABC123','Sedan','FORD','1985','Azul','2022-03-31',1,1);
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `idtrabajador` int(11) NOT NULL,
  `idcajero` int(11) NOT NULL,
  `idservicio` int(11) NOT NULL,
  `idvehiculo` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`idventa`),
  KEY `FK_idcajero` (`idcajero`),
  KEY `FK_idtrabajador` (`idtrabajador`) USING BTREE,
  KEY `FK_idservicio` (`idservicio`) USING BTREE,
  KEY `FK_idvehiculo` (`idvehiculo`) USING BTREE,
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`idservicio`) REFERENCES `servicio` (`idservicio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`idtrabajador`) REFERENCES `trabajador` (`idtrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`idvehiculo`) REFERENCES `vehiculo` (`idvehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ventas_ibfk_4` FOREIGN KEY (`idcajero`) REFERENCES `trabajador` (`idtrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,'2022-03-01',5,5,2,1,0);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-01  1:26:21
