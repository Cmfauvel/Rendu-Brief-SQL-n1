-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 22 fév. 2021 à 10:00
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
-- Base de données : `sqlix`
--
CREATE DATABASE IF NOT EXISTS `sqlix` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `sqlix`;

-- --------------------------------------------------------

--
-- Structure de la table `absorber`
--

DROP TABLE IF EXISTS `absorber`;
CREATE TABLE IF NOT EXISTS `absorber` (
  `num_potion` int(11) NOT NULL,
  `date_a` datetime NOT NULL,
  `num_hab` int(11) NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_potion`,`date_a`,`num_hab`),
  KEY `num_potion` (`num_potion`),
  KEY `num_hab` (`num_hab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `code_cat` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_categ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb_points` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fabriquer`
--

DROP TABLE IF EXISTS `fabriquer`;
CREATE TABLE IF NOT EXISTS `fabriquer` (
  `num_potion` int(11) NOT NULL,
  `num_hab` int(11) NOT NULL,
  PRIMARY KEY (`num_potion`,`num_hab`),
  KEY `num_potion` (`num_potion`),
  KEY `num_hab` (`num_hab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `habitant`
--

DROP TABLE IF EXISTS `habitant`;
CREATE TABLE IF NOT EXISTS `habitant` (
  `num_hab` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `num_qualite` int(11) DEFAULT NULL,
  `num_village` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_hab`),
  KEY `num_qualite` (`num_qualite`),
  KEY `num_village` (`num_village`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `potion`
--

DROP TABLE IF EXISTS `potion`;
CREATE TABLE IF NOT EXISTS `potion` (
  `num_potion` int(11) NOT NULL AUTO_INCREMENT,
  `lib_potion` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `formule` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `constituant_principal` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`num_potion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `province`
--

DROP TABLE IF EXISTS `province`;
CREATE TABLE IF NOT EXISTS `province` (
  `num_province` int(11) NOT NULL AUTO_INCREMENT,
  `nom_province` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_gouverneur` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`num_province`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `qualite`
--

DROP TABLE IF EXISTS `qualite`;
CREATE TABLE IF NOT EXISTS `qualite` (
  `num_qualite` int(11) NOT NULL AUTO_INCREMENT,
  `lib_qualite` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`num_qualite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `resserre`
--

DROP TABLE IF EXISTS `resserre`;
CREATE TABLE IF NOT EXISTS `resserre` (
  `num_resserre` int(11) NOT NULL AUTO_INCREMENT,
  `nom_resserre` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `superficie` int(11) DEFAULT NULL,
  `num_village` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_resserre`),
  KEY `num_village` (`num_village`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `trophee`
--

DROP TABLE IF EXISTS `trophee`;
CREATE TABLE IF NOT EXISTS `trophee` (
  `num_trophee` int(11) NOT NULL AUTO_INCREMENT,
  `date_prise` datetime DEFAULT NULL,
  `code_cat` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_preneur` int(11) DEFAULT NULL,
  `num_resserre` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_trophee`),
  KEY `code_cat` (`code_cat`),
  KEY `num_preneur` (`num_preneur`),
  KEY `num_resserre` (`num_resserre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `village`
--

DROP TABLE IF EXISTS `village`;
CREATE TABLE IF NOT EXISTS `village` (
  `num_village` int(11) NOT NULL AUTO_INCREMENT,
  `nom_village` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb_huttes` int(11) DEFAULT NULL,
  `num_province` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_village`),
  KEY `num_province` (`num_province`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `absorber`
--
ALTER TABLE `absorber`
  ADD CONSTRAINT `absorber_ibfk_1` FOREIGN KEY (`num_potion`) REFERENCES `potion` (`num_potion`),
  ADD CONSTRAINT `absorber_ibfk_2` FOREIGN KEY (`num_hab`) REFERENCES `habitant` (`num_hab`);

--
-- Contraintes pour la table `fabriquer`
--
ALTER TABLE `fabriquer`
  ADD CONSTRAINT `fabriquer_ibfk_1` FOREIGN KEY (`num_potion`) REFERENCES `potion` (`num_potion`),
  ADD CONSTRAINT `fabriquer_ibfk_2` FOREIGN KEY (`num_hab`) REFERENCES `habitant` (`num_hab`);

--
-- Contraintes pour la table `habitant`
--
ALTER TABLE `habitant`
  ADD CONSTRAINT `habitant_ibfk_1` FOREIGN KEY (`num_qualite`) REFERENCES `qualite` (`num_qualite`),
  ADD CONSTRAINT `habitant_ibfk_2` FOREIGN KEY (`num_village`) REFERENCES `village` (`num_village`);

--
-- Contraintes pour la table `resserre`
--
ALTER TABLE `resserre`
  ADD CONSTRAINT `resserre_ibfk_1` FOREIGN KEY (`num_village`) REFERENCES `village` (`num_village`);

--
-- Contraintes pour la table `trophee`
--
ALTER TABLE `trophee`
  ADD CONSTRAINT `trophee_ibfk_1` FOREIGN KEY (`code_cat`) REFERENCES `categorie` (`code_cat`),
  ADD CONSTRAINT `trophee_ibfk_2` FOREIGN KEY (`num_preneur`) REFERENCES `habitant` (`num_hab`),
  ADD CONSTRAINT `trophee_ibfk_3` FOREIGN KEY (`num_resserre`) REFERENCES `resserre` (`num_resserre`);

--
-- Contraintes pour la table `village`
--
ALTER TABLE `village`
  ADD CONSTRAINT `village_ibfk_1` FOREIGN KEY (`num_province`) REFERENCES `province` (`num_province`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
