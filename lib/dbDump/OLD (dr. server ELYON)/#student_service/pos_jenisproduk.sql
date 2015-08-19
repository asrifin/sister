# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:26:35
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_jenisproduk"
#

DROP TABLE IF EXISTS `pos_jenisproduk`;
CREATE TABLE `pos_jenisproduk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Data for table "pos_jenisproduk"
#

INSERT INTO `pos_jenisproduk` VALUES (1,'SERAGAM'),(3,'BUKU'),(4,'FOTOKOPI'),(5,'ATK'),(6,'FORM');
