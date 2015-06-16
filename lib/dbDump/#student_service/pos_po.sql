# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:24:03
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_po"
#

DROP TABLE IF EXISTS `pos_po`;
CREATE TABLE `pos_po` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nopo` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "pos_po"
#

INSERT INTO `pos_po` VALUES (1,'PO1606150001','2015-06-16','SUP0019','127000','0','127000','admin');
