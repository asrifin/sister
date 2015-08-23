
#
# Structure for table "psbcalon_bulan"
#

DROP TABLE IF EXISTS `psbcalon_bulan`;
CREATE TABLE `psbcalon_bulan` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

#
# Data for table "psbcalon_bulan"
#

INSERT INTO `psbcalon_bulan` VALUES (1,'Januari','01'),(2,'Februari','02'),(3,'Maret','03'),(4,'April','04'),(5,'Mei','05'),(6,'Juni','06'),(7,'Juli','07'),(8,'Agustus','08'),(9,'September','09'),(10,'Oktober','10'),(11,'Nopember','11'),(12,'Desember','12');

#
# Structure for table "psbcalon_gelombang"
#

DROP TABLE IF EXISTS `psbcalon_gelombang`;
CREATE TABLE `psbcalon_gelombang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "psbcalon_gelombang"
#

INSERT INTO `psbcalon_gelombang` VALUES (1,'1'),(2,'2'),(3,'3');

#
# Structure for table "psbcalon_level"
#

DROP TABLE IF EXISTS `psbcalon_level`;
CREATE TABLE `psbcalon_level` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `level` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "psbcalon_level"
#

INSERT INTO `psbcalon_level` VALUES (1,'PGA','PLAYGROUP A'),(2,'PGB','PLAYGROUP B'),(3,'P1','PRIMARY 1'),(4,'KG1','KINDERGARDEN 1');

#
# Structure for table "psbcalon_lokasi"
#

DROP TABLE IF EXISTS `psbcalon_lokasi`;
CREATE TABLE `psbcalon_lokasi` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `lokasi` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "psbcalon_lokasi"
#

INSERT INTO `psbcalon_lokasi` VALUES (1,'SUKO','ELYON SUKOMANUNGGAL'),(2,'RKT','ELYON RUNGKUT'),(3,'KTJ','ELYON KERTAJAYA');

#
# Structure for table "psbcalon_siswa"
#

DROP TABLE IF EXISTS `psbcalon_siswa`;
CREATE TABLE `psbcalon_siswa` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kelompok` varchar(50) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `tgllahir` varchar(50) NOT NULL,
  `namaortu` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `telp` varchar(50) NOT NULL,
  `hp` varchar(50) NOT NULL,
  `ket` varchar(512) NOT NULL,
  `asalsekolah` varchar(50) NOT NULL,
  `info` varchar(50) NOT NULL,
  `kelamin` varchar(50) NOT NULL,
  `gelombang` varchar(5) NOT NULL,
  `ket2` varchar(512) NOT NULL,
  `followup` varchar(10) NOT NULL,
  `freetrial` varchar(10) NOT NULL,
  `beliform` varchar(10) NOT NULL,
  `psikotest` varchar(10) NOT NULL,
  `testmandarin` varchar(10) NOT NULL,
  `testenglish` varchar(10) NOT NULL,
  `testmath` varchar(10) NOT NULL,
  `wawancaraortu` varchar(10) NOT NULL,
  `diterima` varchar(10) NOT NULL,
  `joiningfee` varchar(50) NOT NULL,
  `dpp` varchar(50) NOT NULL,
  `uangseragam` varchar(50) NOT NULL,
  `uangbuku` varchar(50) NOT NULL,
  `uangmaterial` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

#
# Data for table "psbcalon_siswa"
#

INSERT INTO `psbcalon_siswa` VALUES (1,'1','2','3','2','2015-06-09','6','7','8','9','0','1','2','3','2','3','z1','2015-06-15','2015-06-10','2015-06-17','','','','','','2015-06-30','2015-06-15','','','','2015-06-30'),(2,'a','a','19','1','a','a','a','a','a','a','a','a','a','1','2','','','','','','','','','','','','','','',''),(3,'m','m','m','m','m','m','m','m','m','m','m','m','m','m','mm','','','','','','','','','','','','','','',''),(4,'g','g','g','g','g','g','g','g','g','g','g','g','g','g','gg','','','','','','','','','','','','','','',''),(5,'r','r','r','r','r','r','r','r','r','r','r','r','r','r','r','','','','','','','','','','','','','','',''),(6,'u','u','u','u','u','u','u','u','u','u','u','u','u','u','u','','','','','','','','','','','','','','',''),(7,'i','i','i','i','i','i','i','i','i','i','ii','i','i','i','i','','','','','','','','','','','','','','',''),(8,'c','c','','1','c','c','c','c','c','c','c','c','c','1','6','','','','','','','','','','','','','','',''),(9,'x','x','x','x','x','x','x','x','x','x','x','x','x','x','x','','','','','','','','','','','','','2015-06-30','','');

