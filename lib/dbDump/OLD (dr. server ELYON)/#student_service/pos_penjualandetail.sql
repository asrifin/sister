# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:24:49
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_penjualandetail"
#

DROP TABLE IF EXISTS `pos_penjualandetail`;
CREATE TABLE `pos_penjualandetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jenis` int(4) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL DEFAULT '0',
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Data for table "pos_penjualandetail"
#

INSERT INTO `pos_penjualandetail` VALUES (1,'FAK2405150001','004',1,'1','125000','120000','0','125000'),(2,'FAK0106150002','008',1,'5','55000','50000','0','275000'),(3,'FAK0106150002','003',1,'3','120000','115000','0','360000'),(4,'FAK0106150003','008',1,'2','55000','50000','0','110000'),(5,'FAK0106150003','001',1,'1','115000','100000','0','115000'),(6,'FAK0606150004','BK001',3,'1','30000','25000','0','30000');
