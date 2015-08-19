# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:25:27
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_pembelianreturdetail"
#

DROP TABLE IF EXISTS `pos_pembelianreturdetail`;
CREATE TABLE `pos_pembelianreturdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "pos_pembelianreturdetail"
#

INSERT INTO `pos_pembelianreturdetail` VALUES (1,'RTB0106150001','INV0106150001','008','2','55000','0','110000'),(2,'RTB0106150001','INV0106150001','001','1','115000','0','115000');
