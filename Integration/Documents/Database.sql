-- MySQL dump 10.13  Distrib 5.5.9, for Win32 (x86)
--
-- Host: localhost    Database: logging
-- ------------------------------------------------------
-- Server version	5.1.47-community

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
-- Current Database: `logging`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `logging` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `logging`;

--
-- Table structure for table `logger_logentry`
--

DROP TABLE IF EXISTS `logger_logentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logger_logentry` (
  `Id` int(11) NOT NULL,
  `ExceptionId` int(11) DEFAULT NULL,
  `Message` varchar(2000) DEFAULT NULL,
  `LoggerId` int(11) DEFAULT NULL,
  `ApplicationId` int(11) DEFAULT NULL,
  `SeverityLevel` int(11) DEFAULT NULL,
  `Server` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_LogEntry_Exception` (`ExceptionId`),
  KEY `FK_LogEntry_Application` (`ApplicationId`),
  KEY `FK_LogEntry_Logger` (`LoggerId`),
  CONSTRAINT `FK_LogEntry_Exception` FOREIGN KEY (`ExceptionId`) REFERENCES `logger_logexception` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_LogEntry_Application` FOREIGN KEY (`ApplicationId`) REFERENCES `logger_loggingapplication` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_LogEntry_Logger` FOREIGN KEY (`LoggerId`) REFERENCES `logger_logger` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logger_logentry`
--

LOCK TABLES `logger_logentry` WRITE;
/*!40000 ALTER TABLE `logger_logentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `logger_logentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logger_logexception`
--

DROP TABLE IF EXISTS `logger_logexception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logger_logexception` (
  `Id` int(11) NOT NULL,
  `InnerExceptionId` int(11) DEFAULT NULL,
  `Message` varchar(2000) DEFAULT NULL,
  `StackTrace` varchar(4000) DEFAULT NULL,
  `HelpLink` varchar(2000) DEFAULT NULL,
  `Source` varchar(1000) DEFAULT NULL,
  `ThrownFrom` varchar(1000) DEFAULT NULL,
  `HRESULT` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_LoggerException_InnerException` (`InnerExceptionId`),
  CONSTRAINT `FK_LoggerException_InnerException` FOREIGN KEY (`InnerExceptionId`) REFERENCES `logger_logexception` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logger_logexception`
--

LOCK TABLES `logger_logexception` WRITE;
/*!40000 ALTER TABLE `logger_logexception` DISABLE KEYS */;
/*!40000 ALTER TABLE `logger_logexception` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logger_logger`
--

DROP TABLE IF EXISTS `logger_logger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logger_logger` (
  `Id` int(11) NOT NULL,
  `Name` varchar(1000) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logger_logger`
--

LOCK TABLES `logger_logger` WRITE;
/*!40000 ALTER TABLE `logger_logger` DISABLE KEYS */;
/*!40000 ALTER TABLE `logger_logger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logger_loggingapplication`
--

DROP TABLE IF EXISTS `logger_loggingapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logger_loggingapplication` (
  `Id` int(11) NOT NULL,
  `Name` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logger_loggingapplication`
--

LOCK TABLES `logger_loggingapplication` WRITE;
/*!40000 ALTER TABLE `logger_loggingapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `logger_loggingapplication` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-01-10 21:02:29
