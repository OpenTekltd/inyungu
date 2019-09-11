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
-- TABLE `igu_agents`
-- -------------------------------------------
DROP TABLE IF EXISTS `igu_agents`;
CREATE TABLE IF NOT EXISTS `igu_agents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `telephone` int(20) NOT NULL,
  `iddistrict` int(11) NOT NULL,
  `sector` varchar(20) DEFAULT NULL,
  `identite` int(15) NOT NULL,
  `iduser` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iddistrict` (`iddistrict`),
  KEY `iduser` (`iduser`),
  CONSTRAINT `igu_agents_ibfk_2` FOREIGN KEY (`iddistrict`) REFERENCES `igu_district` (`id`),
  CONSTRAINT `igu_agents_ibfk_3` FOREIGN KEY (`iduser`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `igu_client_product`
-- -------------------------------------------
DROP TABLE IF EXISTS `igu_client_product`;
CREATE TABLE IF NOT EXISTS `igu_client_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idproduct` int(11) NOT NULL,
  `idclient` int(11) NOT NULL,
  `currentprice` int(11) NOT NULL,
  `creationdate` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `mesure` varchar(10) NOT NULL,
  `totalamount` int(11) NOT NULL,
  `detail` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idproduct` (`idproduct`,`idclient`),
  KEY `idclient` (`idclient`),
  CONSTRAINT `igu_client_product_ibfk_1` FOREIGN KEY (`idclient`) REFERENCES `igu_registration` (`id`),
  CONSTRAINT `igu_client_product_ibfk_2` FOREIGN KEY (`idproduct`) REFERENCES `igu_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `igu_companytype`
-- -------------------------------------------
DROP TABLE IF EXISTS `igu_companytype`;
CREATE TABLE IF NOT EXISTS `igu_companytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companytype` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companytype` (`companytype`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `igu_credit`
-- -------------------------------------------
DROP TABLE IF EXISTS `igu_credit`;
CREATE TABLE IF NOT EXISTS `igu_credit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cash` int(11) NOT NULL,
  `days` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cash` (`cash`),
  UNIQUE KEY `days` (`days`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `igu_district`
-- -------------------------------------------
DROP TABLE IF EXISTS `igu_district`;
CREATE TABLE IF NOT EXISTS `igu_district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `district` varchar(20) NOT NULL,
  `idprovince` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `district` (`district`),
  KEY `idprovince` (`idprovince`),
  CONSTRAINT `igu_district_ibfk_1` FOREIGN KEY (`idprovince`) REFERENCES `igu_province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `igu_historique_price`
-- -------------------------------------------
DROP TABLE IF EXISTS `igu_historique_price`;
CREATE TABLE IF NOT EXISTS `igu_historique_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idproduct` int(11) NOT NULL,
  `idclient` int(11) NOT NULL,
  `changedate` date NOT NULL,
  `oldprice` int(11) NOT NULL,
  `newprice` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idproduct` (`idproduct`,`idclient`),
  KEY `idclient` (`idclient`),
  CONSTRAINT `igu_historique_price_ibfk_1` FOREIGN KEY (`idclient`) REFERENCES `igu_registration` (`id`),
  CONSTRAINT `igu_historique_price_ibfk_2` FOREIGN KEY (`idproduct`) REFERENCES `igu_products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `igu_image_product`
-- -------------------------------------------
DROP TABLE IF EXISTS `igu_image_product`;
CREATE TABLE IF NOT EXISTS `igu_image_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `idclientproduct` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idclientproduct` (`idclientproduct`),
  CONSTRAINT `igu_image_product_ibfk_1` FOREIGN KEY (`idclientproduct`) REFERENCES `igu_client_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `igu_investment`
-- -------------------------------------------
DROP TABLE IF EXISTS `igu_investment`;
CREATE TABLE IF NOT EXISTS `igu_investment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idclient` int(11) NOT NULL,
  `idproduct` int(11) NOT NULL,
  `cashinvested` int(11) NOT NULL,
  `cashprofit` int(11) NOT NULL,
  `year` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idclient` (`idclient`,`idproduct`),
  CONSTRAINT `igu_investment_ibfk_1` FOREIGN KEY (`idclient`) REFERENCES `igu_registration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `igu_payment`
-- -------------------------------------------
DROP TABLE IF EXISTS `igu_payment`;
CREATE TABLE IF NOT EXISTS `igu_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idclient` int(11) NOT NULL,
  `datepaiement` date NOT NULL,
  `vouchernumber` varchar(12) NOT NULL,
  `validity` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idclient` (`idclient`),
  CONSTRAINT `igu_payment_ibfk_1` FOREIGN KEY (`idclient`) REFERENCES `igu_registration` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `igu_product_category`
-- -------------------------------------------
DROP TABLE IF EXISTS `igu_product_category`;
CREATE TABLE IF NOT EXISTS `igu_product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `igu_products`
-- -------------------------------------------
DROP TABLE IF EXISTS `igu_products`;
CREATE TABLE IF NOT EXISTS `igu_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idsouscategory` int(11) NOT NULL,
  `productname` varchar(30) NOT NULL,
  `image` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `productname` (`productname`),
  KEY `idsouscategory` (`idsouscategory`),
  CONSTRAINT `igu_products_ibfk_1` FOREIGN KEY (`idsouscategory`) REFERENCES `igu_sous_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `igu_province`
-- -------------------------------------------
DROP TABLE IF EXISTS `igu_province`;
CREATE TABLE IF NOT EXISTS `igu_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `province` (`province`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `igu_registration`
-- -------------------------------------------
DROP TABLE IF EXISTS `igu_registration`;
CREATE TABLE IF NOT EXISTS `igu_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `datedinscription` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `iddistrict` int(11) NOT NULL,
  `idumurenge` int(11) NOT NULL,
  `akagali` varchar(20) DEFAULT NULL,
  `umudugudu` varchar(20) DEFAULT NULL,
  `identite` varchar(16) NOT NULL,
  `idcompanytype` int(11) NOT NULL,
  `numberofmembers` int(5) NOT NULL DEFAULT '1',
  `nameofcooperative` varchar(50) NOT NULL,
  `iduser` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iduser` (`iduser`),
  KEY `idcompanytype` (`idcompanytype`),
  KEY `idumurenge` (`idumurenge`),
  KEY `iddistrict` (`iddistrict`),
  CONSTRAINT `igu_registration_ibfk_2` FOREIGN KEY (`iduser`) REFERENCES `user` (`id`),
  CONSTRAINT `igu_registration_ibfk_3` FOREIGN KEY (`idcompanytype`) REFERENCES `igu_companytype` (`id`),
  CONSTRAINT `igu_registration_ibfk_4` FOREIGN KEY (`idumurenge`) REFERENCES `imirenge` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `igu_sous_category`
-- -------------------------------------------
DROP TABLE IF EXISTS `igu_sous_category`;
CREATE TABLE IF NOT EXISTS `igu_sous_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subcategory` varchar(30) NOT NULL,
  `idcategory` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subcategory` (`subcategory`),
  KEY `idcategory` (`idcategory`),
  CONSTRAINT `igu_sous_category_ibfk_1` FOREIGN KEY (`idcategory`) REFERENCES `igu_product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `igu_voucher`
-- -------------------------------------------
DROP TABLE IF EXISTS `igu_voucher`;
CREATE TABLE IF NOT EXISTS `igu_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vouchernumber` varchar(12) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `idcredit` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vouchernumber` (`vouchernumber`),
  KEY `idcredit` (`idcredit`),
  CONSTRAINT `igu_voucher_ibfk_1` FOREIGN KEY (`idcredit`) REFERENCES `igu_credit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1025 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `igu_voucher_management`
-- -------------------------------------------
DROP TABLE IF EXISTS `igu_voucher_management`;
CREATE TABLE IF NOT EXISTS `igu_voucher_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idagent` int(11) NOT NULL,
  `idvoucher` int(11) NOT NULL,
  `useddate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `givendate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idagent` (`idagent`,`idvoucher`),
  KEY `idvoucher` (`idvoucher`),
  CONSTRAINT `igu_voucher_management_ibfk_1` FOREIGN KEY (`idvoucher`) REFERENCES `igu_voucher` (`id`),
  CONSTRAINT `igu_voucher_management_ibfk_2` FOREIGN KEY (`idagent`) REFERENCES `igu_agents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `imirenge`
-- -------------------------------------------
DROP TABLE IF EXISTS `imirenge`;
CREATE TABLE IF NOT EXISTS `imirenge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `umurenge` varchar(30) NOT NULL,
  `iddistrict` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iddistrict` (`iddistrict`),
  CONSTRAINT `imirenge_ibfk_1` FOREIGN KEY (`iddistrict`) REFERENCES `igu_district` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `pcounter_save`
-- -------------------------------------------
DROP TABLE IF EXISTS `pcounter_save`;
CREATE TABLE IF NOT EXISTS `pcounter_save` (
  `save_name` varchar(10) NOT NULL,
  `save_value` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `pcounter_users`
-- -------------------------------------------
DROP TABLE IF EXISTS `pcounter_users`;
CREATE TABLE IF NOT EXISTS `pcounter_users` (
  `user_ip` varchar(39) NOT NULL,
  `user_time` int(10) unsigned NOT NULL,
  UNIQUE KEY `user_ip` (`user_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `user`
-- -------------------------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `status` int(1) NOT NULL,
  `salt` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE DATA igu_client_product
-- -------------------------------------------
INSERT INTO `igu_client_product` (`id`,`idproduct`,`idclient`,`currentprice`,`creationdate`,`quantity`,`mesure`,`totalamount`,`detail`) VALUES
('1','41','1','400','2015-06-09','12','T','4800000','soya zange ni nziza ni toni 12 tuzazibazanira aho muri muzitwaye zose');
INSERT INTO `igu_client_product` (`id`,`idproduct`,`idclient`,`currentprice`,`creationdate`,`quantity`,`mesure`,`totalamount`,`detail`) VALUES
('2','43','3','4070','2015-06-15','1200','Kg','4884000','moringa yange ni nziza irumye');
INSERT INTO `igu_client_product` (`id`,`idproduct`,`idclient`,`currentprice`,`creationdate`,`quantity`,`mesure`,`totalamount`,`detail`) VALUES
('4','47','5','13000','2015-06-16','10000000','T','2147483647','dufite umucanga mwiza wa Kayumbu qualite ya mbere, tuwubagereza ikigali kuri chantier yanyu, twifashishije imodoka zacu nini. imwe itwara 16M3 .  tukawubagurisha 13000Frws / M3 wageze kuri chantier yanyu mu mujyi wa kigali . ');
INSERT INTO `igu_client_product` (`id`,`idproduct`,`idclient`,`currentprice`,`creationdate`,`quantity`,`mesure`,`totalamount`,`detail`) VALUES
('5','46','5','10000','2015-06-16','10000000','T','2147483647','laterite biterwa naho ijya kumenwa mumujyi wa kigali 
ariko igiciro fatizo twayikugereje kuri chantier ni 9000/ m3
');
INSERT INTO `igu_client_product` (`id`,`idproduct`,`idclient`,`currentprice`,`creationdate`,`quantity`,`mesure`,`totalamount`,`detail`) VALUES
('6','44','5','13500','2015-06-16','10000000','T','2147483647','tubafitiye amabuye meza, tubagereza kuri chantier bitewe ningano mukeneye, 
biterwa kandi naho ajyanwa , ariko igiciro fatizo ni 13500/m3 ');
INSERT INTO `igu_client_product` (`id`,`idproduct`,`idclient`,`currentprice`,`creationdate`,`quantity`,`mesure`,`totalamount`,`detail`) VALUES
('7','48','8','1350','2015-07-27','6','T','8100000','Urusenda rutukura rutoya rwumishijwe.');
INSERT INTO `igu_client_product` (`id`,`idproduct`,`idclient`,`currentprice`,`creationdate`,`quantity`,`mesure`,`totalamount`,`detail`) VALUES
('8','48','9','1350','2015-07-27','6','T','8100000','Urusenda rutukura rutoya rwumishijwe.');
INSERT INTO `igu_client_product` (`id`,`idproduct`,`idclient`,`currentprice`,`creationdate`,`quantity`,`mesure`,`totalamount`,`detail`) VALUES
('9','48','11','1350','2015-07-27','6','T','8100000','Urusenda rutukura rutoya rwumishijwe.');
INSERT INTO `igu_client_product` (`id`,`idproduct`,`idclient`,`currentprice`,`creationdate`,`quantity`,`mesure`,`totalamount`,`detail`) VALUES
('10','48','10','1350','2015-07-27','6','T','8100000','Urusenda rutukura rutoya rwumishijwe.');
INSERT INTO `igu_client_product` (`id`,`idproduct`,`idclient`,`currentprice`,`creationdate`,`quantity`,`mesure`,`totalamount`,`detail`) VALUES
('11','44','14','45000','2015-08-03','4000','T','36000000','abakeneye amabuye  n\'imicanga yo kubakisha mu Karere ka Gisagara Na HUYE nabibaha');
INSERT INTO `igu_client_product` (`id`,`idproduct`,`idclient`,`currentprice`,`creationdate`,`quantity`,`mesure`,`totalamount`,`detail`) VALUES
('12','5','15','20','2015-08-26','1200','Kg','240000','amasaka yange ni mezxa');
INSERT INTO `igu_client_product` (`id`,`idproduct`,`idclient`,`currentprice`,`creationdate`,`quantity`,`mesure`,`totalamount`,`detail`) VALUES
('13','25','18','250','2016-05-27','2000','Kg','500000','amashu yacu nibwo agisarurwa');



-- -------------------------------------------
-- TABLE DATA igu_companytype
-- -------------------------------------------
INSERT INTO `igu_companytype` (`id`,`companytype`) VALUES
('3','Company');
INSERT INTO `igu_companytype` (`id`,`companytype`) VALUES
('2','Cooperative');
INSERT INTO `igu_companytype` (`id`,`companytype`) VALUES
('1','personal');



-- -------------------------------------------
-- TABLE DATA igu_credit
-- -------------------------------------------
INSERT INTO `igu_credit` (`id`,`cash`,`days`) VALUES
('1','0','120');



-- -------------------------------------------
-- TABLE DATA igu_district
-- -------------------------------------------
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('1','Burera','1');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('2','Musanze','1');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('3','Rubavu','5');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('4','Rwamagana','3');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('5','Huye','2');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('8','Nyamagabe','2');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('11','Kayonza','3');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('13','Muhanga','2');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('15','Kicukiro','6');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('17','Nyarugenge','6');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('18','Gasabo','6');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('19','Nyanza','2');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('20','Gakenke','1');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('21','Rulindo','1');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('22','Bugesera','3');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('23','Nyagatare','3');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('24','Ngoma','3');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('25','Kirehe','3');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('26','Gatsibo','3');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('27','Gisagara','2');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('28','Kamonyi','2');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('29','Nyaruguru','2');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('30','Ruhango','2');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('31','Karongi','5');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('32','Ngororero','5');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('33','Nyabihu','5');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('34','Nyamasheke','5');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('35','Rusizi','5');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('36','Rutsiro','5');
INSERT INTO `igu_district` (`id`,`district`,`idprovince`) VALUES
('37','Gicumbi','1');



-- -------------------------------------------
-- TABLE DATA igu_image_product
-- -------------------------------------------
INSERT INTO `igu_image_product` (`id`,`image`,`idclientproduct`) VALUES
('33','default.jpg','1');
INSERT INTO `igu_image_product` (`id`,`image`,`idclientproduct`) VALUES
('34','default.jpg','2');
INSERT INTO `igu_image_product` (`id`,`image`,`idclientproduct`) VALUES
('36','4238272-3437_395852787160450_1185761997_n.jpg','4');
INSERT INTO `igu_image_product` (`id`,`image`,`idclientproduct`) VALUES
('37','338209908-387828_209044492507948_725585026_n.jpg','4');
INSERT INTO `igu_image_product` (`id`,`image`,`idclientproduct`) VALUES
('38','default.jpg','7');
INSERT INTO `igu_image_product` (`id`,`image`,`idclientproduct`) VALUES
('39','default.jpg','8');
INSERT INTO `igu_image_product` (`id`,`image`,`idclientproduct`) VALUES
('40','default.jpg','9');
INSERT INTO `igu_image_product` (`id`,`image`,`idclientproduct`) VALUES
('41','default.jpg','10');
INSERT INTO `igu_image_product` (`id`,`image`,`idclientproduct`) VALUES
('42','default.jpg','11');
INSERT INTO `igu_image_product` (`id`,`image`,`idclientproduct`) VALUES
('43','default.jpg','12');
INSERT INTO `igu_image_product` (`id`,`image`,`idclientproduct`) VALUES
('44','55597835-images.jpg','13');



-- -------------------------------------------
-- TABLE DATA igu_payment
-- -------------------------------------------
INSERT INTO `igu_payment` (`id`,`idclient`,`datepaiement`,`vouchernumber`,`validity`) VALUES
('1','1','2015-06-09','710837886760','0');
INSERT INTO `igu_payment` (`id`,`idclient`,`datepaiement`,`vouchernumber`,`validity`) VALUES
('2','3','2015-06-09','167304876467','0');
INSERT INTO `igu_payment` (`id`,`idclient`,`datepaiement`,`vouchernumber`,`validity`) VALUES
('3','4','2015-06-16','695528630805','0');
INSERT INTO `igu_payment` (`id`,`idclient`,`datepaiement`,`vouchernumber`,`validity`) VALUES
('4','5','2015-06-16','171072735251','0');
INSERT INTO `igu_payment` (`id`,`idclient`,`datepaiement`,`vouchernumber`,`validity`) VALUES
('5','6','2015-06-17','898273871318','0');
INSERT INTO `igu_payment` (`id`,`idclient`,`datepaiement`,`vouchernumber`,`validity`) VALUES
('6','8','2015-06-30','530657428780','0');
INSERT INTO `igu_payment` (`id`,`idclient`,`datepaiement`,`vouchernumber`,`validity`) VALUES
('7','9','2015-06-30','331099688981','0');
INSERT INTO `igu_payment` (`id`,`idclient`,`datepaiement`,`vouchernumber`,`validity`) VALUES
('8','10','2015-06-30','578820246068','0');
INSERT INTO `igu_payment` (`id`,`idclient`,`datepaiement`,`vouchernumber`,`validity`) VALUES
('9','11','2015-06-30','873506130603','0');
INSERT INTO `igu_payment` (`id`,`idclient`,`datepaiement`,`vouchernumber`,`validity`) VALUES
('10','12','2015-07-02','566227996766','0');
INSERT INTO `igu_payment` (`id`,`idclient`,`datepaiement`,`vouchernumber`,`validity`) VALUES
('11','14','2015-08-03','203582512223','0');
INSERT INTO `igu_payment` (`id`,`idclient`,`datepaiement`,`vouchernumber`,`validity`) VALUES
('12','15','2015-08-26','715001898185','0');
INSERT INTO `igu_payment` (`id`,`idclient`,`datepaiement`,`vouchernumber`,`validity`) VALUES
('13','18','2016-05-27','453257304743','0');



-- -------------------------------------------
-- TABLE DATA igu_product_category
-- -------------------------------------------
INSERT INTO `igu_product_category` (`id`,`category`) VALUES
('2','Amatungo');
INSERT INTO `igu_product_category` (`id`,`category`) VALUES
('1','Ibihingwa');
INSERT INTO `igu_product_category` (`id`,`category`) VALUES
('3','Ibindi');



-- -------------------------------------------
-- TABLE DATA igu_products
-- -------------------------------------------
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('2','11','Icyayi','8.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('3','11','Ikawa','9.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('5','10','Amasaka','11.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('6','4','Ihene','12.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('7','6','Inkoko','13.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('8','5','Inka','14.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('9','4','Intama','15.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('10','4','Ingurube','16.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('11','4','Inkwavu','17.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('12','4','Imbeba','18.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('13','6','Inzuki','38.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('14','8','Inanasi','39.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('15','8','Icunga','40.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('16','8','Ibinyomoro','19.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('17','8','Imineke','20.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('18','8','Indimu','7.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('19','8','Imyembe','29.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('20','8','Marakuja','30.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('21','8','Avoka','31.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('22','11','Ibireti','32.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('23','9','Ibitunguru','6.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('24','9','Karoti','33.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('25','9','Amashu','34.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('26','9','Epinari','35.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('27','9','Imiteja','36jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('28','9','Puwavuro','37.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('29','9','Itomati','22.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('30','9','Ibihumyo','21.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('31','10','Umuceli','42.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('32','10','Ibigori','23.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('33','10','Ingano','28.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('34','10','Ibirayi','24.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('35','10','Imyumbati','25.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('36','10','Ibijumba','26.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('37','10','Amateke','27.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('38','10','Igitoki','41.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('39','10','Amashaza','5.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('40','10','Ibishyimbo','4.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('41','10','Soya','3.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('42','10','Ubunyobwa','2.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('43','11','Moringa','6709-images.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('44','12','amabuye','64578-amabuye.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('45','14','gravier','44213-gravier.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('46','15','laterite','19135-laterite_ibitaka.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('47','13','umucanga','14319-umucanga.jpg');
INSERT INTO `igu_products` (`id`,`idsouscategory`,`productname`,`image`) VALUES
('48','8','Urusenda','91206-chili.jpg');



-- -------------------------------------------
-- TABLE DATA igu_province
-- -------------------------------------------
INSERT INTO `igu_province` (`id`,`province`) VALUES
('1','Intara y\'Amajyaruguru');
INSERT INTO `igu_province` (`id`,`province`) VALUES
('2','Intara y\'Amajyepfo');
INSERT INTO `igu_province` (`id`,`province`) VALUES
('3','Intara y\'Iburasirazu');
INSERT INTO `igu_province` (`id`,`province`) VALUES
('5','Intara y’Iburengerazuba');
INSERT INTO `igu_province` (`id`,`province`) VALUES
('6','Umujyi wa Kigali');



-- -------------------------------------------
-- TABLE DATA igu_registration
-- -------------------------------------------
INSERT INTO `igu_registration` (`id`,`firstname`,`lastname`,`telephone`,`datedinscription`,`email`,`iddistrict`,`idumurenge`,`akagali`,`umudugudu`,`identite`,`idcompanytype`,`numberofmembers`,`nameofcooperative`,`iduser`) VALUES
('1','sebudurugu','Elias','0784412427','2015-06-08','thierry1love@yahoo.com','35','279','nyamikana','Rusizi','1196780023983081','2','8','Bugarama','43');
INSERT INTO `igu_registration` (`id`,`firstname`,`lastname`,`telephone`,`datedinscription`,`email`,`iddistrict`,`idumurenge`,`akagali`,`umudugudu`,`identite`,`idcompanytype`,`numberofmembers`,`nameofcooperative`,`iduser`) VALUES
('2','Nyirabugingo','kurusumu','0785384349','2015-06-08','thierry1love@yahoo.com','35','279','pera','Rusizi','1197470037170088','1','2','Bugarama','44');
INSERT INTO `igu_registration` (`id`,`firstname`,`lastname`,`telephone`,`datedinscription`,`email`,`iddistrict`,`idumurenge`,`akagali`,`umudugudu`,`identite`,`idcompanytype`,`numberofmembers`,`nameofcooperative`,`iduser`) VALUES
('3','sifa','justin','0788533567','2015-06-09','umupfasoni@gmail.com','18','142','nyabisindu','rugarama','1197470008060028','3','1','umucuruzi','45');
INSERT INTO `igu_registration` (`id`,`firstname`,`lastname`,`telephone`,`datedinscription`,`email`,`iddistrict`,`idumurenge`,`akagali`,`umudugudu`,`identite`,`idcompanytype`,`numberofmembers`,`nameofcooperative`,`iduser`) VALUES
('4','sharon','sharon','0788543310','2015-06-16','udenyse@gmail.com','18','140','dghdhgdh','jfcjhfjhdgdh','1198470023308177','1','1','sharon','46');
INSERT INTO `igu_registration` (`id`,`firstname`,`lastname`,`telephone`,`datedinscription`,`email`,`iddistrict`,`idumurenge`,`akagali`,`umudugudu`,`identite`,`idcompanytype`,`numberofmembers`,`nameofcooperative`,`iduser`) VALUES
('5','MUGABO','Maurice','0785390426','2015-06-16','mauriceblessed@live.com','17','173','Nyabugogo','Umutekano','1199480021901026','1','2','nyabugogo','47');
INSERT INTO `igu_registration` (`id`,`firstname`,`lastname`,`telephone`,`datedinscription`,`email`,`iddistrict`,`idumurenge`,`akagali`,`umudugudu`,`identite`,`idcompanytype`,`numberofmembers`,`nameofcooperative`,`iduser`) VALUES
('6','Murenzi ','Donatien','0788300759','2015-06-17','murenzisupplycompany@yahoo.fr','15','147','','','1196280002637075','3','15','Industrial Park-Gikondo','48');
INSERT INTO `igu_registration` (`id`,`firstname`,`lastname`,`telephone`,`datedinscription`,`email`,`iddistrict`,`idumurenge`,`akagali`,`umudugudu`,`identite`,`idcompanytype`,`numberofmembers`,`nameofcooperative`,`iduser`) VALUES
('7','NIYOTWAGIRA','FRANCOIS','+250788354220','2015-06-26','olivercompanyltd@gmail.com','17','175','MUMENA','-','1197280079337071','3','4','OLIVER COMPANY LTD','62');
INSERT INTO `igu_registration` (`id`,`firstname`,`lastname`,`telephone`,`datedinscription`,`email`,`iddistrict`,`idumurenge`,`akagali`,`umudugudu`,`identite`,`idcompanytype`,`numberofmembers`,`nameofcooperative`,`iduser`) VALUES
('8','Vestine','ayinkamiye','0781275312','2015-06-30','aee@rwanda1.com','22','2','','','1198770134742035','2','140','ABADAHEMUKA','59');
INSERT INTO `igu_registration` (`id`,`firstname`,`lastname`,`telephone`,`datedinscription`,`email`,`iddistrict`,`idumurenge`,`akagali`,`umudugudu`,`identite`,`idcompanytype`,`numberofmembers`,`nameofcooperative`,`iduser`) VALUES
('9','Michel','Rukundo','0781132886','2015-06-30','aee@rwanda1.com','22','1','','','1199480035167015','2','120','DUHAGURUKE','61');
INSERT INTO `igu_registration` (`id`,`firstname`,`lastname`,`telephone`,`datedinscription`,`email`,`iddistrict`,`idumurenge`,`akagali`,`umudugudu`,`identite`,`idcompanytype`,`numberofmembers`,`nameofcooperative`,`iduser`) VALUES
('10','Ramnath','Bysani','0784697851','2015-06-30','ramanthgb@gmail.com','23','94','','','1199080003339205','3','10','Nyagatare Agro-venture Rwanda','58');
INSERT INTO `igu_registration` (`id`,`firstname`,`lastname`,`telephone`,`datedinscription`,`email`,`iddistrict`,`idumurenge`,`akagali`,`umudugudu`,`identite`,`idcompanytype`,`numberofmembers`,`nameofcooperative`,`iduser`) VALUES
('11','Francois','Nshimirimana','0783256520','2015-06-30','aee@rwanda1.com','22','12','','','1199480037002043','2','140','ABAHUJIMBARAGA','60');
INSERT INTO `igu_registration` (`id`,`firstname`,`lastname`,`telephone`,`datedinscription`,`email`,`iddistrict`,`idumurenge`,`akagali`,`umudugudu`,`identite`,`idcompanytype`,`numberofmembers`,`nameofcooperative`,`iduser`) VALUES
('12','NDABUNGUYE','BERNARD','250783021745','2015-07-02','ndbernard@gmail.com','15','146','NYANZA','SABAGANGA','1198380015362085','1','4','KIGALI','50');
INSERT INTO `igu_registration` (`id`,`firstname`,`lastname`,`telephone`,`datedinscription`,`email`,`iddistrict`,`idumurenge`,`akagali`,`umudugudu`,`identite`,`idcompanytype`,`numberofmembers`,`nameofcooperative`,`iduser`) VALUES
('13','uwimana','SAlama','0788229653','2015-07-24','uwimasala@gmail.com','17','175','Nyarugenge','Buhoro','1198270007726037','1','1','ntaho','68');
INSERT INTO `igu_registration` (`id`,`firstname`,`lastname`,`telephone`,`datedinscription`,`email`,`iddistrict`,`idumurenge`,`akagali`,`umudugudu`,`identite`,`idcompanytype`,`numberofmembers`,`nameofcooperative`,`iduser`) VALUES
('14','Tuginama','J.Bosco','0784104558','2015-08-03','habarubern@yahoo.fr','27','311','Gasagara','Remera','1197980041747087','1','12','Gisagara','67');
INSERT INTO `igu_registration` (`id`,`firstname`,`lastname`,`telephone`,`datedinscription`,`email`,`iddistrict`,`idumurenge`,`akagali`,`umudugudu`,`identite`,`idcompanytype`,`numberofmembers`,`nameofcooperative`,`iduser`) VALUES
('15','uwamahoro','denyse','0788543310','2015-08-26','udenyse@yahoo.fr','15','144','gahanga','gahanga','1198470023308177','3','10','cyuda','73');
INSERT INTO `igu_registration` (`id`,`firstname`,`lastname`,`telephone`,`datedinscription`,`email`,`iddistrict`,`idumurenge`,`akagali`,`umudugudu`,`identite`,`idcompanytype`,`numberofmembers`,`nameofcooperative`,`iduser`) VALUES
('16','kayitare','kalisa','07886765758','2015-09-23','udenyse@gmail.com','22','1','gsdkjadak','jaskgakjfajk','1198470023308177','1','1','arikorera','74');
INSERT INTO `igu_registration` (`id`,`firstname`,`lastname`,`telephone`,`datedinscription`,`email`,`iddistrict`,`idumurenge`,`akagali`,`umudugudu`,`identite`,`idcompanytype`,`numberofmembers`,`nameofcooperative`,`iduser`) VALUES
('17','Emmanuel','Ruvurajabo','+250788496960','2015-10-07','ruvurajabo@gmail.com','18','142','ifiyfiifyiffjyfk','kufhjfhudfyudc','1198470023308177','3','1','zilionizer','76');
INSERT INTO `igu_registration` (`id`,`firstname`,`lastname`,`telephone`,`datedinscription`,`email`,`iddistrict`,`idumurenge`,`akagali`,`umudugudu`,`identite`,`idcompanytype`,`numberofmembers`,`nameofcooperative`,`iduser`) VALUES
('18','Sebigori','Kalim','07881245011','2016-05-27','kalim@gmail.com','2','252','gorora','hitamo','1199180002477128','1','2','umuhinzi ','79');



-- -------------------------------------------
-- TABLE DATA igu_sous_category
-- -------------------------------------------
INSERT INTO `igu_sous_category` (`id`,`subcategory`,`idcategory`) VALUES
('4','Amatungo magufi','2');
INSERT INTO `igu_sous_category` (`id`,`subcategory`,`idcategory`) VALUES
('5','Amatungo maremare','2');
INSERT INTO `igu_sous_category` (`id`,`subcategory`,`idcategory`) VALUES
('6','Ibiguruka','2');
INSERT INTO `igu_sous_category` (`id`,`subcategory`,`idcategory`) VALUES
('7','Amafi','2');
INSERT INTO `igu_sous_category` (`id`,`subcategory`,`idcategory`) VALUES
('8','Imbuto','1');
INSERT INTO `igu_sous_category` (`id`,`subcategory`,`idcategory`) VALUES
('9','Imboga','1');
INSERT INTO `igu_sous_category` (`id`,`subcategory`,`idcategory`) VALUES
('10','Ibihingwa ngandurarugo','1');
INSERT INTO `igu_sous_category` (`id`,`subcategory`,`idcategory`) VALUES
('11','Ibihingwa ngengabukungu','1');
INSERT INTO `igu_sous_category` (`id`,`subcategory`,`idcategory`) VALUES
('12','amabuye','3');
INSERT INTO `igu_sous_category` (`id`,`subcategory`,`idcategory`) VALUES
('13','umucanga','3');
INSERT INTO `igu_sous_category` (`id`,`subcategory`,`idcategory`) VALUES
('14','gravier','3');
INSERT INTO `igu_sous_category` (`id`,`subcategory`,`idcategory`) VALUES
('15','laterite(ibitaka)','3');



-- -------------------------------------------
-- TABLE DATA igu_voucher
-- -------------------------------------------
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1','167304876467','2','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('2','695528630805','2','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('3','530657428780','2','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('4','331099688981','2','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('5','171072735251','2','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('6','578820246068','2','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('7','873506130603','2','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('8','203582512223','2','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('9','898273871318','2','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('10','453257304743','2','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('11','710837886760','2','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('12','250934742420','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('13','566227996766','2','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('14','508344204448','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('15','348957393738','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('16','103302398283','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('17','688850714048','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('18','359010816069','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('19','737194825457','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('20','124580709094','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('21','672307014742','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('22','519301558189','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('23','531165637571','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('24','448138471818','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('25','287346230607','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('26','279458439899','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('27','396403503336','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('28','978737281718','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('29','122920154042','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('30','324389121914','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('31','509533635359','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('32','345298809895','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('33','652703703332','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('34','273420859093','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('35','480936238680','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('36','724734622424','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('37','724534761414','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('38','742218249892','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('39','847994705457','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('40','437764313437','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('41','715001898185','2','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('42','936279433936','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('43','374873172324','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('44','102720253032','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('45','954863921314','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('46','723591458183','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('47','707545062527','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('48','179312486269','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('49','317752105257','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('50','605464277475','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('51','550657217770','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('52','846454859496','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('53','653269202923','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('54','863075795553','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('55','421706626661','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('56','968651042128','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('57','371485038581','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('58','533417388783','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('59','923516381613','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('60','322054973432','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('61','412182635252','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('62','220366017670','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('63','313416746663','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('64','474728142824','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('65','827730700007','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('66','218978366868','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('67','425186544645','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('68','247891658187','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('69','158449895958','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('70','556382124246','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('71','283116134643','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('72','301905379591','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('73','363343653333','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('74','477546072627','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('75','618397336768','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('76','829244771419','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('77','268118483838','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('78','927938474847','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('79','435647235755','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('80','590932252220','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('81','180438367870','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('82','828430941018','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('83','822347256762','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('84','566576670606','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('85','188680645058','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('86','206455457576','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('87','818644302428','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('88','875454979495','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('89','466004508486','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('90','721188671811','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('91','425368432825','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('92','163803952323','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('93','738368700808','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('94','369610456069','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('95','601494925451','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('96','845305224545','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('97','564579005954','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('98','964006094644','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('99','804552260204','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('100','115403096365','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('101','244998984844','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('102','169056739699','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('103','688418029898','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('104','241552577271','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('105','653036736663','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('106','889829712929','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('107','702089202922','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('108','116365914546','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('109','413816368683','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('110','992975301512','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('111','265999689995','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('112','785882035255','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('113','208806850608','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('114','950711016160','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('115','824155851514','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('116','368142375258','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('117','371922679291','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('118','145291131115','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('119','756222510206','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('120','646706225656','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('121','302884016462','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('122','774380879094','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('123','140784973430','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('124','528943925358','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('125','316794975456','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('126','198384416468','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('127','813967466763','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('128','678204281418','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('129','494869746964','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('130','358635663538','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('131','341953327371','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('132','763334324443','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('133','739986215659','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('134','681544898481','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('135','918928684848','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('136','786340382026','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('137','696656928686','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('138','795918720805','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('139','937191219197','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('140','697099362927','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('141','981483603331','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('142','430837833730','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('143','667775092527','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('144','347652970207','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('145','341932852221','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('146','939525062529','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('147','612773892322','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('148','314140412024','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('149','642966759692','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('150','120423118380','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('151','227687298787','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('152','446518797876','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('153','815592217275','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('154','415893055355','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('155','654131102124','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('156','656762780206','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('157','934934231414','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('158','500580241010','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('159','743729570903','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('160','171081938181','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('161','694871705154','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('162','700900052020','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('163','479641945159','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('164','878593923338','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('165','762341149192','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('166','693806745653','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('167','964000460004','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('168','314597192724','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('169','562905891512','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('170','189905932529','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('171','999032476269','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('172','618662682228','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('173','682849988982','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('174','128380582028','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('175','813859434943','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('176','578123547378','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('177','594446394644','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('178','125180858085','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('179','206833529396','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('180','756369630906','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('181','156389287976','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('182','495064630405','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('183','599379530909','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('184','821447223731','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('185','908279402928','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('186','985541261115','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('187','236524883436','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('188','712139858982','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('189','638314749498','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('190','523219403933','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('191','336854236466','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('192','945792193235','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('193','526135501516','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('194','833065543533','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('195','746258529896','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('196','671085635551','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('197','926518753836','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('198','264300659094','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('199','924650132024','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('200','739627591719','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('201','669332915259','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('202','489150770009','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('203','923414231413','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('204','838460533038','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('205','858531707178','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('206','167183370307','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('207','307984449497','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('208','139499892929','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('209','984574795454','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('210','201683722321','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('211','273252499293','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('212','496038771816','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('213','990030417070','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('214','263416706663','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('215','604989502924','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('216','241744184441','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('217','279385205559','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('218','302706752622','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('219','554586718684','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('220','350606990600','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('221','437920433037','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('222','493739616963','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('223','784015675554','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('224','520079340900','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('225','174367746764','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('226','679626620609','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('227','865401303135','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('228','438206521618','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('229','369748543839','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('230','437270414047','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('231','354453065354','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('232','997322292227','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('233','475371309195','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('234','694365719594','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('235','198161838188','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('236','959179056969','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('237','960253083330','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('238','585393244345','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('239','583141404143','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('240','284933666364','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('241','416337688786','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('242','215846581615','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('243','742046748682','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('244','909246937679','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('245','397971907177','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('246','921665227571','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('247','151129872921','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('248','599296169699','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('249','957027497777','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('250','859650453039','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('251','404629174944','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('252','484103924344','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('253','429722738289','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('254','138910447078','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('255','971281122121','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('256','490671185150','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('257','348165426568','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('258','865850886065','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('259','824233754344','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('260','955502975255','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('261','115691425155','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('262','405424605455','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('263','197210937077','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('264','513135940503','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('265','559831856169','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('266','590582284240','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('267','151488924841','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('268','573475377573','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('269','953933074343','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('270','977737787777','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('271','513449833933','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('272','394193873334','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('273','528956943638','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('274','104198578884','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('275','591691789191','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('276','148592685258','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('277','632593022322','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('278','201408184841','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('279','270089377970','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('280','582157723732','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('281','770831830100','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('282','906018887876','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('283','469163108389','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('284','444154992424','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('285','554995155554','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('286','865461746165','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('287','365889950905','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('288','871210439091','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('289','420560456060','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('290','428383118388','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('291','573161358183','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('292','703932289293','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('293','965004211415','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('294','520639343930','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('295','617590309097','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('296','822661413132','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('297','294319635954','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('298','370914157470','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('299','800263963330','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('300','560710663030','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('301','316609895956','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('302','829294031419','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('303','403871451113','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('304','735732028285','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('305','772103961312','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('306','640728146860','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('307','824518176864','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('308','547286783637','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('309','997813456367','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('310','781059604941','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('311','547778055857','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('312','403356146663','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('313','719843936369','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('314','430415074540','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('315','960338547870','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('316','280223281310','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('317','500566742620','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('318','445101056165','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('319','448436143638','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('320','723443476363','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('321','620254546460','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('322','289442880209','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('323','588875500508','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('324','245346454645','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('325','576416345656','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('326','693888926863','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('327','945832685255','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('328','789248185859','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('329','603629616963','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('330','986437082726','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('331','137826875657','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('332','196680183036','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('333','444813026364','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('334','638024285458','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('335','917805632527','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('336','580386778680','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('337','479697122729','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('338','165442613235','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('339','193854246463','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('340','783172357273','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('341','642467375752','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('342','215726651615','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('343','837478296867','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('344','783451892123','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('345','711031095151','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('346','835246797675','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('347','974275304544','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('348','416666183636','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('349','318794603438','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('350','649542324249','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('351','234117772724','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('352','719220528089','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('353','539566493639','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('354','890803784340','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('355','762470409092','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('356','203742808283','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('357','136105533536','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('358','783462792223','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('359','425147327775','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('360','427332668287','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('361','599427764749','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('362','543879023933','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('363','270802421210','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('364','402433609392','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('365','974246455654','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('366','121287948781','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('367','808026270608','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('368','464633415354','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('369','846035508586','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('370','911154193431','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('371','831962572221','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('372','793774421413','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('373','242006772622','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('374','892330396062','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('375','148268134848','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('376','997942140207','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('377','988743902328','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('378','241051219191','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('379','259335874549','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('380','170185712520','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('381','365825495555','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('382','360402958280','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('383','142935819592','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('384','206270384046','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('385','117762264247','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('386','919993027379','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('387','632364985452','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('388','440594614440','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('389','753418903833','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('390','514551639194','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('391','524020098084','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('392','398105982528','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('393','800078332820','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('394','810620594040','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('395','984024539494','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('396','625698692825','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('397','882174631412','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('398','904005926564','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('399','405435927575','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('400','910772846260','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('401','865858541815','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('402','278993746368','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('403','232213082322','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('404','299328466869','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('405','630381021110','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('406','782506448682','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('407','247534095457','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('408','990105550500','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('409','120174122420','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('410','695093751315','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('411','568994605458','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('412','444912542224','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('413','188296684648','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('414','918291121118','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('415','946400828086','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('416','200055472520','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('417','119583760309','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('418','491067226761','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('419','728373799398','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('420','269401550109','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('421','404151143134','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('422','470709582920','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('423','578146677678','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('424','295025609595','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('425','371951667171','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('426','545506823635','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('427','404467543734','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('428','640638697870','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('429','319485560509','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('430','103406322623','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('431','725133013335','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('432','289943342329','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('433','102149557972','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('434','960674347470','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('435','118247596768','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('436','807814281417','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('437','855973513335','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('438','240297284740','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('439','710308817870','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('440','125759226965','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('441','755797611715','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('442','781693341311','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('443','907091322127','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('444','925265849595','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('445','950997620700','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('446','945935111515','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('447','194868033834','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('448','425974026465','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('449','658685836568','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('450','440269045950','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('451','349883070309','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('452','180812033230','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('453','920424958480','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('454','437004535457','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('455','111808439891','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('456','994521172124','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('457','743107984743','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('458','984433111314','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('459','339276466669','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('460','519646207679','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('461','358111589198','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('462','182248273832','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('463','886443847376','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('464','338143438388','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('465','621150973031','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('466','424126477674','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('467','131543280301','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('468','371707106761','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('469','309117328789','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('470','109808011819','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('471','798930250008','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('472','134416045654','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('473','284775076564','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('474','723849191913','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('475','223675073533','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('476','813695550503','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('477','302315731512','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('478','394600585054','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('479','815517806765','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('480','509226433639','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('481','287359758987','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('482','962857043732','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('483','668213245358','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('484','921505853531','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('485','466730073036','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('486','683810369093','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('487','544114593434','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('488','532461672122','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('489','567162905257','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('490','152897276762','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('491','679439486969','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('492','629782591219','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('493','168083517378','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('494','604261404144','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('495','556645941516','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('496','568760673038','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('497','765807717775','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('498','421738181811','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('499','453636270603','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('500','641470831011','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('501','991154290401','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('502','511353671311','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('503','271397801711','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('504','242789639992','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('505','575521624145','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('506','455223370305','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('507','892799353932','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('508','533796246663','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('509','831807767771','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('510','242155861512','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('511','411692716261','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('512','363069098983','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('513','286313991316','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('514','399783667379','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('515','294508449894','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('516','396904968486','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('517','203528355853','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('518','572852529292','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('519','381712676261','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('520','999245718589','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('521','720233160300','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('522','625015007575','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('523','240127965750','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('524','459487512729','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('525','813644344443','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('526','134426809694','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('527','879115360509','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('528','983758258883','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('529','365558259895','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('530','130876794640','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('531','701044883431','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('532','992149264942','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('533','979676543639','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('534','741255145551','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('535','951111836161','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('536','407557448787','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('537','345435918585','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('538','499109931919','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('539','633640219093','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('540','743929302923','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('541','449627616769','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('542','656284018486','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('543','522695692522','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('544','283503530303','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('545','166193105356','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('546','498249902928','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('547','460526825650','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('548','360455844540','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('549','133926647673','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('550','121435263531','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('551','466122480206','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('552','960878589890','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('553','605413377375','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('554','274611843134','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('555','349227098789','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('556','349874500409','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('557','233303180303','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('558','761689835951','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('559','306069713936','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('560','798882571218','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('561','998141688188','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('562','212321220102','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('563','540349404940','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('564','357707033737','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('565','480262969290','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('566','640464934440','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('567','727889253937','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('568','314844099494','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('569','754536009694','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('570','647656387677','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('571','236411027176','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('572','894238569894','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('573','695255665555','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('574','678809485958','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('575','661542857271','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('576','565031823135','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('577','959909479999','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('578','682804838482','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('579','953619644943','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('580','154885620504','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('581','259318436869','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('582','208734717478','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('583','247904777477','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('584','147151993137','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('585','269533085359','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('586','368795124548','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('587','413808825853','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('588','308833244348','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('589','281649503931','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('590','351757583731','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('591','398001706168','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('592','452527056762','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('593','105211316165','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('594','955964487475','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('595','590318806860','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('596','705925444545','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('597','314119466964','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('598','704244228484','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('599','771047646761','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('600','147771406167','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('601','667672370207','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('602','615913523335','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('603','457094791417','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('604','245269048985','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('605','944983336364','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('606','441020745051','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('607','460903838380','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('608','350199493930','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('609','425644389495','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('610','342542201212','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('611','796810838086','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('612','981997060701','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('613','916423655356','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('614','519061995159','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('615','450931274140','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('616','412918295852','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('617','480721666160','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('618','358993956368','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('619','672855789592','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('620','274950870004','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('621','633968643833','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('622','229445093539','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('623','635700429095','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('624','156344854446','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('625','855360517075','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('626','234759938984','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('627','146138253836','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('628','432178831812','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('629','351524308481','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('630','847813356367','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('631','303259053933','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('632','550757040700','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('633','131667912721','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('634','302613613332','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('635','476876038686','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('636','207788799897','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('637','151968291811','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('638','561687342721','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('639','154128280804','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('640','435761711115','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('641','819271829199','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('642','761996110601','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('643','402839148982','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('644','935055999595','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('645','809165709599','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('646','667599909997','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('647','796087575756','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('648','672467897772','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('649','537946382627','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('650','581707906761','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('651','921741295151','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('652','959185511519','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('653','526400267076','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('654','777352727277','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('655','860141137170','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('656','891743693331','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('657','913088241813','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('658','487718437877','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('659','267818126867','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('660','255337215755','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('661','271990985051','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('662','989167123739','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('663','179180268089','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('664','427976058687','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('665','965603740305','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('666','635303160305','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('667','510899636960','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('668','627523648387','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('669','889015678589','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('670','840175697570','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('671','574560829094','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('672','821142599291','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('673','209665783539','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('674','465963863335','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('675','660767177770','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('676','643666336663','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('677','692182939292','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('678','624896647674','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('679','819341596169','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('680','754181924144','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('681','122723968382','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('682','450004348480','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('683','497365278587','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('684','479871679199','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('685','965826406665','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('686','479752138289','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('687','681396828681','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('688','350103920300','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('689','888428258888','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('690','984690065054','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('691','331202983231','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('692','736936936666','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('693','258151560108','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('694','502244988482','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('695','105734161415','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('696','915970498085','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('697','191210999091','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('698','264426732624','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('699','245346812625','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('700','326691951116','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('701','890361523130','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('702','462204817472','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('703','479730273039','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('704','101692825251','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('705','249383755359','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('706','370700466060','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('707','479088555859','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('708','184368509894','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('709','314323117374','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('710','909162837279','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('711','674681851114','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('712','318301991118','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('713','959529894949','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('714','265080937075','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('715','428981408188','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('716','446652028286','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('717','130187865750','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('718','722857277772','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('719','714262490204','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('720','736892217276','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('721','219135639599','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('722','200824319490','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('723','415396247675','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('724','547088308887','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('725','164010195054','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('726','210281008180','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('727','154050525054','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('728','428742944248','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('729','191764825451','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('730','128871625158','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('731','435153753335','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('732','807213192327','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('733','573360786063','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('734','809364747479','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('735','853820339093','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('736','468390112028','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('737','550181173130','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('738','985268112825','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('739','196907044746','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('740','759135571519','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('741','317923330307','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('742','530057763730','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('743','747915826567','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('744','355095416565','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('745','336809974946','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('746','306530763036','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('747','714610763034','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('748','247811325157','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('749','165057940705','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('750','249577100709','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('751','718199912928','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('752','923020707073','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('753','283132760203','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('754','178886806668','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('755','515194058485','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('756','994996804644','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('757','632599817972','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('758','417164577477','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('759','188256606668','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('760','379217238789','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('761','406839064946','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('762','273829727973','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('763','838859916968','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('764','115073397375','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('765','951101995151','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('766','634916340604','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('767','371519082921','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('768','403274134443','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('769','769458207879','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('770','644352780204','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('771','309694302429','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('772','651649951911','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('773','703048523833','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('774','202473885352','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('775','519904520409','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('776','850860304040','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('777','399020055059','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('778','593344196463','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('779','156387935756','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('780','515499132925','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('781','893346635653','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('782','918675626568','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('783','320739230900','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('784','155201549195','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('785','823725628583','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('786','389598189899','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('787','844583400304','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('788','478667523738','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('789','464427730704','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('790','271138703831','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('791','699886469699','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('792','565769151915','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('793','283992758283','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('794','322651808182','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('795','695926131615','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('796','894507189794','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('797','853064488483','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('798','395380407075','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('799','751914396461','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('800','104027617774','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('801','979584058489','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('802','323751322123','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('803','314507247774','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('804','234990588084','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('805','521307197771','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('806','200600636060','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('807','911402335251','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('808','607776686667','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('809','886170852026','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('810','811459162921','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('811','178886279698','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('812','926382161216','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('813','610514237470','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('814','438122020208','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('815','869333558389','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('816','568769923938','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('817','160102761210','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('818','395434964445','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('819','807406548687','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('820','557183259397','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('821','873823343333','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('822','754625799594','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('823','971923874341','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('824','681113970301','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('825','485721855155','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('826','205444429495','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('827','546254322426','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('828','171148202821','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('829','717629435957','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('830','191485399591','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('831','581232282221','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('832','679211779199','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('833','123094489493','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('834','642301081112','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('835','719382686269','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('836','732325095552','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('837','533355025553','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('838','929553975359','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('839','996898002826','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('840','674435588584','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('841','658767348788','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('842','773062655253','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('843','297053152327','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('844','520671144140','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('845','859052923239','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('846','398696634648','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('847','224314845454','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('848','280892660200','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('849','193941679193','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('850','473959617973','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('851','164745957574','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('852','666080754046','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('853','508142163238','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('854','937487624747','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('855','492543051312','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('856','585929877975','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('857','870705230500','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('858','830183682320','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('859','591150950001','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('860','633783795353','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('861','155264379495','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('862','759659628989','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('863','715028643835','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('864','327882818287','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('865','699236628689','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('866','258724731418','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('867','191694544441','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('868','318635130508','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('869','420661914140','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('870','395032195255','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('871','103610850003','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('872','856195433536','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('873','413086895653','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('874','479779014949','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('875','930914505450','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('876','727914750407','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('877','842633627372','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('878','586104621416','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('879','308305930508','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('880','413362745253','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('881','692177563732','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('882','294051868184','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('883','906145169596','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('884','531916506661','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('885','414179518984','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('886','159342258289','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('887','601281437171','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('888','769799952929','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('889','977720921017','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('890','699344076469','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('891','640544872420','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('892','128271451118','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('893','740489176960','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('894','588093073338','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('895','357629907977','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('896','454937827774','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('897','969833893339','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('898','734636618684','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('899','545137107775','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('900','496584625456','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('901','602107929792','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('902','628793792328','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('903','300473943330','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('904','131127462721','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('905','588937187778','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('906','410739229990','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('907','407882694247','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('908','606694145456','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('909','453340876063','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('910','517353935357','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('911','799000100009','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('912','317175004547','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('913','402202351212','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('914','571842456261','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('915','606637931716','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('916','380418728880','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('917','598890010008','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('918','196603019396','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('919','267098729897','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('920','174538258884','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('921','835839396965','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('922','609726827679','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('923','542369841912','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('924','518163153338','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('925','170234102420','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('926','664575331514','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('927','686403257376','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('928','733799317973','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('929','206387184746','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('930','161522665251','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('931','191248529891','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('932','455797241715','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('933','531361276161','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('934','291254747471','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('935','869321057179','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('936','975833671315','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('937','878866864648','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('938','725542474245','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('939','194973038384','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('940','689777487779','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('941','178811852128','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('942','938278392828','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('943','620277070700','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('944','683136776663','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('945','848631791118','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('946','265535824545','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('947','673579922923','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('948','205462370205','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('949','439160430009','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('950','895420326065','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('951','892937143732','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('952','407152733237','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('953','128663659398','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('954','393950618083','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('955','641074898481','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('956','694790564044','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('957','307173489397','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('958','354979778984','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('959','881236944641','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('960','956375995556','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('961','636199668986','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('962','195474051415','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('963','566622885256','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('964','520904984440','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('965','328588823838','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('966','870403292320','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('967','637111719197','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('968','889180018089','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('969','663010499093','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('970','307469326967','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('971','440721677170','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('972','992532153232','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('973','774494234444','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('974','368790942028','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('975','976706217676','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('976','555349205955','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('977','185628026865','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('978','795158343835','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('979','454474178484','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('980','825794587475','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('981','146719405956','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('982','207157411717','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('983','608588905858','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('984','857143700307','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('985','567115319597','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('986','459300554049','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('987','724774398484','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('988','378303882328','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('989','719687617779','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('990','957666835657','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('991','266913613336','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('992','309493834349','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('993','820211728180','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('994','876181539196','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('995','713664677473','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('996','802161362122','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('997','834012845254','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('998','232001161112','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('999','204805805554','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1000','445250063035','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1001','194568871814','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1002','593248656863','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1003','957708403837','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1004','592634159492','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1005','493200104043','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1006','897001269197','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1007','190916742620','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1008','456865472526','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1009','640016813630','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1010','464657686764','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1011','197791660107','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1012','998667448788','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1013','362612602222','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1014','795278785855','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1015','964826769694','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1016','127571167177','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1017','952348291812','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1018','679305834549','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1019','620455281510','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1020','874775012524','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1021','438333206368','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1022','608476870608','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1023','582549053932','0','1');
INSERT INTO `igu_voucher` (`id`,`vouchernumber`,`status`,`idcredit`) VALUES
('1024','386313713336','0','1');



-- -------------------------------------------
-- TABLE DATA imirenge
-- -------------------------------------------
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('1','Gashora','22');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('2','Juru','22');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('3','Kamabuye','22');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('4','Ntarama','22');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('5','Mareba','22');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('6','Mayange','22');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('7','Musenyi','22');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('8','Mwogo','22');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('9','Ngeruka','22');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('10','Nyamata','22');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('11','Nyarugenge','22');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('12','Rilima','22');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('13','Ruhuha','22');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('14','Rweru','22');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('15','Shyara','22');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('16','Gasange','26');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('17','Gatsibo','26');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('18','Gitoki','26');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('19','Kabarore','26');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('20','Kageyo','26');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('21','Kiramuruzi','26');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('22','kKiziguro','26');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('23','Muhura','26');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('24','Murambi','26');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('25','Ngarama','26');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('26','Nyagihanga','26');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('27','Remera','26');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('28','Rugarama','26');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('29','Rwimbogo','26');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('30','Gahini','11');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('31','Kabare','11');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('32','Kabarondo','11');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('33','Mukarange','11');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('34','Murama','11');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('35','Murundi','11');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('36','Mwiri','11');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('37','Bungwe','1');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('38','Ndego','11');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('39','Nyamirama','11');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('40','Butaro','1');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('41','Cyanika','1');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('42','Rukara','11');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('43','Ruramira','11');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('44','Rwinkwavu','11');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('45','Gahara','25');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('46','cyeru','1');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('47','gahunga','1');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('48','Gatebe','1');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('49','Gatore','25');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('50','Kigina','25');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('51','Gitovu','1');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('52','Kirehe','25');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('53','Mahama','25');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('54','Kagogo','1');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('55','Mpanga','25');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('56','Kinoni','1');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('57','Musaza','25');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('58','Mushikiri','25');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('59','Nasho','25');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('60','Nyamugari','25');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('61','Nyarubuye','25');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('62','Kigarama','25');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('63','Gashanda','24');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('64','Jarama','24');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('65','Karembo','24');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('66','Kazo','24');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('67','Kibungo','24');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('68','Mugesera','24');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('69','Kinyababa','1');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('71','Kivuye','1');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('73','Nemba','1');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('76','Mutenderi','24');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('78','Rukira','24');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('79','Rukumberi','24');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('80','Rurenge','24');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('81','Sake','24');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('82','Zaza','24');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('83','Murama','24');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('84','Remera','24');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('85','Gatunda','23');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('86','Kiyombe','23');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('87','Karama','23');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('88','Karangazi','23');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('89','Katabagemu','23');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('90','Matimba','23');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('91','Mimuli','23');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('92','Mukama','23');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('93','Musheli','23');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('94','Nyagatare','23');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('95','Rukomo','23');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('96','Rwempasha','23');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('97','Rwimiyaga','23');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('98','Tabagwe','23');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('99','Fumbwe','4');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('100','Gahengeri','4');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('101','Gishari','4');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('102','Karenge','4');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('103','Kigabiro','4');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('104','Muhazi','4');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('105','Munyaga','4');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('106','Munyiginya','4');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('107','Musha','4');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('108','Muyumbu','4');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('109','Mwulire','4');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('110','Nyakariro','4');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('111','Nzige','4');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('112','Rubona','4');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('113','Rugarama','1');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('114','Rugendabari','1');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('115','Ruhunde','1');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('116','Rusarabuge','1');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('117','Rwerere','1');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('118','Busenge','20');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('119','Coko','20');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('120','Bumbogo','18');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('121','Gatsata','18');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('122','Cyabingo','20');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('123','Jali','18');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('124','Gakenke','20');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('125','Gikomero','18');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('126','Gashenyi','20');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('127','Gisozi','18');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('128','Jabana','18');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('129','Mugunga','20');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('130','Kinyinya','18');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('131','Ndera','18');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('132','Nduba','18');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('133','Rusororo','18');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('134','jinja','20');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('135','Rutunga','18');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('136','Kamubuga','20');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('137','Kacyiru','18');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('138','Kimihurura','18');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('139','Karambo','20');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('140','Kimironko','18');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('141','Kivuruga','20');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('142','Remera','18');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('143','Mataba','20');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('144','Gahanga','15');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('145','Minazi','20');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('146','Gatenga','15');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('147','Gikondo','15');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('148','Muhondo','20');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('149','Kagarama','15');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('150','Muyongwe','20');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('151','Kanombe','15');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('152','Kicukiro','15');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('153','Muzo','20');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('154','Kigarama','15');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('155','Masaka','15');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('156','Nemba','20');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('157','Niboye','15');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('158','Nyarugunga','15');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('159','Ruli','20');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('160','Rusasa','20');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('161','Rushashi','20');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('162','Bukure','37');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('163','Bwisige','37');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('164','Byumba','37');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('165','Cyumba','37');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('166','Gitega','17');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('167','Giti','37');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('168','Kanyinya','17');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('169','Kigali','17');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('170','Kaniga','37');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('171','Kimisagara','17');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('172','Mageragere','17');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('173','Muhima','17');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('174','Nyakabanda','17');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('175','Nyamirambo','17');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('176','Rwezamenyo','17');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('177','Nyarugenge','17');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('178','Bwishyura','31');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('179','Gishari','31');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('180','Gishyita','31');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('181','Gisovu','31');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('182','Gitesi','31');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('183','Kareba','31');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('184','Murambi','31');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('185','Mubuga','31');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('186','Rubengera','31');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('187','Manyagiro','37');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('188','Miyove','37');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('189','Mutuntu','31');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('190','Rugabano','31');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('191','Rwankuba','31');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('192','Ruganda','31');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('193','Twumba','31');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('194','Bwira','32');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('195','Kageyo','37');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('196','Mukarange','37');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('197','Muko','37');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('198','Gatumba','32');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('199','Mutete','37');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('200','Nyamiyaga','37');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('201','Hindiro','32');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('202','Nyankenke','37');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('203','Rubaya','37');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('204','Rukomo','37');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('205','Kabaya','32');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('206','Kageyo','32');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('207','Rushaki','37');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('208','Kavumu','32');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('209','Matyazo','32');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('210','Muhanda','32');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('211','Muhororo','32');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('212','Ndaro','32');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('213','Ngororero','32');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('214','Nyange','32');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('215','Rutare','37');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('216','Sovu','32');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('217','Ruvune','37');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('218','Bigogwe','33');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('219','Jenda','33');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('220','Rwamiko','37');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('221','Jomba','33');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('222','Shangasha','37');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('223','Kabatwa','33');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('224','Karago','33');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('225','Kintobo','33');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('226','Mukamira','33');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('227','Muringa','33');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('228','Rambura','33');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('229','Rugera','33');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('230','Busogo','2');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('231','Rurembo','33');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('232','Cyuve','2');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('233','Shyira','33');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('234','gacaca','2');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('235','Gashaki','2');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('236','Gataraga','2');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('237','Bushekeri','34');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('238','Kimonyi','2');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('239','Bushenge','34');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('240','Kinigi','2');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('241','Cyato','34');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('242','Muhoza','2');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('243','Gihombo','34');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('244','Kagano','34');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('245','Muko','2');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('246','Kanjongo','34');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('247','Karambi','34');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('248','Musanze','2');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('249','Nkotsi','2');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('250','Nyange','2');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('251','Remera','2');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('252','Rwaza','2');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('253','Shingiri','2');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('254','Karengera','34');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('255','Kirimbi','34');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('256','Macuba','34');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('257','Base','21');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('258','Mahembe','34');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('259','Burega','21');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('260','Nyabitekeri','34');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('261','Bushoki','21');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('262','Rangiro','34');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('263','Buyoga','21');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('264','Kinzuzi','21');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('265','Ruharambuga','34');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('266','Shangi','34');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('267','Bugeshi','3');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('268','Busasamana','3');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('269','Cyanzarwe','3');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('270','Gisenyi','3');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('271','Kanama','3');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('272','Kanzenze','3');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('273','Mudende','3');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('274','Nyakiliba','3');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('275','Nyamyumba','3');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('276','Nyundo','3');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('277','Rubavu','3');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('278','Rugerero','3');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('279','Bugarama','35');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('280','Butare','35');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('281','Bweyeye','35');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('282','Gikundamvura','35');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('283','Gashonga','35');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('284','Giheke','35');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('285','Gihundwe','35');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('286','Gitambi','35');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('287','Kamembe','35');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('288','Muganza','35');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('289','Muganza','35');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('290','Mururu','35');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('291','Nkanka','35');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('292','Nkombo','35');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('293','Nkungu','35');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('294','Nyakabuye','35');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('295','Nyakarenzo','35');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('296','Nzahaha','35');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('297','Rwimbogo','35');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('298','Boneza','36');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('299','Gihango','36');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('300','Kigeyo','36');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('301','Kivumu','36');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('302','Manihira','36');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('303','Mukura','36');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('304','Murunda','36');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('305','Musasa','36');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('306','Mushonyi','36');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('307','Mushubati','36');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('308','Nyabirasi','36');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('309','Ruhango','36');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('310','Rusebeya','36');
INSERT INTO `imirenge` (`id`,`umurenge`,`iddistrict`) VALUES
('311','Gikonko','27');



-- -------------------------------------------
-- TABLE DATA pcounter_save
-- -------------------------------------------
INSERT INTO `pcounter_save` (`save_name`,`save_value`) VALUES
('day_time','2457147');
INSERT INTO `pcounter_save` (`save_name`,`save_value`) VALUES
('max_count','2');
INSERT INTO `pcounter_save` (`save_name`,`save_value`) VALUES
('counter','6');
INSERT INTO `pcounter_save` (`save_name`,`save_value`) VALUES
('yesterday','0');



-- -------------------------------------------
-- TABLE DATA pcounter_users
-- -------------------------------------------
INSERT INTO `pcounter_users` (`user_ip`,`user_time`) VALUES
('\'41.215.250.115\'','1430729705');



-- -------------------------------------------
-- TABLE DATA user
-- -------------------------------------------
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('10','admin','2a3c1c5d123714824d9a9df6274dd076','2','52e7b9ee31c604.31795449');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('17','administrator','7cc44ab5195e5b0500bdb66f300e490f','2','5305dc9ea41540.58993569');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('37','ntabana','d4370f8085ede7ccc559a1d37da4ded9','1','556f22105ed406.45216417');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('38','Mahoro','571ba5a619e2f743942a8621a1562c7f','1','557146ead91235.11847846');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('39','Umukunzi ','eadee487952bfb1e912f1b9833c43d42','1','557156b6b1e8c2.56616878');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('40','karekezi','58494811810f7e5289f8327f14c7800b','1','55716a7a9d3427.28004244');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('41','stella','401202ca0a342619d55627a225c8fbc3','1','5571840ee89551.84607908');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('42','mugabe','5f30be52bd9636929b8d361dafdf77c7','1','55731d69b8b2c4.88030481');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('43','elias','4642599eec6e7f8a3e2c8ba9fbc49dfa','1','557589ac3d4535.80081263');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('44','Nyirabugingo','db954c850d70509241135da4459468fb','1','5575d489e1a9b8.21336826');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('45','SIFA JUSTIN','ce62505761352a38c62106f6b395b622','1','557e92087a9c55.43984172');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('46','sharon','89091ee4afaded64375b4b6ddf18e262','1','557fd1fd75a568.61098906');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('47','MUGABO Maurice','4d0d82d84d1a5760408802e7f6a7e8ea','1','557fdc020b4781.66029765');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('48','murenziSupplycompany','88383a61a601d8af44fb9ded21805ddc','1','55813a5a6cc062.57250851');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('49','Mugisha','fc9aabe89aefa05f1cbf8c9fd6f25e7b','1','55819b54bbdcc4.37412120');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('50','NDABUNGUYE BERNARD','fb541791289a628b3d4d4861f27b83e8','1','558812db032562.86929051');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('51','gwiza ','e8886fdcf78deadc67aebb1854e73e29','1','55885f26603d24.57732042');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('52','gwira','3e8a1f095a6a1411c4f6c9242980fc13','1','55885fb15b5482.82735414');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('53','benie','9cff1c5e4f7003b3e65e96b7e8f1b896','1','55886006ab4a35.37472649');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('54','Nick','c32b7d1735c5eb2b82a036e4cc5df311','1','55886077e5d233.49811029');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('55','Rica','1e5bfc21311ec87d5f3bddbc719d29c9','1','558860ae353a71.55384848');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('56','Puchoni','5c367b8740a5e810434da3faa02e9f4d','1','55886107c97642.83949077');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('57','den','0ca989fb9b74fe5acabeda382d5bbaf2','1','558a6bab1ecd72.58434495');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('58','Nyagatare Agro-ventures Rwanda','208de269e0a93aaacaf25bd4a9d2030d','1','558d18485c4839.07017660');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('59','abadahemuka','f8d13c99500d171698a76721f94c2184','1','558d1eb91f8f05.17631557');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('60','abahujimbaraga','b30094e603a7a337428d95beccbb9cfe','1','558d1f3304a6f7.40110203');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('61','duhaguruke','9e98e087449ecf07bd829d3a3921aedc','1','558d1f7692b2a1.59159475');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('62','olivercompanyltd','5d8b214b14064527195eceeba2e161f9','1','558d2d1fae0025.78125886');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('63','NTAKIRUTIMANA VIATERUR','4026a8d25459d6f3611dfe3e32ccb72a','1','559e6e575a8654.31827161');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('64','jado','88034a8f931c0a5fa6e5636abb735fe0','1','55afa9522583f3.54633341');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('65','Tugirimana J.Bosco','7179bb239cd17559b421fd50772b8453','1','55b214ca11cb60.32984234');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('66','chalvi','c42ac11aa51eeaea9950818de9f4d1a7','1','55b2191e1f68d5.09509955');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('67','Tuginama J.Bosco','7a0e07aae85ff0f9757a8b3dafd1cac6','1','55b22f36132137.17975501');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('68','uwimana','d5042c77304afc7134af8db039f50453','1','55b25af5600147.01305940');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('69','eddy','ede2b2a72ee6244126ae2e26cc7535ac','1','55be2bfd8d22c5.19791531');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('70','j82ph','414ace8ceabe17c3f47fc7f305335927','1','55d46a92445741.78771097');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('71','Amata','58bbab95f5bbe1ab13564731a46b1d9f','1','55d59d55489571.01257001');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('72','kalisa','02c1ff6215862333401a3c6a3f7ab25f','1','55ddb16969fe11.28146243');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('73','denyse','d3dfcdf71a328c33d0153df27571e2ab','1','55ddb4201ddd49.05650123');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('74','kayitare','a860192b572f959f9d4db5cb7a63561d','1','5602b94e2d6e50.91142842');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('75','Craig','00eaff3bb33cb63d29c4df3b89f2d6ea','1','56042191bbb1e5.10365816');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('76','emma','707d07950669b8c5a54cb83caa7f28cd','1','5614d147907743.53179999');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('77','sadekjake@technoflame.com','94639e1f3085f0296a042dc8fc126298','1','561e4f8e794343.33353266');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('78','cyusa','66c813d5b3fbe1ae66d06aeb83d38d75','2','564ecea9e8e940.52714978');
INSERT INTO `user` (`id`,`username`,`password`,`status`,`salt`) VALUES
('79','kalim','4711f0cf5a9e8ed83dc300dd126fd3fe','1','57485005d309a3.33798573');



-- -------------------------------------------
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
COMMIT;
-- -------------------------------------------
-- -------------------------------------------
-- END BACKUP
-- -------------------------------------------
