# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:21:47
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "po_pembelian"
#

DROP TABLE IF EXISTS `po_pembelian`;
CREATE TABLE `po_pembelian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `notasupplier` varchar(100) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

#
# Data for table "po_pembelian"
#

INSERT INTO `po_pembelian` VALUES (14,'INV1606150001','PO1606150001','2015-06-16','SUP01','','Tunai','3500000','0','3500000','3500000','0','0','','admin'),(15,'INV1606150002','PO1606150001','2015-06-16','SUP01','','Tunai','4700000','0','4700000','4700000','0','0','','admin');
