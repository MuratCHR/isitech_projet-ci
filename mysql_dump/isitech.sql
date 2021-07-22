-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 04 juin 2021 à 10:08
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `isitech`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `typeCategorie` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`ID`, `typeCategorie`) VALUES
(1, 'Alimentaire'),
(2, 'Non-Alimentaire');

-- --------------------------------------------------------

--
-- Structure de la table `magasin`
--

DROP TABLE IF EXISTS `magasin`;
CREATE TABLE IF NOT EXISTS `magasin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `placeTotale` int(11) NOT NULL,
  `identifiantVille` int(11) NOT NULL,
  `ville_id` int(11) DEFAULT NULL,
  `iddelacategorie` int(11) NOT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKk4l2fbtaj4crmmr5iot1kjndb` (`identifiantVille`),
  KEY `FKrcil60lqs6k7siv51ey0657qt` (`categorie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `magasin`
--

INSERT INTO `magasin` (`ID`, `nom`, `adresse`, `placeTotale`, `identifiantVille`, `ville_id`, `iddelacategorie`, `categorie_id`) VALUES
(1, 'Carrefour Market', '10 Rue Barriere de Jaude', 100, 1, 1, 1, 1),
(2, 'Carrefour Contact', '1 Mail Besset', 75, 3, 3, 1, 1),
(3, 'Carrefour Express', '25 Avenue Berthelot', 45, 2, 2, 1, 1),
(5, 'Carrefour City', '4 Rue Pasteur', 40, 5, 5, 1, 1),
(11, 'Carrefour Contact', '2 Rue de Liege', 140, 13, 13, 1, 1),
(13, 'Zara', '2 rue des trucs moches', 35, 2, 2, 2, 2),
(14, 'Carrefour Contact', '4 Rue de Londres', 45, 13, 13, 1, 1),
(15, 'Carrefour City', '14 Rue Montcalm', 40, 18, 18, 1, 1),
(16, 'Carrefour Market', '4 Rue des Fermiers', 40, 17, 17, 1, 1),
(17, 'Carrefour Contact', '18 Rue de Tocqueville', 35, 15, 15, 1, 1),
(18, 'Carrefour Contact', '2 Rue Fontgieve', 55, 1, 1, 1, 1);

--
-- Déclencheurs `magasin`
--
DROP TRIGGER IF EXISTS `addVilleID`;
DELIMITER $$
CREATE TRIGGER `addVilleID` BEFORE INSERT ON `magasin` FOR EACH ROW SET NEW.ville_id = NEW.identifiantVille
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `idCategorie`;
DELIMITER $$
CREATE TRIGGER `idCategorie` BEFORE INSERT ON `magasin` FOR EACH ROW SET NEW.categorie_id = NEW.iddelacategorie
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `iddumagasin` int(11) NOT NULL,
  `dateReservation` date NOT NULL,
  `heureDebut` time NOT NULL,
  `heureFin` time NOT NULL,
  `nbPlace` int(11) NOT NULL,
  `idPersonne` int(11) NOT NULL,
  `magasin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK310uq6f8pv8mlixo321xg0p31` (`iddumagasin`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`ID`, `iddumagasin`, `dateReservation`, `heureDebut`, `heureFin`, `nbPlace`, `idPersonne`, `magasin_id`) VALUES
(1, 1, '2021-02-13', '11:30:00', '12:00:00', 1, 60000, 1),
(2, 1, '2021-02-13', '12:00:01', '12:30:00', 1, 61000, 1),
(3, 1, '2021-02-13', '11:30:00', '12:00:00', 1, 60000, 1),
(4, 1, '2021-02-13', '11:30:00', '12:00:00', 1, 60001, 1),
(5, 3, '2021-02-13', '11:30:00', '12:00:00', 97, 60002, 3),
(6, 2, '2021-04-21', '00:09:11', '03:09:11', 1, 1, 2),
(7, 2, '2021-04-21', '12:00:00', '13:00:00', 1, 121, 2),
(11, 1, '2021-04-20', '10:00:00', '11:00:00', 1, 1, 1),
(12, 3, '2021-04-21', '09:00:00', '11:00:00', 1, 1, 3),
(13, 2, '2021-04-21', '14:00:00', '15:00:00', 1, 1, 2),
(14, 2, '2021-04-23', '12:00:00', '13:00:00', 1, 121, 2),
(15, 3, '2021-04-23', '11:00:00', '12:00:00', 1, 222, 3),
(16, 5, '2021-04-23', '15:00:00', '16:00:00', 5, 1, 5),
(17, 3, '2021-04-20', '12:00:00', '13:00:00', 4, 1, 3);

--
-- Déclencheurs `reservation`
--
DROP TRIGGER IF EXISTS `test`;
DELIMITER $$
CREATE TRIGGER `test` BEFORE INSERT ON `reservation` FOR EACH ROW SET NEW.magasin_id = NEW.iddumagasin
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `codePostal` varchar(5) NOT NULL,
  `nomVille` varchar(250) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`ID`, `codePostal`, `nomVille`) VALUES
(1, '63000', 'Clermont-Ferrand'),
(2, '69000', 'Lyon'),
(3, '63001', 'Clermont-Ferrand'),
(4, '69001', 'Lyon'),
(5, '69002', 'Lyon'),
(6, '69003', 'Lyon'),
(7, '69004', 'Lyon'),
(8, '69005', 'Lyon'),
(9, '69006', 'Lyon'),
(10, '69007', 'Lyon'),
(11, '69008', 'Lyon'),
(12, '69009', 'Lyon'),
(13, '75000', 'Paris'),
(14, '75001', 'Paris'),
(15, '75002', 'Paris'),
(16, '75003', 'Paris'),
(17, '75004', 'Paris'),
(18, '75005', 'Paris'),
(19, '75006', 'Paris');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `magasin`
--
ALTER TABLE `magasin`
  ADD CONSTRAINT `FKk4l2fbtaj4crmmr5iot1kjndb` FOREIGN KEY (`identifiantVille`) REFERENCES `ville` (`ID`),
  ADD CONSTRAINT `FKnjnxrwe4v1fevk8o2ehs2n1lq` FOREIGN KEY (`categorie_id`) REFERENCES `magasin` (`ID`),
  ADD CONSTRAINT `FKrcil60lqs6k7siv51ey0657qt` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`ID`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK310uq6f8pv8mlixo321xg0p31` FOREIGN KEY (`iddumagasin`) REFERENCES `magasin` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
