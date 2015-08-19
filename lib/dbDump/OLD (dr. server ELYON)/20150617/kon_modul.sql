# Host: localhost  (Version: 5.5.36)
# Date: 2015-06-17 06:42:48
# Generator: MySQL-Front 5.3  (Build 2.16)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

#
# Source for table "kon_modul"
#

DROP TABLE IF EXISTS `kon_modul`;
CREATE TABLE `kon_modul` (
  `id_modul` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupmodul` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `modul` varchar(100) NOT NULL,
  `id_warna` int(11) NOT NULL,
  `id_icon` int(11) NOT NULL,
  `size` enum('','double','double double-vertical') NOT NULL DEFAULT '',
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_modul`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

#
# Data for table "kon_modul"
#

INSERT INTO `kon_modul` VALUES (1,1,'akademik','akademik',13,9,'double','data akademik siswa'),(2,1,'psb','penerimaan siswa baru',14,10,'double','data penerimaan siswa'),(3,1,'perpustakaan','perpustakaan',3,11,'double double-vertical','data koleksi dan sirkulasi buku di perpustakaan'),(4,1,'sarpras','sarana dan prasarana',4,12,'double double-vertical','data sirkulasi peminjaman barang / inventaris'),(5,2,'hrd','kepegawaian',5,13,'double double-vertical','data kepegawaian dan penggajian'),(6,2,'keuangan','keuangan',6,14,'double double-vertical','data keuangan'),(7,2,'student','student services',7,15,'double','data pembelian seragam dan buku'),(8,2,'purchaseorder','purchase order',8,16,'double','data purchase order'),(10,3,'konfigurasi','konfigurasi',12,20,'','konfigurasi sistem'),(11,3,'marketingpsb','marketeng PSB',15,18,'double','');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
