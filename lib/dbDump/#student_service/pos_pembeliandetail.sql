# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:25:46
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_pembeliandetail"
#

DROP TABLE IF EXISTS `pos_pembeliandetail`;
CREATE TABLE `pos_pembeliandetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jenis` int(3) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Data for table "pos_pembeliandetail"
#

INSERT INTO `pos_pembeliandetail` VALUES (1,'INV0106150001','008',1,'2','55000','0','110000'),(2,'INV0106150001','001',1,'1','115000','0','115000'),(3,'INV0606150002','001',1,'1','100000','0','100000'),(4,'INV0606150002','008',1,'1','50000','0','50000'),(5,'INV0606150003','BK001',3,'1','25000','0','25000');
