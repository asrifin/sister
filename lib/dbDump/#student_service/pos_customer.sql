# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:26:59
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_customer"
#

DROP TABLE IF EXISTS `pos_customer`;
CREATE TABLE `pos_customer` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "pos_customer"
#

INSERT INTO `pos_customer` VALUES (2,'234','SEKOLAH');
