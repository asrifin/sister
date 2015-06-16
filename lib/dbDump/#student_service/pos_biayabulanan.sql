# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:27:12
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_biayabulanan"
#

DROP TABLE IF EXISTS `pos_biayabulanan`;
CREATE TABLE `pos_biayabulanan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `nama` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "pos_biayabulanan"
#

INSERT INTO `pos_biayabulanan` VALUES (1,'2015-05-30','LISTRIK','500000'),(2,'2015-06-06','AIR','50000');
