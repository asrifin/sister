# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:27:24
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_alur_stok"
#

DROP TABLE IF EXISTS `pos_alur_stok`;
CREATE TABLE `pos_alur_stok` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `transaksi` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

#
# Data for table "pos_alur_stok"
#

INSERT INTO `pos_alur_stok` VALUES (2,'2015-05-01','Saldo Awal','-','008','100'),(3,'2015-05-01','Saldo Awal','-','BK001','63'),(4,'2015-05-01','Saldo Awal','-','002','49'),(5,'2015-05-01','Saldo Awal','-','003','47'),(6,'2015-05-01','Saldo Awal','-','004','50'),(7,'2015-05-02','Penjualan','FAK2405150001','004','1'),(8,'2015-05-01','saldo awal','-','005','82'),(9,'2015-05-01','saldo awal','-','006','66'),(10,'2015-05-01','saldo awal','-','007','47'),(11,'2015-06-01','Pembelian','INV0106150001','008','2'),(12,'2015-06-01','Pembelian','INV0106150001','001','1'),(13,'2015-06-01','Retur Pembelian','RTB0106150001','008','2'),(14,'2015-06-01','Retur Pembelian','RTB0106150001','001','1'),(15,'2015-06-01','Penjualan','FAK0106150002','008','5'),(16,'2015-06-01','Penjualan','FAK0106150002','003','3'),(17,'2015-06-01','Penjualan','FAK0106150003','008','2'),(18,'2015-06-01','Penjualan','FAK0106150003','001','1'),(19,'2015-06-06','Pembelian','INV0606150002','001','1'),(20,'2015-06-06','Pembelian','INV0606150002','008','1'),(21,'2015-06-06','Pembelian','INV0606150003','BK001','1'),(22,'2015-06-06','Penjualan','FAK0606150004','BK001','1');
