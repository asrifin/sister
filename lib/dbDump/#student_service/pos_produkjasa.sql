# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:23:20
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_produkjasa"
#

DROP TABLE IF EXISTS `pos_produkjasa`;
CREATE TABLE `pos_produkjasa` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `hargajual` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`),
  UNIQUE KEY `kode_2` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

#
# Data for table "pos_produkjasa"
#

INSERT INTO `pos_produkjasa` VALUES (6,4,'5','FOTOKOPI','FOTOKOPI','100000'),(7,6,'5','PRAMUKA','PRAMUKA','10000'),(8,6,'4','BL01','BALET 01','10000');
