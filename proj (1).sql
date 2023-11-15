-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 15 nov. 2023 à 07:36
-- Version du serveur : 5.7.40
-- Version de PHP : 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `proj`
--

-- --------------------------------------------------------

--
-- Structure de la table `absensg`
--

DROP TABLE IF EXISTS `absensg`;
CREATE TABLE IF NOT EXISTS `absensg` (
  `NumAbs` int(11) NOT NULL AUTO_INCREMENT,
  `MatriculeProf` smallint(6) NOT NULL,
  `Session` int(11) NOT NULL,
  `DateAbs` datetime NOT NULL,
  `Seance` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Motif` char(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TypeSeance` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CodeClasse` char(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CodeMatiere` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Justifier` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`NumAbs`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `actionmembres`
--

DROP TABLE IF EXISTS `actionmembres`;
CREATE TABLE IF NOT EXISTS `actionmembres` (
  `NumAction` int(11) NOT NULL,
  `NumProf` smallint(6) NOT NULL,
  `DatePart` datetime NOT NULL,
  `Qualité` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Dpt` char(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Opt` char(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Niveau` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CodeMat` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remarque` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`NumAction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cellules`
--

DROP TABLE IF EXISTS `cellules`;
CREATE TABLE IF NOT EXISTS `cellules` (
  `NumProf` smallint(6) DEFAULT NULL,
  `NumMat` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NumCell` int(11) NOT NULL AUTO_INCREMENT,
  `NumSession` int(11) DEFAULT NULL,
  PRIMARY KEY (`NumCell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `CodClasse` char(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IntClasse` char(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Département` char(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OptionClasse` char(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Niveau` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IntClasseArabB` char(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OptionAaraB` char(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DepartementAaraB` char(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NiveauAaraB` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CodeEtape` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CodeSalima` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CodClasse`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `conges`
--

DROP TABLE IF EXISTS `conges`;
CREATE TABLE IF NOT EXISTS `conges` (
  `NumConge` int(11) NOT NULL AUTO_INCREMENT,
  `MatriculeProf` smallint(6) DEFAULT NULL,
  `DateDeb` datetime DEFAULT NULL,
  `DateFin` datetime DEFAULT NULL,
  PRIMARY KEY (`NumConge`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `dossieretud`
--

DROP TABLE IF EXISTS `dossieretud`;
CREATE TABLE IF NOT EXISTS `dossieretud` (
  `Ndossier` int(11) NOT NULL AUTO_INCREMENT,
  `Motif` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MatEtud` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TypePiece` int(11) DEFAULT NULL,
  `DatePiece` datetime DEFAULT NULL,
  `Session` int(11) DEFAULT NULL,
  `nomfichierpiece` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Ndossier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `heuresup`
--

DROP TABLE IF EXISTS `heuresup`;
CREATE TABLE IF NOT EXISTS `heuresup` (
  `Session` int(11) NOT NULL,
  `MatProf` smallint(6) NOT NULL,
  `CI` double DEFAULT NULL,
  `TP` double DEFAULT NULL,
  `Tot` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inscriptions`
--

DROP TABLE IF EXISTS `inscriptions`;
CREATE TABLE IF NOT EXISTS `inscriptions` (
  `CodeClasse` char(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MatEtud` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Session` int(11) NOT NULL,
  `DateInscription` datetime DEFAULT NULL,
  `DecisionConseil` char(12) COLLATE utf8mb4_unicode_ci DEFAULT '*****',
  `Rachat` bit(1) NOT NULL DEFAULT b'0',
  `MoyGen` double DEFAULT NULL,
  `Dispense` bit(1) NOT NULL DEFAULT b'0',
  `TauxAbsences` float DEFAULT NULL,
  `Redouble` bit(1) NOT NULL DEFAULT b'0',
  `StOuv` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StTech` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TypeInscrip` char(7) COLLATE utf8mb4_unicode_ci DEFAULT 'NR',
  `MontantIns` char(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NumIns` int(11) NOT NULL AUTO_INCREMENT,
  `Remarque` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sitfin` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Montant` decimal(18,0) DEFAULT NULL,
  `NoteSO` double DEFAULT NULL,
  `NoteST` double DEFAULT NULL,
  PRIMARY KEY (`NumIns`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jssd`
--

DROP TABLE IF EXISTS `jssd`;
CREATE TABLE IF NOT EXISTS `jssd` (
  `Jour` char(10) NOT NULL,
  `Séance` char(3) NOT NULL,
  `Salle` char(10) NOT NULL,
  `NDist` int(11) NOT NULL,
  `Groupe` char(3) NOT NULL,
  UNIQUE KEY `unique_combination` (`Jour`,`Séance`,`Salle`,`NDist`,`Groupe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `jssold`
--

DROP TABLE IF EXISTS `jssold`;
CREATE TABLE IF NOT EXISTS `jssold` (
  `Jour` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Séance` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Salle` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CodeClasse` char(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codeProf` smallint(6) DEFAULT NULL,
  `codeMatière` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TypeSéance` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Groupe` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Activité` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Session` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `CodeMatiere` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Sess` int(11) NOT NULL,
  `NomMatiere` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CoefMatiere` float DEFAULT NULL,
  `Departement` char(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Semestre` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OptionMatiere` char(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NbHeureCI` double DEFAULT NULL,
  `NbHeureTP` double DEFAULT NULL,
  `TypeLabo` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Bonus` double DEFAULT NULL,
  `Categories` char(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SousCategories` char(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DateDeb` datetime DEFAULT NULL,
  `DateFin` datetime DEFAULT NULL,
  `Session` int(11) NOT NULL,
  `Responsable` smallint(6) DEFAULT NULL,
  `C` double DEFAULT NULL,
  `TD` double DEFAULT NULL,
  PRIMARY KEY (`CodeMatiere`,`Sess`,`Session`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `matieres`
--

DROP TABLE IF EXISTS `matieres`;
CREATE TABLE IF NOT EXISTS `matieres` (
  `Code_Matière` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nom_Matière` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Coef_Matière` float DEFAULT NULL,
  `Département` char(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Semestre` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Option` char(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Nb Heure CI` double DEFAULT NULL,
  `Nb Heure TP` double DEFAULT NULL,
  `TypeLabo` char(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Bonus` double DEFAULT NULL,
  `Catégories` char(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SousCatégories` char(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DateDeb` datetime DEFAULT NULL,
  `DateFin` datetime DEFAULT NULL,
  PRIMARY KEY (`Code_Matière`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `membrecell`
--

DROP TABLE IF EXISTS `membrecell`;
CREATE TABLE IF NOT EXISTS `membrecell` (
  `NumCell` int(11) NOT NULL,
  `NumProf` smallint(6) NOT NULL,
  PRIMARY KEY (`NumCell`,`NumProf`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `modifgrade`
--

DROP TABLE IF EXISTS `modifgrade`;
CREATE TABLE IF NOT EXISTS `modifgrade` (
  `NGmodif` int(11) NOT NULL AUTO_INCREMENT,
  `Grade` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DateNomin` datetime DEFAULT NULL,
  `MatProf` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`NGmodif`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `piece`
--

DROP TABLE IF EXISTS `piece`;
CREATE TABLE IF NOT EXISTS `piece` (
  `Typepiece` int(11) NOT NULL AUTO_INCREMENT,
  `LibPiece` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Typepiece`),
  UNIQUE KEY `LibPiece` (`LibPiece`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `piece`
--

INSERT INTO `piece` (`Typepiece`, `LibPiece`) VALUES
(8, 'cin'),
(2, 'relevÃ© de note'),
(4, 'tp1'),
(5, 'td');

-- --------------------------------------------------------

--
-- Structure de la table `prof`
--

DROP TABLE IF EXISTS `prof`;
CREATE TABLE IF NOT EXISTS `prof` (
  `MatriculeProf` smallint(6) NOT NULL,
  `Nom` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Prenom` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CINouPasseport` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IdentifiantCNRPS` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DateDeNaissance` datetime DEFAULT NULL,
  `Nationalite` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sexe` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DateEntAdm` datetime DEFAULT NULL,
  `DateEntEtbs` datetime DEFAULT NULL,
  `Diplome` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Adresse` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ville` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CodePostal` smallint(6) DEFAULT NULL,
  `NumeroTelephone` char(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Grade` char(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DateNominationDansLeGrade` datetime DEFAULT NULL,
  `DateTitularisation` datetime DEFAULT NULL,
  `NumeroPoste` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Departement` char(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Situation` char(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Specialite` char(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NumeroDeCompte` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Banque` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Agence` char(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AdressePendantLesVacances` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TelephonePendantLesVacances` char(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LieuDeNaissance` char(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DebutDuContrat` datetime DEFAULT NULL,
  `FinDuContrat` datetime DEFAULT NULL,
  `TypeDeContrat` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NombreContratISETSOUSSE` tinyint(4) DEFAULT NULL,
  `NombreContratAutreEtb` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Bureau` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` char(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailInterne` char(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NomArabe` char(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PrenomArabe` char(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LieuNaissanceArabe` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AdresseArabe` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VilleArabe` char(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Disponible` char(10) COLLATE utf8mb4_unicode_ci DEFAULT 'oui',
  `SousSP` char(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EtbOrigine` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TypeEnseignement` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ControlAcces` char(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MatriculeProf`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `repartition`
--

DROP TABLE IF EXISTS `repartition`;
CREATE TABLE IF NOT EXISTS `repartition` (
  `Numdist` int(11) NOT NULL AUTO_INCREMENT,
  `NumSes` int(11) NOT NULL,
  `NSemDeb` int(11) NOT NULL,
  `NSemFin` int(11) NOT NULL,
  `TypeSeance` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NbGrp` double NOT NULL,
  `NBHDT` double DEFAULT NULL,
  `CodeClasse` char(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CodeProf` smallint(6) NOT NULL,
  `CodeMat` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NBHD` double NOT NULL,
  `TypeGest` char(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Numdist`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `NomSalle` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Departement` char(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Categorie` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Responsable` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Charge` tinyint(4) DEFAULT NULL,
  `NbPlaceExamen` tinyint(4) DEFAULT NULL,
  `NbLignes` tinyint(4) DEFAULT NULL,
  `NbCol` tinyint(4) DEFAULT NULL,
  `NbSurv` smallint(6) DEFAULT NULL,
  `Type` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `Disponible` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`NomSalle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
