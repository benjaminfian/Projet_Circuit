-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 10 mai 2019 à 18:48
-- Version du serveur :  5.7.17
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `dbcircuits`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

CREATE TABLE `activite` (
  `descriptionActivite` text COLLATE utf8_unicode_ci NOT NULL,
  `idJour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `activite`
--

INSERT INTO `activite` (`descriptionActivite`, `idJour`) VALUES
('activité circuit1 etape1 jour1', 1),
('activité circuit1 etape1 jour2', 2),
('activité circuit1 etape2 jour1', 3),
('activité circuit1 etape2 jour2', 4),
('activité circuit2 etape1 jour1', 5),
('activité circuit2 etape1 jour2', 6),
('activité circuit2 etape2 jour1', 7),
('activité circuit2 etape2 jour2', 8);

-- --------------------------------------------------------

--
-- Structure de la table `circuit`
--

CREATE TABLE `circuit` (
  `idCircuit` int(11) NOT NULL,
  `titreCircuit` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `descriptionCircuit` text COLLATE utf8_unicode_ci NOT NULL,
  `prixCircuit` double NOT NULL,
  `etat` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `circuit`
--

INSERT INTO `circuit` (`idCircuit`, `titreCircuit`, `descriptionCircuit`, `prixCircuit`, `etat`) VALUES
(1, 'test1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 10000, b'1'),
(2, 'test2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 20000, b'0'),
(3, 'test3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 30000, b'1');

-- --------------------------------------------------------

--
-- Structure de la table `circuit_etape`
--

CREATE TABLE `circuit_etape` (
  `idCircuit` int(11) NOT NULL,
  `idEtape` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `circuit_etape`
--

INSERT INTO `circuit_etape` (`idCircuit`, `idEtape`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `connexion`
--

CREATE TABLE `connexion` (
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pwd` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `statut` bit(1) NOT NULL DEFAULT b'1',
  `type` enum('M','P','A') COLLATE utf8_unicode_ci NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `detailscircuit`
--

CREATE TABLE `detailscircuit` (
  `idCircuit` int(11) NOT NULL,
  `dateDebutCircuit` date NOT NULL,
  `dateFinCircuit` date NOT NULL,
  `nbPlaceMin` int(11) NOT NULL,
  `nbPlaceMax` int(11) NOT NULL,
  `montantReservation` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `detailscircuit`
--

INSERT INTO `detailscircuit` (`idCircuit`, `dateDebutCircuit`, `dateFinCircuit`, `nbPlaceMin`, `nbPlaceMax`, `montantReservation`) VALUES
(1, '2019-06-01', '2019-06-30', 3, 10, 1000),
(2, '2019-07-01', '2019-07-31', 4, 20, 2000),
(3, '2019-08-01', '2019-08-31', 5, 30, 3000);

-- --------------------------------------------------------

--
-- Structure de la table `detailsreservation`
--

CREATE TABLE `detailsreservation` (
  `idReservation` int(11) NOT NULL,
  `nbAdulte` int(11) NOT NULL,
  `nbEnfant` int(11) NOT NULL,
  `nbBebe` int(11) NOT NULL,
  `nbChambre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `etape`
--

CREATE TABLE `etape` (
  `idEtape` int(11) NOT NULL,
  `titreEtape` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `descriptionEtape` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `etape`
--

INSERT INTO `etape` (`idEtape`, `titreEtape`, `descriptionEtape`) VALUES
(1, 'etape1Circuit1', 'blablabla'),
(2, 'etape2Circuit1', 'blablabla'),
(3, 'Etape1Circuit2', 'blablabla'),
(4, 'Etape2Circuit2', 'blablabla');

-- --------------------------------------------------------

--
-- Structure de la table `hebergement`
--

CREATE TABLE `hebergement` (
  `nomHebergement` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lienHebergement` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `idJour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Structure de la table `historique`
--

CREATE TABLE `historique` (
  `nom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `sexe` enum('M','F') COLLATE utf8_unicode_ci NOT NULL,
  `dateVoyage` date NOT NULL,
  `titreCircuit` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `montant` double NOT NULL,
  `nbParticipant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jour`
--

CREATE TABLE `jour` (
  `idJour` int(11) NOT NULL,
  `titreJour` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descriptionJour` text COLLATE utf8_unicode_ci,
  `idEtape` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `jour`
--

INSERT INTO `jour` (`idJour`, `titreJour`, `descriptionJour`, `idEtape`) VALUES
(1, 'Circuit1 Etape1 jour1', 'blablabla', 1),
(2, 'Circuit1 Etape1 jour2', 'blablabla', 1),
(3, 'Circuit1 etape2 jour1', 'blablabla', 2),
(4, 'Circuit1 etape2 jour2', 'blablabla', 2),
(5, 'Circuit2 etape1 jour1', 'blablabla', 3),
(6, 'circuit2 etape1 jour2', 'blablabla', 3),
(7, 'circuit2 etape2 jour1', 'blablabla', 4),
(8, 'circuit2 etape2 jour2', 'blablabla', 4);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `idMessage` int(11) NOT NULL,
  `titreMessage` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `texteMessage` text COLLATE utf8_unicode_ci NOT NULL,
  `dateMessage` datetime NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `idPaiement` int(11) NOT NULL,
  `datePaiement` date NOT NULL,
  `montantPaiement` double NOT NULL,
  `typePaiement` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `idReservation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `participant`
--

CREATE TABLE `participant` (
  `nom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `sexe` enum('M','F') COLLATE utf8_unicode_ci NOT NULL,
  `idReservation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pension`
--

CREATE TABLE `pension` (
  `nomPension` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lienPension` varchar(200) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `idJour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

CREATE TABLE `promotion` (
  `idPromotion` int(11) NOT NULL,
  `pourcentagePromotion` double NOT NULL,
  `titrePromotion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateDebutPromotion` datetime NOT NULL,
  `dateFinPromotion` datetime NOT NULL,
  `idCircuit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rabais`
--

CREATE TABLE `rabais` (
  `idRabais` int(11) NOT NULL,
  `montantRabais` double NOT NULL,
  `titreRabais` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateDebutRabais` datetime NOT NULL,
  `dateFinRabais` datetime NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `idReservation` int(11) NOT NULL,
  `montantTotal` double NOT NULL,
  `acompte` double DEFAULT NULL,
  `annulation` bit(1) NOT NULL DEFAULT b'0',
  `dateReservation` datetime NOT NULL,
  `idUser` int(11) NOT NULL,
  `idCircuit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tarif`
--

CREATE TABLE `tarif` (
  `idCircuit` int(11) NOT NULL,
  `prixBebe` double NOT NULL,
  `prixEnfant` double NOT NULL,
  `prixAdulte` double NOT NULL,
  `prixChambre` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `nomUser` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `prenomUser` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sexe` enum('M','F') CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `dateNaissance` date NOT NULL,
  `dateInscription` datetime NOT NULL,
  `panier` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activite`
--
ALTER TABLE `activite`
  ADD KEY `idJour` (`idJour`);

--
-- Index pour la table `circuit`
--
ALTER TABLE `circuit`
  ADD PRIMARY KEY (`idCircuit`);

--
-- Index pour la table `circuit_etape`
--
ALTER TABLE `circuit_etape`
  ADD KEY `idCircuit` (`idCircuit`),
  ADD KEY `idEtape` (`idEtape`);

--
-- Index pour la table `connexion`
--
ALTER TABLE `connexion`
  ADD PRIMARY KEY (`email`),
  ADD KEY `idUser` (`idUser`);

--
-- Index pour la table `detailscircuit`
--
ALTER TABLE `detailscircuit`
  ADD KEY `idCircuit` (`idCircuit`);

--
-- Index pour la table `detailsreservation`
--
ALTER TABLE `detailsreservation`
  ADD KEY `idReservation` (`idReservation`);

--
-- Index pour la table `etape`
--
ALTER TABLE `etape`
  ADD PRIMARY KEY (`idEtape`);

--
-- Index pour la table `hebergement`
--
ALTER TABLE `hebergement`
  ADD KEY `idJour` (`idJour`);

--
-- Index pour la table `jour`
--
ALTER TABLE `jour`
  ADD PRIMARY KEY (`idJour`),
  ADD KEY `idEtape` (`idEtape`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`idMessage`),
  ADD KEY `idUser` (`idUser`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`idPaiement`),
  ADD KEY `idReservation` (`idReservation`);

--
-- Index pour la table `participant`
--
ALTER TABLE `participant`
  ADD KEY `idReservation` (`idReservation`);

--
-- Index pour la table `pension`
--
ALTER TABLE `pension`
  ADD KEY `idJour` (`idJour`);

--
-- Index pour la table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`idPromotion`),
  ADD KEY `idCircuit` (`idCircuit`);

--
-- Index pour la table `rabais`
--
ALTER TABLE `rabais`
  ADD PRIMARY KEY (`idRabais`),
  ADD KEY `idUser` (`idUser`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`idReservation`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idCircuit` (`idCircuit`);

--
-- Index pour la table `tarif`
--
ALTER TABLE `tarif`
  ADD KEY `idCircuit` (`idCircuit`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `circuit`
--
ALTER TABLE `circuit`
  MODIFY `idCircuit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `etape`
--
ALTER TABLE `etape`
  MODIFY `idEtape` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `jour`
--
ALTER TABLE `jour`
  MODIFY `idJour` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `idMessage` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `idPromotion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `rabais`
--
ALTER TABLE `rabais`
  MODIFY `idRabais` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `idReservation` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `activite`
--
ALTER TABLE `activite`
  ADD CONSTRAINT `activite_ibfk_1` FOREIGN KEY (`idJour`) REFERENCES `jour` (`idJour`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `circuit_etape`
--
ALTER TABLE `circuit_etape`
  ADD CONSTRAINT `circuit_etape_ibfk_1` FOREIGN KEY (`idCircuit`) REFERENCES `circuit` (`idCircuit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `circuit_etape_ibfk_2` FOREIGN KEY (`idEtape`) REFERENCES `etape` (`idEtape`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `connexion`
--
ALTER TABLE `connexion`
  ADD CONSTRAINT `connexion_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `detailscircuit`
--
ALTER TABLE `detailscircuit`
  ADD CONSTRAINT `detailscircuit_ibfk_1` FOREIGN KEY (`idCircuit`) REFERENCES `circuit` (`idCircuit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `detailsreservation`
--
ALTER TABLE `detailsreservation`
  ADD CONSTRAINT `detailsreservation_ibfk_1` FOREIGN KEY (`idReservation`) REFERENCES `reservation` (`idReservation`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `hebergement`
--
ALTER TABLE `hebergement`
  ADD CONSTRAINT `hebergement_ibfk_1` FOREIGN KEY (`idJour`) REFERENCES `jour` (`idJour`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `jour`
--
ALTER TABLE `jour`
  ADD CONSTRAINT `jour_ibfk_1` FOREIGN KEY (`idEtape`) REFERENCES `etape` (`idEtape`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `paiement_ibfk_1` FOREIGN KEY (`idReservation`) REFERENCES `reservation` (`idReservation`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `participant_ibfk_1` FOREIGN KEY (`idReservation`) REFERENCES `reservation` (`idReservation`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `pension`
--
ALTER TABLE `pension`
  ADD CONSTRAINT `pension_ibfk_1` FOREIGN KEY (`idJour`) REFERENCES `jour` (`idJour`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `promotion`
--
ALTER TABLE `promotion`
  ADD CONSTRAINT `promotion_ibfk_1` FOREIGN KEY (`idCircuit`) REFERENCES `circuit` (`idCircuit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `rabais`
--
ALTER TABLE `rabais`
  ADD CONSTRAINT `rabais_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`idCircuit`) REFERENCES `circuit` (`idCircuit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tarif`
--
ALTER TABLE `tarif`
  ADD CONSTRAINT `tarif_ibfk_1` FOREIGN KEY (`idCircuit`) REFERENCES `circuit` (`idCircuit`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
