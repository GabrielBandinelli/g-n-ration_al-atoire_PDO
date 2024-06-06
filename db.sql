-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 22 jan. 2024 à 17:31
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bd_php_avance`
--

-- --------------------------------------------------------

--
-- Structure de la table `ecole`
--

DROP TABLE IF EXISTS `ecole`;
CREATE TABLE IF NOT EXISTS `ecole` (
  `ecole_id` int NOT NULL AUTO_INCREMENT,
  `ecole_nom` varchar(250) NOT NULL,
  PRIMARY KEY (`ecole_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecole`
--

INSERT INTO `ecole` (`ecole_id`, `ecole_nom`) VALUES
(1, 'Ecole A'),
(2, 'Ecole B'),
(3, 'Ecole C');

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `eleve_id` int NOT NULL,
  `ecole_id` int NOT NULL,
  PRIMARY KEY (`eleve_id`),
  KEY `key` (`ecole_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`eleve_id`, `ecole_id`) VALUES
(1, 1),
(3, 1),
(4, 1),
(5, 1),
(8, 1),
(11, 1),
(15, 1),
(16, 1),
(17, 1),
(19, 1),
(24, 1),
(26, 1),
(30, 1),
(2, 2),
(6, 2),
(7, 2),
(9, 2),
(10, 2),
(12, 2),
(13, 2),
(14, 2),
(21, 2),
(22, 2),
(23, 2),
(25, 2),
(27, 2),
(28, 2),
(29, 2),
(31, 2),
(18, 3),
(20, 3);

-- --------------------------------------------------------

--
-- Structure de la table `eleve_sport`
--

DROP TABLE IF EXISTS `eleve_sport`;
CREATE TABLE IF NOT EXISTS `eleve_sport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `eleve_id` int NOT NULL,
  `sport_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key` (`eleve_id`),
  KEY `key2` (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `eleve_sport`
--

INSERT INTO `eleve_sport` (`id`, `eleve_id`, `sport_id`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 4, 5),
(4, 4, 2),
(5, 4, 3),
(6, 5, 4),
(7, 8, 3),
(8, 8, 5),
(9, 11, 5),
(10, 11, 2),
(11, 16, 2),
(12, 16, 5),
(13, 16, 1),
(14, 17, 2),
(15, 17, 4),
(16, 24, 2),
(17, 24, 5),
(18, 2, 3),
(19, 2, 5),
(20, 6, 4),
(21, 6, 2),
(22, 9, 4),
(23, 9, 5),
(24, 10, 2),
(25, 10, 3),
(26, 12, 3),
(27, 13, 2),
(28, 13, 4),
(29, 14, 1),
(30, 14, 4),
(31, 14, 3),
(32, 22, 3),
(33, 22, 5),
(34, 23, 2),
(35, 23, 5),
(36, 25, 2),
(37, 25, 4),
(38, 25, 5),
(39, 28, 5),
(40, 28, 2),
(41, 29, 1),
(42, 31, 4),
(43, 31, 5),
(44, 18, 2);

-- --------------------------------------------------------

--
-- Structure de la table `sport`
--

DROP TABLE IF EXISTS `sport`;
CREATE TABLE IF NOT EXISTS `sport` (
  `sport_id` int NOT NULL AUTO_INCREMENT,
  `sport_nom` varchar(250) NOT NULL,
  PRIMARY KEY (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `sport`
--

INSERT INTO `sport` (`sport_id`, `sport_nom`) VALUES
(1, 'Boxe'),
(2, 'Judo'),
(3, 'Football'),
(4, 'Natation'),
(5, 'Cyclisme');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD CONSTRAINT `eleve_ibfk_1` FOREIGN KEY (`ecole_id`) REFERENCES `ecole` (`ecole_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `eleve_sport`
--
ALTER TABLE `eleve_sport`
  ADD CONSTRAINT `eleve_sport_ibfk_1` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`sport_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `eleve_sport_ibfk_2` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`eleve_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
