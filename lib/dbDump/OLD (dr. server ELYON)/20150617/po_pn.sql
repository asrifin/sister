# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:20:49
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "po_pn"
#

DROP TABLE IF EXISTS `po_pn`;
CREATE TABLE `po_pn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nopn` varchar(50) NOT NULL,
  `nopr` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "po_pn"
#

INSERT INTO `po_pn` VALUES (4,'NPN1606150001','PR1606150001','2015-06-16','admin');
