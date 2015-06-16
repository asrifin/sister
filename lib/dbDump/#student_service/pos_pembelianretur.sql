# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:25:36
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_pembelianretur"
#

DROP TABLE IF EXISTS `pos_pembelianretur`;
CREATE TABLE `pos_pembelianretur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "pos_pembelianretur"
#

INSERT INTO `pos_pembelianretur` VALUES (1,'RTB0106150001','INV0106150001','2015-06-01','SUP111','Tunai','225000','admin');
