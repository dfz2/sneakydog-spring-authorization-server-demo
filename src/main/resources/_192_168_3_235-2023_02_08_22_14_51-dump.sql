-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: 192.168.3.235    Database: local2
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BLOB_DATA` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_BLOB_TRIGGERS`
--

LOCK TABLES `QRTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CALENDAR` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CALENDARS`
--

LOCK TABLES `QRTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CRON_EXPRESSION` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TIME_ZONE_ID` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CRON_TRIGGERS`
--

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ENTRY_ID` varchar(95) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `INSTANCE_NAME` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FIRED_TIME` bigint DEFAULT NULL,
  `SCHED_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `STATE` varchar(16) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `JOB_NAME` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `JOB_GROUP` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_FIRED_TRIGGERS`
--

LOCK TABLES `QRTZ_FIRED_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `JOB_NAME` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `JOB_GROUP` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IS_DURABLE` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IS_UPDATE_DATA` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `JOB_DATA` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_JOB_DETAILS`
--

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LOCK_NAME` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_LOCKS`
--

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;
INSERT INTO `QRTZ_LOCKS` (`SCHED_NAME`, `LOCK_NAME`) VALUES ('quartzScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `QRTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `INSTANCE_NAME` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CHECKIN_TIME` bigint DEFAULT NULL,
  `CHECKIN_INTERVAL` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SCHEDULER_STATE`
--

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REPEAT_COUNT` bigint DEFAULT NULL,
  `REPEAT_INTERVAL` bigint DEFAULT NULL,
  `TIMES_TRIGGERED` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STR_PROP_1` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STR_PROP_2` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STR_PROP_3` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `INT_PROP_1` int DEFAULT NULL,
  `INT_PROP_2` int DEFAULT NULL,
  `LONG_PROP_1` bigint DEFAULT NULL,
  `LONG_PROP_2` bigint DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `JOB_NAME` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `JOB_GROUP` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint DEFAULT NULL,
  `PREV_FIRE_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TRIGGER_TYPE` varchar(8) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `START_TIME` bigint DEFAULT NULL,
  `END_TIME` bigint DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint DEFAULT NULL,
  `JOB_DATA` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_TRIGGERS`
--

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REGISTERED_CLIENT`
--

