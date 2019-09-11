-- -------------------------------------------
SET AUTOCOMMIT=0;
START TRANSACTION;
SET SQL_QUOTE_SHOW_CREATE = 1;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- -------------------------------------------
-- -------------------------------------------
-- START BACKUP
-- -------------------------------------------
-- -------------------------------------------
-- TABLE `departments`
-- -------------------------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `position`
-- -------------------------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE IF NOT EXISTS `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iddepertment` int(11) NOT NULL,
  `jobTitle` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iddepertment` (`iddepertment`),
  CONSTRAINT `position_ibfk_2` FOREIGN KEY (`iddepertment`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `request`
-- -------------------------------------------
DROP TABLE IF EXISTS `request`;
CREATE TABLE IF NOT EXISTS `request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request` text NOT NULL,
  `phonenumber` varchar(15) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `requestdate` date NOT NULL,
  `responsedate` date DEFAULT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `response`
-- -------------------------------------------
DROP TABLE IF EXISTS `response`;
CREATE TABLE IF NOT EXISTS `response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idrequest` int(11) NOT NULL,
  `response` text NOT NULL,
  `response_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idrequest` (`idrequest`),
  CONSTRAINT `response_ibfk_1` FOREIGN KEY (`idrequest`) REFERENCES `request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `user`
-- -------------------------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` int(1) NOT NULL,
  `status` int(1) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `idposition` int(11) NOT NULL,
  `salt` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idposition` (`idposition`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`idposition`) REFERENCES `position` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `user_requests`
-- -------------------------------------------
DROP TABLE IF EXISTS `user_requests`;
CREATE TABLE IF NOT EXISTS `user_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `idrequest` int(11) NOT NULL,
  `receiveddate` date NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iduser` (`iduser`,`idrequest`),
  KEY `idrequest` (`idrequest`),
  CONSTRAINT `user_requests_ibfk_3` FOREIGN KEY (`idrequest`) REFERENCES `request` (`id`),
  CONSTRAINT `user_requests_ibfk_4` FOREIGN KEY (`iduser`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE DATA departments
-- -------------------------------------------
INSERT INTO `departments` (`id`,`department`) VALUES
('1','Imisoro');



-- -------------------------------------------
-- TABLE DATA position
-- -------------------------------------------
INSERT INTO `position` (`id`,`iddepertment`,`jobTitle`) VALUES
('1','1','Director Manager');
INSERT INTO `position` (`id`,`iddepertment`,`jobTitle`) VALUES
('2','1','Analyst');



-- -------------------------------------------
-- TABLE DATA request
-- -------------------------------------------
INSERT INTO `request` (`id`,`request`,`phonenumber`,`email`,`requestdate`,`responsedate`,`status`) VALUES
('1','ntabana','0788598445','cntabana@yahoo.fr','2015-07-30','2015-07-30','1');



-- -------------------------------------------
-- TABLE DATA user
-- -------------------------------------------
INSERT INTO `user` (`id`,`group`,`status`,`username`,`password`,`firstname`,`lastname`,`idposition`,`salt`) VALUES
('5','2','0','ntabana','7a85697262e3f2762bb7d2036361cd27','Ruddy','Aloys','1','5453b9f341b356.43939804');
INSERT INTO `user` (`id`,`group`,`status`,`username`,`password`,`firstname`,`lastname`,`idposition`,`salt`) VALUES
('6','0','0','komeza','6ecafb0fec609047eeefd440903fa576','Komeza9','Olivier','1','5421c3c6ea1430.40612653');
INSERT INTO `user` (`id`,`group`,`status`,`username`,`password`,`firstname`,`lastname`,`idposition`,`salt`) VALUES
('7','1','0','denyse','02da94b0259301f2eea4484ad59fe307','Uwamahoro','Denyse 4','2','54bd28aa4ad784.16243876');
INSERT INTO `user` (`id`,`group`,`status`,`username`,`password`,`firstname`,`lastname`,`idposition`,`salt`) VALUES
('8','1','0','cyusa','4eb68cc20bdeab46cb1a625df4aae289','Mucyowiraba','Leandre Cyusa','1','54228c8fde9c75.67291711');
INSERT INTO `user` (`id`,`group`,`status`,`username`,`password`,`firstname`,`lastname`,`idposition`,`salt`) VALUES
('9','1','1','chalvi','75310b6b5962c76f0557ac703f802db4','kamanzi','Peter','1','5453980fc097e7.03330510');



-- -------------------------------------------
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
COMMIT;
-- -------------------------------------------
-- -------------------------------------------
-- END BACKUP
-- -------------------------------------------
