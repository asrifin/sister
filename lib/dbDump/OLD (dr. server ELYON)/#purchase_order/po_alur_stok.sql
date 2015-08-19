# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:22:02
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "po_alur_stok"
#

DROP TABLE IF EXISTS `po_alur_stok`;
CREATE TABLE `po_alur_stok` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `transaksi` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

#
# Data for table "po_alur_stok"
#

INSERT INTO `po_alur_stok` VALUES (29,'2015-06-16','Pembelian','INV1606150009','123','1'),(30,'2015-06-16','Pembelian','INV1606150009','123','1'),(31,'2015-06-16','Pembelian','INV1606150010','123','1'),(32,'2015-06-16','Pembelian','INV1606150011','9','1'),(33,'2015-06-16','Pembelian','INV1606150011','18','1'),(34,'2015-06-16','Pembelian','INV1606150012','123','1'),(35,'2015-06-16','Pembelian','INV1606150012','LO','1'),(36,'2015-06-16','Pembelian','INV1606150013','123','1'),(37,'2015-06-16','Pembelian','INV1606150013','LO','1'),(38,'2015-06-16','Pembelian','INV1606150001','1','7'),(39,'2015-06-16','Pembelian','INV1606150002','1','0'),(40,'2015-06-16','Pembelian','INV1606150002','2','2');
