-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: web_site_db
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_versions`
--

LOCK TABLES `migration_versions` WRITE;
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
INSERT INTO `migration_versions` VALUES ('20200206164059','2020-02-06 16:41:24'),('20200206184707','2020-02-06 18:47:23');
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,'Yandex'),(2,'Google'),(3,'Mail'),(4,'Dell'),(5,'HP'),(6,'Asus');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649444F97DD` (`phone`),
  KEY `IDX_8D93D64932C8A3DE` (`organization_id`),
  KEY `IDX_8D93D649A76ED395` (`user_id`),
  CONSTRAINT `FK_8D93D64932C8A3DE` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  CONSTRAINT `FK_8D93D649A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'89615931205','[]','$argon2id$v=19$m=65536,t=4,p=1$tuI1LH1vZNdqgZIIc8PmNQ$W/PUPOBzTSiSBuDiyihs8prjiEvIvKwTWauIW2oU2y4',2,NULL,'admin','admin'),(4,'89615931208','[]','$argon2id$v=19$m=65536,t=4,p=1$pZakccr8Tl7y8j7e3lZmTg$da7AWN9H0AvAKJJK3bgc7nOWoSEXeHvtNBxL3WTiDJk',4,1,'Andrey','Ka'),(5,'89615931209','[]','$argon2id$v=19$m=65536,t=4,p=1$dalbSE5evjak0Ml3ijOs3g$37jSBc45iW+mZEXBy75D6qjuVf9+9H0IEK71YwD35Z8',3,4,'Ivan','Ivanov'),(6,'89615931210','[]','$argon2id$v=19$m=65536,t=4,p=1$2TP2bUSPPtcLTUwSJa1v7g$Gt0bWjGMc/PgZqeno19m27IgwBIuim629xMFg62emV8',1,4,'Petr','Ivanov'),(7,'89615931211','[]','$argon2id$v=19$m=65536,t=4,p=1$0N2rLkISqi4ThF2mkANx1g$LNJBbI5qR5XtcHEiGofVmYiIxQeQMompvA3YSPJ4kYk',1,1,'Alex','Petrov'),(8,'89615931212','[]','$argon2id$v=19$m=65536,t=4,p=1$cYppj3dIENWVEpJHCiZh/w$MMqZ6cRQPlmIDEshNMrg4umu4GfgSEQeI7jWLxmoYyU',2,1,'Boris','Ivanov'),(9,'89615931215','[]','$argon2id$v=19$m=65536,t=4,p=1$ze2ahdat1a7iAjlgCgeJCQ$Mlr0zVSinw13YcszBvmCYEOAP1jw7ntjnYnt8vC1Jf8',2,1,'Ivan','Borisov');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-10  1:17:28
