-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  sam. 20 avr. 2019 à 21:10
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
  `idActivite` int(11) NOT NULL,
  `titreActivite` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `villeActivite` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `descriptionActivite` text COLLATE utf8_unicode_ci NOT NULL,
  `idJour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

-- --------------------------------------------------------

--
-- Structure de la table `circuit_etape`
--

CREATE TABLE `circuit_etape` (
  `idCircuit` int(11) NOT NULL,
  `idEtape` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `connexion`
--

CREATE TABLE `connexion` (
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pwd` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `statut` bit(1) NOT NULL DEFAULT b'1',
  `type` enum('M','P','A') COLLATE utf8_unicode_ci NOT NULL,
  `panier` text COLLATE utf8_unicode_ci,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `detailscircuit`
--

CREATE TABLE `detailscircuit` (
  `idCircuit` int(11) NOT NULL,
  `dateDebutcircuit` date NOT NULL,
  `dateFinCircuit` date NOT NULL,
  `nbPlaceMin` int(11) NOT NULL,
  `nbPlaceMax` int(11) NOT NULL,
  `montantReservation` double NOT NULL,
  `nbReservationMax` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

-- --------------------------------------------------------

--
-- Structure de la table `hotel`
--

CREATE TABLE `hotel` (
  `idHotel` int(11) NOT NULL,
  `nomHotel` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `villeHotel` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lienHotel` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `idJour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jour`
--

CREATE TABLE `jour` (
  `idJour` int(11) NOT NULL,
  `titreJour` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `descriptionJour` text COLLATE utf8_unicode_ci NOT NULL,
  `idEtape` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `idMessage` int(11) NOT NULL,
  `titreMessage` varchar(100) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
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
  `idParticipant` int(11) NOT NULL,
  `nom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `sexe` enum('M','F') COLLATE utf8_unicode_ci NOT NULL,
  `idReservation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Structure de la table `restaurant`
--

CREATE TABLE `restaurant` (
  `idResto` int(11) NOT NULL,
  `nomResto` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `villeResto` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lienResto` varchar(200) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `idJour` int(11) NOT NULL
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
  `dateInscription` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`idActivite`),
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
-- Index pour la table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`idHotel`),
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
  ADD PRIMARY KEY (`idParticipant`),
  ADD KEY `idReservation` (`idReservation`);

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
-- Index pour la table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`idResto`),
  ADD KEY `idJour` (`idJour`);

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
-- AUTO_INCREMENT pour la table `activite`
--
ALTER TABLE `activite`
  MODIFY `idActivite` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `circuit`
--
ALTER TABLE `circuit`
  MODIFY `idCircuit` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `etape`
--
ALTER TABLE `etape`
  MODIFY `idEtape` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `idHotel` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `jour`
--
ALTER TABLE `jour`
  MODIFY `idJour` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `idMessage` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `participant`
--
ALTER TABLE `participant`
  MODIFY `idParticipant` int(11) NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT pour la table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `idResto` int(11) NOT NULL AUTO_INCREMENT;
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
-- Contraintes pour la table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`idJour`) REFERENCES `jour` (`idJour`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Contraintes pour la table `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`idJour`) REFERENCES `jour` (`idJour`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tarif`
--
ALTER TABLE `tarif`
  ADD CONSTRAINT `tarif_ibfk_1` FOREIGN KEY (`idCircuit`) REFERENCES `circuit` (`idCircuit`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
