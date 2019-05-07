-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 07 mai 2019 à 16:11
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `restaurant`
--

-- --------------------------------------------------------

--
-- Structure de la table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookingDate` date NOT NULL,
  `bookingTime` time NOT NULL,
  `numberOfSeats` tinyint(4) NOT NULL,
  `userId` int(11) NOT NULL,
  `creationTimestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `meal`
--

DROP TABLE IF EXISTS `meal`;
CREATE TABLE IF NOT EXISTS `meal` (
  `id` tinyint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `photo` varchar(30) NOT NULL,
  `description` varchar(250) NOT NULL,
  `quantityInStock` int(4) NOT NULL,
  `buyPrice` double NOT NULL,
  `salePrice` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `meal`
--

INSERT INTO `meal` (`id`, `name`, `photo`, `description`, `quantityInStock`, `buyPrice`, `salePrice`) VALUES
(9, 'Acras de morue', 'acrasmorue.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat.', 100, 1, 2),
(10, 'Beignets de banane plaintain', 'beignetsbabane', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat.', 20, 1.75, 3),
(11, 'Jus ananas/coco', 'CAananascoco', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat.', 150, 0.5, 2.5),
(12, 'Jus fruit de la passion', 'CAfruitpassion', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat.', 150, 0.5, 2.5),
(13, 'Colombo de poulet pimenté', 'colombopouletpimente', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat.', 10, 5, 11),
(14, 'Frites de patates douces', 'fritespatatesdouces', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat.', 50, 2, 3.5),
(15, 'Frites', 'fritespdt', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat.', 30, 1, 2.5),
(16, 'Matété de crabe', 'matetecrabe', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat.', 90, 10, 15),
(17, 'Poulet boucané', 'pouletboucane', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat.', 45, 7, 11.75),
(18, 'Rougail', 'rougail', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat.', 12, 12, 15),
(19, 'Sauce chien', 'saucechien', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat.', 33, 1, 3.5),
(20, 'Coca Cola', 'coca.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat.', 2, 2.2, 2.5);

-- --------------------------------------------------------

--
-- Structure de la table `orderline`
--

DROP TABLE IF EXISTS `orderline`;
CREATE TABLE IF NOT EXISTS `orderline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantityOrdered` int(4) NOT NULL,
  `mealId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `priceEach` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `totalAmount` double NOT NULL,
  `taxRate` float NOT NULL DEFAULT '0.2',
  `taxAmount` double NOT NULL,
  `creationTimestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `completeTimestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(40) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `birthDay` date NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(40) NOT NULL,
  `zipCode` char(5) NOT NULL,
  `country` varchar(20) DEFAULT NULL,
  `phone` char(10) NOT NULL,
  `creationTimestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastLoginTimestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `firstName`, `lastName`, `email`, `password`, `birthDay`, `address`, `city`, `zipCode`, `country`, `phone`, `creationTimestamp`, `lastLoginTimestamp`) VALUES
(3, 'Sofien', 'BILLOT', 'so@so.so', '$2y$10$inFUEwfdQT3mbOTOu3.aruICQ9lwipCO0kw29BY/q9e.Gie/AQxtS', '1995-01-13', 'Addresse lalilou', 'Montfavet', '84140', 'France', '0102030405', '2019-03-20 15:59:44', '2019-05-07 18:07:36');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
