CREATE TABLE IF NOT EXISTS `piece` (
  `Typepiece` int(11) NOT NULL AUTO_INCREMENT,
  `LibPiece` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Typepiece`),
  UNIQUE KEY `LibPiece` (`LibPiece`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;