# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:23:43
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_produk"
#

DROP TABLE IF EXISTS `pos_produk`;
CREATE TABLE `pos_produk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL,
  `hargajual` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`),
  UNIQUE KEY `kode_2` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

#
# Data for table "pos_produk"
#

INSERT INTO `pos_produk` VALUES (15,1,'2','001','BLOUSE PUTRI ','50','100000','115000'),(16,1,'2','002','JUMPER PUTRI','49','127000','130000'),(17,1,'2','003','KEMEJA PUTRA','44','115000','120000'),(18,1,'2','004','CELANA PUTRA','49','120000','125000'),(19,1,'2','005','DASI','82','48000','50000'),(20,1,'2','006','KAOS OLAH RAGA','66','72000','75000'),(21,1,'2','007','CELANA OLAH RAGA','47','72000','75000'),(22,1,'2','008','TOPI','94','50000','55000'),(23,3,'3','BK001','BUKU LKS ENGLISH','63','25000','30000');
