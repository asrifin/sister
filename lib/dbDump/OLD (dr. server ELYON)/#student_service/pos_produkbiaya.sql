# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:23:32
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_produkbiaya"
#

DROP TABLE IF EXISTS `pos_produkbiaya`;
CREATE TABLE `pos_produkbiaya` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `hargajual` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`),
  UNIQUE KEY `kode_2` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "pos_produkbiaya"
#

INSERT INTO `pos_produkbiaya` VALUES (2,6,'5','GURU PRAMUKA','GURU PRAMUKA','500000');
