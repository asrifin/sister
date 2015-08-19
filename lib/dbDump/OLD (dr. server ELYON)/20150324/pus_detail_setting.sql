# Host: localhost  (Version: 5.5.36)
# Date: 2015-03-24 18:12:04
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
# Source for table "pus_detail_setting"
#

DROP TABLE IF EXISTS `pus_detail_setting`;
CREATE TABLE `pus_detail_setting` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kunci` int(11) NOT NULL DEFAULT '0',
  `nilai` varchar(200) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

#
# Data for table "pus_detail_setting"
#

/*!40000 ALTER TABLE `pus_detail_setting` DISABLE KEYS */;
INSERT INTO `pus_detail_setting` VALUES (1,1,'nomorauto.5',''),(2,1,'sumber',''),(3,1,'sistem',''),(4,1,'tahun',''),(5,1,'tingkatbuku',''),(6,2,'nomorauto.5',''),(7,2,'sumber',''),(8,2,'sistem',''),(9,2,'tahun',''),(10,2,'tingkatbuku','');
/*!40000 ALTER TABLE `pus_detail_setting` ENABLE KEYS */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
