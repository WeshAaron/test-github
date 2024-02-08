-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 07 fév. 2024 à 14:54
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `netflux`
--

-- --------------------------------------------------------

--
-- Structure de la table `acteur`
--

CREATE TABLE `acteur` (
  `IdActeur` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Prénom` varchar(255) DEFAULT NULL,
  `Date_Naissance` date DEFAULT NULL,
  `Date_Mort` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `acteur`
--

INSERT INTO `acteur` (`IdActeur`, `Nom`, `Prénom`, `Date_Naissance`, `Date_Mort`) VALUES
(1, 'Johnson', 'Dwayne', '1972-05-02', NULL),
(2, 'Hodge', 'Aldis', '1986-09-20', NULL),
(3, 'Brosnan', 'Pierce', '1963-05-16', NULL),
(4, 'Shahi', 'Sarah', '1980-01-10', NULL),
(5, 'Centineo', 'Noah', '1996-05-09', NULL),
(100, 'Leonardo', 'DiCaprio', '0000-00-00', NULL),
(101, 'Tom', 'Hardy', '0000-00-00', NULL),
(102, 'Domhnall', 'Gleeson', '0000-00-00', NULL),
(103, 'Will', 'Poulter', '0000-00-00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

CREATE TABLE `appartient` (
  `FkVideo` int(11) NOT NULL,
  `FkGenre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `appartient`
--

INSERT INTO `appartient` (`FkVideo`, `FkGenre`) VALUES
(1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `IdGenre` int(11) NOT NULL,
  `Libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`IdGenre`, `Libelle`) VALUES
(1, 'Action'),
(2, 'Aventure'),
(3, 'Fantastique'),
(4, 'Super-héros'),
(5, 'horreur'),
(6, 'Policier');

-- --------------------------------------------------------

--
-- Structure de la table `joue`
--

CREATE TABLE `joue` (
  `FkVideo` int(11) NOT NULL,
  `FkActeur` int(11) NOT NULL,
  `Role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `joue`
--

INSERT INTO `joue` (`FkVideo`, `FkActeur`, `Role`) VALUES
(1, 1, 'Black Adam'),
(1, 2, 'Hawkman'),
(1, 3, 'Doctor Fate'),
(1, 4, 'Adrianna Tomaz'),
(100, 100, 'Hugh Glass'),
(100, 101, 'John Fitzgerald'),
(100, 102, 'Andrew Henry'),
(100, 103, 'Jim Bridger');

-- --------------------------------------------------------

--
-- Structure de la table `obtientacteur`
--

CREATE TABLE `obtientacteur` (
  `FkActeur` int(11) NOT NULL,
  `FkRecompense` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `obtientacteur`
--

INSERT INTO `obtientacteur` (`FkActeur`, `FkRecompense`) VALUES
(100, 100);

-- --------------------------------------------------------

--
-- Structure de la table `obtientrealisateur`
--

CREATE TABLE `obtientrealisateur` (
  `FkRealisateur` int(11) NOT NULL,
  `FkRecompense` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `obtientvideo`
--

CREATE TABLE `obtientvideo` (
  `FkVideo` int(11) NOT NULL,
  `FkRecompense` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `producteur`
--

CREATE TABLE `producteur` (
  `IdProducteur` int(11) NOT NULL,
  `RaisonSocial` varchar(255) DEFAULT NULL,
  `Date_Creation` year(4) DEFAULT NULL,
  `Adresse` varchar(255) DEFAULT NULL,
  `Mail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `producteur`
--

INSERT INTO `producteur` (`IdProducteur`, `RaisonSocial`, `Date_Creation`, `Adresse`, `Mail`) VALUES
(1, 'DC Studios', '2016', '4000 Warner Boulevard Burbank, CA 91522 ', 'copyright@wb.com'),
(2, 'New Line Cinema ', '1967', '4000 Warner Boulevard Burbank, CA 91522', 'copyright@wb.com'),
(100, 'Regency Enterprises ', '1982', '10201 W. Pico Blvd, Bldg. 12\r\nLos Angeles, CA 90035', 'info@newregency.com'),
(101, 'Anonymous Content', '1999', '8501 Washington Blvd\r\nCulver City, CA 90232', 'eric@anonymouscontent.com'),
(102, 'Appian Way', '2004', 'West Hollywood États-Unis', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `FkVideo` int(11) NOT NULL,
  `FkProducteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`FkVideo`, `FkProducteur`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `realisateur`
--

CREATE TABLE `realisateur` (
  `IdRealisateur` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Prenom` varchar(255) DEFAULT NULL,
  `Date_Naissance` date DEFAULT NULL,
  `Date_Mort` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `realisateur`
--

INSERT INTO `realisateur` (`IdRealisateur`, `Nom`, `Prenom`, `Date_Naissance`, `Date_Mort`) VALUES
(0, 'Gonzalez Inarritu', 'Alejandro', '0000-00-00', NULL),
(1, 'Collet-Serra', 'Jaume', '1974-03-23', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `realise`
--

CREATE TABLE `realise` (
  `FkVideo` int(11) NOT NULL,
  `FkRealisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `realise`
--

INSERT INTO `realise` (`FkVideo`, `FkRealisateur`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `recompense`
--

CREATE TABLE `recompense` (
  `IdRecompense` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Catégorie` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `recompense`
--

INSERT INTO `recompense` (`IdRecompense`, `Nom`, `Catégorie`) VALUES
(100, 'meilleur acteur', 'oscar');

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `IdType` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`IdType`, `Nom`) VALUES
(1, 'Film'),
(2, 'Anime'),
(3, 'Serie');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `Identifiant` varchar(255) NOT NULL,
  `Mdp` varchar(255) DEFAULT NULL,
  `Date_Naissance` date DEFAULT NULL,
  `Adresse` varchar(255) DEFAULT NULL,
  `Genre` enum('Homme','Femme','Autres') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`Identifiant`, `Mdp`, `Date_Naissance`, `Adresse`, `Genre`) VALUES
('adam', 'adam2002', '2023-09-01', 'a@gmail.com', 'Homme');

-- --------------------------------------------------------

--
-- Structure de la table `video`
--

CREATE TABLE `video` (
  `IdVideo` int(11) NOT NULL,
  `Titre` varchar(255) DEFAULT NULL,
  `FkType` int(11) DEFAULT NULL,
  `Date_Sortie` date DEFAULT NULL,
  `duree` int(11) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `video`
--

INSERT INTO `video` (`IdVideo`, `Titre`, `FkType`, `Date_Sortie`, `duree`, `image`) VALUES
(1, 'Black Adam', 1, '2022-10-19', 124, 'BlackAdam\r\n'),
(100, 'The Revenant', 1, '2015-12-16', 156, 'TheRevenant'),
(101, 'Split', 1, '2016-09-26', 117, 'split'),
(102, 'Prisonners', 1, '2013-10-09', 153, 'prisonners'),
(103, 'Dora', 1, '2019-08-09', 102, 'dora');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acteur`
--
ALTER TABLE `acteur`
  ADD PRIMARY KEY (`IdActeur`);

--
-- Index pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD PRIMARY KEY (`FkVideo`,`FkGenre`),
  ADD KEY `FkGenre` (`FkGenre`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`IdGenre`);

--
-- Index pour la table `joue`
--
ALTER TABLE `joue`
  ADD PRIMARY KEY (`FkVideo`,`FkActeur`,`Role`),
  ADD KEY `joue_ibfk_2` (`FkActeur`);

--
-- Index pour la table `obtientacteur`
--
ALTER TABLE `obtientacteur`
  ADD PRIMARY KEY (`FkActeur`,`FkRecompense`),
  ADD KEY `FkRecompense` (`FkRecompense`);

--
-- Index pour la table `obtientrealisateur`
--
ALTER TABLE `obtientrealisateur`
  ADD PRIMARY KEY (`FkRealisateur`,`FkRecompense`),
  ADD KEY `FkRecompense` (`FkRecompense`);

--
-- Index pour la table `obtientvideo`
--
ALTER TABLE `obtientvideo`
  ADD PRIMARY KEY (`FkVideo`,`FkRecompense`),
  ADD KEY `FkRecompense` (`FkRecompense`);

--
-- Index pour la table `producteur`
--
ALTER TABLE `producteur`
  ADD PRIMARY KEY (`IdProducteur`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`FkVideo`,`FkProducteur`),
  ADD KEY `FkProducteur` (`FkProducteur`);

--
-- Index pour la table `realisateur`
--
ALTER TABLE `realisateur`
  ADD PRIMARY KEY (`IdRealisateur`);

--
-- Index pour la table `realise`
--
ALTER TABLE `realise`
  ADD PRIMARY KEY (`FkVideo`,`FkRealisateur`),
  ADD KEY `FkRealisateur` (`FkRealisateur`);

--
-- Index pour la table `recompense`
--
ALTER TABLE `recompense`
  ADD PRIMARY KEY (`IdRecompense`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`IdType`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`Identifiant`);

--
-- Index pour la table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`IdVideo`),
  ADD KEY `FkType` (`FkType`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD CONSTRAINT `appartient_ibfk_1` FOREIGN KEY (`FkVideo`) REFERENCES `video` (`IdVideo`),
  ADD CONSTRAINT `appartient_ibfk_2` FOREIGN KEY (`FkGenre`) REFERENCES `genre` (`IdGenre`);

--
-- Contraintes pour la table `joue`
--
ALTER TABLE `joue`
  ADD CONSTRAINT `joue_ibfk_1` FOREIGN KEY (`FkVideo`) REFERENCES `video` (`IdVideo`),
  ADD CONSTRAINT `joue_ibfk_2` FOREIGN KEY (`FkActeur`) REFERENCES `acteur` (`IdActeur`);

--
-- Contraintes pour la table `obtientacteur`
--
ALTER TABLE `obtientacteur`
  ADD CONSTRAINT `obtientacteur_ibfk_1` FOREIGN KEY (`FkActeur`) REFERENCES `acteur` (`IdActeur`),
  ADD CONSTRAINT `obtientacteur_ibfk_2` FOREIGN KEY (`FkRecompense`) REFERENCES `recompense` (`IdRecompense`);

--
-- Contraintes pour la table `obtientrealisateur`
--
ALTER TABLE `obtientrealisateur`
  ADD CONSTRAINT `obtientrealisateur_ibfk_1` FOREIGN KEY (`FkRealisateur`) REFERENCES `realisateur` (`IdRealisateur`),
  ADD CONSTRAINT `obtientrealisateur_ibfk_2` FOREIGN KEY (`FkRecompense`) REFERENCES `recompense` (`IdRecompense`);

--
-- Contraintes pour la table `obtientvideo`
--
ALTER TABLE `obtientvideo`
  ADD CONSTRAINT `obtientvideo_ibfk_1` FOREIGN KEY (`FkVideo`) REFERENCES `video` (`IdVideo`),
  ADD CONSTRAINT `obtientvideo_ibfk_2` FOREIGN KEY (`FkRecompense`) REFERENCES `recompense` (`IdRecompense`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`FkVideo`) REFERENCES `video` (`IdVideo`),
  ADD CONSTRAINT `produit_ibfk_2` FOREIGN KEY (`FkProducteur`) REFERENCES `producteur` (`IdProducteur`);

--
-- Contraintes pour la table `realise`
--
ALTER TABLE `realise`
  ADD CONSTRAINT `realise_ibfk_1` FOREIGN KEY (`FkVideo`) REFERENCES `video` (`IdVideo`),
  ADD CONSTRAINT `realise_ibfk_2` FOREIGN KEY (`FkRealisateur`) REFERENCES `realisateur` (`IdRealisateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
