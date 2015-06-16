# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:22:47
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_supplier"
#

DROP TABLE IF EXISTS `pos_supplier`;
CREATE TABLE `pos_supplier` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telepon` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "pos_supplier"
#

INSERT INTO `pos_supplier` VALUES (1,'SUP0019','CV. MAJU BERKAH','JAKARTA','0215469856'),(2,'SUP111','CV. ADIPERKASA','SIDOARJO','0312568899'),(3,'111','PT. ADI JAYA','SURABAYA','0315689523');
