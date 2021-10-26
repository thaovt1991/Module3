-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: ManagerDrinksAndCoffee
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.3

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
-- Table structure for table `OrderCarryAway`
--

DROP TABLE IF EXISTS `OrderCarryAway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderCarryAway` (
  `idCarryAway` varchar(5) NOT NULL,
  `idDrinks` varchar(6) DEFAULT NULL,
  `quanityDrinksOrder` int DEFAULT '0',
  `idStaffServing` varchar(8) NOT NULL,
  `timeIn` datetime DEFAULT NULL,
  `timeOut` datetime DEFAULT NULL,
  `totalMoney` mediumtext,
  PRIMARY KEY (`idCarryAway`),
  KEY `idStaffServing` (`idStaffServing`),
  KEY `OrderCarryAway_ibfk_1` (`idDrinks`),
  CONSTRAINT `OrderCarryAway_ibfk_1` FOREIGN KEY (`idDrinks`) REFERENCES `Drinks` (`id`),
  CONSTRAINT `OrderCarryAway_ibfk_2` FOREIGN KEY (`idStaffServing`) REFERENCES `Staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderCarryAway`
--

LOCK TABLES `OrderCarryAway` WRITE;
/*!40000 ALTER TABLE `OrderCarryAway` DISABLE KEYS */;
INSERT INTO `OrderCarryAway` VALUES ('CA1','CF001',3,'NA123456','2021-10-15 00:00:00','2021-10-20 00:00:00',NULL);
/*!40000 ALTER TABLE `OrderCarryAway` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-23 12:52:12
