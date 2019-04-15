-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 15 avr. 2019 à 20:55
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
  `descriptionActivite` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `circuit`
--

CREATE TABLE `circuit` (
  `idCircuit` int(11) NOT NULL,
  `titreCircuit` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `descriptionCircuit` text COLLATE utf8_unicode_ci NOT NULL,
  `dateDebutCircuit` date NOT NULL,
  `dateFinCircuit` date NOT NULL,
  `prixCircuit` double NOT NULL,
  `etat` tinyint(1) NOT NULL DEFAULT '0',
  `nbPlaceMin` int(11) NOT NULL,
  `nbPlaceMax` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `circuit_etape`
--

CREATE TABLE `circuit_etape` (
  `idCircuit_etape` int(11) NOT NULL,
  `idCircuit` int(11) NOT NULL,
  `idEtape` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `circuit_promotion`
--

CREATE TABLE `circuit_promotion` (
  `idCircuit_promotion` int(11) NOT NULL,
  `idCircuit` int(11) NOT NULL,
  `idPromotion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `connexion`
--

CREATE TABLE `connexion` (
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pwd` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `statut` tinyint(1) NOT NULL,
  `type` tinyint(3) NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Structure de la table `etape_jour`
--

CREATE TABLE `etape_jour` (
  `idEtape_jour` int(11) NOT NULL,
  `idEtape` int(11) NOT NULL,
  `idJour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `hotel`
--

CREATE TABLE `hotel` (
  `idHotel` int(11) NOT NULL,
  `nomHotel` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `villeHotel` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lienHotel` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `idimage` int(11) NOT NULL,
  `adresse` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `altText` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `image_activite`
--

CREATE TABLE `image_activite` (
  `idImage_activite` int(11) NOT NULL,
  `idImage` int(11) NOT NULL,
  `idActivite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `image_circuit`
--

CREATE TABLE `image_circuit` (
  `idImage_circuit` int(11) NOT NULL,
  `idImage` int(11) NOT NULL,
  `idCircuit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `image_etape`
--

CREATE TABLE `image_etape` (
  `idImage_etape` int(11) NOT NULL,
  `idImage` int(11) NOT NULL,
  `idEtape` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `image_hotel`
--

CREATE TABLE `image_hotel` (
  `idImage_hotel` int(11) NOT NULL,
  `idImage` int(11) NOT NULL,
  `idHotel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `image_jour`
--

CREATE TABLE `image_jour` (
  `idImage_jour` int(11) NOT NULL,
  `idImage` int(11) NOT NULL,
  `idJour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `image_promotion`
--

CREATE TABLE `image_promotion` (
  `idImage_promotion` int(11) NOT NULL,
  `idImage` int(11) NOT NULL,
  `idPromotion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `image_rabais`
--

CREATE TABLE `image_rabais` (
  `idImage_rabais` int(11) NOT NULL,
  `idImage` int(11) NOT NULL,
  `idRabais` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `image_restaurant`
--

CREATE TABLE `image_restaurant` (
  `idImage_restaurant` int(11) NOT NULL,
  `idImage` int(11) NOT NULL,
  `idResto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `image_user`
--

CREATE TABLE `image_user` (
  `idImage_user` int(11) NOT NULL,
  `idImage` int(11) NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jour`
--

CREATE TABLE `jour` (
  `idJour` int(11) NOT NULL,
  `titreJour` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `descriptionJour` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jour_activite`
--

CREATE TABLE `jour_activite` (
  `idJour_activite` int(11) NOT NULL,
  `idJour` int(11) NOT NULL,
  `idActivite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jour_hotel`
--

CREATE TABLE `jour_hotel` (
  `idJour_hotel` int(11) NOT NULL,
  `idJour` int(11) NOT NULL,
  `idHotel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jour_restaurant`
--

CREATE TABLE `jour_restaurant` (
  `idJour_restaurant` int(11) NOT NULL,
  `idJour` int(11) NOT NULL,
  `idResto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

CREATE TABLE `promotion` (
  `idpromotion` int(11) NOT NULL,
  `pourcentage` double NOT NULL,
  `titrePromotion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateDebutPromotion` datetime NOT NULL,
  `dateFinPromotion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rabais`
--

CREATE TABLE `rabais` (
  `idRabais` int(11) NOT NULL,
  `montantRabais` double NOT NULL,
  `titreRabais` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateRabais` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `restaurant`
--

CREATE TABLE `restaurant` (
  `idResto` int(11) NOT NULL,
  `nomResto` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `villeResto` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lienResto` varchar(200) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `nomUser` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `prenomUser` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sexe` char(1) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `dateNaissance` date NOT NULL,
  `dateInscription` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_circuit`
--

CREATE TABLE `user_circuit` (
  `iduser_circuit` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idCircuit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_rabais`
--

CREATE TABLE `user_rabais` (
  `idUser_rabais` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idRabais` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`idActivite`);

--
-- Index pour la table `circuit`
--
ALTER TABLE `circuit`
  ADD PRIMARY KEY (`idCircuit`);

--
-- Index pour la table `circuit_etape`
--
ALTER TABLE `circuit_etape`
  ADD PRIMARY KEY (`idCircuit_etape`),
  ADD KEY `idCircuit` (`idCircuit`),
  ADD KEY `idEtape` (`idEtape`);

--
-- Index pour la table `circuit_promotion`
--
ALTER TABLE `circuit_promotion`
  ADD PRIMARY KEY (`idCircuit_promotion`),
  ADD KEY `idCircuit` (`idCircuit`),
  ADD KEY `idPromotion` (`idPromotion`);

--
-- Index pour la table `connexion`
--
ALTER TABLE `connexion`
  ADD PRIMARY KEY (`email`),
  ADD KEY `idUser` (`idUser`);

--
-- Index pour la table `etape`
--
ALTER TABLE `etape`
  ADD PRIMARY KEY (`idEtape`);

--
-- Index pour la table `etape_jour`
--
ALTER TABLE `etape_jour`
  ADD PRIMARY KEY (`idEtape_jour`),
  ADD KEY `idEtape` (`idEtape`),
  ADD KEY `idJour` (`idJour`);

--
-- Index pour la table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`idHotel`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`idimage`);

--
-- Index pour la table `image_activite`
--
ALTER TABLE `image_activite`
  ADD PRIMARY KEY (`idImage_activite`),
  ADD KEY `idActivite` (`idActivite`),
  ADD KEY `idImage` (`idImage`);

--
-- Index pour la table `image_circuit`
--
ALTER TABLE `image_circuit`
  ADD PRIMARY KEY (`idImage_circuit`),
  ADD KEY `idCircuit` (`idCircuit`),
  ADD KEY `idImage` (`idImage`);

--
-- Index pour la table `image_etape`
--
ALTER TABLE `image_etape`
  ADD PRIMARY KEY (`idImage_etape`),
  ADD KEY `idEtape` (`idEtape`),
  ADD KEY `idImage` (`idImage`);

--
-- Index pour la table `image_hotel`
--
ALTER TABLE `image_hotel`
  ADD PRIMARY KEY (`idImage_hotel`),
  ADD KEY `idHotel` (`idHotel`),
  ADD KEY `idImage` (`idImage`);

--
-- Index pour la table `image_jour`
--
ALTER TABLE `image_jour`
  ADD PRIMARY KEY (`idImage_jour`),
  ADD KEY `idImage` (`idImage`),
  ADD KEY `idJour` (`idJour`);

--
-- Index pour la table `image_promotion`
--
ALTER TABLE `image_promotion`
  ADD PRIMARY KEY (`idImage_promotion`),
  ADD KEY `idImage` (`idImage`),
  ADD KEY `idPromotion` (`idPromotion`);

--
-- Index pour la table `image_rabais`
--
ALTER TABLE `image_rabais`
  ADD PRIMARY KEY (`idImage_rabais`),
  ADD KEY `idImage` (`idImage`),
  ADD KEY `idRabais` (`idRabais`);

--
-- Index pour la table `image_restaurant`
--
ALTER TABLE `image_restaurant`
  ADD PRIMARY KEY (`idImage_restaurant`),
  ADD KEY `idImage` (`idImage`),
  ADD KEY `idResto` (`idResto`);

--
-- Index pour la table `image_user`
--
ALTER TABLE `image_user`
  ADD PRIMARY KEY (`idImage_user`),
  ADD KEY `idImage` (`idImage`),
  ADD KEY `idUser` (`idUser`);

--
-- Index pour la table `jour`
--
ALTER TABLE `jour`
  ADD PRIMARY KEY (`idJour`);

--
-- Index pour la table `jour_activite`
--
ALTER TABLE `jour_activite`
  ADD PRIMARY KEY (`idJour_activite`),
  ADD KEY `idActivite` (`idActivite`),
  ADD KEY `idJour` (`idJour`);

--
-- Index pour la table `jour_hotel`
--
ALTER TABLE `jour_hotel`
  ADD PRIMARY KEY (`idJour_hotel`),
  ADD KEY `idHotel` (`idHotel`),
  ADD KEY `idJour` (`idJour`);

--
-- Index pour la table `jour_restaurant`
--
ALTER TABLE `jour_restaurant`
  ADD PRIMARY KEY (`idJour_restaurant`),
  ADD KEY `idJour` (`idJour`),
  ADD KEY `idResto` (`idResto`);

--
-- Index pour la table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`idpromotion`);

--
-- Index pour la table `rabais`
--
ALTER TABLE `rabais`
  ADD PRIMARY KEY (`idRabais`);

--
-- Index pour la table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`idResto`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- Index pour la table `user_circuit`
--
ALTER TABLE `user_circuit`
  ADD PRIMARY KEY (`iduser_circuit`),
  ADD KEY `idCircuit` (`idCircuit`),
  ADD KEY `idUser` (`idUser`);

--
-- Index pour la table `user_rabais`
--
ALTER TABLE `user_rabais`
  ADD PRIMARY KEY (`idUser_rabais`),
  ADD KEY `idRabais` (`idRabais`),
  ADD KEY `idUser` (`idUser`);

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
-- AUTO_INCREMENT pour la table `circuit_etape`
--
ALTER TABLE `circuit_etape`
  MODIFY `idCircuit_etape` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `circuit_promotion`
--
ALTER TABLE `circuit_promotion`
  MODIFY `idCircuit_promotion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `etape`
--
ALTER TABLE `etape`
  MODIFY `idEtape` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `etape_jour`
--
ALTER TABLE `etape_jour`
  MODIFY `idEtape_jour` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `idHotel` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `idimage` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `image_activite`
--
ALTER TABLE `image_activite`
  MODIFY `idImage_activite` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `image_circuit`
--
ALTER TABLE `image_circuit`
  MODIFY `idImage_circuit` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `image_etape`
--
ALTER TABLE `image_etape`
  MODIFY `idImage_etape` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `image_hotel`
--
ALTER TABLE `image_hotel`
  MODIFY `idImage_hotel` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `image_jour`
--
ALTER TABLE `image_jour`
  MODIFY `idImage_jour` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `image_promotion`
--
ALTER TABLE `image_promotion`
  MODIFY `idImage_promotion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `image_rabais`
--
ALTER TABLE `image_rabais`
  MODIFY `idImage_rabais` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `image_restaurant`
--
ALTER TABLE `image_restaurant`
  MODIFY `idImage_restaurant` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `image_user`
--
ALTER TABLE `image_user`
  MODIFY `idImage_user` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `jour`
--
ALTER TABLE `jour`
  MODIFY `idJour` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `jour_activite`
--
ALTER TABLE `jour_activite`
  MODIFY `idJour_activite` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `jour_hotel`
--
ALTER TABLE `jour_hotel`
  MODIFY `idJour_hotel` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `jour_restaurant`
--
ALTER TABLE `jour_restaurant`
  MODIFY `idJour_restaurant` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `idpromotion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `rabais`
--
ALTER TABLE `rabais`
  MODIFY `idRabais` int(11) NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT pour la table `user_circuit`
--
ALTER TABLE `user_circuit`
  MODIFY `iduser_circuit` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `user_rabais`
--
ALTER TABLE `user_rabais`
  MODIFY `idUser_rabais` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `circuit_etape`
--
ALTER TABLE `circuit_etape`
  ADD CONSTRAINT `circuit_etape_ibfk_1` FOREIGN KEY (`idCircuit`) REFERENCES `circuit` (`idCircuit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `circuit_etape_ibfk_2` FOREIGN KEY (`idEtape`) REFERENCES `etape` (`idEtape`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `circuit_promotion`
--
ALTER TABLE `circuit_promotion`
  ADD CONSTRAINT `circuit_promotion_ibfk_1` FOREIGN KEY (`idCircuit`) REFERENCES `circuit` (`idCircuit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `circuit_promotion_ibfk_2` FOREIGN KEY (`idPromotion`) REFERENCES `promotion` (`idpromotion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `connexion`
--
ALTER TABLE `connexion`
  ADD CONSTRAINT `connexion_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `etape_jour`
--
ALTER TABLE `etape_jour`
  ADD CONSTRAINT `etape_jour_ibfk_1` FOREIGN KEY (`idEtape`) REFERENCES `etape` (`idEtape`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `etape_jour_ibfk_2` FOREIGN KEY (`idJour`) REFERENCES `jour` (`idJour`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `image_activite`
--
ALTER TABLE `image_activite`
  ADD CONSTRAINT `image_activite_ibfk_1` FOREIGN KEY (`idActivite`) REFERENCES `activite` (`idActivite`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `image_activite_ibfk_2` FOREIGN KEY (`idImage`) REFERENCES `image` (`idimage`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `image_circuit`
--
ALTER TABLE `image_circuit`
  ADD CONSTRAINT `image_circuit_ibfk_1` FOREIGN KEY (`idCircuit`) REFERENCES `circuit` (`idCircuit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `image_circuit_ibfk_2` FOREIGN KEY (`idImage`) REFERENCES `image` (`idimage`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `image_etape`
--
ALTER TABLE `image_etape`
  ADD CONSTRAINT `image_etape_ibfk_1` FOREIGN KEY (`idEtape`) REFERENCES `etape` (`idEtape`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `image_etape_ibfk_2` FOREIGN KEY (`idImage`) REFERENCES `image` (`idimage`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `image_hotel`
--
ALTER TABLE `image_hotel`
  ADD CONSTRAINT `image_hotel_ibfk_1` FOREIGN KEY (`idHotel`) REFERENCES `hotel` (`idHotel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `image_hotel_ibfk_2` FOREIGN KEY (`idImage`) REFERENCES `image` (`idimage`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `image_jour`
--
ALTER TABLE `image_jour`
  ADD CONSTRAINT `image_jour_ibfk_1` FOREIGN KEY (`idImage`) REFERENCES `image` (`idimage`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `image_jour_ibfk_2` FOREIGN KEY (`idJour`) REFERENCES `jour` (`idJour`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `image_promotion`
--
ALTER TABLE `image_promotion`
  ADD CONSTRAINT `image_promotion_ibfk_1` FOREIGN KEY (`idImage`) REFERENCES `image` (`idimage`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `image_promotion_ibfk_2` FOREIGN KEY (`idPromotion`) REFERENCES `promotion` (`idpromotion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `image_rabais`
--
ALTER TABLE `image_rabais`
  ADD CONSTRAINT `image_rabais_ibfk_1` FOREIGN KEY (`idImage`) REFERENCES `image` (`idimage`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `image_rabais_ibfk_2` FOREIGN KEY (`idRabais`) REFERENCES `rabais` (`idRabais`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `image_restaurant`
--
ALTER TABLE `image_restaurant`
  ADD CONSTRAINT `image_restaurant_ibfk_1` FOREIGN KEY (`idImage`) REFERENCES `image` (`idimage`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `image_restaurant_ibfk_2` FOREIGN KEY (`idResto`) REFERENCES `restaurant` (`idResto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `image_user`
--
ALTER TABLE `image_user`
  ADD CONSTRAINT `image_user_ibfk_1` FOREIGN KEY (`idImage`) REFERENCES `image` (`idimage`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `image_user_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `jour_activite`
--
ALTER TABLE `jour_activite`
  ADD CONSTRAINT `jour_activite_ibfk_1` FOREIGN KEY (`idActivite`) REFERENCES `activite` (`idActivite`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jour_activite_ibfk_2` FOREIGN KEY (`idJour`) REFERENCES `jour` (`idJour`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `jour_hotel`
--
ALTER TABLE `jour_hotel`
  ADD CONSTRAINT `jour_hotel_ibfk_1` FOREIGN KEY (`idHotel`) REFERENCES `hotel` (`idHotel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jour_hotel_ibfk_2` FOREIGN KEY (`idJour`) REFERENCES `jour` (`idJour`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `jour_restaurant`
--
ALTER TABLE `jour_restaurant`
  ADD CONSTRAINT `jour_restaurant_ibfk_1` FOREIGN KEY (`idJour`) REFERENCES `jour` (`idJour`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jour_restaurant_ibfk_2` FOREIGN KEY (`idResto`) REFERENCES `restaurant` (`idResto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `user_circuit`
--
ALTER TABLE `user_circuit`
  ADD CONSTRAINT `user_circuit_ibfk_1` FOREIGN KEY (`idCircuit`) REFERENCES `circuit` (`idCircuit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_circuit_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `user_rabais`
--
ALTER TABLE `user_rabais`
  ADD CONSTRAINT `user_rabais_ibfk_1` FOREIGN KEY (`idRabais`) REFERENCES `rabais` (`idRabais`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_rabais_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
