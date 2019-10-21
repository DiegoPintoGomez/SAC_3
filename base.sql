-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.2.14-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2019-10-17 21:53:20
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for inge
CREATE DATABASE IF NOT EXISTS `inge` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `inge`;


-- Dumping structure for table inge.banco
CREATE TABLE IF NOT EXISTS `banco` (
  `base` int(10) NOT NULL DEFAULT '0',
  `encuesta` varchar(10) NOT NULL DEFAULT '0',
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`base`,`encuesta`),
  KEY `FK_Banco_Encuesta` (`encuesta`),
  CONSTRAINT `FK_Banco_Encuesta` FOREIGN KEY (`encuesta`) REFERENCES `encuesta` (`nombreEncuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table inge.banco: ~0 rows (approximately)
/*!40000 ALTER TABLE `banco` DISABLE KEYS */;
/*!40000 ALTER TABLE `banco` ENABLE KEYS */;


-- Dumping structure for table inge.contacto
CREATE TABLE IF NOT EXISTS `contacto` (
  `numero_Telefono` varchar(50) NOT NULL DEFAULT '',
  `estado` varchar(50) DEFAULT NULL,
  `encuesta` varchar(50) NOT NULL,
  `banco` int(50) NOT NULL,
  `citaTelefonica` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`numero_Telefono`,`encuesta`),
  KEY `FK_Contacto_Banco` (`banco`),
  KEY `FK_Contacto_Encuesta` (`encuesta`),
  CONSTRAINT `FK_Contacto_Banco` FOREIGN KEY (`banco`) REFERENCES `banco` (`base`),
  CONSTRAINT `FK_Contacto_Encuesta` FOREIGN KEY (`encuesta`) REFERENCES `encuesta` (`nombreEncuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table inge.contacto: ~0 rows (approximately)
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;


-- Dumping structure for table inge.encuesta
CREATE TABLE IF NOT EXISTS `encuesta` (
  `nombreEncuesta` varchar(50) NOT NULL DEFAULT '',
  `muestra` int(10) NOT NULL,
  PRIMARY KEY (`nombreEncuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table inge.encuesta: ~0 rows (approximately)
/*!40000 ALTER TABLE `encuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `encuesta` ENABLE KEYS */;


-- Dumping structure for table inge.operadora
CREATE TABLE IF NOT EXISTS `operadora` (
  `nombre` varchar(50) DEFAULT NULL,
  `rangoMenor` varchar(11) DEFAULT NULL,
  `rangoMayor` varchar(11) DEFAULT NULL,
  `Id_operador` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id_operador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table inge.operadora: ~0 rows (approximately)
/*!40000 ALTER TABLE `operadora` DISABLE KEYS */;
/*!40000 ALTER TABLE `operadora` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
