-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               8.3.0 - MySQL Community Server - GPL
-- Server Betriebssystem:        Linux
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportiere Datenbank Struktur für JOINS_123
CREATE DATABASE IF NOT EXISTS `JOINS_123` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `JOINS_123`;

-- Exportiere Struktur von Tabelle JOINS_123.Dreier
CREATE TABLE IF NOT EXISTS `Dreier` (
  `Wert` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle JOINS_123.Dreier: ~0 rows (ungefähr)
DELETE FROM `Dreier`;
INSERT INTO `Dreier` (`Wert`) VALUES
	(3),
	(6),
	(9),
	(12),
	(15),
	(18),
	(21),
	(24),
	(27),
	(30),
	(33),
	(36),
	(39);

-- Exportiere Struktur von Tabelle JOINS_123.Einer
CREATE TABLE IF NOT EXISTS `Einer` (
  `Wert` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle JOINS_123.Einer: ~0 rows (ungefähr)
DELETE FROM `Einer`;
INSERT INTO `Einer` (`Wert`) VALUES
	(10),
	(11),
	(12),
	(13),
	(14),
	(15),
	(16),
	(17),
	(18),
	(19);

-- Exportiere Struktur von Tabelle JOINS_123.Zweier
CREATE TABLE IF NOT EXISTS `Zweier` (
  `Wert` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle JOINS_123.Zweier: ~0 rows (ungefähr)
DELETE FROM `Zweier`;
INSERT INTO `Zweier` (`Wert`) VALUES
	(2),
	(4),
	(6),
	(8),
	(10),
	(12),
	(14),
	(16),
	(18),
	(20),
	(22),
	(24),
	(26),
	(28),
	(30);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
