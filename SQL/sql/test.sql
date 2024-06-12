-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server-Version:               5.7.44 - MySQL Community Server (GPL)
-- Server-Betriebssystem:        Linux
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportiere Datenbank-Struktur für semarb3_prod
DROP DATABASE IF EXISTS `semarb3_prod`;
CREATE DATABASE IF NOT EXISTS `semarb3_prod` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `semarb3_prod`;

-- Exportiere Struktur von Tabelle semarb3_prod.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle semarb3_prod.users: ~2 rows (ungefähr)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `is_admin`) VALUES
	(1, 'admin', 'admin@admin.ch', 'scrypt:32768:8:1$KbXzHw4w3S1HznXN$af57f9721a58edeabbbcb773ebbf3d91c84e750f77fe5071b843e47c5ac07d52ca43761198c17a88ea60f44356c12518e57fb869c19fb549b18d19ce105a8529', 1),
	(2, 'test', 'test@test.ch', 'scrypt:32768:8:1$vDU6JC9QWP1fNZYD$105cc36bc70323dcd9cede81cae52671bdcf91727569522c0ad9499de5f000125f087c42aa92ead9bfe4f7b9125b1b2b501e80af9d21cdc1c203ae867b527d15', 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
