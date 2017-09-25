CREATE DATABASE  IF NOT EXISTS `1100` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `1100`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: 1100
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `elemento`
--

DROP TABLE IF EXISTS `elemento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elemento` (
  `NIN` bigint(10) NOT NULL AUTO_INCREMENT,
  `nome_elemento` varchar(90) NOT NULL,
  `nsc_elemento` datetime NOT NULL,
  `seccao_id_seccao` int(11) NOT NULL,
  PRIMARY KEY (`NIN`,`seccao_id_seccao`),
  KEY `fk_elemento_seccao1_idx` (`seccao_id_seccao`),
  CONSTRAINT `fk_elemento_seccao1` FOREIGN KEY (`seccao_id_seccao`) REFERENCES `seccao` (`id_seccao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elemento`
--

LOCK TABLES `elemento` WRITE;
/*!40000 ALTER TABLE `elemento` DISABLE KEYS */;
/*!40000 ALTER TABLE `elemento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipa`
--

DROP TABLE IF EXISTS `equipa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipa` (
  `id_equipa` int(11) NOT NULL AUTO_INCREMENT,
  `seccao_id_seccao` int(11) NOT NULL,
  `nome_equipa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_equipa`,`seccao_id_seccao`),
  KEY `fk_equipa_seccao1_idx` (`seccao_id_seccao`),
  CONSTRAINT `fk_equipa_seccao1` FOREIGN KEY (`seccao_id_seccao`) REFERENCES `seccao` (`id_seccao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipa`
--

LOCK TABLES `equipa` WRITE;
/*!40000 ALTER TABLE `equipa` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seccao`
--

DROP TABLE IF EXISTS `seccao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seccao` (
  `id_seccao` int(11) NOT NULL AUTO_INCREMENT,
  `nome_seccao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_seccao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seccao`
--

LOCK TABLES `seccao` WRITE;
/*!40000 ALTER TABLE `seccao` DISABLE KEYS */;
/*!40000 ALTER TABLE `seccao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id_transaction` int(11) NOT NULL,
  `elemento_id` bigint(10) NOT NULL,
  `valor` int(11) NOT NULL,
  `data` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_transaction`,`elemento_id`),
  KEY `elemento_id_idx` (`elemento_id`),
  CONSTRAINT `elemento_id` FOREIGN KEY (`elemento_id`) REFERENCES `elemento` (`NIN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `id_user_roles` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  PRIMARY KEY (`user_name`),
  UNIQUE KEY `id_user_roles_UNIQUE` (`id_user_roles`),
  CONSTRAINT `fk_user_roles_users` FOREIGN KEY (`user_name`) REFERENCES `users` (`user_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (6,'elemento','1234567890'),(5,'developer','dev'),(4,'admin','teste');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_users` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(90) NOT NULL,
  PRIMARY KEY (`user_name`),
  UNIQUE KEY `id_users_UNIQUE` (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'1234567890','teste'),(2,'dev','devops'),(1,'teste','teste');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database '1100'
--

--
-- Dumping routines for database '1100'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-25 12:55:31
