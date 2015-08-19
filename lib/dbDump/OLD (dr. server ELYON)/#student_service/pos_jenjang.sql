# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:26:26
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_jenjang"
#

DROP TABLE IF EXISTS `pos_jenjang`;
CREATE TABLE `pos_jenjang` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Data for table "pos_jenjang"
#

INSERT INTO `pos_jenjang` VALUES (1,'Playgroup'),(2,'Kindegarden'),(3,'Elementary'),(4,'Primary'),(5,'Tidak Ada');
