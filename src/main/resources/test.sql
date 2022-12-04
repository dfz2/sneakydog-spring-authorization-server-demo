-- --------------------------------------------------------
-- 主机:                           hk.qcloud.myhyh.xyz
-- 服务器版本:                        8.0.26 - MySQL Community Server - GPL
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 test 的数据库结构
CREATE DATABASE IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `test`;

-- 导出  表 test.authorities 结构
CREATE TABLE IF NOT EXISTS `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `ix_auth_username` (`username`,`authority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.authorities 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` (`username`, `authority`) VALUES
	('1231313', 'ROLE_USER'),
	('test@yeah.net', 'ROLE_USER'),
	('user@yeah.net', 'ROLE_USER');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;

-- 导出  表 test.flyway_schema_history 结构
CREATE TABLE IF NOT EXISTS `flyway_schema_history` (
  `installed_rank` int NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.flyway_schema_history 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `flyway_schema_history` DISABLE KEYS */;
INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES
	(1, '1', '<< Flyway Baseline >>', 'BASELINE', '<< Flyway Baseline >>', NULL, 'root', '2021-04-17 12:20:36', 0, 1);
/*!40000 ALTER TABLE `flyway_schema_history` ENABLE KEYS */;

-- 导出  表 test.hibernate_sequence 结构
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.hibernate_sequence 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` (`next_val`) VALUES
	(1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;

-- 导出  表 test.inventory 结构
CREATE TABLE IF NOT EXISTS `inventory` (
  `id` bigint NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.inventory 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;

-- 导出  表 test.logs 结构
CREATE TABLE IF NOT EXISTS `logs` (
  `username` varchar(500) DEFAULT NULL,
  `ipAddress` varchar(300) DEFAULT NULL,
  `region` varchar(20) DEFAULT NULL,
  `userAgent` varchar(500) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `loginStatus` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.logs 的数据：~174 rows (大约)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`username`, `ipAddress`, `region`, `userAgent`, `createdAt`, `loginStatus`) VALUES
	('user@yeah.net', '124.77.151.56', '中国/上海', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-02 09:57:20', 'y'),
	('user@yeah.net', '124.77.151.56', '中国/上海', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-02 09:58:11', 'y'),
	('joesph.wilkinson38@zebyinbox.com', '174.138.115.170', '加拿大/安大略', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '2021-06-02 10:05:28', 'n'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-02 10:24:39', 'y'),
	('user@yeah.net', '114.88.173.226', '中国,上海', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-02 11:18:33', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-02 11:24:52', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-02 11:25:12', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-02 12:03:30', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-02 12:08:08', 'y'),
	('user@yeah.net', '114.88.173.226', '中国,上海', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-02 15:17:17', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-02 15:36:15', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-02 16:21:19', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-03 00:53:33', 'y'),
	('test@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36 Edg/91.0.864.37', '2021-06-03 00:54:56', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-03 02:08:54', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-03 02:20:45', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-03 02:21:04', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-03 04:32:27', 'y'),
	('user@yeah.net', '124.77.151.56', '中国,上海', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-03 04:34:48', 'y'),
	('test@yeah.net', '124.77.151.56', '中国,上海', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-03 04:35:12', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-03 04:42:02', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-03 07:26:36', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-03 09:08:01', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-03 09:10:24', 'n'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-03 09:14:11', 'n'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-03 09:17:07', 'n'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-03 09:20:54', 'y'),
	('test@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36 Edg/91.0.864.37', '2021-06-03 09:21:58', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-03 12:26:44', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-03 12:28:13', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-03 12:50:32', 'y'),
	('test@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-03 12:51:41', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-03 12:52:02', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-03 14:14:51', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-04 03:23:43', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-04 04:36:34', 'y'),
	('user@yeah.net', '124.77.151.56', '中国,上海', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-04 08:53:51', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-04 08:59:32', 'y'),
	('user@yeah.net', '124.77.151.56', '中国,上海', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-04 09:10:15', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-04 09:33:01', 'n'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-04 09:41:40', 'n'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-04 09:42:53', 'n'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-04 09:54:46', 'n'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-04 09:57:54', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-04 10:21:37', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-04 10:24:38', 'n'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-04 10:25:47', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-04 13:22:54', 'y'),
	('user@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-04 13:36:30', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-06 10:42:32', 'n'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-06 10:49:19', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-07 05:31:56', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-07 05:35:01', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-07 05:50:48', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-07 05:52:50', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-07 05:55:45', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-07 06:00:38', 'y'),
	('hyhdfz@gmail.com', '124.77.151.56', '中国,上海', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-07 06:03:12', 'y'),
	('hyhdfz@gmail.com', '124.77.151.56', '中国,上海', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-07 08:20:13', 'y'),
	('hyhdfz@gmail.com', '124.77.151.56', '中国,上海', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-07 08:21:00', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-07 14:27:52', 'y'),
	('hyhdfz@gmail.com', '114.88.173.226', '中国,上海', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-07 15:22:47', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-08 04:15:54', 'n'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-08 04:16:18', 'n'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'UNKNOW', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-08 04:16:58', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-09 13:07:26', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 03:12:47', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 04:20:51', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 05:22:09', 'y'),
	('hyhdfz@gmail.com', '124.77.151.56', '中国,上海', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 05:24:43', 'y'),
	('hyhdfz@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 07:09:53', 'n'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 07:10:19', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 08:12:20', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 09:38:02', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 09:39:27', 'y'),
	('test@yeah.net', '124.77.151.56', '中国,上海', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 09:59:04', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 10:01:15', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 12:35:54', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 14:15:30', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 14:24:02', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 14:24:59', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-10 14:28:23', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'UNKNOW', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-12 14:01:11', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-12 14:07:13', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-25 06:46:59', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-25 07:51:13', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-25 08:47:40', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-25 13:19:36', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-25 15:15:36', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-25 15:21:28', 'y'),
	('test@yeah.net', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.54', '2021-06-25 15:22:25', 'y'),
	('hyhdfz@gmail.com', '114.88.173.226', '中国,上海', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-25 15:30:02', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-27 02:20:28', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-27 03:01:45', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-27 03:04:03', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-27 03:10:01', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-27 07:07:41', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-27 07:15:54', 'y'),
	('hydfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-27 07:38:42', 'n'),
	('hydfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-27 07:38:46', 'n'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-27 07:39:35', 'n'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-27 07:40:03', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-27 07:40:10', 'n'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-27 07:40:13', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-27 07:54:15', 'n'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-27 07:54:19', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-27 09:53:40', 'n'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-27 09:53:42', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-27 11:46:16', 'n'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'UNKNOW', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-27 11:46:19', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-27 14:56:27', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-28 02:35:27', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-28 04:19:57', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-28 04:31:43', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-28 04:38:11', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-28 04:41:39', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-28 04:54:28', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-28 04:55:55', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-28 04:56:07', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-28 06:02:53', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-28 07:20:21', 'y'),
	('hyhdfz@gmail.com', '222.70.195.97', '中国,上海', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-28 08:52:01', 'n'),
	('hyhdfz@gmail.com', '222.70.195.97', '中国,上海', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-28 08:52:21', 'n'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-28 12:29:51', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-28 12:40:06', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-28 12:43:17', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-28 12:45:13', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-28 12:45:49', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-28 12:47:06', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-28 12:51:42', 'y'),
	('hyhdfz@gmail.com', '222.70.195.97', '中国,上海', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-29 03:48:04', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-29 03:50:03', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-02 07:33:29', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-02 10:35:19', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-02 13:58:29', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-02 15:12:03', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-02 16:04:59', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-03 03:35:29', 'y'),
	('hyhdfz@gmail.com', '127.0.0.1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-03 06:20:09', 'n'),
	('hyhdfz@gmail.com', '127.0.0.1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-03 06:20:12', 'n'),
	('hyhdfz@gmail.com', '127.0.0.1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-03 06:20:15', 'n'),
	('hyhdfz@gmail.com', '127.0.0.1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-03 06:22:33', 'n'),
	('hyhdfz@gmail.com', '127.0.0.1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-03 06:22:58', 'n'),
	('hyhdfz@gmail.com', '127.0.0.1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-03 06:24:17', 'y'),
	('hyhdfz@gmail.com', '127.0.0.1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-03 06:24:32', 'y'),
	('hyhdfz@gmail.com', '127.0.0.1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-03 06:27:18', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-03 13:28:46', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-03 15:08:26', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-03 15:08:42', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-04 04:55:46', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-04 07:15:48', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-04 07:16:41', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'UNKNOW', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-04 07:30:56', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-04 08:54:51', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-04 14:47:45', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-04 15:07:55', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-05 01:47:43', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-05 02:05:39', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-05 03:11:17', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-05 08:11:57', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-05 12:21:26', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-06 03:54:11', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'UNKNOW', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-06 06:41:11', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-06 08:22:28', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-06 12:34:21', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-06 13:50:51', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-07 13:41:55', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-14 05:43:40', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'UNKNOW', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', '2021-07-27 07:56:01', 'y'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'UNKNOW', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', '2021-08-09 08:00:05', 'n'),
	('hyhdfz@gmail.com', '0:0:0:0:0:0:0:1', 'UNKNOW', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', '2021-08-09 08:00:10', 'y'),
	('hyhdfz@gmail.com', '45.152.70.51', '欧洲,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '2021-08-23 15:29:31', 'y'),
	('hyhdfz@gmail.com', '127.0.0.1', 'XX,XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36 Edg/92.0.902.78', '2021-08-25 08:43:14', 'n'),
	('hyhdfz@gmail.com', '127.0.0.1', 'UNKNOW', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '2021-08-25 08:50:15', 'n');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- 导出  表 test.menus 结构
CREATE TABLE IF NOT EXISTS `menus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parentId` bigint DEFAULT NULL,
  `menuName` varchar(100) DEFAULT NULL,
  `perms` varchar(300) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `menuType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.menus 的数据：~21 rows (大约)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `parentId`, `menuName`, `perms`, `url`, `menuType`) VALUES
	(1, 4, 'Users V1', 'ROLE_USER_LIST', '/user/index', 'C'),
	(2, 4, 'Menus V1', 'ROLE_USER_MENUS_LIST', '/user/menus/list', 'C'),
	(3, 4, 'Logs V1', 'ROLE_USER_LOGS', '/user/user_login_logs', 'C'),
	(4, 0, 'Settings', NULL, NULL, 'M'),
	(5, 4, 'Roles V1', 'ROLE_USER_ROLES', '/role/index', 'C'),
	(6, 2, 'Add Menu', 'ROLE_USER_MENUS_ADD', '/user/menus/add', 'F'),
	(7, 4, 'Online Users V1', 'ROLE_USER_ONLINE_LIST', '/user/online/list', 'C'),
	(8, 2, 'Save Menu', 'ROLE_USER_MENUS_SAVE', '/user/menus/save', 'F'),
	(9, 2, 'Delete Menu', 'ROLE_USER_MENUS_DEL', '/user/menus/delete', 'F'),
	(10, 0, 'Roles', 'ROLE_', '#', 'M'),
	(11, 10, 'Delete Roles', 'ROLE_USER_ROLES_DELETE', '/user/roles/delete', 'C'),
	(12, 2, 'Edit Menu', 'ROLE_USER_MENUS_EDIT', '/user/menus/{menuId}', 'F'),
	(13, 5, 'User Roles Add', 'ROLE_USER_ROLES_ADD', '/roles/add', 'F'),
	(14, 5, 'Roles SaveOrUpdate', 'ROLE_USER_ROLES_SAVE', '/role/save', 'F'),
	(15, 5, 'Roles Edit', 'ROLE_USER_ROLES_EDIT', '/role/{roleId}', 'F'),
	(17, 4, 'Registered Clients V1', 'ROLE_REGISTERED_CLIENT', '/registered/clients/index', 'C'),
	(18, 17, 'Add Registered Clients V1', 'ROLE_REGISTERED_CLIENTS_ADD', '/registered/clients/add', 'F'),
	(20, 0, 'My App', 'ROLE_MY_APP', '/my-app.html', 'B'),
	(21, 22, 'Multi Language test', 'ROLE_DEMO_LANG', '/demo/lang/test', 'M'),
	(22, 0, 'demos', 'ROLE_', '', 'M'),
	(23, 22, 'logfile', 'ROLE_DEMO_logfile', '/demo/logfile', 'C');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- 导出  表 test.myorder 结构
CREATE TABLE IF NOT EXISTS `myorder` (
  `order_id` bigint NOT NULL AUTO_INCREMENT,
  `customer_id` bigint DEFAULT NULL,
  `pay_amount` decimal(19,2) DEFAULT NULL,
  `total_amount` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `myorder_order_id_uindex` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.myorder 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `myorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `myorder` ENABLE KEYS */;

-- 导出  表 test.oauth2_authorization 结构
CREATE TABLE IF NOT EXISTS `oauth2_authorization` (
  `id` varchar(100) NOT NULL,
  `registered_client_id` varchar(100) NOT NULL,
  `principal_name` varchar(200) NOT NULL,
  `authorization_grant_type` varchar(100) NOT NULL,
  `attributes` longtext,
  `state` varchar(500) DEFAULT NULL,
  `authorization_code_value` blob,
  `authorization_code_issued_at` timestamp NULL DEFAULT NULL,
  `authorization_code_expires_at` timestamp NULL DEFAULT NULL,
  `authorization_code_metadata` varchar(2000) DEFAULT NULL,
  `access_token_value` blob,
  `access_token_issued_at` timestamp NULL DEFAULT NULL,
  `access_token_expires_at` timestamp NULL DEFAULT NULL,
  `access_token_metadata` varchar(2000) DEFAULT NULL,
  `access_token_type` varchar(100) DEFAULT NULL,
  `access_token_scopes` varchar(1000) DEFAULT NULL,
  `oidc_id_token_value` blob,
  `oidc_id_token_issued_at` timestamp NULL DEFAULT NULL,
  `oidc_id_token_expires_at` timestamp NULL DEFAULT NULL,
  `oidc_id_token_metadata` varchar(2000) DEFAULT NULL,
  `refresh_token_value` blob,
  `refresh_token_issued_at` timestamp NULL DEFAULT NULL,
  `refresh_token_expires_at` timestamp NULL DEFAULT NULL,
  `refresh_token_metadata` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.oauth2_authorization 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `oauth2_authorization` DISABLE KEYS */;
INSERT INTO `oauth2_authorization` (`id`, `registered_client_id`, `principal_name`, `authorization_grant_type`, `attributes`, `state`, `authorization_code_value`, `authorization_code_issued_at`, `authorization_code_expires_at`, `authorization_code_metadata`, `access_token_value`, `access_token_issued_at`, `access_token_expires_at`, `access_token_metadata`, `access_token_type`, `access_token_scopes`, `oidc_id_token_value`, `oidc_id_token_issued_at`, `oidc_id_token_expires_at`, `oidc_id_token_metadata`, `refresh_token_value`, `refresh_token_issued_at`, `refresh_token_expires_at`, `refresh_token_metadata`) VALUES
	('5a139516-8107-434f-a1f7-a690172e2e02', '236d910e-5ed0-490b-95c4-a0abb4cf8cbf', 'hyhdfz@gmail.com', 'authorization_code', '{"@class":"java.util.Collections$UnmodifiableMap","org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest":{"@class":"org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest","authorizationUri":"http://auth-server:9001/oauth2/authorize","authorizationGrantType":{"value":"authorization_code"},"responseType":{"value":"code"},"clientId":"d47632e9bc594d6b9c40186f2c793b83","redirectUri":"http://127.0.0.1:8080/login/oauth2/code/spring-boot-admin-client-demo","scopes":["java.util.Collections$UnmodifiableSet",["openid"]],"state":"5vVaY1nwTpVPUoS1n6OtDTPNck1BrjdUhnFcFNmIBHU=","additionalParameters":{"@class":"java.util.Collections$UnmodifiableMap","nonce":"ALPKLQlDMDI8XFNnPCKwOsn5fsMdGP89IPSGG9iFmzI"},"authorizationRequestUri":"http://auth-server:9001/oauth2/authorize?response_type=code&client_id=d47632e9bc594d6b9c40186f2c793b83&scope=openid&state=5vVaY1nwTpVPUoS1n6OtDTPNck1BrjdUhnFcFNmIBHU%3D&redirect_uri=http://127.0.0.1:8080/login/oauth2/code/spring-boot-admin-client-demo&nonce=ALPKLQlDMDI8XFNnPCKwOsn5fsMdGP89IPSGG9iFmzI","attributes":{"@class":"java.util.Collections$UnmodifiableMap"}},"java.security.Principal":{"@class":"org.springframework.security.authentication.UsernamePasswordAuthenticationToken","authorities":["java.util.Collections$UnmodifiableRandomAccessList",[{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_DEMO_LANG"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_DEMO_logfile"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_MY_APP"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_REGISTERED_CLIENT"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_REGISTERED_CLIENTS_ADD"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_LIST"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_LOGS"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_ADD"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_EDIT"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_LIST"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_SAVE"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ONLINE_LIST"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES_ADD"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES_EDIT"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES_SAVE"}]],"details":{"@class":"org.springframework.security.web.authentication.WebAuthenticationDetails","remoteAddress":"127.0.0.1","sessionId":"85c0bbac-30ef-45c0-bdb4-393e8b09e153"},"authenticated":true,"principal":{"@class":"org.springframework.security.core.userdetails.User","password":null,"username":"hyhdfz@gmail.com","authorities":["java.util.Collections$UnmodifiableSet",[{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_DEMO_LANG"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_DEMO_logfile"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_MY_APP"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_REGISTERED_CLIENT"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_REGISTERED_CLIENTS_ADD"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_LIST"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_LOGS"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_ADD"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_EDIT"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_LIST"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_SAVE"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ONLINE_LIST"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES_ADD"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES_EDIT"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES_SAVE"}]],"accountNonExpired":true,"accountNonLocked":true,"credentialsNonExpired":true,"enabled":true},"credentials":null},"org.springframework.security.oauth2.server.authorization.OAuth2Authorization.AUTHORIZED_SCOPE":["java.util.Collections$UnmodifiableSet",["openid"]]}', NULL, _binary 0x5566784c413265326e6e37324c4f484473552d6b5a556b684564543954502d6e7867336c4b44454b754a714362567570793858752d32336e5038646d6f794e63682d597752396637627759454439454f715468766374435f6d4f5836475770477266495a3654366c63516a6b416f414c795555496e707a61503745525a5a3631, '2021-08-27 13:30:43', '2021-08-27 13:35:43', '{"@class":"java.util.Collections$UnmodifiableMap","metadata.token.invalidated":true}', _binary 0x65794a72615751694f69497a4f446b794e5749774e79307a5a4759344c54526a4f544574596a526a4f4330304d54593459545a6b595451324d4751694c434a68624763694f694a53557a49314e694a392e65794a7a645749694f694a6f6557686b5a6e70415a3231686157777559323974496977695958566b496a6f695a4451334e6a4d795a546c69597a55354e475132596a6c6a4e4441784f445a6d4d6d4d334f544e694f444d694c434a75596d59694f6a45324d7a41774e4449794e444d73496e4e6a6233426c496a7062496d39775a5735705a434a644c434a7063334d694f694a6f644852774f6c7776584339686458526f4c584e6c636e5a6c636a6f354d444178496977695a586877496a6f784e6a4d774d4451794e54517a4c434a70595851694f6a45324d7a41774e4449794e444e392e6c527439366b6c517179326c5071324454307130507976336e4f6f39597237597656674a6c37336c556330596c5359446345354d3146656d6f79656779727331366e766e5f4f684e4a73376444666d46547976776c617a67307a4a366257694a4a57565251592d4b77726a4f5867504d3950364e366a6174736a58706c4352717334482d4171684767633041737338344d54365f497578577a486d46725f4f6d327758796f6967353274375a526365437463576266794f423054754f71317a65387a525a5f6f7376715f3667494178444f333471633662713662784a68784c4a464964715144395071724a4166393362594b3339514d6779354e70783274314b587074754f5053734a61717676616a58625f5470532d4c5f7539314a46727a4d6c4b4a44754630706871535a3543726365766a62684764544f4e515f454571446d586a5831525363584b49375f414943474e7a354d67, '2021-08-27 13:30:44', '2021-08-27 13:35:44', '{"@class":"java.util.Collections$UnmodifiableMap","metadata.token.claims":{"@class":"java.util.Collections$UnmodifiableMap","sub":"hyhdfz@gmail.com","aud":["java.util.Collections$SingletonList",["d47632e9bc594d6b9c40186f2c793b83"]],"nbf":["java.time.Instant",1630042243.505000000],"scope":["java.util.Collections$UnmodifiableSet",["openid"]],"iss":["java.net.URL","http://auth-server:9001"],"exp":["java.time.Instant",1630042543.505000000],"iat":["java.time.Instant",1630042243.505000000]},"metadata.token.invalidated":false}', 'Bearer', 'openid', _binary 0x65794a72615751694f69497a4f446b794e5749774e79307a5a4759344c54526a4f544574596a526a4f4330304d54593459545a6b595451324d4751694c434a68624763694f694a53557a49314e694a392e65794a7a645749694f694a6f6557686b5a6e70415a3231686157777559323974496977695958566b496a6f695a4451334e6a4d795a546c69597a55354e475132596a6c6a4e4441784f445a6d4d6d4d334f544e694f444d694c434a68656e41694f694a6b4e4463324d7a4a6c4f574a6a4e546b305a445a694f574d304d4445344e6d5979597a63354d3249344d794973496d6c7a63794936496d683064484136584339634c3246316447677463325679646d56794f6a6b774d4445694c434a6c654841694f6a45324d7a41774e4451774e444d73496d6c68644349364d54597a4d4441304d6a49304d797769626d3975593255694f694a425446424c544646735245314553546859526b357555454e4c6430397a626a566d6330316b523141344f556c51553064484f576c476258704a496e302e4e2d467331386b547064794d3241596a5750524150676a4b43466561484e4f353262786a52446f71733965684d4c35446b704a4d497458555850705945544972326f7174373453376474595056766b4a5549306a4739327071746d797572734b5a36464742784478435a4376635a68396244364b374336314c5870732d7841384e6d7a39306f31463375674f5753524639424a2d376e4131394136674f4364754a784d5343753149414d4c346c34612d524348785a54665f696c796a347069433570494830533175636f55716e676d414d71475736426b73375432313556364e585f6e38675531347051374f6f72554d514e5641415658424736417a4f55674d757676745070655564514b48334a737a434347394d64684a326b4a53484c585268663247727871674b335a5132574f63666c6f443031424b4d6c7634546966325562504b77513071464d674537504d506d746b4e5267, '2021-08-27 13:30:44', '2021-08-27 14:00:44', '{"@class":"java.util.Collections$UnmodifiableMap","metadata.token.claims":{"@class":"java.util.Collections$UnmodifiableMap","sub":"hyhdfz@gmail.com","aud":["java.util.Collections$SingletonList",["d47632e9bc594d6b9c40186f2c793b83"]],"azp":"d47632e9bc594d6b9c40186f2c793b83","iss":["java.net.URL","http://auth-server:9001"],"exp":["java.time.Instant",1630044043.551000000],"iat":["java.time.Instant",1630042243.551000000],"nonce":"ALPKLQlDMDI8XFNnPCKwOsn5fsMdGP89IPSGG9iFmzI"},"metadata.token.invalidated":false}', _binary 0x65716b2d434d6f51365833536879694e527a7a33524c75424937627a614646575973756a745a6f534a3750624a76667151565554386559524e47373661384466783666473631525558334d436f39757367646830544c35484370575a66334f4a5053634430685f4a4e4d5f3759677943455f76486d4374394f654e73464e565a, '2021-08-27 13:30:44', '2021-08-27 14:30:44', '{"@class":"java.util.Collections$UnmodifiableMap","metadata.token.invalidated":false}'),
	('96328a01-9d12-421c-85b1-08fbedb58bff', '236d910e-5ed0-490b-95c4-a0abb4cf8cbf', 'hyhdfz@gmail.com', 'authorization_code', '{"@class":"java.util.Collections$UnmodifiableMap","java.security.Principal":{"@class":"org.springframework.security.authentication.UsernamePasswordAuthenticationToken","authorities":["java.util.Collections$UnmodifiableRandomAccessList",[{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_DEMO_LANG"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_DEMO_logfile"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_MY_APP"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_REGISTERED_CLIENT"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_REGISTERED_CLIENTS_ADD"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_LIST"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_LOGS"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_ADD"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_EDIT"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_LIST"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_SAVE"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ONLINE_LIST"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES_ADD"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES_EDIT"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES_SAVE"}]],"details":{"@class":"org.springframework.security.web.authentication.WebAuthenticationDetails","remoteAddress":"127.0.0.1","sessionId":"85c0bbac-30ef-45c0-bdb4-393e8b09e153"},"authenticated":true,"principal":{"@class":"org.springframework.security.core.userdetails.User","password":null,"username":"hyhdfz@gmail.com","authorities":["java.util.Collections$UnmodifiableSet",[{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_DEMO_LANG"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_DEMO_logfile"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_MY_APP"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_REGISTERED_CLIENT"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_REGISTERED_CLIENTS_ADD"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_LIST"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_LOGS"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_ADD"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_EDIT"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_LIST"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_SAVE"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ONLINE_LIST"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES_ADD"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES_EDIT"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES_SAVE"}]],"accountNonExpired":true,"accountNonLocked":true,"credentialsNonExpired":true,"enabled":true},"credentials":null},"org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest":{"@class":"org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest","authorizationUri":"http://auth-server:9001/oauth2/authorize","authorizationGrantType":{"value":"authorization_code"},"responseType":{"value":"code"},"clientId":"d47632e9bc594d6b9c40186f2c793b83","redirectUri":"http://127.0.0.1:8080/login/oauth2/code/spring-boot-admin-client-demo","scopes":["java.util.Collections$UnmodifiableSet",["openid"]],"state":"OmZ7anJBZECpEw3Cc5TaKn8grjTT60JRtbcPznp7CsM=","additionalParameters":{"@class":"java.util.Collections$UnmodifiableMap","nonce":"2FUzKe4W7HsL1nZ28iTe8VcHCgXFbyLLj2-I2IPUx3E"},"authorizationRequestUri":"http://auth-server:9001/oauth2/authorize?response_type=code&client_id=d47632e9bc594d6b9c40186f2c793b83&scope=openid&state=OmZ7anJBZECpEw3Cc5TaKn8grjTT60JRtbcPznp7CsM%3D&redirect_uri=http://127.0.0.1:8080/login/oauth2/code/spring-boot-admin-client-demo&nonce=2FUzKe4W7HsL1nZ28iTe8VcHCgXFbyLLj2-I2IPUx3E","attributes":{"@class":"java.util.Collections$UnmodifiableMap"}},"org.springframework.security.oauth2.server.authorization.OAuth2Authorization.AUTHORIZED_SCOPE":["java.util.Collections$UnmodifiableSet",["openid"]]}', NULL, _binary 0x4961665979754a743736745a44376c6c555230364a67693446716131373036756d68774f476a6577785a5167454135414265707862676a645036747065323477376a3443453178514e4e596c7355506f643073367966695774496541306d69547668495f6a4548554c67426b7a642d4a7064595444596c626a75584959737a78, '2021-08-27 13:30:40', '2021-08-27 13:35:40', '{"@class":"java.util.Collections$UnmodifiableMap","metadata.token.invalidated":false}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('f4fe3ec6-6b0c-4289-9231-22c47bf9e0ba', '236d910e-5ed0-490b-95c4-a0abb4cf8cbf', 'hyhdfz@gmail.com', 'authorization_code', '{"@class":"java.util.Collections$UnmodifiableMap","java.security.Principal":{"@class":"org.springframework.security.authentication.UsernamePasswordAuthenticationToken","authorities":["java.util.Collections$UnmodifiableRandomAccessList",[{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_DEMO_LANG"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_DEMO_logfile"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_MY_APP"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_REGISTERED_CLIENT"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_REGISTERED_CLIENTS_ADD"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_LIST"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_LOGS"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_ADD"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_EDIT"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_LIST"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_SAVE"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ONLINE_LIST"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES_ADD"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES_EDIT"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES_SAVE"}]],"details":{"@class":"org.springframework.security.web.authentication.WebAuthenticationDetails","remoteAddress":"127.0.0.1","sessionId":"97a234da-435c-4d9e-a939-a519fa3c1933"},"authenticated":true,"principal":{"@class":"org.springframework.security.core.userdetails.User","password":null,"username":"hyhdfz@gmail.com","authorities":["java.util.Collections$UnmodifiableSet",[{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_DEMO_LANG"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_DEMO_logfile"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_MY_APP"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_REGISTERED_CLIENT"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_REGISTERED_CLIENTS_ADD"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_LIST"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_LOGS"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_ADD"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_EDIT"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_LIST"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_MENUS_SAVE"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ONLINE_LIST"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES_ADD"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES_EDIT"},{"@class":"org.springframework.security.core.authority.SimpleGrantedAuthority","authority":"ROLE_USER_ROLES_SAVE"}]],"accountNonExpired":true,"accountNonLocked":true,"credentialsNonExpired":true,"enabled":true},"credentials":null},"org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest":{"@class":"org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest","authorizationUri":"http://auth-server:9001/oauth2/authorize","authorizationGrantType":{"value":"authorization_code"},"responseType":{"value":"code"},"clientId":"d47632e9bc594d6b9c40186f2c793b83","redirectUri":"http://127.0.0.1:8080/login/oauth2/code/spring-boot-admin-client-demo","scopes":["java.util.Collections$UnmodifiableSet",["openid"]],"state":"4pWS_EtMw_bbUIYmGbHvovIu8ICmPqNIVXTMeG6jYWw=","additionalParameters":{"@class":"java.util.Collections$UnmodifiableMap","nonce":"fWiT3DPvjtNwg0XqTKT_mQNYX-A1eMNzZym_Oc29fEM"},"authorizationRequestUri":"http://auth-server:9001/oauth2/authorize?response_type=code&client_id=d47632e9bc594d6b9c40186f2c793b83&scope=openid&state=4pWS_EtMw_bbUIYmGbHvovIu8ICmPqNIVXTMeG6jYWw%3D&redirect_uri=http://127.0.0.1:8080/login/oauth2/code/spring-boot-admin-client-demo&nonce=fWiT3DPvjtNwg0XqTKT_mQNYX-A1eMNzZym_Oc29fEM","attributes":{"@class":"java.util.Collections$UnmodifiableMap"}},"org.springframework.security.oauth2.server.authorization.OAuth2Authorization.AUTHORIZED_SCOPE":["java.util.Collections$UnmodifiableSet",["openid"]]}', NULL, _binary 0x4f6c6d435348786d736a39683766776456763937716e497a4d5865785a3668625f5f58777350644149365a30765052304f794931627a5349535f4d5f4939674764354930663053446a514d496e4a4b6b4a5958467734457164615f652d594a654867456853454d6e6c726c6249364f50726d59564f7632775a3177586f314e42, '2021-08-25 09:18:09', '2021-08-25 09:23:09', '{"@class":"java.util.Collections$UnmodifiableMap","metadata.token.invalidated":false}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `oauth2_authorization` ENABLE KEYS */;

-- 导出  表 test.oauth2_authorization_consent 结构
CREATE TABLE IF NOT EXISTS `oauth2_authorization_consent` (
  `registered_client_id` varchar(100) NOT NULL,
  `principal_name` varchar(200) NOT NULL,
  `authorities` varchar(1000) NOT NULL,
  PRIMARY KEY (`registered_client_id`,`principal_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.oauth2_authorization_consent 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `oauth2_authorization_consent` DISABLE KEYS */;
INSERT INTO `oauth2_authorization_consent` (`registered_client_id`, `principal_name`, `authorities`) VALUES
	('236d910e-5ed0-490b-95c4-a0abb4cf8cbf', 'hyhdfz@gmail.com', '121');
/*!40000 ALTER TABLE `oauth2_authorization_consent` ENABLE KEYS */;

-- 导出  表 test.oauth2_registered_client 结构
CREATE TABLE IF NOT EXISTS `oauth2_registered_client` (
  `id` varchar(100) NOT NULL,
  `client_id` varchar(100) NOT NULL,
  `client_id_issued_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client_secret` blob NOT NULL,
  `client_secret_expires_at` timestamp NULL DEFAULT NULL,
  `client_name` varchar(200) DEFAULT NULL,
  `client_authentication_methods` varchar(1000) NOT NULL,
  `authorization_grant_types` varchar(1000) NOT NULL,
  `redirect_uris` varchar(1000) NOT NULL,
  `scopes` varchar(1000) NOT NULL,
  `client_settings` varchar(1000) DEFAULT NULL,
  `token_settings` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.oauth2_registered_client 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `oauth2_registered_client` DISABLE KEYS */;
INSERT INTO `oauth2_registered_client` (`id`, `client_id`, `client_id_issued_at`, `client_secret`, `client_secret_expires_at`, `client_name`, `client_authentication_methods`, `authorization_grant_types`, `redirect_uris`, `scopes`, `client_settings`, `token_settings`) VALUES
	('236d910e-5ed0-490b-95c4-a0abb4cf8cbf', 'd47632e9bc594d6b9c40186f2c793b83', '2021-08-24 05:51:05', _binary 0x7b6263727970747d2432612431302436436b5662362e4e6e30577539715a7a5a435077722e4845676c6f6a2f735a6e414c54752f4e6c78627a4d63467034446d6d635657, NULL, 'spring-boot-admin-client-demo', 'client_secret_post,private_key_jwt,client_secret_jwt,client_secret_basic', 'refresh_token,client_credentials,authorization_code', 'http://127.0.0.1:8080/login/oauth2/code/spring-boot-admin-client-demo', 'openid', '{"@class":"java.util.Collections$UnmodifiableMap","settings.client.require-proof-key":false,"settings.client.require-authorization-consent":true}', '{"@class":"java.util.Collections$UnmodifiableMap","settings.token.reuse-refresh-tokens":true,"settings.token.id-token-signature-algorithm":["org.springframework.security.oauth2.jose.jws.SignatureAlgorithm","RS256"],"settings.token.access-token-time-to-live":["java.time.Duration",300.000000000],"settings.token.refresh-token-time-to-live":["java.time.Duration",3600.000000000]}'),
	('7b9e2358-b6d0-48cd-991b-a498113805ef', '3d229c0b13d04879bd2af2e2216420fa', '2021-08-27 15:27:12', _binary 0x7b6263727970747d24326124313024755a7650636877693448736b4a6151477155366c592e4b357038765739595368326155305178685867585261307543763069685965, NULL, 'sneakydog-spring-cloud-gateway-demo', 'client_secret_post,private_key_jwt,client_secret_jwt,client_secret_basic', 'refresh_token,client_credentials,authorization_code', 'https://www.baidu.com', 'openid', '{"@class":"java.util.Collections$UnmodifiableMap","settings.client.require-proof-key":false,"settings.client.require-authorization-consent":true}', '{"@class":"java.util.Collections$UnmodifiableMap","settings.token.reuse-refresh-tokens":true,"settings.token.id-token-signature-algorithm":["org.springframework.security.oauth2.jose.jws.SignatureAlgorithm","RS256"],"settings.token.access-token-time-to-live":["java.time.Duration",300.000000000],"settings.token.refresh-token-time-to-live":["java.time.Duration",3600.000000000]}');
/*!40000 ALTER TABLE `oauth2_registered_client` ENABLE KEYS */;

-- 导出  表 test.oauth_access_token 结构
CREATE TABLE IF NOT EXISTS `oauth_access_token` (
  `token_id` varchar(255) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `authentication` blob,
  `refresh_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.oauth_access_token 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oauth_access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_token` ENABLE KEYS */;

-- 导出  表 test.oauth_client_details 结构
CREATE TABLE IF NOT EXISTS `oauth_client_details` (
  `client_id` varchar(255) NOT NULL,
  `resource_ids` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `authorized_grant_types` varchar(255) DEFAULT NULL,
  `web_server_redirect_uri` varchar(255) DEFAULT NULL,
  `authorities` varchar(255) DEFAULT NULL,
  `access_token_validity` int DEFAULT NULL,
  `refresh_token_validity` int DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` tinyint DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.oauth_client_details 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `oauth_client_details` DISABLE KEYS */;
INSERT INTO `oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`) VALUES
	('order-client', NULL, '$2a$10$0a5hzf1psuxyeIVdVRCWQufacDWJgkQhZMZcE9QWbAzkHwIFzjcvq', 'all', 'authorization_code,refresh_token,password', NULL, NULL, 3600, 36000, NULL, 1),
	('user-client', NULL, '$2a$10$0a5hzf1psuxyeIVdVRCWQufacDWJgkQhZMZcE9QWbAzkHwIFzjcvq', 'all', 'authorization_code,refresh_token,password', NULL, NULL, 3600, 36000, NULL, 1);
/*!40000 ALTER TABLE `oauth_client_details` ENABLE KEYS */;

-- 导出  表 test.oauth_client_token 结构
CREATE TABLE IF NOT EXISTS `oauth_client_token` (
  `token_id` varchar(255) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.oauth_client_token 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oauth_client_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_token` ENABLE KEYS */;

-- 导出  表 test.oauth_code 结构
CREATE TABLE IF NOT EXISTS `oauth_code` (
  `code` varchar(255) DEFAULT NULL,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.oauth_code 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oauth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_code` ENABLE KEYS */;

-- 导出  表 test.oauth_refresh_token 结构
CREATE TABLE IF NOT EXISTS `oauth_refresh_token` (
  `token_id` varchar(255) DEFAULT NULL,
  `token` blob,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.oauth_refresh_token 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oauth_refresh_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_token` ENABLE KEYS */;

-- 导出  表 test.ordersbak 结构
CREATE TABLE IF NOT EXISTS `ordersbak` (
  `orderId` int DEFAULT NULL,
  `customerId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.ordersbak 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `ordersbak` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordersbak` ENABLE KEYS */;

-- 导出  表 test.persistent_logins 结构
CREATE TABLE IF NOT EXISTS `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.persistent_logins 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `persistent_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `persistent_logins` ENABLE KEYS */;

-- 导出  表 test.REGISTERED_CLIENT 结构
CREATE TABLE IF NOT EXISTS `REGISTERED_CLIENT` (
  `ID` varchar(100) NOT NULL,
  `CLIENT_ID` varchar(200) DEFAULT NULL,
  `CLIENT_SECRET` varchar(400) DEFAULT NULL,
  `JSON_CONTENT` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `REGISTERED_CLIENT_ID_uindex` (`ID`),
  UNIQUE KEY `REGISTERED_CLIENT_CLIENT_ID_uindex` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.REGISTERED_CLIENT 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `REGISTERED_CLIENT` DISABLE KEYS */;
INSERT INTO `REGISTERED_CLIENT` (`ID`, `CLIENT_ID`, `CLIENT_SECRET`, `JSON_CONTENT`) VALUES
	('5ad278be-18c5-46b6-9480-95412b7c5963', '1231', '1321231', '{"id":"322ff3ce-ba5f-4e8e-9a7c-1221b3b3a722","clientId":"1231","clientSecret":"1321231","authorizationGrantTypes":null,"redirectUris":["http://127.0.0.1:8080/authorized","http://127.0.0.1:8080/login/oauth2/code/messaging-client-oidc"],"scopes":["message.read","openid","message.write"],"clientSettings":{"settings":{"setting.client.require-user-consent":false,"setting.client.require-proof-key":false}},"tokenSettings":{"settings":{"setting.token.access-token-time-to-live":300.000000000,"setting.token.refresh-token-time-to-live":3600.000000000,"setting.token.reuse-refresh-tokens":true}},"methods":["post","basic"],"grantTypes":["authorization_code","client_credentials"]}'),
	('94cf9ef4-ee85-4591-aa5c-e402e9c36591', '1231313', '1231313', '{"id":"94cf9ef4-ee85-4591-aa5c-e402e9c36591","clientId":"1231313","clientSecret":"1231313","clientAuthenticationMethods":[{"value":"post"},{"value":"basic"}],"authorizationGrantTypes":[{"value":"client_credentials"},{"value":"authorization_code"}],"redirectUris":["http://127.0.0.1:8080/authorized","http://127.0.0.1:8080/login/oauth2/code/messaging-client-oidc"],"scopes":["openid","message.read","message.write"],"clientSettings":{"settings":{"setting.client.require-user-consent":false,"setting.client.require-proof-key":false}},"tokenSettings":{"settings":{"setting.token.access-token-time-to-live":300.000000000,"setting.token.refresh-token-time-to-live":3600.000000000,"setting.token.reuse-refresh-tokens":true}}}');
/*!40000 ALTER TABLE `REGISTERED_CLIENT` ENABLE KEYS */;

-- 导出  表 test.roles 结构
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.roles 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `roleName`, `remark`) VALUES
	(1, '管理员', NULL),
	(2, '普通用户', NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- 导出  表 test.role_menus 结构
CREATE TABLE IF NOT EXISTS `role_menus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roleId` bigint DEFAULT NULL,
  `menuId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.role_menus 的数据：~20 rows (大约)
/*!40000 ALTER TABLE `role_menus` DISABLE KEYS */;
INSERT INTO `role_menus` (`id`, `roleId`, `menuId`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4),
	(5, 1, 5),
	(6, 2, 3),
	(7, 2, 4),
	(8, 1, 6),
	(9, 1, 7),
	(10, 1, 8),
	(11, 1, 12),
	(12, 1, 13),
	(13, 1, 14),
	(14, 1, 15),
	(15, 1, 17),
	(16, 1, 18),
	(17, 1, 20),
	(18, 1, 21),
	(19, 1, 22),
	(20, 1, 23);
/*!40000 ALTER TABLE `role_menus` ENABLE KEYS */;

-- 导出  表 test.test_encrypt 结构
CREATE TABLE IF NOT EXISTS `test_encrypt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.test_encrypt 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `test_encrypt` DISABLE KEYS */;
INSERT INTO `test_encrypt` (`id`, `name`) VALUES
	(3, '48wH56ijZjHzZQBxuF9A2w==');
/*!40000 ALTER TABLE `test_encrypt` ENABLE KEYS */;

-- 导出  表 test.t_employee 结构
CREATE TABLE IF NOT EXISTS `t_employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `job` varchar(128) NOT NULL,
  `manager_id` int DEFAULT NULL,
  `hire_date` date NOT NULL,
  `salary` bigint NOT NULL,
  `department_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.t_employee 的数据：~10 rows (大约)
/*!40000 ALTER TABLE `t_employee` DISABLE KEYS */;
INSERT INTO `t_employee` (`id`, `name`, `job`, `manager_id`, `hire_date`, `salary`, `department_id`) VALUES
	(1, 'tech', 'it', NULL, '2021-06-30', 111, 111),
	(2, 'tech', 'it', NULL, '2021-06-30', 111, 111),
	(3, 'tech', 'it', NULL, '2021-06-30', 111, 111),
	(4, 'tech', 'it', NULL, '2021-06-30', 111, 111),
	(5, 'tech', 'it', NULL, '2021-06-30', 111, 111),
	(6, 'tech', 'it', NULL, '2021-06-30', 111, 111),
	(7, 'tech', 'it', NULL, '2021-06-30', 111, 111),
	(8, 'tech', 'it', NULL, '2021-06-30', 111, 111),
	(9, 'tech', 'it', NULL, '2021-06-30', 111, 111),
	(10, 'tech', 'it', NULL, '2021-06-30', 111, 111);
/*!40000 ALTER TABLE `t_employee` ENABLE KEYS */;

-- 导出  表 test.t_user_0 结构
CREATE TABLE IF NOT EXISTS `t_user_0` (
  `userId` bigint NOT NULL,
  `userName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `User_0_userId_uindex` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.t_user_0 的数据：~101 rows (大约)
/*!40000 ALTER TABLE `t_user_0` DISABLE KEYS */;
INSERT INTO `t_user_0` (`userId`, `userName`) VALUES
	(591317419876679680, '1231313'),
	(591317577297297408, '1231313'),
	(591317578115186688, '1231313'),
	(591317578425565184, '1231313'),
	(591317578752720896, '1231313'),
	(591317579151179776, '1231313'),
	(591317579482529792, '1231313'),
	(591317579805491200, '1231313'),
	(591317580149424128, '1231313'),
	(591317580635963392, '1231313'),
	(591317580946341888, '1231313'),
	(591317581260914688, '1231313'),
	(591317581634207744, '1231313'),
	(591317581957169152, '1231313'),
	(591317582301102080, '1231313'),
	(591317582657617920, '1231313'),
	(591317582976385024, '1231313'),
	(591317583387426816, '1231313'),
	(591317583823634432, '1231313'),
	(591317584150790144, '1231313'),
	(591317584570220544, '1231313'),
	(591317584947707904, '1231313'),
	(591317585321000960, '1231313'),
	(591317585677516800, '1231313'),
	(591317586176638976, '1231313'),
	(591317586575097856, '1231313'),
	(591317587028082688, '1231313'),
	(591317587330072576, '1231313'),
	(591317587657228288, '1231313'),
	(591317588043104256, '1231313'),
	(591317588479311872, '1231313'),
	(591317588856799232, '1231313'),
	(591317589154594816, '1231313'),
	(591317589615968256, '1231313'),
	(591317589922152448, '1231313'),
	(591317590257696768, '1231313'),
	(591317590572269568, '1231313'),
	(591317590953951232, '1231313'),
	(591317591251746816, '1231313'),
	(591317591562125312, '1231313'),
	(591317591935418368, '1231313'),
	(591317592254185472, '1231313'),
	(591317592551981056, '1231313'),
	(591317592883331072, '1231313'),
	(591317593206292480, '1231313'),
	(591317593546031104, '1231313'),
	(591317593894158336, '1231313'),
	(591317594196148224, '1231313'),
	(591317594535886848, '1231313'),
	(591317594867236864, '1231313'),
	(591317595290861568, '1231313'),
	(591318078344658944, '1231313'),
	(591318079229657088, '1231313'),
	(591318079531646976, '1231313'),
	(591318079812665344, '1231313'),
	(591318080219512832, '1231313'),
	(591318080525697024, '1231313'),
	(591318080815104000, '1231313'),
	(591318081142259712, '1231313'),
	(591318081540718592, '1231313'),
	(591318082002092032, '1231313'),
	(591318082387968000, '1231313'),
	(591318082765455360, '1231313'),
	(591318083100999680, '1231313'),
	(591318083411378176, '1231313'),
	(591318083696590848, '1231313'),
	(591318083990192128, '1231313'),
	(591318084287987712, '1231313'),
	(591318084619337728, '1231313'),
	(591318084904550400, '1231313'),
	(591318085261066240, '1231313'),
	(591318085558861824, '1231313'),
	(591318085886017536, '1231313'),
	(591318086179618816, '1231313'),
	(591318086469025792, '1231313'),
	(591318086791987200, '1231313'),
	(591318087098171392, '1231313'),
	(591318087408549888, '1231313'),
	(591318087723122688, '1231313'),
	(591318088058667008, '1231313'),
	(591318088352268288, '1231313'),
	(591318088624898048, '1231313'),
	(591318088943665152, '1231313'),
	(591318089266626560, '1231313'),
	(591318089551839232, '1231313'),
	(591318089832857600, '1231313'),
	(591318090185179136, '1231313'),
	(591318090491363328, '1231313'),
	(591318090894016512, '1231313'),
	(591318091170840576, '1231313'),
	(591318091497996288, '1231313'),
	(591318091875483648, '1231313'),
	(591318092148113408, '1231313'),
	(591318092471074816, '1231313'),
	(591318093054083072, '1231313'),
	(591318093460930560, '1231313'),
	(591318093733560320, '1231313'),
	(591318094056521728, '1231313'),
	(591318094454980608, '1231313'),
	(591318094828273664, '1231313'),
	(591318095214149632, '1231313');
/*!40000 ALTER TABLE `t_user_0` ENABLE KEYS */;

-- 导出  表 test.t_user_1 结构
CREATE TABLE IF NOT EXISTS `t_user_1` (
  `userId` bigint NOT NULL,
  `userName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `User_1_userId_uindex` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.t_user_1 的数据：~100 rows (大约)
/*!40000 ALTER TABLE `t_user_1` DISABLE KEYS */;
INSERT INTO `t_user_1` (`userId`, `userName`) VALUES
	(591317577909665793, '1231313'),
	(591317578261987329, '1231313'),
	(591317578593337345, '1231313'),
	(591317578970824705, '1231313'),
	(591317579318951937, '1231313'),
	(591317579641913345, '1231313'),
	(591317579994234881, '1231313'),
	(591317580443025409, '1231313'),
	(591317580786958337, '1231313'),
	(591317581109919745, '1231313'),
	(591317581424492545, '1231313'),
	(591317581789396993, '1231313'),
	(591317582133329921, '1231313'),
	(591317582477262849, '1231313'),
	(591317582817001473, '1231313'),
	(591317583215460353, '1231313'),
	(591317583643279361, '1231313'),
	(591317583974629377, '1231313'),
	(591317584305979393, '1231313'),
	(591317584784130049, '1231313'),
	(591317585132257281, '1231313'),
	(591317585509744641, '1231313'),
	(591317585958535169, '1231313'),
	(591317586377965569, '1231313'),
	(591317586847727617, '1231313'),
	(591317587174883329, '1231313'),
	(591317587489456129, '1231313'),
	(591317587837583361, '1231313'),
	(591317588206682113, '1231313'),
	(591317588668055553, '1231313'),
	(591317589003599873, '1231313'),
	(591317589355921409, '1231313'),
	(591317589766963201, '1231313'),
	(591317590098313217, '1231313'),
	(591317590408691713, '1231313'),
	(591317590727458817, '1231313'),
	(591317591109140481, '1231313'),
	(591317591427907585, '1231313'),
	(591317591763451905, '1231313'),
	(591317592094801921, '1231313'),
	(591317592396791809, '1231313'),
	(591317592749113345, '1231313'),
	(591317593042714625, '1231313'),
	(591317593390841857, '1231313'),
	(591317593713803265, '1231313'),
	(591317594057736193, '1231313'),
	(591317594376503297, '1231313'),
	(591317594686881793, '1231313'),
	(591317595081146369, '1231313'),
	(591317595437662209, '1231313'),
	(591318079070273537, '1231313'),
	(591318079384846337, '1231313'),
	(591318079674253313, '1231313'),
	(591318080022380545, '1231313'),
	(591318080366313473, '1231313'),
	(591318080659914753, '1231313'),
	(591318080966098945, '1231313'),
	(591318081364557825, '1231313'),
	(591318081729462273, '1231313'),
	(591318082178252801, '1231313'),
	(591318082564128769, '1231313'),
	(591318082903867393, '1231313'),
	(591318083277160449, '1231313'),
	(591318083541401601, '1231313'),
	(591318083847585793, '1231313'),
	(591318084141187073, '1231313'),
	(591318084472537089, '1231313'),
	(591318084749361153, '1231313'),
	(591318085080711169, '1231313'),
	(591318085416255489, '1231313'),
	(591318085735022593, '1231313'),
	(591318086028623873, '1231313'),
	(591318086326419457, '1231313'),
	(591318086657769473, '1231313'),
	(591318086951370753, '1231313'),
	(591318087232389121, '1231313'),
	(591318087580516353, '1231313'),
	(591318087911866369, '1231313'),
	(591318088197079041, '1231313'),
	(591318088490680321, '1231313'),
	(591318088771698689, '1231313'),
	(591318089094660097, '1231313'),
	(591318089417621505, '1231313'),
	(591318089690251265, '1231313'),
	(591318089988046849, '1231313'),
	(591318090348756993, '1231313'),
	(591318090654941185, '1231313'),
	(591318091028234241, '1231313'),
	(591318091330224129, '1231313'),
	(591318091644796929, '1231313'),
	(591318092018089985, '1231313'),
	(591318092320079873, '1231313'),
	(591318092592709633, '1231313'),
	(591318093276381185, '1231313'),
	(591318093595148289, '1231313'),
	(591318093913915393, '1231313'),
	(591318094278819841, '1231313'),
	(591318094622752769, '1231313'),
	(591318095033794561, '1231313'),
	(591318095390310401, '1231313');
/*!40000 ALTER TABLE `t_user_1` ENABLE KEYS */;

-- 导出  表 test.undo_log 结构
CREATE TABLE IF NOT EXISTS `undo_log` (
  `branch_id` bigint NOT NULL COMMENT 'branch transaction id',
  `xid` varchar(128) NOT NULL COMMENT 'global transaction id',
  `context` varchar(128) NOT NULL COMMENT 'undo_log context,such as serialization',
  `rollback_info` longblob NOT NULL COMMENT 'rollback info',
  `log_status` int NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` datetime(6) NOT NULL COMMENT 'create datetime',
  `log_modified` datetime(6) NOT NULL COMMENT 'modify datetime',
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='AT transaction mode undo table';

-- 正在导出表  test.undo_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `undo_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `undo_log` ENABLE KEYS */;

-- 导出  表 test.users 结构
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `enabled` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_uindex` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.users 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `enabled`) VALUES
	(2, 'test@yeah.net', '10570969a04118ea9bf265ddc69c80ed08941f432d43b9be5ceb02bf94b7c92563e06b74d629617d', 1),
	(3, 'hyhdfz@gmail.com', '{bcrypt}$2a$10$UJdS5IXdPkNU0jeEkEgesOkGPruYtvATSlmTN0Yf64jfRxfisHs2a', 1),
	(4, '123@yeah.net', '10570969a04118ea9bf265ddc69c80ed08941f432d43b9be5ceb02bf94b7c92563e06b74d629617d', 0),
	(8, 'zhangsan', '12313', 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- 导出  表 test.user_clients 结构
CREATE TABLE IF NOT EXISTS `user_clients` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `clientId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.user_clients 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `user_clients` DISABLE KEYS */;
INSERT INTO `user_clients` (`id`, `username`, `clientId`) VALUES
	(1, 'hyhdfz@gmail.com', '4f7ad12d-7ade-4438-98d0-44f44652ab2e');
/*!40000 ALTER TABLE `user_clients` ENABLE KEYS */;

-- 导出  表 test.user_role 结构
CREATE TABLE IF NOT EXISTS `user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userId` bigint DEFAULT NULL,
  `roleId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  test.user_role 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`id`, `userId`, `roleId`) VALUES
	(1, 3, 1),
	(2, 2, 2),
	(3, 4, 2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
