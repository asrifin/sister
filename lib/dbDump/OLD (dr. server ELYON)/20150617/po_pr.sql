# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:19:51
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "po_pr"
#

DROP TABLE IF EXISTS `po_pr`;
CREATE TABLE `po_pr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nopr` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `namapr` varchar(512) NOT NULL,
  `departemenpr` varchar(512) NOT NULL,
  `tujuanpr` varchar(512) NOT NULL,
  `kategorianggaran` varchar(5) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

#
# Data for table "po_pr"
#

INSERT INTO `po_pr` VALUES (12,'PR1606150001','2015-06-16','andre','8','meja rusak','16','admin');
