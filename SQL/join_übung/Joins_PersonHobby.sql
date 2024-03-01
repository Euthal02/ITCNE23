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


-- Exportiere Datenbank Struktur für JOINS
CREATE DATABASE IF NOT EXISTS `JOINS_PersonHobby` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `JOINS_PersonHobby`;

-- Exportiere Struktur von Tabelle JOINS_PersonHobby.hobby
CREATE TABLE IF NOT EXISTS `hobby` (
  `hobby_id` int NOT NULL AUTO_INCREMENT,
  `hobby_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`hobby_id`),
  UNIQUE KEY `hobby_name` (`hobby_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle JOINS_PersonHobby.hobby: ~8 rows (ungefähr)
DELETE FROM `hobby`;
INSERT INTO `hobby` (`hobby_id`, `hobby_name`) VALUES
	(5, 'Fechten'),
	(4, 'Fussball'),
	(2, 'Hockey'),
	(3, 'PingPong'),
	(7, 'Skifahren'),
	(8, 'Snowboarden'),
	(1, 'Tennis'),
	(6, 'Volleyball');

-- Exportiere Struktur von Tabelle JOINS_PersonHobby.person
CREATE TABLE IF NOT EXISTS `person` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle JOINS_PersonHobby.person: ~4 rows (ungefähr)
DELETE FROM `person`;
INSERT INTO `person` (`person_id`, `first_name`, `last_name`) VALUES
	(1, 'Hans', 'Meier'),
	(2, 'Armin', 'Peter'),
	(3, 'Anita', 'Ulmer'),
	(4, 'Erich', 'Kundert');

-- Exportiere Struktur von Tabelle JOINS_PersonHobby.person_hobby
CREATE TABLE IF NOT EXISTS `person_hobby` (
  `personhobby_id` int NOT NULL AUTO_INCREMENT,
  `fk_person_id` int NOT NULL DEFAULT '0',
  `fk_hobby_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`personhobby_id`),
  UNIQUE KEY `person_id_hobby_id` (`fk_person_id`,`fk_hobby_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle JOINS_PersonHobby.person_hobby: ~3 rows (ungefähr)
DELETE FROM `person_hobby`;
INSERT INTO `person_hobby` (`personhobby_id`, `fk_person_id`, `fk_hobby_id`) VALUES
	(1, 2, 2),
	(2, 2, 3),
	(3, 3, 3);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
