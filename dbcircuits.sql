-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema yassine
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema yassine
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `yassine` DEFAULT CHARACTER SET latin1 ;
USE `yassine` ;

-- -----------------------------------------------------
-- Table `yassine`.`activite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yassine`.`activite` (
  `idActivite` INT(11) NOT NULL AUTO_INCREMENT,
  `titreActivite` VARCHAR(100) NOT NULL,
  `villeActivite` VARCHAR(100) NOT NULL,
  `descriptionActivite` TEXT NOT NULL,
  `idJour` INT(11) NOT NULL,
  PRIMARY KEY (`idActivite`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `yassine`.`circuit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yassine`.`circuit` (
  `idCircuit` INT(11) NOT NULL AUTO_INCREMENT,
  `titreCircuit` VARCHAR(100) NOT NULL,
  `descriptionCircuit` TEXT NOT NULL,
  `dateDebutCircuit` DATE NOT NULL,
  `dateFinCircuit` DATE NOT NULL,
  `prixCircuit` DOUBLE NOT NULL,
  `etat` BIT(1) NOT NULL DEFAULT b'0',
  `nbPlaceMin` INT(11) NOT NULL,
  `nbPlaceMax` INT(11) NOT NULL,
  `nbReservationMax` INT(11) NOT NULL,
  PRIMARY KEY (`idCircuit`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `yassine`.`etape`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yassine`.`etape` (
  `idEtape` INT(11) NOT NULL AUTO_INCREMENT,
  `titreEtape` VARCHAR(100) NOT NULL,
  `descriptionEtape` TEXT NOT NULL,
  `idCircuit` INT NOT NULL,
  PRIMARY KEY (`idEtape`),
  INDEX `circuit_idx` (`idCircuit` ASC) ,
  CONSTRAINT `circuit`
    FOREIGN KEY (`idCircuit`)
    REFERENCES `yassine`.`circuit` (`idCircuit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `yassine`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yassine`.`user` (
  `idUser` INT(11) NOT NULL AUTO_INCREMENT,
  `nomUser` VARCHAR(100) NOT NULL,
  `prenomUser` VARCHAR(100) NOT NULL,
  `sexe` CHAR(1) CHARACTER SET 'utf32' COLLATE 'utf32_unicode_ci' NOT NULL,
  `dateNaissance` DATE NOT NULL,
  `dateInscription` DATETIME NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `pwd` VARCHAR(100) NOT NULL,
  `statut` BIT(1) NOT NULL DEFAULT b'1',
  `type` ENUM('M', 'P', 'A') NOT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `yassine`.`historique`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yassine`.`historique` (
  `idUser` INT(11) NOT NULL,
  `idCircuit` INT(11) NOT NULL,
  `dateAchat` DATE NOT NULL,
  `prixAchat` DOUBLE NOT NULL,
  INDEX `idCircuit` (`idCircuit` ASC) ,
  INDEX `idUser` (`idUser` ASC) ,
  CONSTRAINT `historique_ibfk_1`
    FOREIGN KEY (`idCircuit`)
    REFERENCES `yassine`.`circuit` (`idCircuit`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `historique_ibfk_2`
    FOREIGN KEY (`idUser`)
    REFERENCES `yassine`.`user` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
ROW_FORMAT = COMPACT;


-- -----------------------------------------------------
-- Table `yassine`.`hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yassine`.`hotel` (
  `idHotel` INT(11) NOT NULL AUTO_INCREMENT,
  `nomHotel` VARCHAR(100) NOT NULL,
  `villeHotel` VARCHAR(100) NOT NULL,
  `lienHotel` VARCHAR(200) NOT NULL,
  `idJour` INT(11) NOT NULL,
  PRIMARY KEY (`idHotel`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `yassine`.`jour`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yassine`.`jour` (
  `idJour` INT(11) NOT NULL AUTO_INCREMENT,
  `titreJour` VARCHAR(100) NOT NULL,
  `descriptionJour` TEXT NOT NULL,
  `idEtape` INT(11) NOT NULL,
  PRIMARY KEY (`idJour`),
  INDEX `etape_idx` (`idEtape` ASC) ,
  CONSTRAINT `etape`
    FOREIGN KEY (`idEtape`)
    REFERENCES `yassine`.`etape` (`idEtape`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `yassine`.`message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yassine`.`message` (
  `idMessage` INT(11) NOT NULL AUTO_INCREMENT,
  `titreMessage` VARCHAR(100) CHARACTER SET 'utf32' COLLATE 'utf32_unicode_ci' NOT NULL,
  `texteMessage` TEXT NOT NULL,
  `idUser` INT(11) NOT NULL,
  PRIMARY KEY (`idMessage`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `yassine`.`promotion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yassine`.`promotion` (
  `idPromotion` INT(11) NOT NULL AUTO_INCREMENT,
  `pourcentage` DOUBLE NOT NULL,
  `titrePromotion` VARCHAR(100) NOT NULL,
  `dateDebutPromotion` DATETIME NOT NULL,
  `dateFinPromotion` DATETIME NOT NULL,
  `idCircuit` INT(11) NOT NULL,
  PRIMARY KEY (`idPromotion`),
  INDEX `circuit_idx` (`idCircuit` ASC) ,
  CONSTRAINT `circuit`
    FOREIGN KEY (`idCircuit`)
    REFERENCES `yassine`.`circuit` (`idCircuit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `yassine`.`reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yassine`.`reservation` (
  `idReservation` INT(11) NOT NULL AUTO_INCREMENT,
  `idUser` INT(11) NOT NULL,
  `idCircuit` INT(11) NOT NULL,
  `dateReservation` DATETIME NOT NULL,
  `depot` DOUBLE NOT NULL,
  PRIMARY KEY (`idReservation`),
  INDEX `user_idx` (`idUser` ASC) ,
  INDEX `circuit_idx` (`idCircuit` ASC) ,
  CONSTRAINT `user`
    FOREIGN KEY (`idUser`)
    REFERENCES `yassine`.`user` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `circuit`
    FOREIGN KEY (`idCircuit`)
    REFERENCES `yassine`.`circuit` (`idCircuit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `yassine`.`rabais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yassine`.`rabais` (
  `idRabais` INT(11) NOT NULL AUTO_INCREMENT,
  `montantRabais` DOUBLE NOT NULL,
  `titreRabais` VARCHAR(100) NOT NULL,
  `dateRabais` DATETIME NOT NULL,
  `idReservation` INT(11) NOT NULL,
  PRIMARY KEY (`idRabais`),
  INDEX `reservation_idx` (`idReservation` ASC) ,
  CONSTRAINT `reservation`
    FOREIGN KEY (`idReservation`)
    REFERENCES `yassine`.`reservation` (`idReservation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `yassine`.`restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yassine`.`restaurant` (
  `idResto` INT(11) NOT NULL AUTO_INCREMENT,
  `nomResto` VARCHAR(100) NOT NULL,
  `villeResto` VARCHAR(100) NOT NULL,
  `lienResto` VARCHAR(200) CHARACTER SET 'utf32' COLLATE 'utf32_unicode_ci' NOT NULL,
  `idJour` INT(11) NOT NULL,
  PRIMARY KEY (`idResto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
