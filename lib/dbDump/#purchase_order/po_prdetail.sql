# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:19:37
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "po_prdetail"
#

DROP TABLE IF EXISTS `po_prdetail`;
CREATE TABLE `po_prdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nopr` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `spesifikasi` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

#
# Data for table "po_prdetail"
#

INSERT INTO `po_prdetail` VALUES (14,'PR1606150001','1','7',''),(15,'PR1606150001','2','8','');