#
# Structure for table "psbcalon_situs"
#

DROP TABLE IF EXISTS `psbcalon_situs`;
CREATE TABLE `psbcalon_situs` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `email_master` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `judul_situs` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `url_situs` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `slogan` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `description` text COLLATE latin1_general_ci NOT NULL,
  `keywords` text COLLATE latin1_general_ci NOT NULL,
  `maxkonten` int(2) NOT NULL DEFAULT '5',
  `maxadmindata` int(2) NOT NULL DEFAULT '5',
  `maxdata` int(2) NOT NULL DEFAULT '5',
  `maxgalleri` int(2) NOT NULL DEFAULT '4',
  `widgetshare` int(2) NOT NULL DEFAULT '0',
  `theme` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'tcms',
  `author` text COLLATE latin1_general_ci NOT NULL,
  `alamatkantor` text COLLATE latin1_general_ci NOT NULL,
  `publishwebsite` int(1) NOT NULL DEFAULT '1',
  `publishnews` int(2) NOT NULL,
  `maxgalleridata` int(11) NOT NULL,
  `widgetkomentar` int(2) NOT NULL DEFAULT '1',
  `widgetpenulis` int(2) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

#
# Data for table "psbcalon_situs"
#

/*!40000 ALTER TABLE `psbcalon_situs` DISABLE KEYS */;
INSERT INTO `psbcalon_situs` VALUES (1,'rekysda@gmail.com','Penerimaan Peserta Didik Baru','http://192.168.10.166/sister/marketingpsb','SISTER - PPDB','WebDesign dengan sistem Responsive','ppdb,surabaya,indonesia',5,50,5,4,3,'pos','Elyon Christian School','Surabaya',1,1,12,1,2);
/*!40000 ALTER TABLE `psbcalon_situs` ENABLE KEYS */;

#
# Structure for table "psbcalon_useraura"
#

DROP TABLE IF EXISTS `psbcalon_useraura`;
CREATE TABLE `psbcalon_useraura` (
  `UserId` int(15) NOT NULL AUTO_INCREMENT,
  `user` varchar(250) NOT NULL DEFAULT '',
  `password` text NOT NULL,
  `email` varchar(250) NOT NULL DEFAULT '',
  `avatar` varchar(250) NOT NULL DEFAULT '',
  `level` enum('Administrator','User') NOT NULL DEFAULT 'Administrator',
  `tipe` varchar(250) NOT NULL DEFAULT '',
  `is_online` int(5) NOT NULL DEFAULT '0',
  `last_ping` text NOT NULL,
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `biodata` text NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

#
# Data for table "psbcalon_useraura"
#

/*!40000 ALTER TABLE `psbcalon_useraura` DISABLE KEYS */;
INSERT INTO `psbcalon_useraura` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','admin@elyon.sch.id','af0675a9e843c6c8f78163a9118efc78.jpg','Administrator','aktif',1,'2015-05-12 09:15:46','2010-08-27 00:00:00','2034-08-27 00:00:00','<p><b>none</b></p>'),(28,'superadmin','b11d5ece6353d17f85c5ad30e0a02360','rekysda@gmail.com','','Administrator','aktif',1,'2015-03-21 23:05:28','0000-00-00 00:00:00','0000-00-00 00:00:00',''),(29,'user','ee11cbb19052e40b07aac0ca060c23ee','user@user.com','','User','aktif',0,'','0000-00-00 00:00:00','0000-00-00 00:00:00','');
/*!40000 ALTER TABLE `psbcalon_useraura` ENABLE KEYS */;

