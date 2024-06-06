-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 14 déc. 2023 à 15:45
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
-- Base de données : `db_php_avance`
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
-- Structure de la table `ecole_eleve`
--

DROP TABLE IF EXISTS `ecole_eleve`;
CREATE TABLE IF NOT EXISTS `ecole_eleve` (
  `ecole_eleve_id` int NOT NULL AUTO_INCREMENT,
  `ecole_id` int NOT NULL,
  `eleve_id` int NOT NULL,
  PRIMARY KEY (`ecole_eleve_id`) USING BTREE,
  KEY `ecole_id` (`ecole_id`),
  KEY `eleve_id` (`eleve_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecole_eleve`
--

INSERT INTO `ecole_eleve` (`ecole_eleve_id`, `ecole_id`, `eleve_id`) VALUES
(1, 3, 1),
(2, 3, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 5),
(6, 1, 6),
(7, 3, 7),
(8, 2, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 3, 12),
(13, 1, 13),
(14, 2, 14),
(15, 2, 15),
(16, 3, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 3, 20),
(21, 2, 21),
(22, 3, 22),
(23, 2, 23),
(24, 2, 24),
(25, 1, 25),
(26, 2, 26),
(27, 3, 27),
(28, 3, 28),
(29, 2, 29),
(30, 1, 30);

-- --------------------------------------------------------

--
-- Structure de la table `ecole_eleve_sport`
--

DROP TABLE IF EXISTS `ecole_eleve_sport`;
CREATE TABLE IF NOT EXISTS `ecole_eleve_sport` (
  `ees_id` int NOT NULL AUTO_INCREMENT,
  `ecole_id` int NOT NULL,
  `eleve_id` int NOT NULL,
  `sport_id` int NOT NULL,
  PRIMARY KEY (`ees_id`),
  KEY `ecole_eleve_sport_ibfk_1` (`ecole_id`),
  KEY `ecole_eleve_sport_ibfk_2` (`eleve_id`),
  KEY `ecole_sport_sport_ibfk_3` (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecole_eleve_sport`
--

INSERT INTO `ecole_eleve_sport` (`ees_id`, `ecole_id`, `eleve_id`, `sport_id`) VALUES
(1, 3, 1, 2),
(2, 3, 2, 5),
(3, 1, 3, 1),
(4, 1, 4, 2),
(5, 2, 5, 3),
(6, 1, 6, 4),
(7, 3, 7, 2),
(8, 2, 8, 1),
(9, 1, 9, 1),
(10, 1, 10, 1),
(11, 1, 11, 1),
(12, 3, 12, 2),
(13, 1, 13, 1),
(14, 2, 14, 1),
(15, 2, 15, 3),
(16, 3, 16, 3),
(17, 1, 17, 2),
(18, 1, 18, 1),
(19, 1, 19, 2),
(20, 3, 20, 2),
(21, 2, 21, 1),
(22, 3, 22, 5),
(23, 2, 23, 4),
(24, 2, 24, 1),
(25, 1, 25, 4),
(26, 2, 26, 1),
(27, 3, 27, 5),
(28, 3, 28, 2),
(29, 2, 29, 4),
(30, 1, 30, 4);

-- --------------------------------------------------------

--
-- Structure de la table `ecole_sport`
--

DROP TABLE IF EXISTS `ecole_sport`;
CREATE TABLE IF NOT EXISTS `ecole_sport` (
  `ecole_sport_id` int NOT NULL AUTO_INCREMENT,
  `ecole_id` int NOT NULL,
  `sport_id` int NOT NULL,
  PRIMARY KEY (`ecole_sport_id`),
  KEY `ecole_id` (`ecole_id`),
  KEY `sport_id` (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecole_sport`
--

INSERT INTO `ecole_sport` (`ecole_sport_id`, `ecole_id`, `sport_id`) VALUES
(7, 2, 1),
(9, 1, 1),
(11, 3, 2),
(12, 3, 5),
(13, 2, 4),
(14, 1, 2),
(15, 3, 3),
(20, 1, 4),
(21, 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `eleve_id` int NOT NULL AUTO_INCREMENT,
  `eleve_nom` varchar(250) NOT NULL,
  `eleve_prenom` varchar(250) NOT NULL,
  PRIMARY KEY (`eleve_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`eleve_id`, `eleve_nom`, `eleve_prenom`) VALUES
(1, 'Girard', 'Lison'),
(2, 'Faure', 'Albane'),
(3, 'Roger', 'Emilie'),
(4, 'Masson', 'Eva'),
(5, 'Dupuy', 'Sara'),
(6, 'da Silva', 'Sarah'),
(7, 'Bonnet', 'Augustin'),
(8, 'Meunier', 'Benjamin'),
(9, 'Caron', 'Achille'),
(10, 'Pollet', 'William'),
(11, 'Leroy', 'Daniel'),
(12, 'Gauthier', 'Marcel'),
(13, 'Leroux', 'Maxence'),
(14, 'Gautier', 'Léa'),
(15, 'Faure', 'Soline'),
(16, 'Clement', 'Lison'),
(17, 'Lompech', 'Margaux'),
(18, 'Caron', 'Octave'),
(19, 'Olivier', 'Malo'),
(20, 'Louis', 'Charline'),
(21, 'Lacroix', 'Benjamin'),
(22, 'Rousseau', 'Agathe'),
(23, 'Meyer', 'Olivia'),
(24, 'Fabre', 'Elsa'),
(25, 'Brun', 'Mathis'),
(26, 'Boé', 'Andréa'),
(27, 'Huart', 'Mathilde'),
(28, 'Gauthier', 'Charline'),
(29, 'Rey', 'Ange'),
(30, 'Girard', 'Iris');

-- --------------------------------------------------------

--
-- Structure de la table `eleve_sport`
--

DROP TABLE IF EXISTS `eleve_sport`;
CREATE TABLE IF NOT EXISTS `eleve_sport` (
  `eleve_sport_id` int NOT NULL AUTO_INCREMENT,
  `eleve_id` int NOT NULL,
  `sport_id` int NOT NULL,
  PRIMARY KEY (`eleve_sport_id`),
  KEY `eleve_id` (`eleve_id`),
  KEY `sport_id` (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `eleve_sport`
--

INSERT INTO `eleve_sport` (`eleve_sport_id`, `eleve_id`, `sport_id`) VALUES
(1, 3, 5),
(2, 4, 1),
(3, 6, 5),
(4, 9, 4),
(5, 10, 1),
(6, 11, 1),
(7, 13, 4),
(8, 17, 2),
(9, 18, 5),
(10, 19, 4),
(11, 25, 1),
(12, 30, 2),
(13, 1, 2),
(14, 2, 5),
(15, 3, 1),
(16, 4, 2),
(17, 5, 3),
(18, 6, 4),
(19, 7, 2),
(20, 8, 1),
(21, 9, 1),
(22, 10, 1),
(23, 11, 1),
(24, 12, 2),
(25, 13, 1),
(26, 14, 1),
(27, 15, 3),
(28, 16, 3),
(29, 17, 2),
(30, 18, 1),
(31, 19, 2),
(32, 20, 2),
(33, 21, 1),
(34, 22, 5),
(35, 23, 4),
(36, 24, 1),
(37, 25, 4),
(38, 26, 1),
(39, 27, 5),
(40, 28, 2),
(41, 29, 4),
(42, 30, 4);

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
-- Contraintes pour la table `ecole_eleve`
--
ALTER TABLE `ecole_eleve`
  ADD CONSTRAINT `ecole_eleve_ibfk_1` FOREIGN KEY (`ecole_id`) REFERENCES `ecole` (`ecole_id`),
  ADD CONSTRAINT `ecole_eleve_ibfk_2` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`eleve_id`);

--
-- Contraintes pour la table `ecole_eleve_sport`
--
ALTER TABLE `ecole_eleve_sport`
  ADD CONSTRAINT `ecole_eleve_sport_ibfk_1` FOREIGN KEY (`ecole_id`) REFERENCES `ecole` (`ecole_id`),
  ADD CONSTRAINT `ecole_eleve_sport_ibfk_2` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`eleve_id`),
  ADD CONSTRAINT `ecole_sport_sport_ibfk_3` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`sport_id`);

--
-- Contraintes pour la table `ecole_sport`
--
ALTER TABLE `ecole_sport`
  ADD CONSTRAINT `ecole_sport_ibfk_1` FOREIGN KEY (`ecole_id`) REFERENCES `ecole` (`ecole_id`),
  ADD CONSTRAINT `ecole_sport_ibfk_2` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`sport_id`);

--
-- Contraintes pour la table `eleve_sport`
--
ALTER TABLE `eleve_sport`
  ADD CONSTRAINT `eleve_sport_ibfk_1` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`eleve_id`),
  ADD CONSTRAINT `eleve_sport_ibfk_2` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`sport_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
--
-- Contraintes pour la table `ecole_eleve_sport`
--
ALTER TABLE `ecole_eleve_sport`
  ADD CONSTRAINT `ecole_eleve_sport_ibfk_1` FOREIGN KEY (`ecole_id`) REFERENCES `ecole` (`ecole_id`),
  ADD CONSTRAINT `ecole_eleve_sport_ibfk_2` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`eleve_id`),
  ADD CONSTRAINT `ecole_sport_sport_ibfk_3` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`sport_id`);

--
-- Contraintes pour la table `ecole_sport`
--
ALTER TABLE `ecole_sport`
  ADD CONSTRAINT `ecole_sport_ibfk_1` FOREIGN KEY (`ecole_id`) REFERENCES `ecole` (`ecole_id`),
  ADD CONSTRAINT `ecole_sport_ibfk_2` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`sport_id`);

--
-- Contraintes pour la table `eleve_sport`
--
ALTER TABLE `eleve_sport`
  ADD CONSTRAINT `eleve_sport_ibfk_1` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`eleve_id`),
  ADD CONSTRAINT `eleve_sport_ibfk_2` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`sport_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 14 déc. 2023 à 15:45
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
-- Base de données : `db_php_avance`
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
-- Structure de la table `ecole_eleve`
--

DROP TABLE IF EXISTS `ecole_eleve`;
CREATE TABLE IF NOT EXISTS `ecole_eleve` (
  `ecole_eleve_id` int NOT NULL AUTO_INCREMENT,
  `ecole_id` int NOT NULL,
  `eleve_id` int NOT NULL,
  PRIMARY KEY (`ecole_eleve_id`) USING BTREE,
  KEY `ecole_id` (`ecole_id`),
  KEY `eleve_id` (`eleve_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecole_eleve`
--

INSERT INTO `ecole_eleve` (`ecole_eleve_id`, `ecole_id`, `eleve_id`) VALUES
(1, 3, 1),
(2, 3, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 5),
(6, 1, 6),
(7, 3, 7),
(8, 2, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 3, 12),
(13, 1, 13),
(14, 2, 14),
(15, 2, 15),
(16, 3, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 3, 20),
(21, 2, 21),
(22, 3, 22),
(23, 2, 23),
(24, 2, 24),
(25, 1, 25),
(26, 2, 26),
(27, 3, 27),
(28, 3, 28),
(29, 2, 29),
(30, 1, 30);

-- --------------------------------------------------------

--
-- Structure de la table `ecole_eleve_sport`
--

DROP TABLE IF EXISTS `ecole_eleve_sport`;
CREATE TABLE IF NOT EXISTS `ecole_eleve_sport` (
  `ees_id` int NOT NULL AUTO_INCREMENT,
  `ecole_id` int NOT NULL,
  `eleve_id` int NOT NULL,
  `sport_id` int NOT NULL,
  PRIMARY KEY (`ees_id`),
  KEY `ecole_eleve_sport_ibfk_1` (`ecole_id`),
  KEY `ecole_eleve_sport_ibfk_2` (`eleve_id`),
  KEY `ecole_sport_sport_ibfk_3` (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecole_eleve_sport`
--

INSERT INTO `ecole_eleve_sport` (`ees_id`, `ecole_id`, `eleve_id`, `sport_id`) VALUES
(1, 3, 1, 2),
(2, 3, 2, 5),
(3, 1, 3, 1),
(4, 1, 4, 2),
(5, 2, 5, 3),
(6, 1, 6, 4),
(7, 3, 7, 2),
(8, 2, 8, 1),
(9, 1, 9, 1),
(10, 1, 10, 1),
(11, 1, 11, 1),
(12, 3, 12, 2),
(13, 1, 13, 1),
(14, 2, 14, 1),
(15, 2, 15, 3),
(16, 3, 16, 3),
(17, 1, 17, 2),
(18, 1, 18, 1),
(19, 1, 19, 2),
(20, 3, 20, 2),
(21, 2, 21, 1),
(22, 3, 22, 5),
(23, 2, 23, 4),
(24, 2, 24, 1),
(25, 1, 25, 4),
(26, 2, 26, 1),
(27, 3, 27, 5),
(28, 3, 28, 2),
(29, 2, 29, 4),
(30, 1, 30, 4);

-- --------------------------------------------------------

--
-- Structure de la table `ecole_sport`
--

DROP TABLE IF EXISTS `ecole_sport`;
CREATE TABLE IF NOT EXISTS `ecole_sport` (
  `ecole_sport_id` int NOT NULL AUTO_INCREMENT,
  `ecole_id` int NOT NULL,
  `sport_id` int NOT NULL,
  PRIMARY KEY (`ecole_sport_id`),
  KEY `ecole_id` (`ecole_id`),
  KEY `sport_id` (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecole_sport`
--

INSERT INTO `ecole_sport` (`ecole_sport_id`, `ecole_id`, `sport_id`) VALUES
(7, 2, 1),
(9, 1, 1),
(11, 3, 2),
(12, 3, 5),
(13, 2, 4),
(14, 1, 2),
(15, 3, 3),
(20, 1, 4),
(21, 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `eleve_id` int NOT NULL AUTO_INCREMENT,
  `eleve_nom` varchar(250) NOT NULL,
  `eleve_prenom` varchar(250) NOT NULL,
  PRIMARY KEY (`eleve_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`eleve_id`, `eleve_nom`, `eleve_prenom`) VALUES
(1, 'Girard', 'Lison'),
(2, 'Faure', 'Albane'),
(3, 'Roger', 'Emilie'),
(4, 'Masson', 'Eva'),
(5, 'Dupuy', 'Sara'),
(6, 'da Silva', 'Sarah'),
(7, 'Bonnet', 'Augustin'),
(8, 'Meunier', 'Benjamin'),
(9, 'Caron', 'Achille'),
(10, 'Pollet', 'William'),
(11, 'Leroy', 'Daniel'),
(12, 'Gauthier', 'Marcel'),
(13, 'Leroux', 'Maxence'),
(14, 'Gautier', 'Léa'),
(15, 'Faure', 'Soline'),
(16, 'Clement', 'Lison'),
(17, 'Lompech', 'Margaux'),
(18, 'Caron', 'Octave'),
(19, 'Olivier', 'Malo'),
(20, 'Louis', 'Charline'),
(21, 'Lacroix', 'Benjamin'),
(22, 'Rousseau', 'Agathe'),
(23, 'Meyer', 'Olivia'),
(24, 'Fabre', 'Elsa'),
(25, 'Brun', 'Mathis'),
(26, 'Boé', 'Andréa'),
(27, 'Huart', 'Mathilde'),
(28, 'Gauthier', 'Charline'),
(29, 'Rey', 'Ange'),
(30, 'Girard', 'Iris');

-- --------------------------------------------------------

--
-- Structure de la table `eleve_sport`
--

DROP TABLE IF EXISTS `eleve_sport`;
CREATE TABLE IF NOT EXISTS `eleve_sport` (
  `eleve_sport_id` int NOT NULL AUTO_INCREMENT,
  `eleve_id` int NOT NULL,
  `sport_id` int NOT NULL,
  PRIMARY KEY (`eleve_sport_id`),
  KEY `eleve_id` (`eleve_id`),
  KEY `sport_id` (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `eleve_sport`
--

INSERT INTO `eleve_sport` (`eleve_sport_id`, `eleve_id`, `sport_id`) VALUES
(1, 3, 5),
(2, 4, 1),
(3, 6, 5),
(4, 9, 4),
(5, 10, 1),
(6, 11, 1),
(7, 13, 4),
(8, 17, 2),
(9, 18, 5),
(10, 19, 4),
(11, 25, 1),
(12, 30, 2),
(13, 1, 2),
(14, 2, 5),
(15, 3, 1),
(16, 4, 2),
(17, 5, 3),
(18, 6, 4),
(19, 7, 2),
(20, 8, 1),
(21, 9, 1),
(22, 10, 1),
(23, 11, 1),
(24, 12, 2),
(25, 13, 1),
(26, 14, 1),
(27, 15, 3),
(28, 16, 3),
(29, 17, 2),
(30, 18, 1),
(31, 19, 2),
(32, 20, 2),
(33, 21, 1),
(34, 22, 5),
(35, 23, 4),
(36, 24, 1),
(37, 25, 4),
(38, 26, 1),
(39, 27, 5),
(40, 28, 2),
(41, 29, 4),
(42, 30, 4);

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
-- Contraintes pour la table `ecole_eleve`
--
ALTER TABLE `ecole_eleve`
  ADD CONSTRAINT `ecole_eleve_ibfk_1` FOREIGN KEY (`ecole_id`) REFERENCES `ecole` (`ecole_id`),
  ADD CONSTRAINT `ecole_eleve_ibfk_2` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`eleve_id`);

--
-- Contraintes pour la table `ecole_eleve_sport`
--
ALTER TABLE `ecole_eleve_sport`
  ADD CONSTRAINT `ecole_eleve_sport_ibfk_1` FOREIGN KEY (`ecole_id`) REFERENCES `ecole` (`ecole_id`),
  ADD CONSTRAINT `ecole_eleve_sport_ibfk_2` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`eleve_id`),
  ADD CONSTRAINT `ecole_sport_sport_ibfk_3` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`sport_id`);

--
-- Contraintes pour la table `ecole_sport`
--
ALTER TABLE `ecole_sport`
  ADD CONSTRAINT `ecole_sport_ibfk_1` FOREIGN KEY (`ecole_id`) REFERENCES `ecole` (`ecole_id`),
  ADD CONSTRAINT `ecole_sport_ibfk_2` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`sport_id`);

--
-- Contraintes pour la table `eleve_sport`
--
ALTER TABLE `eleve_sport`
  ADD CONSTRAINT `eleve_sport_ibfk_1` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`eleve_id`),
  ADD CONSTRAINT `eleve_sport_ibfk_2` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`sport_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
