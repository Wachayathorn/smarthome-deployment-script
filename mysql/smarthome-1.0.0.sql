-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: 3.142.219.106    Database: SMARTHOME
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.0-MariaDB-1:10.6.0+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Raspberry_Pi`
--

DROP TABLE IF EXISTS `Raspberry_Pi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Raspberry_Pi` (
  `Pi_ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `create_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `position_x` varchar(50) DEFAULT NULL,
  `position_y` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Pi_ID`),
  KEY `FK_Raspberry_Pi_User` (`user_id`),
  CONSTRAINT `FK_6a649652c631a22481732c21572` FOREIGN KEY (`user_id`) REFERENCES `User` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Raspberry_Pi`
--

LOCK TABLES `Raspberry_Pi` WRITE;
/*!40000 ALTER TABLE `Raspberry_Pi` DISABLE KEYS */;
INSERT INTO `Raspberry_Pi` VALUES (1,'chinnu home','2021-05-22 10:24:23',1,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `Raspberry_Pi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `first_access` datetime DEFAULT NULL,
  `last_access` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'User for','Development','2021-05-22 09:09:59',NULL,NULL);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_DHT`
--

DROP TABLE IF EXISTS `device_DHT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_DHT` (
  `dht_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `is_online` int(11) NOT NULL,
  `temperature` varchar(10) DEFAULT NULL,
  `moisture` varchar(10) DEFAULT NULL,
  `sw_last_update` datetime DEFAULT NULL,
  `hw_last_update` datetime DEFAULT NULL,
  `pi_id` int(11) NOT NULL,
  `position_x` varchar(50) DEFAULT NULL,
  `position_y` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dht_id`),
  KEY `FK__Raspberry_Pi` (`pi_id`),
  CONSTRAINT `FK_c578e9031f67875455d39c09d02` FOREIGN KEY (`pi_id`) REFERENCES `Raspberry_Pi` (`Pi_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_DHT`
--

LOCK TABLES `device_DHT` WRITE;
/*!40000 ALTER TABLE `device_DHT` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_DHT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_Light`
--

DROP TABLE IF EXISTS `device_Light`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_Light` (
  `light_id` int(11) NOT NULL,
  `pi_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `is_online` int(11) NOT NULL,
  `sw_last_update` datetime DEFAULT NULL,
  `hw_last_update` datetime DEFAULT NULL,
  `position_x` varchar(50) DEFAULT NULL,
  `position_y` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`light_id`),
  KEY `FK_device_Light_Raspberry_Pi` (`pi_id`),
  CONSTRAINT `FK_8ee71021cdf1f85925c3bd4c0cf` FOREIGN KEY (`pi_id`) REFERENCES `Raspberry_Pi` (`Pi_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_Light`
--

LOCK TABLES `device_Light` WRITE;
/*!40000 ALTER TABLE `device_Light` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_Light` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'SMARTHOME'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-26 18:18:57
