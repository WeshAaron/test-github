-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 07 fév. 2024 à 13:13
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
-- Base de données : `user`
--

-- --------------------------------------------------------

--
-- Structure de la table `acteur`
--

CREATE TABLE `acteur` (
  `idActeur` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `dateN` date DEFAULT NULL,
  `dateM` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

CREATE TABLE `appartient` (
  `fkGenre` int(11) DEFAULT NULL,
  `fkVideo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `filmrecompense`
--

CREATE TABLE `filmrecompense` (
  `fkRecompense` int(11) DEFAULT NULL,
  `fkvideo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `idGenre` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `joue`
--

CREATE TABLE `joue` (
  `fkVideo` int(11) DEFAULT NULL,
  `fkActeur` int(11) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `obtenir`
--

CREATE TABLE `obtenir` (
  `fkRecompense` int(11) DEFAULT NULL,
  `fkAuteur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `production`
--

CREATE TABLE `production` (
  `idProduction` int(11) NOT NULL,
  `raisonSociale` varchar(255) DEFAULT NULL,
  `dateCreation` date DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produire`
--

CREATE TABLE `produire` (
  `fkfilm` int(11) DEFAULT NULL,
  `fkproduct` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `realisateur`
--

CREATE TABLE `realisateur` (
  `idReal` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `dateN` date DEFAULT NULL,
  `dateM` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `realisateurrecompense`
--

CREATE TABLE `realisateurrecompense` (
  `fkRecompense` int(11) DEFAULT NULL,
  `fkReal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `realise`
--

CREATE TABLE `realise` (
  `fkReal` int(11) DEFAULT NULL,
  `fkVideo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `récompense`
--

CREATE TABLE `récompense` (
  `idRecompense` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `categorie` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `idType` int(11) NOT NULL,
  `denomination` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` varchar(200) DEFAULT NULL,
  `mail` varchar(255) NOT NULL,
  `mdp` varchar(200) DEFAULT NULL,
  `age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `mail`, `mdp`, `age`) VALUES
('mickeymouse', 'mickeymouse@mickeymouse.fr', 'd0ff2794ec7af8764a654b31b68d07aec0f518053fee9629917a5782ad9cf837', 12),
('oooooooo', 'oooooooo@oooooooo.fr', 'oooooooo', 12),
('tttttttt', 'tttttttt@tttttttt.fr', '5208dce8de0fed86f96119e8259e7f99b9fdda607810db3c54e36aa6ac163469', 12);

-- --------------------------------------------------------

--
-- Structure de la table `video`
--

CREATE TABLE `video` (
  `idvideo` int(11) NOT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `dateN` date DEFAULT NULL,
  `dateM` date DEFAULT NULL,
  `fkType` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acteur`
--
ALTER TABLE `acteur`
  ADD PRIMARY KEY (`idActeur`);

--
-- Index pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD KEY `fkGenre` (`fkGenre`),
  ADD KEY `fkVideo` (`fkVideo`);

--
-- Index pour la table `filmrecompense`
--
ALTER TABLE `filmrecompense`
  ADD KEY `fkRecompense` (`fkRecompense`),
  ADD KEY `fkvideo` (`fkvideo`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`idGenre`);

--
-- Index pour la table `joue`
--
ALTER TABLE `joue`
  ADD KEY `fkVideo` (`fkVideo`),
  ADD KEY `fkActeur` (`fkActeur`);

--
-- Index pour la table `obtenir`
--
ALTER TABLE `obtenir`
  ADD KEY `fkRecompense` (`fkRecompense`),
  ADD KEY `fkAuteur` (`fkAuteur`);

--
-- Index pour la table `production`
--
ALTER TABLE `production`
  ADD PRIMARY KEY (`idProduction`);

--
-- Index pour la table `produire`
--
ALTER TABLE `produire`
  ADD KEY `fkfilm` (`fkfilm`),
  ADD KEY `fkproduct` (`fkproduct`);

--
-- Index pour la table `realisateur`
--
ALTER TABLE `realisateur`
  ADD PRIMARY KEY (`idReal`);

--
-- Index pour la table `realisateurrecompense`
--
ALTER TABLE `realisateurrecompense`
  ADD KEY `fkRecompense` (`fkRecompense`),
  ADD KEY `fkReal` (`fkReal`);

--
-- Index pour la table `realise`
--
ALTER TABLE `realise`
  ADD KEY `fkReal` (`fkReal`),
  ADD KEY `fkVideo` (`fkVideo`);

--
-- Index pour la table `récompense`
--
ALTER TABLE `récompense`
  ADD PRIMARY KEY (`idRecompense`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`idType`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`mail`);

--
-- Index pour la table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`idvideo`),
  ADD KEY `fkType` (`fkType`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `acteur`
--
ALTER TABLE `acteur`
  MODIFY `idActeur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
  MODIFY `idGenre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `production`
--
ALTER TABLE `production`
  MODIFY `idProduction` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `realisateur`
--
ALTER TABLE `realisateur`
  MODIFY `idReal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `récompense`
--
ALTER TABLE `récompense`
  MODIFY `idRecompense` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `type`
--
ALTER TABLE `type`
  MODIFY `idType` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `video`
--
ALTER TABLE `video`
  MODIFY `idvideo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD CONSTRAINT `appartient_ibfk_1` FOREIGN KEY (`fkGenre`) REFERENCES `genre` (`idGenre`),
  ADD CONSTRAINT `appartient_ibfk_2` FOREIGN KEY (`fkVideo`) REFERENCES `video` (`idvideo`);

--
-- Contraintes pour la table `filmrecompense`
--
ALTER TABLE `filmrecompense`
  ADD CONSTRAINT `filmrecompense_ibfk_1` FOREIGN KEY (`fkRecompense`) REFERENCES `récompense` (`idRecompense`),
  ADD CONSTRAINT `filmrecompense_ibfk_2` FOREIGN KEY (`fkvideo`) REFERENCES `video` (`idvideo`);

--
-- Contraintes pour la table `joue`
--
ALTER TABLE `joue`
  ADD CONSTRAINT `joue_ibfk_1` FOREIGN KEY (`fkVideo`) REFERENCES `video` (`idvideo`),
  ADD CONSTRAINT `joue_ibfk_2` FOREIGN KEY (`fkActeur`) REFERENCES `acteur` (`idActeur`);

--
-- Contraintes pour la table `obtenir`
--
ALTER TABLE `obtenir`
  ADD CONSTRAINT `obtenir_ibfk_1` FOREIGN KEY (`fkRecompense`) REFERENCES `récompense` (`idRecompense`),
  ADD CONSTRAINT `obtenir_ibfk_2` FOREIGN KEY (`fkAuteur`) REFERENCES `acteur` (`idActeur`);

--
-- Contraintes pour la table `produire`
--
ALTER TABLE `produire`
  ADD CONSTRAINT `produire_ibfk_1` FOREIGN KEY (`fkfilm`) REFERENCES `video` (`idvideo`),
  ADD CONSTRAINT `produire_ibfk_2` FOREIGN KEY (`fkproduct`) REFERENCES `production` (`idProduction`);

--
-- Contraintes pour la table `realisateurrecompense`
--
ALTER TABLE `realisateurrecompense`
  ADD CONSTRAINT `realisateurrecompense_ibfk_1` FOREIGN KEY (`fkRecompense`) REFERENCES `récompense` (`idRecompense`),
  ADD CONSTRAINT `realisateurrecompense_ibfk_2` FOREIGN KEY (`fkReal`) REFERENCES `realisateur` (`idReal`);

--
-- Contraintes pour la table `realise`
--
ALTER TABLE `realise`
  ADD CONSTRAINT `realise_ibfk_1` FOREIGN KEY (`fkReal`) REFERENCES `realisateur` (`idReal`),
  ADD CONSTRAINT `realise_ibfk_2` FOREIGN KEY (`fkVideo`) REFERENCES `video` (`idvideo`);

--
-- Contraintes pour la table `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `video_ibfk_1` FOREIGN KEY (`fkType`) REFERENCES `type` (`idType`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
