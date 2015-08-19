# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:24:39
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_penjualanjasa"
#

DROP TABLE IF EXISTS `pos_penjualanjasa`;
CREATE TABLE `pos_penjualanjasa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodecustomer` varchar(50) NOT NULL,
  `carabayar` enum('Tunai','Debet Card','Piutang') NOT NULL DEFAULT 'Tunai',
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL DEFAULT '0',
  `piutang` varchar(50) NOT NULL DEFAULT '0',
  `termin` enum('0','14','21','30','60','90','120') NOT NULL DEFAULT '0',
  `tgltermin` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "pos_penjualanjasa"
#

INSERT INTO `pos_penjualanjasa` VALUES (1,'FKJ0106150001','2015-06-01','234','Tunai','10000','0','10000','10000','0','0','','admin'),(2,'FKJ0606150002','2015-06-06','1005','Tunai','10000','0','10000','10000','0','0','','admin'),(3,'FKJ0606150003','2015-06-06','633','Tunai','10000','0','10000','10000','0','0','','admin'),(4,'FKJ0606150004','2015-06-06','1004','Tunai','10000','0','10000','10000','0','0','','admin');
