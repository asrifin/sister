# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:21:34
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "po_pembeliandetail"
#

DROP TABLE IF EXISTS `po_pembeliandetail`;
CREATE TABLE `po_pembeliandetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jenis` int(3) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

#
# Data for table "po_pembeliandetail"
#

INSERT INTO `po_pembeliandetail` VALUES (23,'INV1606150001','PO1606150001','1',0,'7','500000','0','3500000'),(24,'INV1606150002','PO1606150001','1',0,'0','500000','0','3500000'),(25,'INV1606150002','PO1606150001','2',0,'2','600000','0','1200000');