DROP TABLE IF EXISTS `REGISTERED_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REGISTERED_CLIENT` (
  `ID` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CLIENT_ID` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(400) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `JSON_CONTENT` varchar(5000) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REGISTERED_CLIENT`
--

LOCK TABLES `REGISTERED_CLIENT` WRITE;
/*!40000 ALTER TABLE `REGISTERED_CLIENT` DISABLE KEYS */;
INSERT INTO `REGISTERED_CLIENT` (`ID`, `CLIENT_ID`, `CLIENT_SECRET`, `JSON_CONTENT`) VALUES ('5ad278be-18c5-46b6-9480-95412b7c5963','1231','1321231','{\"id\":\"322ff3ce-ba5f-4e8e-9a7c-1221b3b3a722\",\"clientId\":\"1231\",\"clientSecret\":\"1321231\",\"authorizationGrantTypes\":null,\"redirectUris\":[\"http://127.0.0.1:8080/authorized\",\"http://127.0.0.1:8080/login/oauth2/code/messaging-client-oidc\"],\"scopes\":[\"message.read\",\"openid\",\"message.write\"],\"clientSettings\":{\"settings\":{\"setting.client.require-user-consent\":false,\"setting.client.require-proof-key\":false}},\"tokenSettings\":{\"settings\":{\"setting.token.access-token-time-to-live\":300.000000000,\"setting.token.refresh-token-time-to-live\":3600.000000000,\"setting.token.reuse-refresh-tokens\":true}},\"methods\":[\"post\",\"basic\"],\"grantTypes\":[\"authorization_code\",\"client_credentials\"]}'),('94cf9ef4-ee85-4591-aa5c-e402e9c36591','1231313','1231313','{\"id\":\"94cf9ef4-ee85-4591-aa5c-e402e9c36591\",\"clientId\":\"1231313\",\"clientSecret\":\"1231313\",\"clientAuthenticationMethods\":[{\"value\":\"post\"},{\"value\":\"basic\"}],\"authorizationGrantTypes\":[{\"value\":\"client_credentials\"},{\"value\":\"authorization_code\"}],\"redirectUris\":[\"http://127.0.0.1:8080/authorized\",\"http://127.0.0.1:8080/login/oauth2/code/messaging-client-oidc\"],\"scopes\":[\"openid\",\"message.read\",\"message.write\"],\"clientSettings\":{\"settings\":{\"setting.client.require-user-consent\":false,\"setting.client.require-proof-key\":false}},\"tokenSettings\":{\"settings\":{\"setting.token.access-token-time-to-live\":300.000000000,\"setting.token.refresh-token-time-to-live\":3600.000000000,\"setting.token.reuse-refresh-tokens\":true}}}');
/*!40000 ALTER TABLE `REGISTERED_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorities` (
  `username` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `authority` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` (`username`, `authority`) VALUES ('1231313','ROLE_USER'),('test@yeah.net','ROLE_USER'),('user@yeah.net','ROLE_USER');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int DEFAULT NULL,
  `version` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `script` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `checksum` int DEFAULT NULL,
  `installed_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `installed_on` timestamp NULL DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  `success` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flyway_schema_history`
--

LOCK TABLES `flyway_schema_history` WRITE;
/*!40000 ALTER TABLE `flyway_schema_history` DISABLE KEYS */;
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES (1,'1','<< Flyway Baseline >>','BASELINE','<< Flyway Baseline >>',NULL,'root','2021-04-17 12:20:36',0,1);
/*!40000 ALTER TABLE `flyway_schema_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` (`next_val`) VALUES (1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `id` bigint DEFAULT NULL,
  `quantity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `username` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ipAddress` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `region` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userAgent` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `loginStatus` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`username`, `ipAddress`, `region`, `userAgent`, `createdAt`, `loginStatus`, `id`) VALUES ('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54','2023-01-02 19:08:02','y',1609869118661242880),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54','2023-01-02 19:08:42','y',1609869286487961600),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54','2023-01-02 19:10:41','y',1609869785673052160),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54','2023-01-02 19:11:40','y',1609870031207608320),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-06 10:45:51','y',1611192287952195584),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-06 17:30:15','y',1611294060478738432),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-06 17:30:34','y',1611294141252644864),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-06 17:36:06','y',1611295530972356608),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-06 21:07:15','y',1611348671000485888),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-06 21:23:59','y',1611352881276502016),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-06 21:30:48','y',1611354596595822592),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-06 21:33:20','y',1611355236201922560),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-06 21:34:29','y',1611355522106757120),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-06 21:36:56','y',1611356138451365888),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-06 21:50:01','y',1611359432070500352),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-07 11:30:14','y',1611565845273047040),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-07 11:38:46','y',1611567994434379776),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-07 11:43:14','y',1611569118931542016),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-07 12:04:59','y',1611574591910969344),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-07 12:24:50','y',1611579586928697344),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-07 12:28:21','y',1611580473671585792),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-07 13:49:33','y',1611600907645390848),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-07 13:52:47','y',1611601722837721088),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-07 13:54:10','y',1611602067794108416),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-07 15:17:22','y',1611623033500766208),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-07 15:22:34','y',1611624313627537408),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-07 15:33:16','y',1611627009369636864),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-07 15:33:27','y',1611627056459087872),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-24 17:23:19','y',1617815295880486912),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-24 22:34:00','y',1617893482660532224),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76','2023-01-24 22:34:29','y',1617893606124040192),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-24 22:51:52','y',1617897979845124096),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-24 23:11:18','y',1617902871095644160),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-24 23:13:50','y',1617903506159362048),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-24 23:24:17','y',1617906135467909120),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-24 23:37:44','y',1617909521319809024),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-24 23:41:09','y',1617910381168914432),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-24 23:46:37','y',1617911756518936576),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-24 23:50:25','y',1617912714200170496),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-24 23:55:54','y',1617914092016414720),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-24 23:57:37','y',1617914524000415744),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-24 23:59:56','y',1617915109009371136),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 00:09:18','y',1617917466749263872),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 00:14:16','y',1617918717620699136),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 00:19:58','y',1617920151682658304),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 00:27:44','y',1617922105032912896),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 00:28:16','y',1617922240647335936),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 00:48:32','y',1617927341025865728),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 01:03:37','y',1617931135772114944),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 08:45:18','y',1618047323294470144),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 08:56:28','y',1618050131125145600),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 08:56:41','y',1618050187618226176),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 10:30:25','y',1618073774089637888),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 11:47:27','y',1618093162364784640),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 11:53:19','y',1618094638298398720),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 11:59:41','y',1618096237708148736),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 12:05:07','y',1618097605114167296),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 13:47:39','n',1618123409248321536),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 13:48:27','n',1618123609815744512),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 14:24:34','y',1618132699010924544),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 14:24:50','n',1618132766652465152),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 14:28:56','n',1618133799172628480),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 14:29:54','n',1618134043226652672),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 14:34:14','n',1618135131619069952),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 14:35:58','n',1618135571496796160),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 14:36:08','n',1618135610470268928),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-25 14:36:10','y',1618135619769040896),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-26 10:16:13','n',1618432589617262592),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-26 10:22:52','y',1618434262972592128),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-26 10:35:23','y',1618437411678547968),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-26 11:16:51','y',1618447847379529728),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-26 11:17:14','y',1618447943764635648),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-26 21:59:20','y',1618609532622958592),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-26 23:23:15','y',1618630653548261376),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-26 23:23:20','y',1618630674884685824),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-26 23:24:18','y',1618630918280146944),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 10:50:02','y',1618803487197196288),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 10:52:22','y',1618804072826892288),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 11:03:15','y',1618806812466487296),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 11:12:58','y',1618809257632587776),('false','false','false','false','2023-01-27 11:22:58','true',1618811775833878528),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 11:24:32','y',1618812170735988736),('false','false','false','false','2023-01-27 11:25:15','true',1618812350059368448),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 11:26:19','y',1618812619404894208),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 11:30:34','y',1618813687446732800),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 11:54:55','y',1618819814423109632),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 11:59:34','y',1618820985376317440),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 12:02:22','y',1618821691453841408),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 12:06:16','y',1618822671301959680),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 12:13:13','y',1618824422465757184),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 12:14:29','y',1618824741039919104),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 12:16:18','y',1618825195501129728),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 12:26:37','y',1618827793704685568),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 12:27:03','y',1618827901263417344),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 12:49:13','y',1618833479763259392),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 14:17:20','y',1618855654725545984),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 14:30:46','y',1618859036412596224),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 14:37:34','y',1618860749701816320),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 14:48:27','y',1618863487210852352),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 15:10:18','y',1618868986618683392),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 15:18:24','y',1618871022609297408),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 15:28:05','n',1618873459671912448),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 15:35:20','n',1618875286371024896),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 15:36:11','n',1618875500456689664),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 15:39:11','n',1618876255544602624),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 15:39:22','y',1618876300687896576),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 15:40:04','y',1618876478673125376),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 15:41:27','y',1618876823021367296),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 15:43:09','y',1618877252824281088),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 15:44:27','y',1618877580869189632),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 15:44:56','y',1618877703078625280),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 15:45:47','n',1618877914001784832),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 15:45:49','y',1618877922876932096),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 15:46:59','y',1618878219561062400),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 15:47:05','n',1618878241623101440),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 15:47:07','y',1618878251848814592),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 15:50:39','y',1618879142035279872),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 15:51:10','y',1618879268841672704),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 16:14:05','y',1618885039142817792),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 16:15:07','y',1618885297532915712),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 21:22:15','y',1618962589844066304),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 21:40:46','y',1618967250852454400),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 21:42:33','y',1618967698841919488),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 21:59:01','y',1618971844236087296),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 21:59:47','y',1618972037631250432),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 22:20:26','y',1618977232780001280),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-27 22:21:23','y',1618977471658283008),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-28 22:40:59','y',1619344793514373120),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-28 22:44:48','y',1619345754349727744),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-28 22:47:07','y',1619346336896610304),('test2@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-28 22:50:37','n',1619347217855639552),('test2@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61','2023-01-28 22:54:08','y',1619348100299452416),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.70','2023-02-04 14:38:52','y',1621760176729423872),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.70','2023-02-04 14:42:37','y',1621761120363950080),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.70','2023-02-04 21:36:03','y',1621865164487077888),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.70','2023-02-04 22:49:54','y',1621883751792717824),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.70','2023-02-05 20:47:16','y',1622215275209637888),('sneakydog@yeah.net','127.0.0.1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.70','2023-02-05 22:38:45','y',1622243334272929792),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','XX,XX','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.70','2023-02-05 22:39:56','y',1622243631892353024),('sneakydog@yeah.net','0:0:0:0:0:0:0:1','UNKNOW','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.70','2023-02-05 22:45:56','y',1622245140830973952);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint DEFAULT NULL,
  `parentId` bigint DEFAULT NULL,
  `menuName` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `perms` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `menuType` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deleted` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `parentId`, `menuName`, `perms`, `url`, `menuType`, `deleted`) VALUES (1,4,'Users V1','ROLE_USER_LIST','/user/index','C','N'),(2,4,'Menus V1','ROLE_USER_MENUS_LIST','/user/menus/list','C','N'),(3,4,'Logs V1','ROLE_USER_LOGS','/user/user_login_logs','C','N'),(4,0,'Settings','#','#','M','N'),(5,4,'Roles V1','ROLE_USER_ROLES','/role/index','C','N'),(6,2,'Add Menu','ROLE_USER_MENUS_ADD','/user/menus/add','F','N'),(7,4,'Online Users V1','ROLE_USER_ONLINE_LIST','/user/online/list','C','N'),(8,2,'Save Menu','ROLE_USER_MENUS_SAVE','/user/menus/save','F','N'),(9,2,'Delete Menu','ROLE_USER_MENUS_DEL','/user/menus/del','F','N'),(10,0,'Roles','ROLE_','#','M','N'),(11,10,'Delete Roles','ROLE_USER_ROLES_DELETE','/user/roles/delete','C','N'),(12,2,'Edit Menu','ROLE_USER_MENUS_EDIT','/user/menus/{menuId}','F','N'),(13,5,'User Roles Add','ROLE_USER_ROLES_ADD','/roles/add','F','N'),(14,5,'Roles SaveOrUpdate','ROLE_USER_ROLES_SAVE','/role/save','F','N'),(15,5,'Roles Edit','ROLE_USER_ROLES_EDIT','/role/{roleId}','F','N'),(17,4,'Registered Clients V1','ROLE_REGISTERED_CLIENT','/registered/clients','C','N'),(18,17,'Add Registered Clients V1','ROLE_REGISTERED_CLIENTS_ADD','/registered/clients/add','F','N'),(20,0,'My App','ROLE_MY_APP','/my-app.html','B','N'),(21,22,'Multi Language test','ROLE_DEMO_LANG','/demo/lang/test','M','N'),(22,0,'demos','ROLE_','','M','N'),(23,22,'logfile','ROLE_DEMO_logfile','/demo/logfile','C','N'),(1609869755830579200,4,'Jobs','ROLE_JOB_LIST','/job/index','C','N'),(1618803801367343104,22,'Uplaod File demo','ROLE_DEMO_UPLOAD','/demo/upload','C','N'),(1618820358713745408,5,'#','#','/role/menus/ztrees','I','N'),(1618970868972380160,5,'查看授权','ROLE_USER_ROLES_AUTHORIZE_VIEW','/roles/{roleId}/authorize/view','M','N'),(1621760469655420928,22,'TestPyNotebook','ROLE_DEMO_JPBK','/demo/jbnbook','C','N');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myorder`
--

DROP TABLE IF EXISTS `myorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myorder` (
  `order_id` bigint DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `pay_amount` decimal(19,2) DEFAULT NULL,
  `total_amount` decimal(19,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myorder`
--

LOCK TABLES `myorder` WRITE;
/*!40000 ALTER TABLE `myorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `myorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_authorization`
--

DROP TABLE IF EXISTS `oauth2_authorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_authorization` (
  `id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `registered_client_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `principal_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `authorization_grant_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `attributes` longtext COLLATE utf8mb4_general_ci,
  `state` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `authorization_code_value` blob,
  `authorization_code_issued_at` timestamp NULL DEFAULT NULL,
  `authorization_code_expires_at` timestamp NULL DEFAULT NULL,
  `authorization_code_metadata` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `access_token_value` blob,
  `access_token_issued_at` timestamp NULL DEFAULT NULL,
  `access_token_expires_at` timestamp NULL DEFAULT NULL,
  `access_token_metadata` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `access_token_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `access_token_scopes` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `oidc_id_token_value` blob,
  `oidc_id_token_issued_at` timestamp NULL DEFAULT NULL,
  `oidc_id_token_expires_at` timestamp NULL DEFAULT NULL,
  `oidc_id_token_metadata` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `refresh_token_value` blob,
  `refresh_token_issued_at` timestamp NULL DEFAULT NULL,
  `refresh_token_expires_at` timestamp NULL DEFAULT NULL,
  `refresh_token_metadata` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_authorization`
--

LOCK TABLES `oauth2_authorization` WRITE;
/*!40000 ALTER TABLE `oauth2_authorization` DISABLE KEYS */;
INSERT INTO `oauth2_authorization` (`id`, `registered_client_id`, `principal_name`, `authorization_grant_type`, `attributes`, `state`, `authorization_code_value`, `authorization_code_issued_at`, `authorization_code_expires_at`, `authorization_code_metadata`, `access_token_value`, `access_token_issued_at`, `access_token_expires_at`, `access_token_metadata`, `access_token_type`, `access_token_scopes`, `oidc_id_token_value`, `oidc_id_token_issued_at`, `oidc_id_token_expires_at`, `oidc_id_token_metadata`, `refresh_token_value`, `refresh_token_issued_at`, `refresh_token_expires_at`, `refresh_token_metadata`) VALUES ('5a139516-8107-434f-a1f7-a690172e2e02','236d910e-5ed0-490b-95c4-a0abb4cf8cbf','hyhdfz@gmail.com','authorization_code','{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest\":{\"@class\":\"org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest\",\"authorizationUri\":\"http://auth-server:9001/oauth2/authorize\",\"authorizationGrantType\":{\"value\":\"authorization_code\"},\"responseType\":{\"value\":\"code\"},\"clientId\":\"d47632e9bc594d6b9c40186f2c793b83\",\"redirectUri\":\"http://127.0.0.1:8080/login/oauth2/code/spring-boot-admin-client-demo\",\"scopes\":[\"java.util.Collections$UnmodifiableSet\",[\"openid\"]],\"state\":\"5vVaY1nwTpVPUoS1n6OtDTPNck1BrjdUhnFcFNmIBHU=\",\"additionalParameters\":{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"nonce\":\"ALPKLQlDMDI8XFNnPCKwOsn5fsMdGP89IPSGG9iFmzI\"},\"authorizationRequestUri\":\"http://auth-server:9001/oauth2/authorize?response_type=code&client_id=d47632e9bc594d6b9c40186f2c793b83&scope=openid&state=5vVaY1nwTpVPUoS1n6OtDTPNck1BrjdUhnFcFNmIBHU%3D&redirect_uri=http://127.0.0.1:8080/login/oauth2/code/spring-boot-admin-client-demo&nonce=ALPKLQlDMDI8XFNnPCKwOsn5fsMdGP89IPSGG9iFmzI\",\"attributes\":{\"@class\":\"java.util.Collections$UnmodifiableMap\"}},\"java.security.Principal\":{\"@class\":\"org.springframework.security.authentication.UsernamePasswordAuthenticationToken\",\"authorities\":[\"java.util.Collections$UnmodifiableRandomAccessList\",[{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_DEMO_LANG\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_DEMO_logfile\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_MY_APP\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_REGISTERED_CLIENT\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_REGISTERED_CLIENTS_ADD\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_LIST\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_LOGS\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_ADD\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_EDIT\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_LIST\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_SAVE\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ONLINE_LIST\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES_ADD\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES_EDIT\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES_SAVE\"}]],\"details\":{\"@class\":\"org.springframework.security.web.authentication.WebAuthenticationDetails\",\"remoteAddress\":\"127.0.0.1\",\"sessionId\":\"85c0bbac-30ef-45c0-bdb4-393e8b09e153\"},\"authenticated\":true,\"principal\":{\"@class\":\"org.springframework.security.core.userdetails.User\",\"password\":null,\"username\":\"hyhdfz@gmail.com\",\"authorities\":[\"java.util.Collections$UnmodifiableSet\",[{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_DEMO_LANG\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_DEMO_logfile\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_MY_APP\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_REGISTERED_CLIENT\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_REGISTERED_CLIENTS_ADD\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_LIST\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_LOGS\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_ADD\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_EDIT\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_LIST\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_SAVE\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ONLINE_LIST\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES_ADD\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES_EDIT\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES_SAVE\"}]],\"accountNonExpired\":true,\"accountNonLocked\":true,\"credentialsNonExpired\":true,\"enabled\":true},\"credentials\":null},\"org.springframework.security.oauth2.server.authorization.OAuth2Authorization.AUTHORIZED_SCOPE\":[\"java.util.Collections$UnmodifiableSet\",[\"openid\"]]}',NULL,_binary 'UfxLA2e2nn72LOHDsU-kZUkhEdT9TP-nxg3lKDEKuJqCbVupy8Xu-23nP8dmoyNch-YwR9f7bwYED9EOqThvctC_mOX6GWpGrfIZ6T6lcQjkAoALyUUInpzaP7ERZZ61','2021-08-27 13:30:43','2021-08-27 13:35:43','{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"metadata.token.invalidated\":true}',_binary 'eyJraWQiOiIzODkyNWIwNy0zZGY4LTRjOTEtYjRjOC00MTY4YTZkYTQ2MGQiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJoeWhkZnpAZ21haWwuY29tIiwiYXVkIjoiZDQ3NjMyZTliYzU5NGQ2YjljNDAxODZmMmM3OTNiODMiLCJuYmYiOjE2MzAwNDIyNDMsInNjb3BlIjpbIm9wZW5pZCJdLCJpc3MiOiJodHRwOlwvXC9hdXRoLXNlcnZlcjo5MDAxIiwiZXhwIjoxNjMwMDQyNTQzLCJpYXQiOjE2MzAwNDIyNDN9.lRt96klQqy2lPq2DT0q0Pyv3nOo9Yr7YvVgJl73lUc0YlSYDcE5M1Femoyegyrs16nvn_OhNJs7dDfmFTyvwlazg0zJ6bWiJJWVRQY-KwrjOXgPM9P6N6jatsjXplCRqs4H-AqhGgc0Ass84MT6_IuxWzHmFr_Om2wXyoig52t7ZRceCtcWbfyOB0TuOq1ze8zRZ_osvq_6gIAxDO34qc6bq6bxJhxLJFIdqQD9PqrJAf93bYK39QMgy5Npx2t1KXptuOPSsJaqvvajXb_TpS-L_u91JFrzMlKJDuF0phqSZ5CrcevjbhGdTONQ_EEqDmXjX1RScXKI7_AICGNz5Mg','2021-08-27 13:30:44','2021-08-27 13:35:44','{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"metadata.token.claims\":{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"sub\":\"hyhdfz@gmail.com\",\"aud\":[\"java.util.Collections$SingletonList\",[\"d47632e9bc594d6b9c40186f2c793b83\"]],\"nbf\":[\"java.time.Instant\",1630042243.505000000],\"scope\":[\"java.util.Collections$UnmodifiableSet\",[\"openid\"]],\"iss\":[\"java.net.URL\",\"http://auth-server:9001\"],\"exp\":[\"java.time.Instant\",1630042543.505000000],\"iat\":[\"java.time.Instant\",1630042243.505000000]},\"metadata.token.invalidated\":false}','Bearer','openid',_binary 'eyJraWQiOiIzODkyNWIwNy0zZGY4LTRjOTEtYjRjOC00MTY4YTZkYTQ2MGQiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJoeWhkZnpAZ21haWwuY29tIiwiYXVkIjoiZDQ3NjMyZTliYzU5NGQ2YjljNDAxODZmMmM3OTNiODMiLCJhenAiOiJkNDc2MzJlOWJjNTk0ZDZiOWM0MDE4NmYyYzc5M2I4MyIsImlzcyI6Imh0dHA6XC9cL2F1dGgtc2VydmVyOjkwMDEiLCJleHAiOjE2MzAwNDQwNDMsImlhdCI6MTYzMDA0MjI0Mywibm9uY2UiOiJBTFBLTFFsRE1ESThYRk5uUENLd09zbjVmc01kR1A4OUlQU0dHOWlGbXpJIn0.N-Fs18kTpdyM2AYjWPRAPgjKCFeaHNO52bxjRDoqs9ehML5DkpJMItXUXPpYETIr2oqt74S7dtYPVvkJUI0jG92pqtmyursKZ6FGBxDxCZCvcZh9bD6K7C61LXps-xA8Nmz90o1F3ugOWSRF9BJ-7nA19A6gOCduJxMSCu1IAML4l4a-RCHxZTf_ilyj4piC5pIH0S1ucoUqngmAMqGW6Bks7T215V6NX_n8gU14pQ7OorUMQNVAAVXBG6AzOUgMuvvtPpeUdQKH3JszCCG9MdhJ2kJSHLXRhf2GrxqgK3ZQ2WOcfloD01BKMlv4Tif2UbPKwQ0qFMgE7PMPmtkNRg','2021-08-27 13:30:44','2021-08-27 14:00:44','{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"metadata.token.claims\":{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"sub\":\"hyhdfz@gmail.com\",\"aud\":[\"java.util.Collections$SingletonList\",[\"d47632e9bc594d6b9c40186f2c793b83\"]],\"azp\":\"d47632e9bc594d6b9c40186f2c793b83\",\"iss\":[\"java.net.URL\",\"http://auth-server:9001\"],\"exp\":[\"java.time.Instant\",1630044043.551000000],\"iat\":[\"java.time.Instant\",1630042243.551000000],\"nonce\":\"ALPKLQlDMDI8XFNnPCKwOsn5fsMdGP89IPSGG9iFmzI\"},\"metadata.token.invalidated\":false}',_binary 'eqk-CMoQ6X3ShyiNRzz3RLuBI7bzaFFWYsujtZoSJ7PbJvfqQVUT8eYRNG76a8Dfx6fG61RUX3MCo9usgdh0TL5HCpWZf3OJPScD0h_JNM_7YgyCE_vHmCt9OeNsFNVZ','2021-08-27 13:30:44','2021-08-27 14:30:44','{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"metadata.token.invalidated\":false}'),('96328a01-9d12-421c-85b1-08fbedb58bff','236d910e-5ed0-490b-95c4-a0abb4cf8cbf','hyhdfz@gmail.com','authorization_code','{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"java.security.Principal\":{\"@class\":\"org.springframework.security.authentication.UsernamePasswordAuthenticationToken\",\"authorities\":[\"java.util.Collections$UnmodifiableRandomAccessList\",[{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_DEMO_LANG\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_DEMO_logfile\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_MY_APP\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_REGISTERED_CLIENT\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_REGISTERED_CLIENTS_ADD\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_LIST\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_LOGS\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_ADD\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_EDIT\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_LIST\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_SAVE\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ONLINE_LIST\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES_ADD\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES_EDIT\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES_SAVE\"}]],\"details\":{\"@class\":\"org.springframework.security.web.authentication.WebAuthenticationDetails\",\"remoteAddress\":\"127.0.0.1\",\"sessionId\":\"85c0bbac-30ef-45c0-bdb4-393e8b09e153\"},\"authenticated\":true,\"principal\":{\"@class\":\"org.springframework.security.core.userdetails.User\",\"password\":null,\"username\":\"hyhdfz@gmail.com\",\"authorities\":[\"java.util.Collections$UnmodifiableSet\",[{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_DEMO_LANG\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_DEMO_logfile\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_MY_APP\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_REGISTERED_CLIENT\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_REGISTERED_CLIENTS_ADD\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_LIST\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_LOGS\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_ADD\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_EDIT\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_LIST\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_SAVE\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ONLINE_LIST\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES_ADD\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES_EDIT\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES_SAVE\"}]],\"accountNonExpired\":true,\"accountNonLocked\":true,\"credentialsNonExpired\":true,\"enabled\":true},\"credentials\":null},\"org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest\":{\"@class\":\"org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest\",\"authorizationUri\":\"http://auth-server:9001/oauth2/authorize\",\"authorizationGrantType\":{\"value\":\"authorization_code\"},\"responseType\":{\"value\":\"code\"},\"clientId\":\"d47632e9bc594d6b9c40186f2c793b83\",\"redirectUri\":\"http://127.0.0.1:8080/login/oauth2/code/spring-boot-admin-client-demo\",\"scopes\":[\"java.util.Collections$UnmodifiableSet\",[\"openid\"]],\"state\":\"OmZ7anJBZECpEw3Cc5TaKn8grjTT60JRtbcPznp7CsM=\",\"additionalParameters\":{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"nonce\":\"2FUzKe4W7HsL1nZ28iTe8VcHCgXFbyLLj2-I2IPUx3E\"},\"authorizationRequestUri\":\"http://auth-server:9001/oauth2/authorize?response_type=code&client_id=d47632e9bc594d6b9c40186f2c793b83&scope=openid&state=OmZ7anJBZECpEw3Cc5TaKn8grjTT60JRtbcPznp7CsM%3D&redirect_uri=http://127.0.0.1:8080/login/oauth2/code/spring-boot-admin-client-demo&nonce=2FUzKe4W7HsL1nZ28iTe8VcHCgXFbyLLj2-I2IPUx3E\",\"attributes\":{\"@class\":\"java.util.Collections$UnmodifiableMap\"}},\"org.springframework.security.oauth2.server.authorization.OAuth2Authorization.AUTHORIZED_SCOPE\":[\"java.util.Collections$UnmodifiableSet\",[\"openid\"]]}',NULL,_binary 'IafYyuJt76tZD7llUR06Jgi4Fqa1706umhwOGjewxZQgEA5ABepxbgjdP6tpe24w7j4CE1xQNNYlsUPod0s6yfiWtIeA0miTvhI_jEHULgBkzd-JpdYTDYlbjuXIYszx','2021-08-27 13:30:40','2021-08-27 13:35:40','{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"metadata.token.invalidated\":false}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('f4fe3ec6-6b0c-4289-9231-22c47bf9e0ba','236d910e-5ed0-490b-95c4-a0abb4cf8cbf','hyhdfz@gmail.com','authorization_code','{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"java.security.Principal\":{\"@class\":\"org.springframework.security.authentication.UsernamePasswordAuthenticationToken\",\"authorities\":[\"java.util.Collections$UnmodifiableRandomAccessList\",[{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_DEMO_LANG\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_DEMO_logfile\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_MY_APP\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_REGISTERED_CLIENT\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_REGISTERED_CLIENTS_ADD\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_LIST\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_LOGS\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_ADD\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_EDIT\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_LIST\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_SAVE\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ONLINE_LIST\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES_ADD\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES_EDIT\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES_SAVE\"}]],\"details\":{\"@class\":\"org.springframework.security.web.authentication.WebAuthenticationDetails\",\"remoteAddress\":\"127.0.0.1\",\"sessionId\":\"97a234da-435c-4d9e-a939-a519fa3c1933\"},\"authenticated\":true,\"principal\":{\"@class\":\"org.springframework.security.core.userdetails.User\",\"password\":null,\"username\":\"hyhdfz@gmail.com\",\"authorities\":[\"java.util.Collections$UnmodifiableSet\",[{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_DEMO_LANG\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_DEMO_logfile\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_MY_APP\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_REGISTERED_CLIENT\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_REGISTERED_CLIENTS_ADD\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_LIST\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_LOGS\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_ADD\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_EDIT\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_LIST\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_MENUS_SAVE\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ONLINE_LIST\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES_ADD\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES_EDIT\"},{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_USER_ROLES_SAVE\"}]],\"accountNonExpired\":true,\"accountNonLocked\":true,\"credentialsNonExpired\":true,\"enabled\":true},\"credentials\":null},\"org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest\":{\"@class\":\"org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest\",\"authorizationUri\":\"http://auth-server:9001/oauth2/authorize\",\"authorizationGrantType\":{\"value\":\"authorization_code\"},\"responseType\":{\"value\":\"code\"},\"clientId\":\"d47632e9bc594d6b9c40186f2c793b83\",\"redirectUri\":\"http://127.0.0.1:8080/login/oauth2/code/spring-boot-admin-client-demo\",\"scopes\":[\"java.util.Collections$UnmodifiableSet\",[\"openid\"]],\"state\":\"4pWS_EtMw_bbUIYmGbHvovIu8ICmPqNIVXTMeG6jYWw=\",\"additionalParameters\":{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"nonce\":\"fWiT3DPvjtNwg0XqTKT_mQNYX-A1eMNzZym_Oc29fEM\"},\"authorizationRequestUri\":\"http://auth-server:9001/oauth2/authorize?response_type=code&client_id=d47632e9bc594d6b9c40186f2c793b83&scope=openid&state=4pWS_EtMw_bbUIYmGbHvovIu8ICmPqNIVXTMeG6jYWw%3D&redirect_uri=http://127.0.0.1:8080/login/oauth2/code/spring-boot-admin-client-demo&nonce=fWiT3DPvjtNwg0XqTKT_mQNYX-A1eMNzZym_Oc29fEM\",\"attributes\":{\"@class\":\"java.util.Collections$UnmodifiableMap\"}},\"org.springframework.security.oauth2.server.authorization.OAuth2Authorization.AUTHORIZED_SCOPE\":[\"java.util.Collections$UnmodifiableSet\",[\"openid\"]]}',NULL,_binary 'OlmCSHxmsj9h7fwdVv97qnIzMXexZ6hb__XwsPdAI6Z0vPR0OyI1bzSIS_M_I9gGd5I0f0SDjQMInJKkJYXFw4Eqda_e-YJeHgEhSEMnlrlbI6OPrmYVOv2wZ1wXo1NB','2021-08-25 09:18:09','2021-08-25 09:23:09','{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"metadata.token.invalidated\":false}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `oauth2_authorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_authorization_consent`
--

DROP TABLE IF EXISTS `oauth2_authorization_consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_authorization_consent` (
  `registered_client_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `principal_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `authorities` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_authorization_consent`
--

LOCK TABLES `oauth2_authorization_consent` WRITE;
/*!40000 ALTER TABLE `oauth2_authorization_consent` DISABLE KEYS */;
INSERT INTO `oauth2_authorization_consent` (`registered_client_id`, `principal_name`, `authorities`) VALUES ('236d910e-5ed0-490b-95c4-a0abb4cf8cbf','hyhdfz@gmail.com','121');
/*!40000 ALTER TABLE `oauth2_authorization_consent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_registered_client`
--

DROP TABLE IF EXISTS `oauth2_registered_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_registered_client` (
  `id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `client_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `client_id_issued_at` timestamp NULL DEFAULT NULL,
  `client_secret` blob,
  `client_secret_expires_at` timestamp NULL DEFAULT NULL,
  `client_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `client_authentication_methods` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `authorization_grant_types` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `redirect_uris` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `scopes` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `client_settings` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token_settings` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_registered_client`
--

LOCK TABLES `oauth2_registered_client` WRITE;
/*!40000 ALTER TABLE `oauth2_registered_client` DISABLE KEYS */;
INSERT INTO `oauth2_registered_client` (`id`, `client_id`, `client_id_issued_at`, `client_secret`, `client_secret_expires_at`, `client_name`, `client_authentication_methods`, `authorization_grant_types`, `redirect_uris`, `scopes`, `client_settings`, `token_settings`) VALUES ('236d910e-5ed0-490b-95c4-a0abb4cf8cbf','d47632e9bc594d6b9c40186f2c793b83','2021-08-24 05:51:05',_binary '{bcrypt}$2a$10$6CkVb6.Nn0Wu9qZzZCPwr.HEgloj/sZnALTu/NlxbzMcFp4DmmcVW',NULL,'spring-boot-admin-client-demo','client_secret_post,private_key_jwt,client_secret_jwt,client_secret_basic','refresh_token,client_credentials,authorization_code','http://127.0.0.1:8080/login/oauth2/code/spring-boot-admin-client-demo','openid','{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"settings.client.require-proof-key\":false,\"settings.client.require-authorization-consent\":true}','{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"settings.token.reuse-refresh-tokens\":true,\"settings.token.id-token-signature-algorithm\":[\"org.springframework.security.oauth2.jose.jws.SignatureAlgorithm\",\"RS256\"],\"settings.token.access-token-time-to-live\":[\"java.time.Duration\",300.000000000],\"settings.token.refresh-token-time-to-live\":[\"java.time.Duration\",3600.000000000]}'),('7b9e2358-b6d0-48cd-991b-a498113805ef','3d229c0b13d04879bd2af2e2216420fa','2021-08-27 15:27:12',_binary '{bcrypt}$2a$10$uZvPchwi4HskJaQGqU6lY.K5p8vW9YSh2aU0QxhXgXRa0uCv0ihYe',NULL,'sneakydog-spring-cloud-gateway-demo','client_secret_post,private_key_jwt,client_secret_jwt,client_secret_basic','refresh_token,client_credentials,authorization_code','https://www.baidu.com','openid','{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"settings.client.require-proof-key\":false,\"settings.client.require-authorization-consent\":true}','{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"settings.token.reuse-refresh-tokens\":true,\"settings.token.id-token-signature-algorithm\":[\"org.springframework.security.oauth2.jose.jws.SignatureAlgorithm\",\"RS256\"],\"settings.token.access-token-time-to-live\":[\"java.time.Duration\",300.000000000],\"settings.token.refresh-token-time-to-live\":[\"java.time.Duration\",3600.000000000]}');
/*!40000 ALTER TABLE `oauth2_registered_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_token`
--

DROP TABLE IF EXISTS `oauth_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_token` (
  `token_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `client_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `authentication` blob,
  `refresh_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_token`
--

LOCK TABLES `oauth_access_token` WRITE;
/*!40000 ALTER TABLE `oauth_access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_details`
--

DROP TABLE IF EXISTS `oauth_client_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `resource_ids` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `client_secret` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `authorized_grant_types` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `web_server_redirect_uri` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `authorities` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `access_token_validity` int DEFAULT NULL,
  `refresh_token_validity` int DEFAULT NULL,
  `additional_information` varchar(4096) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `autoapprove` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_details`
--

LOCK TABLES `oauth_client_details` WRITE;
/*!40000 ALTER TABLE `oauth_client_details` DISABLE KEYS */;
INSERT INTO `oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`) VALUES ('order-client',NULL,'$2a$10$0a5hzf1psuxyeIVdVRCWQufacDWJgkQhZMZcE9QWbAzkHwIFzjcvq','all','authorization_code,refresh_token,password',NULL,NULL,3600,36000,NULL,1),('user-client',NULL,'$2a$10$0a5hzf1psuxyeIVdVRCWQufacDWJgkQhZMZcE9QWbAzkHwIFzjcvq','all','authorization_code,refresh_token,password',NULL,NULL,3600,36000,NULL,1);
/*!40000 ALTER TABLE `oauth_client_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_token`
--

DROP TABLE IF EXISTS `oauth_client_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_client_token` (
  `token_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `client_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_token`
--

LOCK TABLES `oauth_client_token` WRITE;
/*!40000 ALTER TABLE `oauth_client_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_code`
--

DROP TABLE IF EXISTS `oauth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_code` (
  `code` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_code`
--

LOCK TABLES `oauth_code` WRITE;
/*!40000 ALTER TABLE `oauth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_token`
--

DROP TABLE IF EXISTS `oauth_refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token` blob,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_token`
--

LOCK TABLES `oauth_refresh_token` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordersbak`
--

DROP TABLE IF EXISTS `ordersbak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordersbak` (
  `orderId` int DEFAULT NULL,
  `customerId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordersbak`
--

LOCK TABLES `ordersbak` WRITE;
/*!40000 ALTER TABLE `ordersbak` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordersbak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistent_logins`
--

DROP TABLE IF EXISTS `persistent_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `series` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_used` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistent_logins`
--

LOCK TABLES `persistent_logins` WRITE;
/*!40000 ALTER TABLE `persistent_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `persistent_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_menus`
--

DROP TABLE IF EXISTS `role_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_menus` (
  `id` int DEFAULT NULL,
  `roleId` bigint DEFAULT NULL,
  `menuId` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_menus`
--

LOCK TABLES `role_menus` WRITE;
/*!40000 ALTER TABLE `role_menus` DISABLE KEYS */;
INSERT INTO `role_menus` (`id`, `roleId`, `menuId`) VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,2,3),(7,2,4),(8,1,6),(9,1,7),(10,1,8),(11,1,12),(12,1,13),(13,1,14),(14,1,15),(15,1,17),(16,1,18),(17,1,20),(18,1,21),(19,1,22),(20,1,23),(21,1,1609869755830579200),(22,1,9),(23,1,1618803801367343104),(24,1,1618970868972380160),(25,1,1621760469655420928);
/*!40000 ALTER TABLE `role_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint DEFAULT NULL,
  `roleName` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `roleName`, `remark`) VALUES (1,'管理员',NULL),(2,'普通用户',NULL),(1617877514878107648,'testasdagagd',NULL),(1617910236159229952,'testasdagagd',NULL),(1617914121410097152,'123',NULL),(1617914589821628416,'123',NULL),(1617915677002018816,'123',NULL),(1617916177537675264,'123',NULL),(1617917533921042432,'123',NULL),(1618141680316047360,'testasdagagd',NULL),(1618145905464946688,'testasdagagd',NULL),(1618976144827944960,'123',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_employee`
--

DROP TABLE IF EXISTS `t_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_employee` (
  `id` int DEFAULT NULL,
  `name` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `salary` bigint DEFAULT NULL,
  `department_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_employee`
--

LOCK TABLES `t_employee` WRITE;
/*!40000 ALTER TABLE `t_employee` DISABLE KEYS */;
INSERT INTO `t_employee` (`id`, `name`, `job`, `manager_id`, `hire_date`, `salary`, `department_id`) VALUES (1,'tech','it',NULL,'2021-06-30',111,111),(2,'tech','it',NULL,'2021-06-30',111,111),(3,'tech','it',NULL,'2021-06-30',111,111),(4,'tech','it',NULL,'2021-06-30',111,111),(5,'tech','it',NULL,'2021-06-30',111,111),(6,'tech','it',NULL,'2021-06-30',111,111),(7,'tech','it',NULL,'2021-06-30',111,111),(8,'tech','it',NULL,'2021-06-30',111,111),(9,'tech','it',NULL,'2021-06-30',111,111),(10,'tech','it',NULL,'2021-06-30',111,111);
/*!40000 ALTER TABLE `t_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_0`
--

DROP TABLE IF EXISTS `t_user_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user_0` (
  `userId` bigint DEFAULT NULL,
  `userName` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_0`
--

LOCK TABLES `t_user_0` WRITE;
/*!40000 ALTER TABLE `t_user_0` DISABLE KEYS */;
INSERT INTO `t_user_0` (`userId`, `userName`) VALUES (591317419876679680,'1231313'),(591317577297297408,'1231313'),(591317578115186688,'1231313'),(591317578425565184,'1231313'),(591317578752720896,'1231313'),(591317579151179776,'1231313'),(591317579482529792,'1231313'),(591317579805491200,'1231313'),(591317580149424128,'1231313'),(591317580635963392,'1231313'),(591317580946341888,'1231313'),(591317581260914688,'1231313'),(591317581634207744,'1231313'),(591317581957169152,'1231313'),(591317582301102080,'1231313'),(591317582657617920,'1231313'),(591317582976385024,'1231313'),(591317583387426816,'1231313'),(591317583823634432,'1231313'),(591317584150790144,'1231313'),(591317584570220544,'1231313'),(591317584947707904,'1231313'),(591317585321000960,'1231313'),(591317585677516800,'1231313'),(591317586176638976,'1231313'),(591317586575097856,'1231313'),(591317587028082688,'1231313'),(591317587330072576,'1231313'),(591317587657228288,'1231313'),(591317588043104256,'1231313'),(591317588479311872,'1231313'),(591317588856799232,'1231313'),(591317589154594816,'1231313'),(591317589615968256,'1231313'),(591317589922152448,'1231313'),(591317590257696768,'1231313'),(591317590572269568,'1231313'),(591317590953951232,'1231313'),(591317591251746816,'1231313'),(591317591562125312,'1231313'),(591317591935418368,'1231313'),(591317592254185472,'1231313'),(591317592551981056,'1231313'),(591317592883331072,'1231313'),(591317593206292480,'1231313'),(591317593546031104,'1231313'),(591317593894158336,'1231313'),(591317594196148224,'1231313'),(591317594535886848,'1231313'),(591317594867236864,'1231313'),(591317595290861568,'1231313'),(591318078344658944,'1231313'),(591318079229657088,'1231313'),(591318079531646976,'1231313'),(591318079812665344,'1231313'),(591318080219512832,'1231313'),(591318080525697024,'1231313'),(591318080815104000,'1231313'),(591318081142259712,'1231313'),(591318081540718592,'1231313'),(591318082002092032,'1231313'),(591318082387968000,'1231313'),(591318082765455360,'1231313'),(591318083100999680,'1231313'),(591318083411378176,'1231313'),(591318083696590848,'1231313'),(591318083990192128,'1231313'),(591318084287987712,'1231313'),(591318084619337728,'1231313'),(591318084904550400,'1231313'),(591318085261066240,'1231313'),(591318085558861824,'1231313'),(591318085886017536,'1231313'),(591318086179618816,'1231313'),(591318086469025792,'1231313'),(591318086791987200,'1231313'),(591318087098171392,'1231313'),(591318087408549888,'1231313'),(591318087723122688,'1231313'),(591318088058667008,'1231313'),(591318088352268288,'1231313'),(591318088624898048,'1231313'),(591318088943665152,'1231313'),(591318089266626560,'1231313'),(591318089551839232,'1231313'),(591318089832857600,'1231313'),(591318090185179136,'1231313'),(591318090491363328,'1231313'),(591318090894016512,'1231313'),(591318091170840576,'1231313'),(591318091497996288,'1231313'),(591318091875483648,'1231313'),(591318092148113408,'1231313'),(591318092471074816,'1231313'),(591318093054083072,'1231313'),(591318093460930560,'1231313'),(591318093733560320,'1231313'),(591318094056521728,'1231313'),(591318094454980608,'1231313'),(591318094828273664,'1231313'),(591318095214149632,'1231313');
/*!40000 ALTER TABLE `t_user_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_1`
--

DROP TABLE IF EXISTS `t_user_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user_1` (
  `userId` bigint DEFAULT NULL,
  `userName` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_1`
--

LOCK TABLES `t_user_1` WRITE;
/*!40000 ALTER TABLE `t_user_1` DISABLE KEYS */;
INSERT INTO `t_user_1` (`userId`, `userName`) VALUES (591317577909665793,'1231313'),(591317578261987329,'1231313'),(591317578593337345,'1231313'),(591317578970824705,'1231313'),(591317579318951937,'1231313'),(591317579641913345,'1231313'),(591317579994234881,'1231313'),(591317580443025409,'1231313'),(591317580786958337,'1231313'),(591317581109919745,'1231313'),(591317581424492545,'1231313'),(591317581789396993,'1231313'),(591317582133329921,'1231313'),(591317582477262849,'1231313'),(591317582817001473,'1231313'),(591317583215460353,'1231313'),(591317583643279361,'1231313'),(591317583974629377,'1231313'),(591317584305979393,'1231313'),(591317584784130049,'1231313'),(591317585132257281,'1231313'),(591317585509744641,'1231313'),(591317585958535169,'1231313'),(591317586377965569,'1231313'),(591317586847727617,'1231313'),(591317587174883329,'1231313'),(591317587489456129,'1231313'),(591317587837583361,'1231313'),(591317588206682113,'1231313'),(591317588668055553,'1231313'),(591317589003599873,'1231313'),(591317589355921409,'1231313'),(591317589766963201,'1231313'),(591317590098313217,'1231313'),(591317590408691713,'1231313'),(591317590727458817,'1231313'),(591317591109140481,'1231313'),(591317591427907585,'1231313'),(591317591763451905,'1231313'),(591317592094801921,'1231313'),(591317592396791809,'1231313'),(591317592749113345,'1231313'),(591317593042714625,'1231313'),(591317593390841857,'1231313'),(591317593713803265,'1231313'),(591317594057736193,'1231313'),(591317594376503297,'1231313'),(591317594686881793,'1231313'),(591317595081146369,'1231313'),(591317595437662209,'1231313'),(591318079070273537,'1231313'),(591318079384846337,'1231313'),(591318079674253313,'1231313'),(591318080022380545,'1231313'),(591318080366313473,'1231313'),(591318080659914753,'1231313'),(591318080966098945,'1231313'),(591318081364557825,'1231313'),(591318081729462273,'1231313'),(591318082178252801,'1231313'),(591318082564128769,'1231313'),(591318082903867393,'1231313'),(591318083277160449,'1231313'),(591318083541401601,'1231313'),(591318083847585793,'1231313'),(591318084141187073,'1231313'),(591318084472537089,'1231313'),(591318084749361153,'1231313'),(591318085080711169,'1231313'),(591318085416255489,'1231313'),(591318085735022593,'1231313'),(591318086028623873,'1231313'),(591318086326419457,'1231313'),(591318086657769473,'1231313'),(591318086951370753,'1231313'),(591318087232389121,'1231313'),(591318087580516353,'1231313'),(591318087911866369,'1231313'),(591318088197079041,'1231313'),(591318088490680321,'1231313'),(591318088771698689,'1231313'),(591318089094660097,'1231313'),(591318089417621505,'1231313'),(591318089690251265,'1231313'),(591318089988046849,'1231313'),(591318090348756993,'1231313'),(591318090654941185,'1231313'),(591318091028234241,'1231313'),(591318091330224129,'1231313'),(591318091644796929,'1231313'),(591318092018089985,'1231313'),(591318092320079873,'1231313'),(591318092592709633,'1231313'),(591318093276381185,'1231313'),(591318093595148289,'1231313'),(591318093913915393,'1231313'),(591318094278819841,'1231313'),(591318094622752769,'1231313'),(591318095033794561,'1231313'),(591318095390310401,'1231313');
/*!40000 ALTER TABLE `t_user_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test1`
--

DROP TABLE IF EXISTS `test1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test1` (
  `id` int DEFAULT NULL,
  `name` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test1`
--

LOCK TABLES `test1` WRITE;
/*!40000 ALTER TABLE `test1` DISABLE KEYS */;
/*!40000 ALTER TABLE `test1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_encrypt`
--

DROP TABLE IF EXISTS `test_encrypt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_encrypt` (
  `id` int DEFAULT NULL,
  `name` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_encrypt`
--

LOCK TABLES `test_encrypt` WRITE;
/*!40000 ALTER TABLE `test_encrypt` DISABLE KEYS */;
INSERT INTO `test_encrypt` (`id`, `name`) VALUES (3,'48wH56ijZjHzZQBxuF9A2w==');
/*!40000 ALTER TABLE `test_encrypt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `undo_log`
--

DROP TABLE IF EXISTS `undo_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `undo_log` (
  `branch_id` bigint DEFAULT NULL,
  `xid` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `context` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rollback_info` longblob,
  `log_status` int DEFAULT NULL,
  `log_created` datetime DEFAULT NULL,
  `log_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `undo_log`
--

LOCK TABLES `undo_log` WRITE;
/*!40000 ALTER TABLE `undo_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `undo_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_clients`
--

DROP TABLE IF EXISTS `user_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_clients` (
  `id` bigint DEFAULT NULL,
  `username` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `clientId` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_clients`
--

LOCK TABLES `user_clients` WRITE;
/*!40000 ALTER TABLE `user_clients` DISABLE KEYS */;
INSERT INTO `user_clients` (`id`, `username`, `clientId`) VALUES (1,'hyhdfz@gmail.com','4f7ad12d-7ade-4438-98d0-44f44652ab2e');
/*!40000 ALTER TABLE `user_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` bigint DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  `roleId` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`id`, `userId`, `roleId`) VALUES (1,3,1),(2,2,2),(3,4,2),(1619346865299222528,1619346865278251008,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `enabled` tinyint DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `age` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `enabled`, `email`, `age`) VALUES (2,'test@yeah.net','10570969a04118ea9bf265ddc69c80ed08941f432d43b9be5ceb02bf94b7c92563e06b74d629617d',1,NULL,NULL),(3,'sneakydog@yeah.net','{bcrypt}$2a$10$J24S4.9NpOba24rP286Ko.y8k3EFwog7GW9zAqqjzB7WZJh1OeFla',1,NULL,NULL),(4,'123@yeah.net','10570969a04118ea9bf265ddc69c80ed08941f432d43b9be5ceb02bf94b7c92563e06b74d629617d',0,NULL,NULL),(8,'zhangsan','12313',0,NULL,NULL),(1619346865278251008,'test2@yeah.net','{bcrypt}$2a$10$ybNw04wWJHHMEmkQU0/pqOWw2YLCGM/58YLQdbBp0BZE6sMUIAKzK',1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-08 22:14:51
