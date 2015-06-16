# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:24:58
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_penjualanbiayadetail"
#

DROP TABLE IF EXISTS `pos_penjualanbiayadetail`;
CREATE TABLE `pos_penjualanbiayadetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `kodebiaya` varchar(50) NOT NULL,
  `jenis` int(2) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL DEFAULT '0',
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "pos_penjualanbiayadetail"
#

INSERT INTO `pos_penjualanbiayadetail` VALUES (1,'FKB3005150001','GURU PRAMUKA',6,'1','500000','0','0','500000'),(2,'FKB0106150002','GURU PRAMUKA',6,'1','550000','0','0','550000');
