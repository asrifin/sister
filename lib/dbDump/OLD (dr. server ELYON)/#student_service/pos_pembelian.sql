# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:25:58
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_pembelian"
#

DROP TABLE IF EXISTS `pos_pembelian`;
CREATE TABLE `pos_pembelian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` enum('Tunai','Debet Card','Hutang') NOT NULL DEFAULT 'Tunai',
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL,
  `hutang` varchar(50) NOT NULL DEFAULT '0',
  `termin` enum('0','14','21','30','60','90','120') NOT NULL DEFAULT '0',
  `tgltermin` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "pos_pembelian"
#

INSERT INTO `pos_pembelian` VALUES (1,'INV0106150001','','2015-06-01','SUP111','Tunai','225000','0','225000','225000','0','0','','admin'),(2,'INV0606150002','','2015-06-06','SUP111','Tunai','150000','0','150000','150000','0','0','','admin'),(3,'INV0606150003','','2015-06-06','SUP111','Tunai','25000','0','25000','25000','0','0','','admin');
