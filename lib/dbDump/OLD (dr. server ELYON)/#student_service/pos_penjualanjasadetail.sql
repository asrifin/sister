# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:24:29
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_penjualanjasadetail"
#

DROP TABLE IF EXISTS `pos_penjualanjasadetail`;
CREATE TABLE `pos_penjualanjasadetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `kodejasa` varchar(50) NOT NULL,
  `jenis` int(4) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL DEFAULT '0',
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "pos_penjualanjasadetail"
#

INSERT INTO `pos_penjualanjasadetail` VALUES (1,'FKJ0106150001','PRAMUKA',6,'1','10000','0','0','10000'),(2,'FKJ0606150002','BL01',6,'1','10000','0','0','10000'),(3,'FKJ0606150003','BL01',6,'1','10000','0','0','10000'),(4,'FKJ0606150004','BL01',6,'1','10000','0','0','10000');
