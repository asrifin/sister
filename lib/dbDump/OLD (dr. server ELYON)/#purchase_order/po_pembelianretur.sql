# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:21:17
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "po_pembelianretur"
#

DROP TABLE IF EXISTS `po_pembelianretur`;
CREATE TABLE `po_pembelianretur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "po_pembelianretur"
#

INSERT INTO `po_pembelianretur` VALUES (1,'RTB1905150001','INV1805150001','2015-05-19','SUP01','Tunai','250000','superadmin'),(2,'RTB0106150002','INV0106150004','2015-06-01','SUP01','Tunai','100000','admin'),(3,'RTB1206150003','INV1206150007','2015-06-12','SUP01','Tunai','20500000','admin'),(4,'RTB1206150004','INV1206150007','2015-06-12','SUP01','Tunai','20500000','admin');
