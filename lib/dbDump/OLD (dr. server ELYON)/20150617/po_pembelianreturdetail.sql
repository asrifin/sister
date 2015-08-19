# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:21:06
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "po_pembelianreturdetail"
#

DROP TABLE IF EXISTS `po_pembelianreturdetail`;
CREATE TABLE `po_pembelianreturdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Data for table "po_pembelianreturdetail"
#

INSERT INTO `po_pembelianreturdetail` VALUES (1,'RTB1905150001','INV1805150001','KD001','5','50000','0','250000'),(2,'RTB0106150002','INV0106150004','KD001','2','50000','0','100000'),(3,'RTB1206150003','INV1206150007','123','1','500000','0','500000'),(4,'RTB1206150003','INV1206150007','14','2','10000000','0','20000000'),(5,'RTB1206150004','INV1206150007','123','0','500000','0','500000'),(6,'RTB1206150004','INV1206150007','14','0','10000000','0','20000000');
