# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:23:53
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_podetail"
#

DROP TABLE IF EXISTS `pos_podetail`;
CREATE TABLE `pos_podetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nopo` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "pos_podetail"
#

INSERT INTO `pos_podetail` VALUES (1,'PO1606150001','002','1','127000','0','127000');
