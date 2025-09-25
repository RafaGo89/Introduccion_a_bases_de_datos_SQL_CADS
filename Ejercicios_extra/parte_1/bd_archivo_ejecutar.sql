CREATE DATABASE  IF NOT EXISTS `sistema_futbol` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sistema_futbol`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema_futbol
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `codigo` smallint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `fecha_fundacion` date DEFAULT NULL,
  `ciudad` varchar(40) NOT NULL,
  `codigo_pais` char(4) NOT NULL,
  `valor` bigint NOT NULL,
  `codigo_estadio` char(5) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_estadio` (`codigo_estadio`),
  KEY `codigo_pais` (`codigo_pais`),
  CONSTRAINT `equipos_ibfk_1` FOREIGN KEY (`codigo_estadio`) REFERENCES `estadios` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `equipos_ibfk_2` FOREIGN KEY (`codigo_pais`) REFERENCES `paises` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'Real Madrid','1902-03-06','Madrid','ESP',5500000000,'SBEMA'),(2,'FC Barcelona','1899-11-29','Barcelona','ESP',5000000000,'CNBAR'),(3,'Atlético de Madrid','1903-04-26','Madrid','ESP',1200000000,'WMAD'),(4,'Athletic Club','1898-01-01','Bilbao','ESP',450000000,'SMLBI'),(5,'Sevilla FC','1890-01-25','Sevilla','ESP',650000000,'RSPSE'),(6,'Real Betis','1907-09-12','Sevilla','ESP',550000000,'BVSEV'),(7,'Manchester United','1878-01-01','Manchester','ENG',4800000000,'OTMAN'),(8,'Liverpool FC','1892-06-03','Liverpool','ENG',4500000000,'ANLIV'),(9,'Arsenal FC','1886-12-01','London','ENG',3200000000,'EMLON'),(10,'Manchester City','1880-01-01','Manchester','ENG',4200000000,'ETMAN'),(11,'Chelsea FC','1905-03-10','London','ENG',3100000000,'SBLON'),(12,'Tottenham Hotspur','1882-09-05','London','ENG',2800000000,'THLON'),(13,'Bayern Munich','1900-02-27','Munich','DEU',4860000000,'AAMUN'),(14,'Borussia Dortmund','1909-12-19','Dortmund','DEU',1800000000,'SIPDO'),(15,'Hertha BSC','1892-07-25','Berlin','DEU',350000000,'OBLBE'),(16,'Hamburger SV','1887-09-29','Hamburg','DEU',220000000,'VWHAM'),(17,'AC Milan','1899-12-16','Milan','ITA',990000000,'SSMIL'),(18,'Inter Milan','1908-03-09','Milan','ITA',1030000000,'SSMIL'),(19,'AS Roma','1927-07-22','Rome','ITA',720000000,'SOROM'),(20,'Juventus FC','1897-11-01','Turin','ITA',1700000000,'JSTUR'),(21,'SSC Napoli','1926-08-01','Naples','ITA',800000000,'DMNAP'),(22,'Paris Saint-Germain','1970-08-12','Paris','FRA',3210000000,'PDPAR'),(23,'Olympique de Marseille','1899-08-31','Marseille','FRA',500000000,'OVMAR'),(24,'Olympique Lyonnais','1950-08-03','Lyon','FRA',600000000,'GLYON'),(25,'Lille OSC','1944-09-23','Lille','FRA',400000000,'PSLIL'),(26,'AFC Ajax','1900-03-18','Amsterdam','NLD',700000000,'JCAMT'),(27,'SL Benfica','1904-02-28','Lisbon','PRT',850000000,'DLIS'),(28,'FC Porto','1893-09-28','Porto','PRT',750000000,'EDPOR'),(29,'Sporting CP','1906-07-01','Lisbon','PRT',650000000,'JAPOR'),(30,'Valencia CF','1919-03-18','Valencia','ESP',500000000,'MEVAL'),(31,'Real Sociedad','1909-09-07','San Sebastián','ESP',600000000,'ANEAS'),(32,'Villarreal CF','1923-03-10','Villarreal','ESP',480000000,'LCVLC'),(33,'Getafe CF','1983-07-08','Getafe','ESP',200000000,'GETAF'),(34,'CA Osasuna','1920-10-24','Pamplona','ESP',180000000,'SADPA'),(35,'Aston Villa','1874-03-21','Birmingham','ENG',600000000,'AVBIR'),(36,'Newcastle United','1892-12-09','Newcastle','ENG',700000000,'SPNEW'),(37,'KAA Gent','1864-01-01','Ghent','BEL',150000000,'GEVBE'),(38,'RC Celta de Vigo','1923-08-23','Vigo','ESP',250000000,'CVIGO'),(39,'RCD Espanyol','1900-10-28','Barcelona','ESP',280000000,'RCDE'),(40,'Lazio','1900-01-09','Rome','ITA',400000000,'SOROM');
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadios`
--

DROP TABLE IF EXISTS `estadios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadios` (
  `codigo` char(5) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `capacidad` mediumint unsigned NOT NULL,
  `codigo_pais` char(4) NOT NULL,
  `ciudad` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_pais` (`codigo_pais`),
  CONSTRAINT `estadios_ibfk_1` FOREIGN KEY (`codigo_pais`) REFERENCES `paises` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadios`
--

LOCK TABLES `estadios` WRITE;
/*!40000 ALTER TABLE `estadios` DISABLE KEYS */;
INSERT INTO `estadios` VALUES ('AAMUN','Allianz Arena',75024,'DEU','Munich'),('AFRAM','Amsterdam Arena',54990,'NLD','Amsterdam'),('ANEAS','Anoeta',39500,'ESP','San Sebastián'),('ANLIV','Anfield',53394,'ENG','Liverpool'),('AVBIR','Villa Park',42785,'ENG','Birmingham'),('BVSEV','Benito Villamarín',60721,'ESP','Sevilla'),('CNBAR','Camp Nou',99354,'ESP','Barcelona'),('CVIGO','Balaídos',29000,'ESP','Vigo'),('DLIS','Estádio da Luz',64642,'PRT','Lisbon'),('DMNAP','Diego Armando Maradona',54726,'ITA','Naples'),('EDPOR','Estádio do Dragão',50033,'PRT','Porto'),('EMLON','Emirates Stadium',60704,'ENG','London'),('ETMAN','Etihad Stadium',55097,'ENG','Manchester'),('GETAF','Coliseum Alfonso Pérez',17393,'ESP','Getafe'),('GEVBE','Ghelamco Arena',20000,'BEL','Ghent'),('GLYON','Groupama Stadium',59186,'FRA','Lyon'),('JAPOR','José Alvalade',50095,'PRT','Lisbon'),('JCAMT','Johan Cruyff Arena',55500,'NLD','Amsterdam'),('JSTUR','Juventus Stadium',41507,'ITA','Turin'),('LCVLC','La Cerámica',23500,'ESP','Villarreal'),('MEVAL','Mestalla',49430,'ESP','Valencia'),('OBLBE','Olympiastadion Berlin',74475,'DEU','Berlin'),('OTMAN','Old Trafford',74879,'ENG','Manchester'),('OVMAR','Orange Vélodrome',67394,'FRA','Marseille'),('PDPAR','Parc des Princes',47929,'FRA','Paris'),('PSLIL','Pierre-Mauroy',50186,'FRA','Lille'),('RCDE','RCDE Stadium',40000,'ESP','Barcelona'),('RSPSE','Ramón Sánchez-Pizjuán',43883,'ESP','Sevilla'),('SADPA','El Sadar',23576,'ESP','Pamplona'),('SBEMA','Santiago Bernabéu',81044,'ESP','Madrid'),('SBLON','Stamford Bridge',40834,'ENG','London'),('SIPDO','Signal Iduna Park',81365,'DEU','Dortmund'),('SMLBI','San Mamés',53289,'ESP','Bilbao'),('SOROM','Stadio Olimpico',72698,'ITA','Rome'),('SPNEW','St. James Park',52354,'ENG','Newcastle'),('SSMIL','San Siro',80018,'ITA','Milan'),('THLON','Tottenham Hotspur Stadium',62850,'ENG','London'),('VWHAM','Volksparkstadion',57000,'DEU','Hamburg'),('WEMLO','Wembley Stadium',90000,'ENG','London'),('WMAD','Wanda Metropolitano',68456,'ESP','Madrid');
/*!40000 ALTER TABLE `estadios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores` (
  `id` char(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `codigo_pais` char(4) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `salario_anual` decimal(15,2) NOT NULL,
  `codigo_equipo` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_equipo` (`codigo_equipo`),
  KEY `codigo_pais` (`codigo_pais`),
  CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`codigo_equipo`) REFERENCES `equipos` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `jugadores_ibfk_2` FOREIGN KEY (`codigo_pais`) REFERENCES `paises` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores`
--

LOCK TABLES `jugadores` WRITE;
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
INSERT INTO `jugadores` VALUES ('ACHA981104','Achraf','Hakimi','MAR','1998-11-04',15000000.00,22),('ALBE921002','Alisson','Becker','BRA','1992-10-02',10000000.00,8),('ANGR910321','Antoine','Griezmann','FRA','1991-03-21',22000000.00,3),('BRFE940908','Bruno','Fernandes','PRT','1994-09-08',15000000.00,7),('BUSA010905','Bukayo','Saka','ENG','2001-09-05',15000000.00,9),('CAHE920223','Casemiro','Henrique','BRA','1992-02-23',18000000.00,7),('CIIM900220','Ciro','Immobile','ITA','1990-02-20',8500000.00,40),('DAGE901107','David','de Gea','ESP','1990-11-07',8000000.00,NULL),('DAPA890416','Daniel','Parejo','ESP','1989-04-16',7000000.00,32),('DUVL000128','Dušan','Vlahović','SRB','2000-01-28',15000000.00,20),('ENFE010117','Enzo','Fernández','ARG','2001-01-17',12000000.00,11),('ERHA000721','Erling','Haaland','NOR','2000-07-21',52000000.00,10),('GAPA040805','Gavi','Páez','ESP','2004-08-05',15000000.00,2),('GEMO920407','Gerard','Moreno','ESP','1992-04-07',8000000.00,32),('GIDO990225','Gianluigi','Donnarumma','ITA','1999-02-25',14000000.00,22),('HAKA930728','Harry','Kane','ENG','1993-07-28',25000000.00,13),('IAAS870801','Iago','Aspas','ESP','1987-08-01',6000000.00,38),('INWI940615','Iñaki','Williams','GHA','1994-06-15',7000000.00,4),('ISAL920421','Isco','Alarcón','ESP','1992-04-21',5000000.00,6),('JAMA961123','James','Maddison','ENG','1996-11-23',10000000.00,12),('JAMU030226','Jamal','Musiala','DEU','2003-02-26',18000000.00,13),('JAOB930107','Jan','Oblak','SVN','1993-01-07',18000000.00,3),('JELI921215','Jesse','Lingard','ENG','1992-12-15',3000000.00,NULL),('JOGA950525','José Luis','Gayà','ESP','1995-05-25',7500000.00,30),('JUBE030629','Jude','Bellingham','ENG','2003-06-29',30000000.00,1),('KDBR910628','Kevin','De Bruyne','BEL','1991-06-28',24000000.00,10),('KHVK010212','Khvicha','Kvaratskhelia','GEO','2001-02-12',15000000.00,21),('KMBA981220','Kylian','Mbappé','FRA','1998-12-20',100000000.00,1),('LAMA970822','Lautaro','Martínez','ARG','1997-08-22',18000000.00,18),('LUMO850909','Luka','Modrić','HRV','1985-09-09',15000000.00,1),('MANE860327','Manuel','Neuer','DEU','1986-03-27',20000000.00,13),('MAOD981217','Martin','Odegaard','NOR','1998-12-17',12000000.00,9),('MARA971031','Marcus','Rashford','ENG','1997-10-31',13000000.00,7),('MARE890531','Marco','Reus','DEU','1989-05-31',12000000.00,14),('MIOY970421','Mikel','Oyarzabal','ESP','1997-04-21',9000000.00,31),('MOSA920615','Mohamed','Salah','EGY','1992-06-15',20000000.00,8),('NIBA970207','Nicolò','Barella','ITA','1997-02-07',14000000.00,18),('NIWI020712','Nico','Williams','ESP','2002-07-12',8000000.00,4),('OUDE970515','Ousmane','Dembélé','FRA','1997-05-15',18000000.00,22),('PEGO021125','Pedri','González','ESP','2002-11-25',18000000.00,2),('PHFO000528','Phil','Foden','ENG','2000-05-28',15000000.00,10),('RALE990610','Rafael','Leão','PRT','1999-06-10',16000000.00,17),('RAST941208','Raheem','Sterling','ENG','1994-12-08',16000000.00,11),('ROLE880821','Robert','Lewandowski','POL','1988-08-21',25000000.00,2),('SOHE920708','Son','Heung-min','KOR','1992-07-08',12000000.00,12),('TOKR900104','Toni','Kroos','DEU','1990-01-04',22000000.00,1),('VIJU000712','Vinicius','Junior','BRA','2000-07-12',40000000.00,1),('VIOS981229','Victor','Osimhen','SRB','1998-12-29',20000000.00,21),('VIVD910708','Virgil','van Dijk','NLD','1991-07-08',14000000.00,8),('YOEN970601','Youssef','En-Nesyri','MAR','1997-06-01',6000000.00,5);
/*!40000 ALTER TABLE `jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `codigo` char(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES ('ARG','Argentina'),('BEL','Bélgica'),('BRA','Brasil'),('DEU','Alemania'),('EGY','Egipto'),('ENG','Inglaterra'),('ESP','España'),('FRA','Francia'),('GEO','Georgia'),('GHA','Ghana'),('HRV','Croacia'),('ITA','Italia'),('KOR','Corea del Sur'),('MAR','Marruecos'),('NLD','Países Bajos'),('NOR','Noruega'),('POL','Polonia'),('PRT','Portugal'),('SRB','Serbia'),('SVN','Eslovenia');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sistema_futbol'
--

--
-- Dumping routines for database 'sistema_futbol'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-22 21:02:06
