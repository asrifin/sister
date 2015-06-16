# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:20:38
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "po_pndetail"
#

DROP TABLE IF EXISTS `po_pndetail`;
CREATE TABLE `po_pndetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nopn` varchar(50) NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

#
# Data for table "po_pndetail"
#

INSERT INTO `po_pndetail` VALUES (11,'NPN1606150001','CV.AAA','1','500000'),(12,'NPN1606150001','CA.GGG','2','600000');
