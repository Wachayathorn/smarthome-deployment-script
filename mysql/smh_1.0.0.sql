-- --------------------------------------------------------
-- Host:                         3.142.219.106
-- Server version:               8.0.24 - MySQL Community Server - GPL
-- Server OS:                    Linux
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table Smart-Home.device_DHT
CREATE TABLE IF NOT EXISTS `device_DHT` (
  `dht_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` int DEFAULT NULL,
  `is_online` int NOT NULL,
  `temperature` varchar(10) DEFAULT NULL,
  `moisture` varchar(10) DEFAULT NULL,
  `sw_last_update` datetime DEFAULT NULL,
  `hw_last_update` datetime DEFAULT NULL,
  `pi_id` bigint NOT NULL,
  `position_x` varchar(50) DEFAULT NULL,
  `position_y` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dht_id`),
  KEY `FK__Raspberry_Pi` (`pi_id`),
  CONSTRAINT `FK__Raspberry_Pi` FOREIGN KEY (`pi_id`) REFERENCES `Raspberry_Pi` (`Pi_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='DHT';

-- Dumping data for table Smart-Home.device_DHT: ~0 rows (approximately)
/*!40000 ALTER TABLE `device_DHT` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_DHT` ENABLE KEYS */;

-- Dumping structure for table Smart-Home.device_Light
CREATE TABLE IF NOT EXISTS `device_Light` (
  `light_id` bigint NOT NULL,
  `pi_id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int DEFAULT NULL,
  `is_online` int NOT NULL,
  `sw_last_update` datetime DEFAULT NULL,
  `hw_last_update` datetime DEFAULT NULL,
  `position_x` varchar(50) DEFAULT NULL,
  `position_y` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`light_id`),
  KEY `FK_device_Light_Raspberry_Pi` (`pi_id`),
  CONSTRAINT `FK_device_Light_Raspberry_Pi` FOREIGN KEY (`pi_id`) REFERENCES `Raspberry_Pi` (`Pi_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Light';

-- Dumping data for table Smart-Home.device_Light: ~0 rows (approximately)
/*!40000 ALTER TABLE `device_Light` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_Light` ENABLE KEYS */;

-- Dumping structure for table Smart-Home.Raspberry_Pi
CREATE TABLE IF NOT EXISTS `Raspberry_Pi` (
  `Pi_ID` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `create_time` datetime NOT NULL,
  `status` int NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`Pi_ID`) USING BTREE,
  KEY `FK_Raspberry_Pi_User` (`user_id`),
  CONSTRAINT `FK_Raspberry_Pi_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Raspberry Pi for user';

-- Dumping data for table Smart-Home.Raspberry_Pi: ~0 rows (approximately)
/*!40000 ALTER TABLE `Raspberry_Pi` DISABLE KEYS */;
/*!40000 ALTER TABLE `Raspberry_Pi` ENABLE KEYS */;

-- Dumping structure for table Smart-Home.User
CREATE TABLE IF NOT EXISTS `User` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `first_access` datetime DEFAULT NULL,
  `last_access` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='User for Smart-Home';

-- Dumping data for table Smart-Home.User: ~0 rows (approximately)
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
