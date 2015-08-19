# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:25:15
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_penjualan"
#

DROP TABLE IF EXISTS `pos_penjualan`;
CREATE TABLE `pos_penjualan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodecustomer` varchar(50) NOT NULL,
  `carabayar` enum('Tunai','Debet Card','Piutang','Pemesanan') NOT NULL DEFAULT 'Tunai',
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
# Data for table "pos_penjualan"
#

INSERT INTO `pos_penjualan` VALUES (1,'FAK2405150001','2015-05-02','599','Pemesanan','125000','0','125000','0','125000','0','2015-05-2','penjualan'),(2,'FAK0106150002','2015-06-01','633','Tunai','635000','0','635000','635000','0','0','','admin'),(3,'FAK0106150003','2015-06-01','1005','Tunai','225000','0','225000','225000','0','0','2015-06-1','penjualan'),(4,'FAK0606150004','2015-06-06','1004','Tunai','30000','0','30000','30000','0','0','','admin');
