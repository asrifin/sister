# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:26:15
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_kelas"
#

DROP TABLE IF EXISTS `pos_kelas`;
CREATE TABLE `pos_kelas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "pos_kelas"
#

INSERT INTO `pos_kelas` VALUES (1,'A','3'),(2,'B','2');
