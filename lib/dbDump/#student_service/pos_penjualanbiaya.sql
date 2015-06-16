# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:25:07
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_penjualanbiaya"
#

DROP TABLE IF EXISTS `pos_penjualanbiaya`;
CREATE TABLE `pos_penjualanbiaya` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `carabayar` enum('Tunai','Debet Card','Piutang') NOT NULL DEFAULT 'Tunai',
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL DEFAULT '0',
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "pos_penjualanbiaya"
#

INSERT INTO `pos_penjualanbiaya` VALUES (1,'FKB3005150001','2015-05-30','Tunai','500000','0','500000','500000','admin'),(2,'FKB0106150002','2015-06-01','Tunai','550000','0','550000','550000','admin');
