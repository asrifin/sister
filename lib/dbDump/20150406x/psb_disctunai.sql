# Host: localhost  (Version: 5.5.36)
# Date: 2015-04-06 15:14:53
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
# Source for table "psb_disctunai"
#

DROP TABLE IF EXISTS `psb_disctunai`;
CREATE TABLE `psb_disctunai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nilai` decimal(10,0) unsigned NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `nama` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`replid`,`nilai`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

#
# Data for table "psb_disctunai"
#

/*!40000 ALTER TABLE `psb_disctunai` DISABLE KEYS */;
INSERT INTO `psb_disctunai` VALUES (1,10,'( DPP ) Second Intake // ( SPP ) untuk anak ke 3 berdasarkan urutan kelahiran // ( SPP ) untuk ortu jemaat aktif GKA Elyon // ( SPP ) untuk anak sekolah minggu aktif GKA Elyon',''),(2,5,'Tambahan subsidi ( DPP ) untuk anak ke 2 dan selanjutnya // ( SPP ) untuk anak ke 2 berdasarkan urutan kelahiran',''),(3,50,'Subsidi ( DPP ) untuk hamba Tuhan di luar GKA Elyon & Calon Siswa Baru Secondary\n\n// ( DPP ) untuk : Guru full timer,staff,Kepsek, dengan masa kerja kurang dari 2 th',''),(5,15,'( DPP ) First Intake, Siswa Baru High School // ( SPP ) anak ke 4 sesuai urutan kelahiran, High School 2 th ajaran, siswa secondary suko 1 th ajaran',''),(6,20,'( DPP ) second intake untuk siswa dalam // ( SPP ) ortu jemaat & anak sekolah minggu ELYON, secondary rungkut 2 th ajaran // Permohonan khusus melalui disposisi untuk siswa baru yg memiliki sibling',''),(7,25,'( DPP ) First Intake naik jenjang',''),(8,40,'( DPP ) JAPRES',''),(9,80,'( SPP ) pengurus PPK Elyon, Hamba Tuhan GKA Elyon, Guru Full Timer, Staff, Kepsek','');
/*!40000 ALTER TABLE `psb_disctunai` ENABLE KEYS */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
