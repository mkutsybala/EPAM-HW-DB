-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: ec2.cevot0jnbma1.eu-west-2.rds.amazonaws.com    Database: ec2
-- ------------------------------------------------------
-- Server version	10.6.10-MariaDB-log

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
-- Table structure for table `availability_zone`
--

DROP TABLE IF EXISTS `availability_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `availability_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `availability_zone`
--

LOCK TABLES `availability_zone` WRITE;
/*!40000 ALTER TABLE `availability_zone` DISABLE KEYS */;
INSERT INTO `availability_zone` VALUES (1,'us-east-1'),(2,'us-east-2'),(3,'ap-south-1'),(4,'ap-northeast-1'),(5,'ca-central-1'),(6,'eu-west-1'),(7,'eu-west-2'),(8,'af-south-1');
/*!40000 ALTER TABLE `availability_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance`
--

DROP TABLE IF EXISTS `instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `i_type` varchar(50) DEFAULT NULL,
  `state` varchar(20) DEFAULT 'running',
  `vpc_id` int(11) NOT NULL DEFAULT 0,
  `availability_zone_id` int(11) NOT NULL DEFAULT 0,
  `owner_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`,`vpc_id`,`availability_zone_id`,`owner_id`),
  KEY `vpc_id` (`vpc_id`),
  KEY `availability_zone_id` (`availability_zone_id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `instance_ibfk_1` FOREIGN KEY (`vpc_id`) REFERENCES `vpc` (`id`),
  CONSTRAINT `instance_ibfk_2` FOREIGN KEY (`availability_zone_id`) REFERENCES `availability_zone` (`id`),
  CONSTRAINT `instance_ibfk_3` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance`
--

LOCK TABLES `instance` WRITE;
/*!40000 ALTER TABLE `instance` DISABLE KEYS */;
INSERT INTO `instance` VALUES (1,'test','t2.micro','running',10,1,2),(2,'DB_SRV','t2.xlarge','running',3,2,8),(3,'WEB_SRV','t2.large','running',3,2,8),(4,'App_SRV','t2.large','running',2,7,4),(5,'Exchange_SRV','t2.xlarge','running',7,5,8),(6,'LPR_SRV','t2.xlarge','running',2,6,5),(7,'LPR1_SRV','t2.xlarge','running',2,6,5),(8,'LPR2_SRV','t2.xlarge','running',2,6,5),(9,'LPR3_SRV','t2.xlarge','running',2,6,5),(11,'Demo1','t2.nano','running',2,8,2),(12,'Demo2','t2.nano','running',3,7,2),(13,'Demo3','t2.nano','running',4,5,2),(14,'Demo4','t2.nano','running',3,4,2),(15,'Demo4','t2.nano','running',8,4,2),(16,'SandBox','t2.xlarge','running',6,3,9),(17,'DevOpsDemo','t2.xlarge','running',5,1,7);
/*!40000 ALTER TABLE `instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_group`
--

DROP TABLE IF EXISTS `security_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `vpc_id` int(11) NOT NULL DEFAULT 0,
  `owner_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`,`vpc_id`,`owner_id`),
  KEY `vpc_id` (`vpc_id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `security_group_ibfk_1` FOREIGN KEY (`vpc_id`) REFERENCES `vpc` (`id`),
  CONSTRAINT `security_group_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_group`
--

LOCK TABLES `security_group` WRITE;
/*!40000 ALTER TABLE `security_group` DISABLE KEYS */;
INSERT INTO `security_group` VALUES (1,'SG_Eu',1,3),(2,'SG_UA',2,4),(3,'SG_USA',3,11),(4,'SG_Japan',5,7),(5,'SG_Demo_For_All',9,8),(6,'SG_Demo_Tutors',9,8),(7,'SG_Demo_SRV',9,8),(8,'SG_Demo1',10,2),(9,'SG_Demo2',11,2),(10,'SG_Demo3',12,2);
/*!40000 ALTER TABLE `security_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'test'),(3,'vlad'),(4,'petro'),(5,'ivan'),(6,'bob'),(7,'dilan'),(8,'poul'),(9,'catrine'),(10,'jack'),(11,'john');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vpc`
--

DROP TABLE IF EXISTS `vpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vpc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `owner_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`,`owner_id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `vpc_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vpc`
--

LOCK TABLES `vpc` WRITE;
/*!40000 ALTER TABLE `vpc` DISABLE KEYS */;
INSERT INTO `vpc` VALUES (1,'Europe',3),(2,'UA',4),(3,'USA',10),(4,'Asia',9),(5,'Japan',5),(6,'Kyiv',4),(7,'Canada',6),(8,'Australia',7),(9,'Demo',2),(10,'Demo_1',2),(11,'Demo_2',2),(12,'Demo_3',2);
/*!40000 ALTER TABLE `vpc` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-18  5:23:03
