/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : josh

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-07-08 16:00:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for psb_angsuran
-- ----------------------------
DROP TABLE IF EXISTS `psb_angsuran`;
CREATE TABLE `psb_angsuran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cicilan` int(11) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`,`cicilan`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_angsuran
-- ----------------------------
INSERT INTO `psb_angsuran` VALUES ('1', '1', 'in house pertama');
INSERT INTO `psb_angsuran` VALUES ('2', '2', 'in house kedua');
INSERT INTO `psb_angsuran` VALUES ('3', '3', 'in house ketiga');
INSERT INTO `psb_angsuran` VALUES ('4', '4', '');
INSERT INTO `psb_angsuran` VALUES ('5', '5', '');
INSERT INTO `psb_angsuran` VALUES ('6', '6', '');
INSERT INTO `psb_angsuran` VALUES ('7', '7', '');
INSERT INTO `psb_angsuran` VALUES ('8', '8', '');
INSERT INTO `psb_angsuran` VALUES ('9', '9', '');
INSERT INTO `psb_angsuran` VALUES ('10', '10', '');
INSERT INTO `psb_angsuran` VALUES ('11', '11', '');
INSERT INTO `psb_angsuran` VALUES ('12', '12', '');

-- ----------------------------
-- Table structure for psb_calonsiswa
-- ----------------------------
DROP TABLE IF EXISTS `psb_calonsiswa`;
CREATE TABLE `psb_calonsiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nopendaftaran` varchar(20) NOT NULL,
  `noformulir` varchar(20) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `kelas` int(10) unsigned NOT NULL DEFAULT '0',
  `idsiswa` int(10) unsigned NOT NULL DEFAULT '0',
  `panggilan` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `tahunmasuk` int(10) unsigned NOT NULL,
  `sekolahasal` varchar(100) NOT NULL,
  `proses` int(10) unsigned NOT NULL DEFAULT '0',
  `kelompok` int(10) unsigned NOT NULL DEFAULT '0',
  `kriteria` int(10) unsigned NOT NULL DEFAULT '0',
  `golongan` int(10) unsigned NOT NULL DEFAULT '0',
  `suku` int(10) unsigned NOT NULL DEFAULT '0',
  `agama` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `kondisi` int(10) unsigned NOT NULL DEFAULT '0',
  `kelamin` varchar(1) NOT NULL,
  `tmplahir` varchar(50) NOT NULL,
  `tgllahir` date NOT NULL,
  `warga` varchar(5) DEFAULT NULL,
  `anakke` tinyint(2) unsigned DEFAULT '0',
  `jsaudara` tinyint(2) unsigned DEFAULT '0',
  `bahasa` varchar(60) DEFAULT NULL,
  `berat` decimal(4,1) unsigned DEFAULT '0.0',
  `tinggi` decimal(4,1) unsigned DEFAULT '0.0',
  `darah` varchar(2) DEFAULT NULL,
  `photo` blob NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `kodepos` varchar(8) DEFAULT NULL,
  `telpon` varchar(20) DEFAULT NULL,
  `pinbb` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `kesehatan` varchar(300) DEFAULT NULL,
  `ketkesehatan` varchar(300) NOT NULL,
  `asalsekolah` varchar(100) DEFAULT NULL,
  `ketsekolah` varchar(255) DEFAULT NULL,
  `diterimadikelas` varchar(25) DEFAULT NULL,
  `ijazah` varchar(55) DEFAULT NULL,
  `keterangan` text,
  `sumpokok` decimal(10,0) DEFAULT '0',
  `sumnet` decimal(10,0) NOT NULL DEFAULT '0',
  `disctb` decimal(10,0) DEFAULT '0',
  `discsaudara` decimal(10,0) DEFAULT '0',
  `disctunai` decimal(10,0) DEFAULT '0',
  `disctotal` decimal(10,0) NOT NULL DEFAULT '0',
  `denda` decimal(10,0) DEFAULT '0',
  `angsuran` decimal(10,0) NOT NULL DEFAULT '0',
  `jmlangsur` int(10) unsigned NOT NULL DEFAULT '1',
  `sppbulan` decimal(10,0) NOT NULL DEFAULT '0',
  `ujian1` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian2` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian3` decimal(5,2) NOT NULL DEFAULT '0.00',
  `bayar` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`nopendaftaran`),
  UNIQUE KEY `UX_calonsiswa_replid` (`replid`),
  KEY `FK_calonsiswa_prosespenerimaansiswa` (`proses`),
  KEY `FK_calonsiswa_kelompokcalonsiswa` (`kelompok`),
  KEY `FK_calonsiswa_suku` (`suku`),
  KEY `FK_calonsiswa_agama` (`agama`),
  KEY `FK_calonsiswa_statusiswa` (`status`),
  KEY `FK_calonsiswa_asalsekolah` (`asalsekolah`),
  KEY `FK_calonsiswa_kondisisiswa` (`kondisi`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_calonsiswa
-- ----------------------------
INSERT INTO `psb_calonsiswa` VALUES ('6', 'PMB2014140001', null, 'Kaitlynn Tiffany L.', '0', '9', null, '1', '0', '', '2', '2', '1', '2', '0', '0', '1', '0', 'P', 'Surabaya', '2012-11-10', null, '0', '0', null, '0.0', '0.0', '-', '', 'Delta Raya IV/12 Sidoarjo', null, '0811909765', null, null, '', '', null, null, null, null, null, '0', '0', '0', '0', '5', '5', '0', '100', '1', '500000', '0.00', '0.00', '0.00', '1');
INSERT INTO `psb_calonsiswa` VALUES ('7', 'PMB2014140007', null, 'Trevor Yongnardi', '0', '0', null, '1', '0', 'Bumble Bee', '2', '2', '0', '2', '0', '5', '0', '0', 'L', '', '2011-10-10', null, '0', '0', null, '0.0', '0.0', '-', '', 'Darmo Indah Timur G59', null, '085731316399', null, null, '', '', null, null, null, null, null, '14000000', '11304995', '2100000', '595000', '5', '2695005', '0', '11305000', '1', '1000000', '0.00', '0.00', '0.00', '1');
INSERT INTO `psb_calonsiswa` VALUES ('8', 'PMB2014140008', null, 'Sean Kennard Sebastian Ho', '0', '0', null, '1', '0', '', '2', '2', '0', '2', '0', '5', '0', '0', 'L', 'Surabaya', '2012-05-07', null, '0', '0', null, '0.0', '0.0', '-', '', 'Ngagel Jaya Selatan E28 Surabaya', null, '085706331688', null, null, '', '', null, null, null, null, null, '14000000', '11304995', '2100000', '595000', '5', '2695005', '0', '11305000', '1', '1000000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('9', 'PMB2014140009', null, 'Chelsey Felicia Sugianto', '0', '0', null, '1', '0', '', '2', '9', '5', '2', '0', '5', '0', '0', 'P', 'Surabaya', '2008-02-18', null, '0', '0', null, '0.0', '0.0', '-', '', 'Satelit Timur II Blok JJ-12', null, '5320745', null, null, '', '', null, null, null, null, null, '37500000', '31875000', '0', '0', '15', '5625000', '0', '31875000', '1', '1700000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('11', 'PMB2014140010', null, 'Kayla Aprillia Tanujaya', '0', '0', null, '1', '0', '', '2', '2', '0', '2', '0', '5', '0', '0', 'P', 'Surabaya', '2012-04-22', null, '0', '0', null, '0.0', '0.0', '-', '', 'Satelit Indah IX/GN-18', null, '70109151', null, null, '', '', null, null, null, null, null, '66500000', '47381245', '16625000', '2493750', '5', '19118755', '0', '47381300', '1', '1000000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('14', 'PMB2014140014', null, 'Luke Caesar Njoto Imanuel', '0', '0', null, '1', '0', '', '2', '2', '0', '2', '0', '5', '0', '0', 'L', 'Surabaya', '2012-05-14', null, '0', '0', null, '0.0', '0.0', '-', '', 'Petemon I/97 Surabaya', null, '70704437', null, null, '', '', null, null, null, null, null, '14000000', '10639995', '2800000', '560000', '5', '3360005', '0', '10640000', '1', '1000000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('15', 'PMB2014140015', null, 'Ezell Dean Nugroho', '0', '0', null, '1', '0', '', '2', '2', '0', '2', '0', '5', '0', '0', 'L', 'Surabaya', '2011-09-28', null, '0', '0', null, '0.0', '0.0', '-', '', 'Woodland WL II no.70 Citraland', null, '', null, null, '', '', null, null, null, null, null, '14000000', '11899995', '2100000', '0', '5', '2100005', '0', '11900000', '1', '1000000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('16', 'PMB2014140016', null, 'Kate Massey Tunggala', '0', '0', null, '1', '0', '', '2', '2', '0', '2', '0', '5', '0', '0', 'P', 'Surabaya', '2011-08-29', null, '0', '0', null, '0.0', '0.0', '-', '', 'Donowati V/43', null, '081333666000', null, null, '', '', null, null, null, null, null, '29000000', '23199995', '5800000', '0', '5', '5800005', '0', '23200000', '1', '1000000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('17', 'PMB2014140017', null, 'Florence Christalyn Tansah', '0', '0', null, '1', '0', '', '2', '2', '0', '2', '0', '5', '0', '0', 'P', 'Surabaya', '2011-08-03', null, '0', '0', null, '0.0', '0.0', '-', '', 'Puri Sentra Raya PS1 / 53E Citraland', null, '082333378888', null, null, '', '', null, null, null, null, null, '22000000', '17599995', '4400000', '0', '5', '4400005', '0', '17600000', '1', '1100000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('18', 'PMB2014140018', null, 'Helena Serafi Xue', '0', '0', null, '1', '0', '', '2', '2', '0', '2', '0', '5', '0', '0', 'P', 'Surabaya', '2011-09-24', null, '0', '0', null, '0.0', '0.0', '-', '', 'Darmo Green Garden B9', null, '7324908', null, null, '', '', null, null, null, null, null, '22000000', '16719995', '4400000', '880000', '5', '5280005', '0', '16720000', '1', '1100000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('19', 'PMB2014140019', null, 'Joel Fabrizio Hanjaya', '0', '0', null, '1', '0', '', '2', '2', '0', '1', '0', '5', '0', '0', 'L', 'Surabaya', '2011-02-18', null, '0', '0', null, '0.0', '0.0', '-', '', 'Darmo Permai Utara XI / 18', null, '7317577', null, null, '', '', null, null, null, null, null, '0', '0', '0', '0', '5', '0', '0', '0', '1', '1100000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('20', 'PMB2014140020', null, 'Jayden Anthony Theios', '0', '0', null, '1', '0', '', '2', '2', '0', '2', '0', '5', '0', '0', 'L', 'Surabaya', '2011-10-24', null, '0', '0', null, '0.0', '0.0', '-', '', 'Banyu Urip Wetan 5/95', null, '5676091', null, null, '', '', null, null, null, null, null, '7000000', '5599995', '1400000', '0', '5', '1400005', '0', '5600000', '1', '1100000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('21', 'PMB2014140021', null, 'Haven Mae Sutiono', '0', '0', null, '1', '0', 'Gracia Preschool Citraraya', '2', '2', '0', '2', '0', '5', '0', '0', 'L', 'Surabaya', '2011-10-26', null, '0', '0', null, '0.0', '0.0', '-', '', 'Pakis Argosari VII/51', null, '5685314', null, null, '', '', null, null, null, null, null, '7000000', '5949995', '1050000', '0', '5', '1050005', '0', '5950000', '1', '1100000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('22', 'PMB2014140022', null, 'Genevieve Ganda', '0', '0', null, '1', '0', '', '2', '2', '9', '5', '0', '5', '0', '0', 'P', 'Surabaya', '2010-06-01', null, '0', '0', null, '0.0', '0.0', '-', '', 'Graha Family N47', null, '0818320768', null, null, '', '', null, null, null, null, null, '7000000', '6650000', '0', '0', '5', '350000', '0', '6650000', '1', '1100000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('23', 'PMB2014140023', null, 'Megan Wu', '0', '0', null, '1', '0', '', '2', '2', '9', '2', '0', '5', '0', '0', 'P', 'Surabaya', '2011-10-01', null, '0', '0', null, '0.0', '0.0', '-', '', 'Tanjungsari Baru I/12', null, '081934626676', null, null, '', '', null, null, null, null, null, '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('24', 'PMB2014140024', null, 'Aishlyn Arianna Tejakusuma', '0', '0', null, '1', '0', '', '2', '3', '9', '2', '0', '5', '0', '0', 'P', 'Surabaya', '2011-07-21', null, '0', '0', null, '0.0', '0.0', '-', '', 'Satelit Indah 3 LN 5', null, '081703434393', null, null, '', '', null, null, null, null, null, '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('25', 'PMB2014140025', null, 'Raelene Michelina Budiman', '0', '0', null, '1', '0', '', '2', '2', '9', '2', '0', '4', '0', '0', 'P', 'Surabaya', '2011-06-21', null, '0', '0', null, '0.0', '0.0', '-', '', 'Taman Puspa Raya B6/19 Citraland Surabaya', null, '70581663', null, null, '', '', null, null, null, null, null, '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('27', 'PMB2014140027', null, 'Frederick Sutendy', '0', '0', null, '1', '0', '', '2', '3', '4', '2', '0', '5', '0', '0', 'L', 'Surabaya', '2010-05-03', null, '0', '0', null, '0.0', '0.0', '-', '', 'Dupak 17 Blok B14 Komplek Ruko Pasifik Megah, Surabaya', null, '', null, null, '', '', null, null, null, null, null, '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('28', 'PMB2014140028', null, 'Victor Fu', '0', '0', null, '1', '0', '', '2', '2', '4', '2', '0', '5', '0', '0', 'L', 'Surabaya', '2010-08-24', null, '0', '0', null, '0.0', '0.0', '-', '', 'Royal Residence B9-187', null, '08121631513', null, null, '', '', null, null, null, null, null, '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('29', 'PMB2014140029', null, 'Hizkia Debharim Xue', '0', '0', null, '1', '0', 'Great Crystal International School', '2', '2', '10', '2', '0', '5', '0', '0', 'L', 'Surabaya', '2009-05-22', null, '0', '0', null, '0.0', '0.0', '-', '', 'Darmo Green Garden B9', null, '087822212573', null, null, '', '', null, null, null, null, null, '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('30', 'PMB2014140030', null, 'Kiersten Jane Priatman', '0', '0', null, '1', '0', 'Sun Surabaya Montessori School', '2', '2', '10', '2', '0', '5', '0', '0', 'P', 'Arcadia, A.S.', '2009-02-09', null, '0', '0', null, '0.0', '0.0', '-', '', 'Graha Family T70', null, '0817584826', null, null, '', '', null, null, null, null, null, '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('32', 'PMB2014140031', null, 'wang yu xin', '0', '0', null, '1', '0', '', '2', '3', '8', '2', '0', '0', '0', '0', 'L', '', '0000-00-00', null, '0', '0', null, '0.0', '0.0', '-', '', '', null, '', null, null, '', '', null, null, null, null, null, '14000000', '13300000', '0', '0', '5', '700000', '0', '13300000', '1', '1000000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('36', 'PMB2014140033', null, 'Kiyora Asami Prasetyo', '0', '0', null, '1', '0', 'Lollypop Preschool', '2', '9', '5', '2', '0', '5', '0', '0', 'P', '', '2008-08-08', null, '0', '0', null, '0.0', '0.0', '-', '', 'Jl. Tulung Agung 3/39', null, '0817335288', null, null, '', '', null, null, null, null, null, '37500000', '31875000', '0', '0', '15', '5625000', '0', '31875000', '1', '1800000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('37', 'PMB2014140037', null, 'Ferlyne Gabrielly Thie', '0', '0', null, '1', '0', 'Lollypop Preschool', '2', '9', '5', '2', '0', '0', '0', '0', 'P', '', '2008-04-24', null, '0', '0', null, '0.0', '0.0', '-', '', 'Pakuwon Indah the Mansion PF 4 No 8', null, '081357226181', null, null, '', '', null, null, null, null, null, '37500000', '30281250', '0', '1593750', '15', '7218750', '0', '30281300', '1', '1710000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('38', 'PMB2014140038', null, 'Colin Cristo Harianto', '0', '0', null, '1', '0', 'Merlion', '2', '9', '5', '2', '0', '0', '0', '0', 'L', '', '2008-01-19', null, '0', '0', null, '0.0', '0.0', '-', '', 'Wisata Bukit Mas E3/10', null, '0818372591', null, null, '', '', null, null, null, null, null, '37500000', '31875000', '0', '0', '15', '5625000', '0', '31875000', '1', '1800000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('39', 'PMB2014140039', null, 'Hacken Wunadi', '0', '0', null, '1', '0', 'Happy Family School', '2', '9', '5', '2', '0', '0', '0', '0', 'L', '', '2008-09-07', null, '0', '0', null, '0.0', '0.0', '-', '', 'Graha Family R179A', null, '081233775900', null, null, '', '', null, null, null, null, null, '37500000', '30000000', '0', '0', '20', '7500000', '0', '30000000', '1', '0', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('40', 'PMB2014140040', null, 'Josevine Angeline Musa', '0', '0', null, '1', '0', 'Stepping stones', '2', '9', '5', '2', '0', '0', '0', '0', 'P', '', '2008-04-02', null, '0', '0', null, '0.0', '0.0', '-', '', 'Darmo permai Selatan XI/18', null, '70178869', null, null, '', '', null, null, null, null, null, '37500000', '31875000', '0', '0', '15', '5625000', '0', '3187500', '10', '0', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('41', 'PMB2014140041', null, 'Sharon A. Soempiet', '0', '0', null, '1', '0', 'Cambridge School', '2', '9', '5', '2', '0', '5', '0', '0', 'P', '', '2008-01-09', null, '0', '0', null, '0.0', '0.0', '-', '', 'Royal Residence B3-52A', null, '71227601', null, null, '', '', null, null, null, null, null, '37500000', '30281250', '0', '1593750', '15', '7218750', '0', '7570400', '4', '1710000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('42', 'PMB2014140042', null, 'Michelle Tanaya', '0', '0', null, '1', '0', '', '2', '9', '5', '2', '0', '0', '0', '0', 'P', '', '2008-07-28', null, '0', '0', null, '0.0', '0.0', '-', '', 'Jl. Tulung Agung 3/6', null, '59319420', null, null, '', '', null, null, null, null, null, '37500000', '31875000', '0', '0', '15', '5625000', '0', '31875000', '1', '1800000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('43', 'PMB2014140043', null, 'Jenevieve Clairine', '0', '0', null, '1', '0', 'JAC', '2', '9', '5', '2', '0', '0', '0', '0', 'P', '', '2008-07-14', null, '0', '0', null, '0.0', '0.0', '-', '', 'Taman Darmo Harapan II/GG II-C', null, '7317042', null, null, '', '', null, null, null, null, null, '37500000', '31875000', '0', '0', '15', '5625000', '0', '31875000', '1', '1800000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('44', 'PMB2014140044', null, 'Calista Gracious Susanto', '0', '0', null, '1', '0', 'Ivy School', '2', '9', '5', '2', '0', '0', '0', '0', 'P', '', '2008-07-13', null, '0', '0', null, '0.0', '0.0', '-', '', 'Wisata Bukit Indah C1-8', null, '70603754', null, null, '', '', null, null, null, null, null, '37500000', '30281250', '0', '1593750', '15', '7218750', '0', '5046900', '6', '1710000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('45', 'PMB2014140045', null, 'Grace Caroline Cahyono', '0', '0', null, '1', '0', 'Vita School', '2', '9', '5', '2', '0', '0', '0', '0', 'P', '', '2008-07-12', null, '0', '0', null, '0.0', '0.0', '-', '', 'San Diego M6-28 Pakuwon City', null, '08575506888', null, null, '', '', null, null, null, null, null, '37500000', '31875000', '0', '0', '15', '5625000', '0', '31875000', '1', '1800000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('46', 'PMB2014140046', null, 'Noel Nelson Felix', '0', '0', null, '1', '0', 'Town for kids', '2', '9', '5', '2', '0', '0', '0', '0', 'L', '', '2008-01-02', null, '0', '0', null, '0.0', '0.0', '-', '', 'Perum Darmo sentosa Raya Blok i-38', null, '71616111', null, null, '', '', null, null, null, null, null, '37500000', '30000000', '0', '0', '20', '7500000', '0', '30000000', '1', '1800000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('47', 'PMB2014140047', null, 'Filbert Wellington', '0', '0', null, '1', '0', 'Xin Zhong', '2', '9', '5', '2', '0', '0', '0', '0', 'L', '', '2008-05-14', null, '0', '0', null, '0.0', '0.0', '-', '', 'The Mansion PF-5/22', null, '71047493', null, null, '', '', null, null, null, null, null, '37500000', '30281250', '0', '1593750', '15', '7218750', '0', '30281300', '1', '1710000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('48', 'PMB2014140048', null, 'Ezekiel Shawn Wondo', '0', '0', null, '1', '0', 'Surabaya Grammar School', '2', '9', '5', '2', '0', '0', '0', '0', 'L', '', '2008-05-04', null, '0', '0', null, '0.0', '0.0', '-', '', 'Centra Park E-19', null, '70597500', null, null, '', '', null, null, null, null, null, '37500000', '31875000', '0', '0', '15', '5625000', '0', '31875000', '1', '1800000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('49', 'PMB2014140049', null, 'Gabriel Grace Ong', '0', '0', null, '1', '0', 'Merlion', '2', '9', '5', '2', '0', '5', '0', '0', 'P', '', '2008-07-09', null, '0', '0', null, '0.0', '0.0', '-', '', '', null, '70789099', null, null, '', '', null, null, null, null, null, '37500000', '30281250', '0', '1593750', '15', '7218750', '0', '30281300', '1', '1710000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('50', 'PMB2014140050', null, 'Fidelia Theodore Chang', '0', '0', null, '1', '0', 'Happy Family School', '2', '9', '5', '2', '0', '0', '0', '0', 'P', '', '2008-03-12', null, '0', '0', null, '0.0', '0.0', '-', '', 'Darmo Hill P-12', null, '081330716553', null, null, '', '', null, null, null, null, null, '37500000', '30281250', '0', '1593750', '15', '7218750', '0', '30281300', '1', '0', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('51', 'PMB2014140051', null, 'Emili Trecia Faustina', '0', '0', null, '1', '0', 'Little Sun', '2', '9', '5', '1', '0', '0', '0', '0', 'P', '', '2008-05-15', null, '0', '0', null, '0.0', '0.0', '-', '', 'Kranggan 102 kav 8', null, '5340131', null, null, '', '', null, null, null, null, null, '37500000', '31875000', '0', '0', '15', '5625000', '0', '31875000', '1', '1800000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('52', 'PMB2014140052', null, 'Janice Valerie Judianto', '0', '0', null, '1', '0', '', '2', '4', '5', '2', '0', '0', '0', '0', 'P', '', '2008-01-28', null, '0', '0', null, '0.0', '0.0', '-', '', 'OGT AB 11/58', null, '0811596881', null, null, '', '', null, null, null, null, null, '37500000', '33750000', '0', '0', '10', '3750000', '0', '33750000', '1', '1800000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('53', 'PMB2014140053', null, 'Christie Feodora Suanthie', '0', '0', null, '1', '0', 'Merlion', '2', '9', '5', '2', '0', '0', '0', '0', 'P', '', '2008-02-18', null, '0', '0', null, '0.0', '0.0', '-', '', 'Graha Family K-63', null, '082330036967', null, null, '', '', null, null, null, null, null, '37500000', '31875000', '0', '0', '15', '5625000', '0', '31875000', '1', '1800000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('54', 'PMB2014140054', null, 'Gycella Ciatawi', '0', '0', null, '1', '0', '', '2', '4', '5', '2', '0', '0', '0', '0', 'P', '', '2008-12-01', null, '0', '0', null, '0.0', '0.0', '-', '', 'Wiyung Indah 19 NN-1', null, '7674450', null, null, '', '', null, null, null, null, null, '37500000', '33750000', '0', '0', '10', '3750000', '0', '33750000', '1', '1800000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('55', 'PMB2014140055', null, 'Nicholas Michael', '0', '0', null, '1', '0', 'IPH', '2', '4', '1', '1', '0', '0', '0', '0', 'L', '', '2008-05-16', null, '0', '0', null, '0.0', '0.0', '-', '', 'Villa Bukit Regency 2 PD 3 no 5 Pakuwon', null, '7391868', null, null, '', '', null, null, null, null, null, '37500000', '33750000', '0', '0', '10', '3750000', '0', '33750000', '1', '0', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('56', 'PMB2014140056', null, 'Andrew Prasetyo', '0', '0', null, '1', '0', 'Merlion', '2', '4', '5', '1', '0', '0', '0', '0', 'L', '', '2008-04-16', null, '0', '0', null, '0.0', '0.0', '-', '', 'Margorejo Indah C-401A', null, '81965989', null, null, '', '', null, null, null, null, null, '37500000', '30281250', '0', '1593750', '15', '7218750', '0', '30281300', '1', '1800000', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('57', 'PMB2014140057', null, 'Ferdinand Christanto Thomas', '0', '0', null, '1', '0', 'Merlion', '2', '4', '5', '2', '0', '0', '0', '0', 'L', '', '2008-02-10', null, '0', '0', null, '0.0', '0.0', '-', '', 'Raya Mastrip Kemlaten 26A', null, '70627543', null, null, '', '', null, null, null, null, null, '37500000', '33750000', '0', '0', '10', '3750000', '0', '33750000', '1', '0', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('58', 'PMB2014140058', null, 'Patricia Michelle Rumoei', '0', '0', null, '1', '0', 'Tutor Time', '2', '4', '5', '2', '0', '0', '0', '0', 'P', '', '2008-04-01', null, '0', '0', null, '0.0', '0.0', '-', '', 'SDPT 2/2', null, '78207041', null, null, '', '', null, null, null, null, null, '37500000', '32062500', '0', '1687500', '10', '5437500', '0', '32062500', '1', '0', '0.00', '0.00', '0.00', '0');
INSERT INTO `psb_calonsiswa` VALUES ('59', 'PMB2014140059', null, 'Griffith Clairenova Wijaya', '0', '0', null, '1', '0', '', '2', '4', '5', '2', '0', '0', '0', '0', 'L', '', '2008-09-22', null, '0', '0', null, '0.0', '0.0', '-', '', '', null, '081316041316', null, null, '', '', null, null, null, null, null, '37500000', '33750000', '0', '0', '10', '3750000', '0', '33750000', '1', '0', '0.00', '0.00', '0.00', '0');

-- ----------------------------
-- Table structure for psb_calonsiswa_ayah
-- ----------------------------
DROP TABLE IF EXISTS `psb_calonsiswa_ayah`;
CREATE TABLE `psb_calonsiswa_ayah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tmplahir` varchar(50) NOT NULL,
  `tgllahir` date NOT NULL,
  `agama` int(10) unsigned NOT NULL DEFAULT '0',
  `warga` varchar(50) NOT NULL,
  `pendidikan` varchar(50) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `penghasilan` decimal(10,0) NOT NULL DEFAULT '0',
  `telpon` varchar(20) NOT NULL,
  `pinbb` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_calonsiswa_ayah
-- ----------------------------
INSERT INTO `psb_calonsiswa_ayah` VALUES ('1', '1', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('2', '2', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('3', '3', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('4', '4', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('5', '5', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('8', '7', 'Tony Yongnardi', 'Surabaya', '1975-12-26', '0', 'Indonesian', '', 'Merchant', '0', '081357676734', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('10', '8', 'Richard Sebastian Ho', 'Surabaya', '1972-06-30', '0', 'Indonesia', '', 'Karyawan Swasta', '0', '0818398989', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('12', '11', 'Denny Tanujaya', 'Surabaya', '1979-10-23', '0', 'Indonesia', '', 'Karyawan Swasta', '0', '70109151', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('15', '14', 'Luvit Njoto Kusuma Prawirodiharjo', 'Surabaya', '1983-05-20', '0', 'Indonesia', '', 'Wiraswasta', '0', '70156188', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('16', '15', 'Denny Osmond Nugroho', 'Surabaya', '1983-02-13', '0', 'Indonesia', '', 'Karyawan Swasta', '0', '085746047047', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('17', '16', 'Herman Prayogo Tunggala', 'Surabaya', '1985-11-19', '0', 'Indonesia', '', 'Wiraswasta', '0', '081333666000', '', 'L_9_va@hotmail.com');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('18', '17', 'Jemmy Tansah', 'Surabaya', '1976-06-10', '0', 'Indonesia', '', 'Wiraswasta', '0', '081333378888', '', 'jemmytansah@gmail.com');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('19', '18', 'Xue Lai Yuan', 'China', '1972-09-29', '0', 'Indonesia', '', 'Wiraswasta', '0', '081331016688', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('21', '20', 'Henry Theios', 'Makassar', '1979-03-06', '0', 'Indonesia', '', 'Wiraswasta', '0', '081330045153', '', 'henrytheios_140@yahoo.com');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('23', '21', 'Ronald Sutiono', 'Ujung Pandang', '1981-06-21', '0', 'Indonesia', '', 'Wiraswasta', '0', '085258270898', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('25', '19', 'Steven Julian Hanjaya', 'Surabaya', '1980-07-21', '0', 'Indonesia', '', 'Guru', '0', '085648888333', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('26', '22', 'Minarto Ganda', 'Surabaya', '1967-05-05', '0', 'Indonesia', '', 'Business', '0', '0811336100', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('27', '23', 'Hendra Gunawan', 'Surabaya', '1982-07-22', '0', 'Indonesia', '', 'Wirausahawan', '0', '70476058', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('28', '24', 'Ivan Haryono', 'Jakarta', '1992-11-11', '0', 'Indonesia', '', 'Wiraswasta', '0', '0818575817', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('29', '25', 'Handy Budiman', 'Surabaya', '1973-08-03', '0', 'Indonesia', '', 'Karyawan Swasta', '0', '0818328245', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('31', '27', 'Dedy Sutendy', 'Medan', '1978-09-19', '0', 'Indonesia', '', 'Karyawan Swasta', '0', '08123206771', '', 'akwank@yahoo.com');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('32', '28', 'Andi Sugeng Pornomo', 'Surabaya', '1979-05-21', '0', 'Indonesia', '', 'Wiraswasta', '0', '08165415741', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('33', '29', 'Xue Lai Yuan', 'China', '1972-09-29', '0', 'Indonesia', '', 'Karyawan Swasta', '0', '081331016688', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('34', '30', 'Ivan Priatman', 'Surabaya', '1984-07-09', '0', 'Indonesia', '', 'Architect', '0', '0818584826', '', 'ivan_priatman@yahoo.com');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('35', '32', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('39', '38', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('41', '39', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('42', '40', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('44', '37', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('46', '42', 'Hendry', '', '0000-00-00', '0', '', '', '', '0', '081331301211', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('54', '45', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('56', '47', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('57', '48', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('61', '49', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('62', '50', 'Daniel Chang', '', '0000-00-00', '0', '', '', '', '0', '082139568687', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('63', '51', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('64', '52', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('65', '53', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('66', '41', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('67', '9', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('68', '36', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('69', '43', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('70', '44', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('71', '46', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('72', '54', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('73', '55', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('74', '56', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('75', '57', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('76', '58', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('77', '59', 'Budi', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('78', '6', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');

-- ----------------------------
-- Table structure for psb_calonsiswa_ibu
-- ----------------------------
DROP TABLE IF EXISTS `psb_calonsiswa_ibu`;
CREATE TABLE `psb_calonsiswa_ibu` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tmplahir` varchar(50) NOT NULL,
  `tgllahir` date NOT NULL,
  `agama` int(10) unsigned NOT NULL DEFAULT '0',
  `warga` varchar(50) NOT NULL,
  `pendidikan` varchar(50) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `penghasilan` decimal(10,0) NOT NULL DEFAULT '0',
  `telpon` varchar(20) NOT NULL,
  `pinbb` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_calonsiswa_ibu
-- ----------------------------
INSERT INTO `psb_calonsiswa_ibu` VALUES ('1', '1', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('2', '2', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('3', '3', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('4', '4', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('5', '5', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('8', '7', 'Elshin Imelda', 'Surabaya', '1979-11-23', '0', 'Indonesian', '', 'House Wife', '0', '085731316399', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('10', '8', 'Susana', 'Kediri', '1981-03-28', '0', 'Indonesia', '', 'Apoteker', '0', '085706331688', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('12', '11', 'Moona Wintoro', 'Surabaya', '1983-11-08', '0', 'Indonesia', '', 'Ibu Rumah Tangga', '0', '08563478824', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('15', '14', 'Chynthia', 'Surabaya', '1982-05-28', '0', 'Indonesia', '', 'Ibu Rumah Tangga', '0', '081331810283', '', 'christ_mybabyboy_c82@yahoo.com');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('16', '15', 'Astried Aprilia', 'Malang', '1984-04-06', '0', 'Indonesia', '', 'Ibu Rumah Tangga', '0', '085645437208', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('17', '16', 'Rebeca Michelle Gunawan', 'Surabaya', '1989-07-22', '0', 'Indonesia', '', 'Karyawan Swasta', '0', '08223309888', '', 'rebeca.michelle89@hotmail.com');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('18', '17', 'Diana Oktavia', 'Banyuwangi', '1986-10-06', '0', 'Indonesia', '', 'Ibu Rumah Tangga', '0', '082333378888', '', 'dianaoktavia86@yahoo.com');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('19', '18', 'Ita Suryandari', 'Bandung', '1980-11-05', '0', 'Indonesia', '', 'Ibu Rumah Tangga', '0', '087822212573', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('21', '20', 'Selvy Fantoro', 'Surabaya', '1980-01-20', '0', 'Indonesia', '', 'Ibu Rumah Tangga', '0', '', '', 'slv.fantoro@yahoo.com');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('23', '21', 'Eunice Soerjohadi', 'Surabaya', '1981-08-24', '0', 'Indonesia', '', 'Ibu Rumah Tangga', '0', '0811325885', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('25', '19', 'Olivia', 'Surabaya', '1983-10-25', '0', 'Indonesia', '', 'Guru', '0', '089678082511', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('26', '22', 'Caroline Haryono', 'Surabaya', '1971-02-08', '0', 'Indonesia', '', 'Ibu Rumah Tangga', '0', '0818320768', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('27', '23', 'Fonny Limanto', 'Surabaya', '1983-02-13', '0', 'Indonesia', '', 'Ibu Rumah Tangga', '0', '081934626676', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('28', '24', 'Novita Sandra Santoso', 'Bojonegoro', '1992-02-28', '0', 'Indonesia', '', 'wiraswasta', '0', '081703434393', '', 'nobita_sansan@hotmail.com');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('29', '25', 'Lili Feliana', 'Mojokerto', '1976-02-18', '0', 'Indonesia', '', 'Ibu Rumah Tangga', '0', '087853331072', '', 'lili.feliana@gmail.com');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('31', '27', 'Jenny OKtavia', 'Surabaya', '1978-10-25', '0', 'Indonesia', '', 'Ibu Rumah Tangga', '0', '082143311743', '', 'ahuajenny@gmail.com');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('32', '28', 'Serli Natalia', 'Surabaya', '1980-06-12', '0', 'Indonesia', '', 'Karyawan Swasta', '0', '08121631513', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('33', '29', 'Ita Suryandari', 'Bandung', '1980-11-05', '0', 'Indonesia', '', 'Ibu Rumah Tangga', '0', '087822212573', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('34', '30', 'Cecilia Marquerita Widjaja', 'Surabaya', '1984-10-09', '0', 'Indonesia', '', 'Karyawan Swasta', '0', '0817584826', '', 'ceciliawidjaja@yahoo.com');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('35', '32', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('39', '38', 'Lesly', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('41', '39', 'Shelly', '', '0000-00-00', '0', '', '', '', '0', '081233775900', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('42', '40', 'Jelly', '', '0000-00-00', '0', '', '', '', '0', '082139808988', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('44', '37', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('46', '42', 'Jenny', '', '0000-00-00', '0', '', '', '', '0', '081331718181', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('54', '45', 'Martinah', '', '0000-00-00', '0', '', '', '', '0', '081357179005', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('56', '47', 'Silvya', '', '0000-00-00', '0', '', '', '', '0', '081217893893', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('57', '48', 'Yuvita', '', '0000-00-00', '0', '', '', '', '0', '087854998555', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('61', '49', 'Elvin', '', '0000-00-00', '0', '', '', '', '0', '0817109899', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('62', '50', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('63', '51', 'Rita', '', '0000-00-00', '0', '', '', '', '0', '085931375800', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('64', '52', 'Lily', '', '0000-00-00', '0', '', '', '', '0', '082131882688', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('65', '53', 'Henny', '', '0000-00-00', '0', '', '', '', '0', '081357179005', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('66', '41', 'Kwince', '', '0000-00-00', '0', '', '', '', '0', '71227601', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('67', '9', 'Meliani', '', '0000-00-00', '0', '', '', '', '0', '709919099', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('68', '36', 'Lani', '', '0000-00-00', '0', '', '', '', '0', '91127223', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('69', '43', 'Rose', '', '2008-07-14', '0', '', '', '', '0', '081330532568', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('70', '44', 'Vonny', '', '0000-00-00', '0', '', '', '', '0', '081227728000', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('71', '46', 'Anik', '', '0000-00-00', '0', '', '', '', '0', '087727272761', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('72', '54', 'Ai Tjhen', '', '0000-00-00', '0', '', '', '', '0', '72077508', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('73', '55', 'Devy', '', '0000-00-00', '0', '', '', '', '0', '0816615880', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('74', '56', 'Rusnia', '', '0000-00-00', '0', '', '', '', '0', '08977330222', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('75', '57', 'Yuliana', '', '0000-00-00', '0', '', '', '', '0', '08123503117', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('76', '58', 'Lina', '', '0000-00-00', '0', '', '', '', '0', '08133067800', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('77', '59', 'Lina', '', '0000-00-00', '0', '', '', '', '0', '081234560530', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('78', '6', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');

-- ----------------------------
-- Table structure for psb_calonsiswa_keluarga
-- ----------------------------
DROP TABLE IF EXISTS `psb_calonsiswa_keluarga`;
CREATE TABLE `psb_calonsiswa_keluarga` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `kakek-nama` varchar(100) NOT NULL,
  `kakek-tgllahir` date NOT NULL,
  `nenek-nama` varchar(100) NOT NULL,
  `nenek-tgllahir` date NOT NULL,
  `tglnikah` date NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_calonsiswa_keluarga
-- ----------------------------
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('1', '1', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('2', '2', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('3', '3', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('4', '4', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('5', '5', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('8', '7', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('10', '8', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('12', '11', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('15', '14', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('16', '15', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('17', '16', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('18', '17', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('19', '18', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('21', '20', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('23', '21', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('25', '19', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('26', '22', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('27', '23', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('28', '24', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('29', '25', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('31', '27', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('32', '28', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('33', '29', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('34', '30', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('35', '32', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('39', '38', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('41', '39', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('42', '40', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('44', '37', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('46', '42', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('54', '45', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('56', '47', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('57', '48', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('61', '49', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('62', '50', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('63', '51', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('64', '52', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('65', '53', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('66', '41', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('67', '9', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('68', '36', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('69', '43', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('70', '44', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('71', '46', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('72', '54', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('73', '55', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('74', '56', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('75', '57', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('76', '58', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('77', '59', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('78', '6', '', '0000-00-00', '', '0000-00-00', '0000-00-00');

-- ----------------------------
-- Table structure for psb_calonsiswa_kontakdarurat
-- ----------------------------
DROP TABLE IF EXISTS `psb_calonsiswa_kontakdarurat`;
CREATE TABLE `psb_calonsiswa_kontakdarurat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `hubungan` varchar(30) NOT NULL,
  `telpon` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_calonsiswa_kontakdarurat
-- ----------------------------
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('1', '1', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('2', '2', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('3', '3', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('4', '4', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('5', '5', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('8', '7', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('10', '8', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('12', '11', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('15', '14', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('16', '15', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('17', '16', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('18', '17', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('19', '18', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('21', '20', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('23', '21', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('25', '19', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('26', '22', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('27', '23', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('28', '24', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('29', '25', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('31', '27', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('32', '28', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('33', '29', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('34', '30', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('35', '32', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('39', '38', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('41', '39', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('42', '40', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('44', '37', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('46', '42', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('54', '45', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('56', '47', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('57', '48', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('61', '49', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('62', '50', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('63', '51', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('64', '52', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('65', '53', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('66', '41', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('67', '9', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('68', '36', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('69', '43', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('70', '44', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('71', '46', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('72', '54', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('73', '55', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('74', '56', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('75', '57', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('76', '58', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('77', '59', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('78', '6', '', '', '');

-- ----------------------------
-- Table structure for psb_calonsiswa_saudara
-- ----------------------------
DROP TABLE IF EXISTS `psb_calonsiswa_saudara`;
CREATE TABLE `psb_calonsiswa_saudara` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tgllahir` date NOT NULL,
  `sekolah` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_calonsiswa_saudara
-- ----------------------------
INSERT INTO `psb_calonsiswa_saudara` VALUES ('3', '49', 'Geoffrey Daniel Ong', '2006-05-13', 'Elyon International Christian School');
INSERT INTO `psb_calonsiswa_saudara` VALUES ('4', '41', 'Regina Soempiet', '2006-06-12', 'Elyon International Christian School');
INSERT INTO `psb_calonsiswa_saudara` VALUES ('5', '44', 'Davide William Susanto', '2006-12-01', 'Elyon International Christian School');

-- ----------------------------
-- Table structure for psb_calonsiswa_syarat
-- ----------------------------
DROP TABLE IF EXISTS `psb_calonsiswa_syarat`;
CREATE TABLE `psb_calonsiswa_syarat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `syarat` int(10) unsigned NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_calonsiswa_syarat
-- ----------------------------

-- ----------------------------
-- Table structure for psb_disctunai
-- ----------------------------
DROP TABLE IF EXISTS `psb_disctunai`;
CREATE TABLE `psb_disctunai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nilai` decimal(10,0) unsigned NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`,`nilai`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_disctunai
-- ----------------------------
INSERT INTO `psb_disctunai` VALUES ('1', '10', '( DPP ) Second Intake // ( SPP ) untuk anak ke 3 berdasarkan urutan kelahiran // ( SPP ) untuk ortu jemaat aktif GKA Elyon // ( SPP ) untuk anak sekolah minggu aktif GKA Elyon');
INSERT INTO `psb_disctunai` VALUES ('2', '5', 'Tambahan subsidi ( DPP ) untuk anak ke 2 dan selanjutnya // ( SPP ) untuk anak ke 2 berdasarkan urutan kelahiran');
INSERT INTO `psb_disctunai` VALUES ('3', '50', 'Subsidi ( DPP ) untuk hamba Tuhan di luar GKA Elyon & Calon Siswa Baru Secondary\n\n// ( DPP ) untuk : Guru full timer,staff,Kepsek, dengan masa kerja kurang dari 2 th');
INSERT INTO `psb_disctunai` VALUES ('5', '15', '( DPP ) First Intake, Siswa Baru High School // ( SPP ) anak ke 4 sesuai urutan kelahiran, High School 2 th ajaran, siswa secondary suko 1 th ajaran');
INSERT INTO `psb_disctunai` VALUES ('6', '20', '( DPP ) second intake untuk siswa dalam // ( SPP ) ortu jemaat & anak sekolah minggu ELYON, secondary rungkut 2 th ajaran // Permohonan khusus melalui disposisi untuk siswa baru yg memiliki sibling');
INSERT INTO `psb_disctunai` VALUES ('7', '25', '( DPP ) First Intake naik jenjang');
INSERT INTO `psb_disctunai` VALUES ('8', '40', '( DPP ) JAPRES');
INSERT INTO `psb_disctunai` VALUES ('9', '80', '( SPP ) pengurus PPK Elyon, Hamba Tuhan GKA Elyon, Guru Full Timer, Staff, Kepsek');

-- ----------------------------
-- Table structure for psb_golongan
-- ----------------------------
DROP TABLE IF EXISTS `psb_golongan`;
CREATE TABLE `psb_golongan` (
  `replid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `golongan` varchar(150) DEFAULT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `urut` int(10) unsigned DEFAULT '1',
  UNIQUE KEY `replid` (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_golongan
-- ----------------------------
INSERT INTO `psb_golongan` VALUES ('1', 'Anak Guru & Staf', 'Anak guru, staf, karyawan aktif Elyon dengan masa kerja lebih dari 2 tahun', '1');
INSERT INTO `psb_golongan` VALUES ('2', 'Umum', 'Masyarakat umum', '1');
INSERT INTO `psb_golongan` VALUES ('3', 'Jemaat Elyon', 'Anggota jemaat GKA Elyon', '1');
INSERT INTO `psb_golongan` VALUES ('4', 'Anak Hamba Tuhan', 'Anak hamba Tuhan, Pendeta aktif dari gereja lain.', '1');
INSERT INTO `psb_golongan` VALUES ('5', 'Anak Pengurus PPKE', 'Anak Pengurus aktif dari Perhimpunan Pendidikan Kristen Elyon', '1');
INSERT INTO `psb_golongan` VALUES ('6', 'Jalur Prestasi', 'Akademik, sports, musik', '1');
INSERT INTO `psb_golongan` VALUES ('7', 'Anak Guru & Staf', 'Anak guru, staf, karyawan aktif Elyon dengan masa kerja kurang dan sama dengan 2 tahun', '1');

-- ----------------------------
-- Table structure for psb_kelompok
-- ----------------------------
DROP TABLE IF EXISTS `psb_kelompok`;
CREATE TABLE `psb_kelompok` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(100) NOT NULL,
  `proses` int(10) unsigned NOT NULL,
  `tglmulai` date NOT NULL DEFAULT '0000-00-00',
  `tglselesai` date NOT NULL DEFAULT '0000-00-00',
  `biaya` decimal(10,0) NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `FK_kelompokcalonsiswa_prosespenerimaansiswa` (`proses`),
  KEY `IX_kelompokcalonsiswa_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_kelompok
-- ----------------------------
INSERT INTO `psb_kelompok` VALUES ('2', 'First Intake (Toodler - PG - KG)', '2', '2013-10-01', '2013-12-31', '300000', 'Uang Formulir / Registration Form Fee', '2014-03-19 12:50:05');
INSERT INTO `psb_kelompok` VALUES ('3', 'Second Intake  (Toodler - PG - KG)', '2', '2014-01-01', '2014-06-30', '300000', 'Uang Formulir/Registration Form Fee', '2014-03-19 12:50:47');
INSERT INTO `psb_kelompok` VALUES ('4', 'Second Intake (Primary Level)', '2', '2014-01-01', '2014-06-30', '400000', 'Uang Formulir/Registration Form Fee', '2014-03-19 12:51:16');
INSERT INTO `psb_kelompok` VALUES ('5', 'First Intake', '3', '2013-09-01', '0000-00-00', '350000', '', '2014-03-19 12:51:43');
INSERT INTO `psb_kelompok` VALUES ('6', 'Second Intake', '3', '2013-11-01', '0000-00-00', '350000', '', '2014-03-19 12:52:06');
INSERT INTO `psb_kelompok` VALUES ('7', 'Third Intake', '3', '2014-01-01', '0000-00-00', '350000', '', '2014-03-19 12:52:32');
INSERT INTO `psb_kelompok` VALUES ('8', 'First Intake', '4', '2013-09-01', '0000-00-00', '350000', '', '2014-03-19 12:55:46');
INSERT INTO `psb_kelompok` VALUES ('9', 'First Intake (Primary Level)', '2', '2013-10-01', '2013-12-31', '400000', 'Uang Formulir/Registration Form Fee', '2014-03-24 09:24:39');
INSERT INTO `psb_kelompok` VALUES ('10', 'First Intake (High School)', '2', '2013-10-01', '2013-12-01', '500000', 'Uang Formulir/Registration Form Fee', '2014-03-24 09:26:33');
INSERT INTO `psb_kelompok` VALUES ('11', 'Second Intake ( High School)', '2', '2014-01-01', '2014-06-30', '500000', 'Uang Formulir/Registration Form Fee', '2014-03-24 09:34:59');
INSERT INTO `psb_kelompok` VALUES ('12', 'First Intake (Secondary level)', '2', '2013-10-01', '2014-12-31', '400000', 'Uang Formulir/ Registration Form Fee', '2014-04-15 13:40:49');
INSERT INTO `psb_kelompok` VALUES ('13', 'Second Intake ( Secondary Level)', '2', '2014-01-01', '2014-06-30', '400000', 'Uang Formulir/Registration Form Fee', '2014-04-15 13:44:31');
INSERT INTO `psb_kelompok` VALUES ('14', 'First Intake (Toodler PG/KG )', '5', '2014-10-01', '2014-12-31', '300000', '', '2015-01-19 16:13:33');
INSERT INTO `psb_kelompok` VALUES ('15', 'First Intake ( Primary Level )', '5', '2014-10-01', '2014-12-31', '400000', '', '2015-01-19 16:15:04');
INSERT INTO `psb_kelompok` VALUES ('16', 'First Intake ( Secondary Level )', '5', '2014-10-01', '2014-12-31', '400000', '', '2015-01-19 16:16:20');
INSERT INTO `psb_kelompok` VALUES ('17', 'Fisrt Intake ( High School Level )', '5', '2014-10-01', '2014-12-31', '500000', '', '2015-01-19 16:17:11');
INSERT INTO `psb_kelompok` VALUES ('18', 'Second Intake ( Toodler PG/KG )', '5', '2015-01-01', '2015-06-30', '300000', '', '2015-01-19 16:18:20');
INSERT INTO `psb_kelompok` VALUES ('19', 'Second Intake ( Primary Level )', '5', '2015-01-01', '2015-06-30', '400000', '', '2015-01-19 16:19:53');
INSERT INTO `psb_kelompok` VALUES ('20', 'Second Intake ( Secondary Level )', '5', '2015-01-01', '2015-06-30', '400000', '', '2015-01-19 16:20:40');
INSERT INTO `psb_kelompok` VALUES ('21', 'Second Intake ( High School Level )', '5', '2015-01-01', '2015-06-30', '500000', '', '2015-01-19 16:21:19');

-- ----------------------------
-- Table structure for psb_kondisisiswa
-- ----------------------------
DROP TABLE IF EXISTS `psb_kondisisiswa`;
CREATE TABLE `psb_kondisisiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kondisi` varchar(100) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_kondisisiswa` (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_kondisisiswa
-- ----------------------------

-- ----------------------------
-- Table structure for psb_kriteria
-- ----------------------------
DROP TABLE IF EXISTS `psb_kriteria`;
CREATE TABLE `psb_kriteria` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kriteria` varchar(150) DEFAULT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `urut` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `replid` (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_kriteria
-- ----------------------------
INSERT INTO `psb_kriteria` VALUES ('1', 'Toddler - PG B', 'Usia 1 tahun - 3 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('4', 'Kindergarten A - B', 'Usia 4 tahun - 5 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('5', 'Primary 1', 'Usia 6 tahun - 7 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('6', 'Secondary 1 - 3', 'Usia 12 tahun - 14 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('7', 'High School', 'Usia 16 tahun - 17 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('8', 'Playgroup A - B', 'Usia 2 tahun - 3 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('9', 'Playgroup B', 'Usia 3 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('10', 'Kindergarten B', 'Usia 5 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('12', 'Primary 2', 'Usia 7 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('13', 'Primary 3', 'Usia 8 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('14', 'Primary 4', 'Usia 9 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('15', 'Primary 5', 'Usia 10 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('16', 'Primary 6', 'Usia 11 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('17', 'Secondary 2', 'Usia 13 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('18', 'Secondary 3', 'Usia 14 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('19', 'Secondary 4', 'Usia 15 tahun', '1');

-- ----------------------------
-- Table structure for psb_photo
-- ----------------------------
DROP TABLE IF EXISTS `psb_photo`;
CREATE TABLE `psb_photo` (
  `dcid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `photo` mediumblob NOT NULL,
  PRIMARY KEY (`dcid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_photo
-- ----------------------------

-- ----------------------------
-- Table structure for psb_proses
-- ----------------------------
DROP TABLE IF EXISTS `psb_proses`;
CREATE TABLE `psb_proses` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proses` varchar(100) NOT NULL,
  `kodeawalan` varchar(10) NOT NULL,
  `angkatan` int(10) unsigned NOT NULL DEFAULT '0',
  `tglmulai` date NOT NULL DEFAULT '0000-00-00',
  `tglselesai` date NOT NULL DEFAULT '0000-00-00',
  `kapasitas` int(11) NOT NULL DEFAULT '0',
  `departemen` int(10) unsigned NOT NULL,
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `FK_prosespenerimaansiswa_departemen` (`departemen`),
  KEY `IX_prosespenerimaansiswa_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_proses
-- ----------------------------
INSERT INTO `psb_proses` VALUES ('2', 'Tahun Ajaran 2014-2015', 'PMB2014', '1', '0000-00-00', '0000-00-00', '150', '1', '1', '', '2014-03-19 10:56:34');
INSERT INTO `psb_proses` VALUES ('3', 'Tahun Ajaran 2014-2015', 'PMB2014', '4', '0000-00-00', '0000-00-00', '60', '2', '1', '', '2014-03-19 12:47:48');
INSERT INTO `psb_proses` VALUES ('4', 'Tahun Ajaran 2014-2015', 'PMB2014', '6', '0000-00-00', '0000-00-00', '60', '3', '1', '', '2014-03-19 12:48:23');
INSERT INTO `psb_proses` VALUES ('5', 'Tahun Ajaran 2015 - 2016', 'PMB2015', '2', '0000-00-00', '0000-00-00', '500', '1', '1', '', '2015-01-19 15:23:13');

-- ----------------------------
-- Table structure for psb_setbiaya
-- ----------------------------
DROP TABLE IF EXISTS `psb_setbiaya`;
CREATE TABLE `psb_setbiaya` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` int(10) unsigned NOT NULL,
  `daftar` decimal(10,0) NOT NULL DEFAULT '0',
  `spp` decimal(10,0) NOT NULL DEFAULT '0',
  `nilai` decimal(10,0) NOT NULL DEFAULT '0',
  `krit` int(10) unsigned NOT NULL DEFAULT '0',
  `gol` int(10) unsigned NOT NULL DEFAULT '0',
  `kel` int(10) unsigned NOT NULL DEFAULT '0',
  `pros` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `UX_calonsiswa_replid` (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=1253 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_setbiaya
-- ----------------------------
INSERT INTO `psb_setbiaya` VALUES ('1', '0', '0', '0', '0', '1', '1', '0', '1');
INSERT INTO `psb_setbiaya` VALUES ('2', '0', '0', '0', '0', '1', '2', '0', '1');
INSERT INTO `psb_setbiaya` VALUES ('5', '1', '200000', '1000000', '10000000', '1', '1', '1', '1');
INSERT INTO `psb_setbiaya` VALUES ('6', '1', '200000', '1200000', '12000000', '1', '2', '1', '1');
INSERT INTO `psb_setbiaya` VALUES ('9', '0', '0', '0', '0', '1', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('10', '0', '0', '0', '0', '1', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('11', '0', '0', '0', '0', '1', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('12', '0', '0', '0', '0', '1', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('13', '0', '0', '0', '0', '1', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('19', '0', '0', '0', '0', '1', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('20', '0', '0', '0', '0', '1', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('21', '0', '0', '0', '0', '1', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('22', '0', '0', '0', '0', '1', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('23', '0', '0', '0', '0', '1', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('29', '0', '0', '0', '0', '1', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('30', '0', '0', '0', '0', '1', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('31', '0', '0', '0', '0', '1', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('32', '0', '0', '0', '0', '1', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('33', '0', '0', '0', '0', '1', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('39', '0', '0', '0', '0', '1', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('40', '0', '0', '0', '0', '1', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('41', '0', '0', '0', '0', '1', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('42', '0', '0', '0', '0', '1', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('43', '0', '0', '0', '0', '1', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('49', '0', '0', '0', '0', '1', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('50', '0', '0', '0', '0', '1', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('51', '0', '0', '0', '0', '1', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('52', '0', '0', '0', '0', '1', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('53', '0', '0', '0', '0', '1', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('54', '0', '0', '0', '0', '1', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('55', '0', '0', '0', '0', '1', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('56', '0', '0', '0', '0', '1', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('57', '0', '0', '0', '0', '1', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('58', '0', '0', '0', '0', '1', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('59', '0', '0', '0', '0', '1', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('60', '0', '0', '0', '0', '1', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('61', '0', '0', '0', '0', '1', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('62', '0', '0', '0', '0', '1', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('63', '0', '0', '0', '0', '1', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('64', '0', '0', '0', '0', '1', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('65', '0', '0', '0', '0', '1', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('66', '0', '0', '0', '0', '1', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('67', '3', '300000', '500000', '12000000', '1', '1', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('68', '3', '300000', '500000', '12000000', '1', '2', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('69', '3', '300000', '500000', '12000000', '1', '3', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('70', '3', '300000', '500000', '12000000', '1', '4', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('71', '3', '300000', '500000', '12000000', '1', '5', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('72', '3', '300000', '500000', '12000000', '1', '6', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('73', '0', '0', '0', '0', '1', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('74', '0', '0', '0', '0', '1', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('75', '0', '0', '0', '0', '1', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('76', '0', '0', '0', '0', '1', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('77', '0', '0', '0', '0', '1', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('78', '0', '0', '0', '0', '1', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('85', '0', '0', '0', '0', '4', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('86', '0', '0', '0', '0', '4', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('87', '0', '0', '0', '0', '4', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('88', '0', '0', '0', '0', '4', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('89', '0', '0', '0', '0', '4', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('90', '0', '0', '0', '0', '4', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('91', '0', '0', '0', '0', '5', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('92', '0', '0', '0', '0', '5', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('93', '0', '0', '0', '0', '5', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('94', '0', '0', '0', '0', '5', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('95', '0', '0', '0', '0', '5', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('96', '0', '0', '0', '0', '5', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('97', '0', '0', '0', '0', '6', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('98', '0', '0', '0', '0', '6', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('99', '0', '0', '0', '0', '6', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('100', '0', '0', '0', '0', '6', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('101', '0', '0', '0', '0', '6', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('102', '0', '0', '0', '0', '6', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('103', '0', '0', '0', '0', '7', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('104', '0', '0', '0', '0', '7', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('105', '0', '0', '0', '0', '7', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('106', '0', '0', '0', '0', '7', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('107', '0', '0', '0', '0', '7', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('108', '0', '0', '0', '0', '7', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('109', '0', '0', '0', '0', '1', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('110', '0', '0', '0', '0', '1', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('111', '0', '0', '0', '0', '1', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('112', '0', '0', '0', '0', '1', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('113', '0', '0', '0', '0', '1', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('114', '0', '0', '0', '0', '1', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('121', '0', '0', '0', '0', '4', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('122', '0', '0', '0', '0', '4', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('123', '0', '0', '0', '0', '4', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('124', '0', '0', '0', '0', '4', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('125', '0', '0', '0', '0', '4', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('126', '0', '0', '0', '0', '4', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('127', '0', '0', '0', '0', '5', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('128', '0', '0', '0', '0', '5', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('129', '0', '0', '0', '0', '5', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('130', '0', '0', '0', '0', '5', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('131', '0', '0', '0', '0', '5', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('132', '0', '0', '0', '0', '5', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('133', '0', '0', '0', '0', '6', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('134', '0', '0', '0', '0', '6', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('135', '0', '0', '0', '0', '6', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('136', '0', '0', '0', '0', '6', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('137', '0', '0', '0', '0', '6', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('138', '0', '0', '0', '0', '6', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('139', '0', '0', '0', '0', '7', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('140', '0', '0', '0', '0', '7', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('141', '0', '0', '0', '0', '7', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('142', '0', '0', '0', '0', '7', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('143', '0', '0', '0', '0', '7', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('144', '0', '0', '0', '0', '7', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('145', '0', '0', '0', '0', '1', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('146', '0', '0', '0', '0', '1', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('147', '0', '0', '0', '0', '1', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('148', '0', '0', '0', '0', '1', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('149', '0', '0', '0', '0', '1', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('150', '0', '0', '0', '0', '1', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('157', '0', '0', '0', '0', '4', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('158', '0', '0', '0', '0', '4', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('159', '0', '0', '0', '0', '4', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('160', '0', '0', '0', '0', '4', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('161', '0', '0', '0', '0', '4', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('162', '0', '0', '0', '0', '4', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('163', '0', '0', '0', '0', '5', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('164', '0', '0', '0', '0', '5', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('165', '0', '0', '0', '0', '5', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('166', '0', '0', '0', '0', '5', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('167', '0', '0', '0', '0', '5', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('168', '0', '0', '0', '0', '5', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('169', '0', '0', '0', '0', '6', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('170', '0', '0', '0', '0', '6', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('171', '0', '0', '0', '0', '6', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('172', '0', '0', '0', '0', '6', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('173', '0', '0', '0', '0', '6', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('174', '0', '0', '0', '0', '6', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('175', '0', '0', '0', '0', '7', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('176', '0', '0', '0', '0', '7', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('177', '0', '0', '0', '0', '7', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('178', '0', '0', '0', '0', '7', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('179', '0', '0', '0', '0', '7', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('180', '0', '0', '0', '0', '7', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('181', '0', '0', '0', '0', '1', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('182', '0', '0', '0', '0', '1', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('183', '0', '0', '0', '0', '1', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('184', '0', '0', '0', '0', '1', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('185', '0', '0', '0', '0', '1', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('186', '0', '0', '0', '0', '1', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('193', '0', '0', '0', '0', '4', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('194', '0', '0', '0', '0', '4', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('195', '0', '0', '0', '0', '4', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('196', '0', '0', '0', '0', '4', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('197', '0', '0', '0', '0', '4', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('198', '0', '0', '0', '0', '4', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('199', '0', '0', '0', '0', '5', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('200', '0', '0', '0', '0', '5', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('201', '0', '0', '0', '0', '5', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('202', '0', '0', '0', '0', '5', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('203', '0', '0', '0', '0', '5', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('204', '0', '0', '0', '0', '5', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('205', '0', '0', '0', '0', '6', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('206', '0', '0', '0', '0', '6', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('207', '0', '0', '0', '0', '6', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('208', '0', '0', '0', '0', '6', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('209', '0', '0', '0', '0', '6', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('210', '0', '0', '0', '0', '6', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('211', '0', '0', '0', '0', '7', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('212', '0', '0', '0', '0', '7', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('213', '0', '0', '0', '0', '7', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('214', '0', '0', '0', '0', '7', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('215', '0', '0', '0', '0', '7', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('216', '0', '0', '0', '0', '7', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('217', '0', '0', '0', '0', '1', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('218', '0', '0', '0', '0', '1', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('219', '0', '0', '0', '0', '1', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('220', '0', '0', '0', '0', '1', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('221', '0', '0', '0', '0', '1', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('222', '0', '0', '0', '0', '1', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('229', '0', '0', '0', '0', '4', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('230', '0', '0', '0', '0', '4', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('231', '0', '0', '0', '0', '4', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('232', '0', '0', '0', '0', '4', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('233', '0', '0', '0', '0', '4', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('234', '0', '0', '0', '0', '4', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('235', '0', '0', '0', '0', '5', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('236', '0', '0', '0', '0', '5', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('237', '0', '0', '0', '0', '5', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('238', '0', '0', '0', '0', '5', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('239', '0', '0', '0', '0', '5', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('240', '0', '0', '0', '0', '5', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('241', '0', '0', '0', '0', '6', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('242', '0', '0', '0', '0', '6', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('243', '0', '0', '0', '0', '6', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('244', '0', '0', '0', '0', '6', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('245', '0', '0', '0', '0', '6', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('246', '0', '0', '0', '0', '6', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('247', '0', '0', '0', '0', '7', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('248', '0', '0', '0', '0', '7', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('249', '0', '0', '0', '0', '7', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('250', '0', '0', '0', '0', '7', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('251', '0', '0', '0', '0', '7', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('252', '0', '0', '0', '0', '7', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('253', '1', '300000', '0', '14000000', '1', '1', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('254', '1', '300000', '0', '14000000', '1', '2', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('255', '1', '300000', '0', '14000000', '1', '3', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('256', '1', '300000', '0', '14000000', '1', '4', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('257', '1', '300000', '0', '14000000', '1', '5', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('258', '1', '300000', '0', '14000000', '1', '6', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('265', '1', '300000', '0', '15000000', '4', '1', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('266', '1', '300000', '0', '15000000', '4', '2', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('267', '1', '300000', '0', '15000000', '4', '3', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('268', '1', '300000', '0', '15000000', '4', '4', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('269', '1', '300000', '0', '15000000', '4', '5', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('270', '1', '300000', '0', '15000000', '4', '6', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('271', '1', '400000', '0', '37500000', '5', '1', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('272', '1', '400000', '0', '37500000', '5', '2', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('273', '1', '400000', '0', '37500000', '5', '3', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('274', '1', '400000', '0', '37500000', '5', '4', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('275', '1', '400000', '0', '37500000', '5', '5', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('276', '1', '400000', '0', '37500000', '5', '6', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('277', '1', '400000', '0', '32000000', '6', '1', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('278', '1', '400000', '0', '32000000', '6', '2', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('279', '1', '400000', '0', '32000000', '6', '3', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('280', '1', '400000', '0', '32000000', '6', '4', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('281', '1', '400000', '0', '32000000', '6', '5', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('282', '1', '400000', '0', '32000000', '6', '6', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('283', '1', '500000', '0', '33000000', '7', '1', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('284', '1', '500000', '0', '33000000', '7', '2', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('285', '1', '500000', '0', '33000000', '7', '3', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('286', '1', '500000', '0', '33000000', '7', '4', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('287', '1', '500000', '0', '33000000', '7', '5', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('288', '1', '500000', '0', '33000000', '7', '6', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('289', '0', '0', '0', '0', '1', '1', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('290', '0', '0', '0', '0', '1', '2', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('291', '0', '0', '0', '0', '1', '3', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('292', '0', '0', '0', '0', '1', '4', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('293', '0', '0', '0', '0', '1', '5', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('294', '0', '0', '0', '0', '1', '6', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('301', '0', '0', '0', '0', '4', '1', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('302', '0', '0', '0', '0', '4', '2', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('303', '0', '0', '0', '0', '4', '3', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('304', '0', '0', '0', '0', '4', '4', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('305', '0', '0', '0', '0', '4', '5', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('306', '0', '0', '0', '0', '4', '6', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('307', '0', '0', '0', '0', '5', '1', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('308', '0', '0', '0', '0', '5', '2', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('309', '0', '0', '0', '0', '5', '3', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('310', '0', '0', '0', '0', '5', '4', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('311', '0', '0', '0', '0', '5', '5', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('312', '0', '0', '0', '0', '5', '6', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('313', '0', '0', '0', '0', '6', '1', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('314', '0', '0', '0', '0', '6', '2', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('315', '0', '0', '0', '0', '6', '3', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('316', '0', '0', '0', '0', '6', '4', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('317', '0', '0', '0', '0', '6', '5', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('318', '0', '0', '0', '0', '6', '6', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('319', '0', '0', '0', '0', '7', '1', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('320', '0', '0', '0', '0', '7', '2', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('321', '0', '0', '0', '0', '7', '3', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('322', '0', '0', '0', '0', '7', '4', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('323', '0', '0', '0', '0', '7', '5', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('324', '0', '0', '0', '0', '7', '6', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('331', '0', '0', '0', '0', '4', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('332', '0', '0', '0', '0', '4', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('333', '0', '0', '0', '0', '4', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('334', '0', '0', '0', '0', '4', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('335', '0', '0', '0', '0', '4', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('336', '0', '0', '0', '0', '4', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('337', '0', '0', '0', '0', '5', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('338', '0', '0', '0', '0', '5', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('339', '0', '0', '0', '0', '5', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('340', '0', '0', '0', '0', '5', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('341', '0', '0', '0', '0', '5', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('342', '0', '0', '0', '0', '5', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('343', '0', '0', '0', '0', '6', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('344', '0', '0', '0', '0', '6', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('345', '0', '0', '0', '0', '6', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('346', '0', '0', '0', '0', '6', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('347', '0', '0', '0', '0', '6', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('348', '0', '0', '0', '0', '6', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('349', '0', '0', '0', '0', '7', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('350', '0', '0', '0', '0', '7', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('351', '0', '0', '0', '0', '7', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('352', '0', '0', '0', '0', '7', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('353', '0', '0', '0', '0', '7', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('354', '0', '0', '0', '0', '7', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('361', '0', '0', '0', '0', '4', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('362', '0', '0', '0', '0', '4', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('363', '0', '0', '0', '0', '4', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('364', '0', '0', '0', '0', '4', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('365', '0', '0', '0', '0', '4', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('366', '0', '0', '0', '0', '4', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('367', '0', '0', '0', '0', '5', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('368', '0', '0', '0', '0', '5', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('369', '0', '0', '0', '0', '5', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('370', '0', '0', '0', '0', '5', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('371', '0', '0', '0', '0', '5', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('372', '0', '0', '0', '0', '5', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('373', '0', '0', '0', '0', '6', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('374', '0', '0', '0', '0', '6', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('375', '0', '0', '0', '0', '6', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('376', '0', '0', '0', '0', '6', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('377', '0', '0', '0', '0', '6', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('378', '0', '0', '0', '0', '6', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('379', '0', '0', '0', '0', '7', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('380', '0', '0', '0', '0', '7', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('381', '0', '0', '0', '0', '7', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('382', '0', '0', '0', '0', '7', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('383', '0', '0', '0', '0', '7', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('384', '0', '0', '0', '0', '7', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('391', '0', '0', '0', '0', '4', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('392', '0', '0', '0', '0', '4', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('393', '0', '0', '0', '0', '4', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('394', '0', '0', '0', '0', '4', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('395', '0', '0', '0', '0', '4', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('396', '0', '0', '0', '0', '4', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('397', '0', '0', '0', '0', '5', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('398', '0', '0', '0', '0', '5', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('399', '0', '0', '0', '0', '5', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('400', '0', '0', '0', '0', '5', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('401', '0', '0', '0', '0', '5', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('402', '0', '0', '0', '0', '5', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('403', '0', '0', '0', '0', '6', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('404', '0', '0', '0', '0', '6', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('405', '0', '0', '0', '0', '6', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('406', '0', '0', '0', '0', '6', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('407', '0', '0', '0', '0', '6', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('408', '0', '0', '0', '0', '6', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('409', '0', '0', '0', '0', '7', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('410', '0', '0', '0', '0', '7', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('411', '0', '0', '0', '0', '7', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('412', '0', '0', '0', '0', '7', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('413', '0', '0', '0', '0', '7', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('414', '0', '0', '0', '0', '7', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('415', '0', '0', '0', '0', '8', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('416', '0', '0', '0', '0', '8', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('417', '0', '0', '0', '0', '8', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('418', '0', '0', '0', '0', '8', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('419', '0', '0', '0', '0', '8', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('420', '0', '0', '0', '0', '8', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('421', '0', '0', '0', '0', '9', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('422', '0', '0', '0', '0', '9', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('423', '0', '0', '0', '0', '9', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('424', '0', '0', '0', '0', '9', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('425', '0', '0', '0', '0', '9', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('426', '0', '0', '0', '0', '9', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('433', '0', '0', '0', '0', '4', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('434', '0', '0', '0', '0', '4', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('435', '0', '0', '0', '0', '4', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('436', '0', '0', '0', '0', '4', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('437', '0', '0', '0', '0', '4', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('438', '0', '0', '0', '0', '4', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('439', '0', '0', '0', '0', '5', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('440', '0', '0', '0', '0', '5', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('441', '0', '0', '0', '0', '5', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('442', '0', '0', '0', '0', '5', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('443', '0', '0', '0', '0', '5', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('444', '0', '0', '0', '0', '5', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('445', '0', '0', '0', '0', '6', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('446', '0', '0', '0', '0', '6', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('447', '0', '0', '0', '0', '6', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('448', '0', '0', '0', '0', '6', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('449', '0', '0', '0', '0', '6', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('450', '0', '0', '0', '0', '6', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('451', '0', '0', '0', '0', '7', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('452', '0', '0', '0', '0', '7', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('453', '0', '0', '0', '0', '7', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('454', '0', '0', '0', '0', '7', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('455', '0', '0', '0', '0', '7', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('456', '0', '0', '0', '0', '7', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('457', '0', '0', '0', '0', '8', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('458', '0', '0', '0', '0', '8', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('459', '0', '0', '0', '0', '8', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('460', '0', '0', '0', '0', '8', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('461', '0', '0', '0', '0', '8', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('462', '0', '0', '0', '0', '8', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('463', '0', '0', '0', '0', '9', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('464', '0', '0', '0', '0', '9', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('465', '0', '0', '0', '0', '9', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('466', '0', '0', '0', '0', '9', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('467', '0', '0', '0', '0', '9', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('468', '0', '0', '0', '0', '9', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('475', '0', '0', '0', '0', '4', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('476', '0', '0', '0', '0', '4', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('477', '0', '0', '0', '0', '4', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('478', '0', '0', '0', '0', '4', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('479', '0', '0', '0', '0', '4', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('480', '0', '0', '0', '0', '4', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('481', '0', '0', '0', '0', '5', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('482', '0', '0', '0', '0', '5', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('483', '0', '0', '0', '0', '5', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('484', '0', '0', '0', '0', '5', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('485', '0', '0', '0', '0', '5', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('486', '0', '0', '0', '0', '5', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('487', '0', '0', '0', '0', '6', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('488', '0', '0', '0', '0', '6', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('489', '0', '0', '0', '0', '6', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('490', '0', '0', '0', '0', '6', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('491', '0', '0', '0', '0', '6', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('492', '0', '0', '0', '0', '6', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('493', '0', '0', '0', '0', '7', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('494', '0', '0', '0', '0', '7', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('495', '0', '0', '0', '0', '7', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('496', '0', '0', '0', '0', '7', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('497', '0', '0', '0', '0', '7', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('498', '0', '0', '0', '0', '7', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('499', '0', '0', '0', '0', '8', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('500', '0', '0', '0', '0', '8', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('501', '0', '0', '0', '0', '8', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('502', '0', '0', '0', '0', '8', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('503', '0', '0', '0', '0', '8', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('504', '0', '0', '0', '0', '8', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('505', '0', '0', '0', '0', '9', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('506', '0', '0', '0', '0', '9', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('507', '0', '0', '0', '0', '9', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('508', '0', '0', '0', '0', '9', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('509', '0', '0', '0', '0', '9', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('510', '0', '0', '0', '0', '9', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('511', '0', '0', '0', '0', '8', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('512', '0', '0', '0', '0', '8', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('513', '0', '0', '0', '0', '8', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('514', '0', '0', '0', '0', '8', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('515', '0', '0', '0', '0', '8', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('516', '0', '0', '0', '0', '8', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('517', '0', '0', '0', '0', '9', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('518', '0', '0', '0', '0', '9', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('519', '0', '0', '0', '0', '9', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('520', '0', '0', '0', '0', '9', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('521', '0', '0', '0', '0', '9', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('522', '0', '0', '0', '0', '9', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('523', '0', '0', '0', '0', '8', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('524', '0', '0', '0', '0', '8', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('525', '0', '0', '0', '0', '8', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('526', '0', '0', '0', '0', '8', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('527', '0', '0', '0', '0', '8', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('528', '0', '0', '0', '0', '8', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('529', '0', '0', '0', '0', '9', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('530', '0', '0', '0', '0', '9', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('531', '0', '0', '0', '0', '9', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('532', '0', '0', '0', '0', '9', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('533', '0', '0', '0', '0', '9', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('534', '0', '0', '0', '0', '9', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('535', '0', '0', '0', '0', '10', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('536', '0', '0', '0', '0', '10', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('537', '0', '0', '0', '0', '10', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('538', '0', '0', '0', '0', '10', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('539', '0', '0', '0', '0', '10', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('540', '0', '0', '0', '0', '10', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('541', '0', '0', '0', '0', '8', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('542', '0', '0', '0', '0', '8', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('543', '0', '0', '0', '0', '8', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('544', '0', '0', '0', '0', '8', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('545', '0', '0', '0', '0', '8', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('546', '0', '0', '0', '0', '8', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('547', '0', '0', '0', '0', '9', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('548', '0', '0', '0', '0', '9', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('549', '0', '0', '0', '0', '9', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('550', '0', '0', '0', '0', '9', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('551', '0', '0', '0', '0', '9', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('552', '0', '0', '0', '0', '9', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('553', '0', '0', '0', '0', '10', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('554', '0', '0', '0', '0', '10', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('555', '0', '0', '0', '0', '10', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('556', '0', '0', '0', '0', '10', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('557', '0', '0', '0', '0', '10', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('558', '0', '0', '0', '0', '10', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('559', '0', '0', '0', '0', '8', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('560', '0', '0', '0', '0', '8', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('561', '0', '0', '0', '0', '8', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('562', '0', '0', '0', '0', '8', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('563', '0', '0', '0', '0', '8', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('564', '0', '0', '0', '0', '8', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('565', '0', '0', '0', '0', '9', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('566', '0', '0', '0', '0', '9', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('567', '0', '0', '0', '0', '9', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('568', '0', '0', '0', '0', '9', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('569', '0', '0', '0', '0', '9', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('570', '0', '0', '0', '0', '9', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('571', '0', '0', '0', '0', '1', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('572', '0', '0', '0', '0', '10', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('573', '0', '0', '0', '0', '10', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('574', '0', '0', '0', '0', '10', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('575', '0', '0', '0', '0', '10', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('576', '0', '0', '0', '0', '10', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('577', '0', '0', '0', '0', '10', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('578', '0', '0', '0', '0', '10', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('579', '0', '0', '0', '0', '4', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('580', '0', '0', '0', '0', '5', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('581', '0', '0', '0', '0', '6', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('582', '0', '0', '0', '0', '7', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('583', '0', '0', '0', '0', '8', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('584', '0', '0', '0', '0', '8', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('585', '0', '0', '0', '0', '8', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('586', '0', '0', '0', '0', '8', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('587', '0', '0', '0', '0', '8', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('588', '0', '0', '0', '0', '8', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('589', '0', '0', '0', '0', '8', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('590', '0', '0', '0', '0', '9', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('591', '0', '0', '0', '0', '9', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('592', '0', '0', '0', '0', '9', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('593', '0', '0', '0', '0', '9', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('594', '0', '0', '0', '0', '9', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('595', '0', '0', '0', '0', '9', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('596', '0', '0', '0', '0', '9', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('597', '0', '0', '0', '0', '12', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('598', '0', '0', '0', '0', '12', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('599', '0', '0', '0', '0', '12', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('600', '0', '0', '0', '0', '12', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('601', '0', '0', '0', '0', '12', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('602', '0', '0', '0', '0', '12', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('603', '0', '0', '0', '0', '12', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('604', '0', '0', '0', '0', '13', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('605', '0', '0', '0', '0', '13', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('606', '0', '0', '0', '0', '13', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('607', '0', '0', '0', '0', '13', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('608', '0', '0', '0', '0', '13', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('609', '0', '0', '0', '0', '13', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('610', '0', '0', '0', '0', '13', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('611', '0', '0', '0', '0', '14', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('612', '0', '0', '0', '0', '14', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('613', '0', '0', '0', '0', '14', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('614', '0', '0', '0', '0', '14', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('615', '0', '0', '0', '0', '14', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('616', '0', '0', '0', '0', '14', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('617', '0', '0', '0', '0', '14', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('618', '0', '0', '0', '0', '15', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('619', '0', '0', '0', '0', '15', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('620', '0', '0', '0', '0', '15', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('621', '0', '0', '0', '0', '15', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('622', '0', '0', '0', '0', '15', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('623', '0', '0', '0', '0', '15', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('624', '0', '0', '0', '0', '15', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('625', '0', '0', '0', '0', '16', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('626', '0', '0', '0', '0', '16', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('627', '0', '0', '0', '0', '16', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('628', '0', '0', '0', '0', '16', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('629', '0', '0', '0', '0', '16', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('630', '0', '0', '0', '0', '16', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('631', '0', '0', '0', '0', '16', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('632', '0', '0', '0', '0', '17', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('633', '0', '0', '0', '0', '17', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('634', '0', '0', '0', '0', '17', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('635', '0', '0', '0', '0', '17', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('636', '0', '0', '0', '0', '17', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('637', '0', '0', '0', '0', '17', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('638', '0', '0', '0', '0', '17', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('639', '0', '0', '0', '0', '18', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('640', '0', '0', '0', '0', '18', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('641', '0', '0', '0', '0', '18', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('642', '0', '0', '0', '0', '18', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('643', '0', '0', '0', '0', '18', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('644', '0', '0', '0', '0', '18', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('645', '0', '0', '0', '0', '18', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('646', '0', '0', '0', '0', '19', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('647', '0', '0', '0', '0', '19', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('648', '0', '0', '0', '0', '19', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('649', '0', '0', '0', '0', '19', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('650', '0', '0', '0', '0', '19', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('651', '0', '0', '0', '0', '19', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('652', '0', '0', '0', '0', '19', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('653', '0', '0', '0', '0', '1', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('654', '0', '0', '0', '0', '10', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('655', '0', '0', '0', '0', '10', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('656', '0', '0', '0', '0', '10', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('657', '0', '0', '0', '0', '10', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('658', '0', '0', '0', '0', '10', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('659', '0', '0', '0', '0', '10', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('660', '0', '0', '0', '0', '10', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('661', '0', '0', '0', '0', '4', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('662', '0', '0', '0', '0', '5', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('663', '0', '0', '0', '0', '6', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('664', '0', '0', '0', '0', '7', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('665', '0', '0', '0', '0', '8', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('666', '0', '0', '0', '0', '8', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('667', '0', '0', '0', '0', '8', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('668', '0', '0', '0', '0', '8', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('669', '0', '0', '0', '0', '8', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('670', '0', '0', '0', '0', '8', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('671', '0', '0', '0', '0', '8', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('672', '0', '0', '0', '0', '9', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('673', '0', '0', '0', '0', '9', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('674', '0', '0', '0', '0', '9', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('675', '0', '0', '0', '0', '9', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('676', '0', '0', '0', '0', '9', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('677', '0', '0', '0', '0', '9', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('678', '0', '0', '0', '0', '9', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('679', '0', '0', '0', '0', '12', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('680', '0', '0', '0', '0', '12', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('681', '0', '0', '0', '0', '12', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('682', '0', '0', '0', '0', '12', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('683', '0', '0', '0', '0', '12', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('684', '0', '0', '0', '0', '12', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('685', '0', '0', '0', '0', '12', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('686', '0', '0', '0', '0', '13', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('687', '0', '0', '0', '0', '13', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('688', '0', '0', '0', '0', '13', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('689', '0', '0', '0', '0', '13', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('690', '0', '0', '0', '0', '13', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('691', '0', '0', '0', '0', '13', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('692', '0', '0', '0', '0', '13', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('693', '0', '0', '0', '0', '14', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('694', '0', '0', '0', '0', '14', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('695', '0', '0', '0', '0', '14', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('696', '0', '0', '0', '0', '14', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('697', '0', '0', '0', '0', '14', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('698', '0', '0', '0', '0', '14', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('699', '0', '0', '0', '0', '14', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('700', '0', '0', '0', '0', '15', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('701', '0', '0', '0', '0', '15', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('702', '0', '0', '0', '0', '15', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('703', '0', '0', '0', '0', '15', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('704', '0', '0', '0', '0', '15', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('705', '0', '0', '0', '0', '15', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('706', '0', '0', '0', '0', '15', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('707', '0', '0', '0', '0', '16', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('708', '0', '0', '0', '0', '16', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('709', '0', '0', '0', '0', '16', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('710', '0', '0', '0', '0', '16', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('711', '0', '0', '0', '0', '16', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('712', '0', '0', '0', '0', '16', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('713', '0', '0', '0', '0', '16', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('714', '0', '0', '0', '0', '17', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('715', '0', '0', '0', '0', '17', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('716', '0', '0', '0', '0', '17', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('717', '0', '0', '0', '0', '17', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('718', '0', '0', '0', '0', '17', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('719', '0', '0', '0', '0', '17', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('720', '0', '0', '0', '0', '17', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('721', '0', '0', '0', '0', '18', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('722', '0', '0', '0', '0', '18', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('723', '0', '0', '0', '0', '18', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('724', '0', '0', '0', '0', '18', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('725', '0', '0', '0', '0', '18', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('726', '0', '0', '0', '0', '18', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('727', '0', '0', '0', '0', '18', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('728', '0', '0', '0', '0', '19', '1', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('729', '0', '0', '0', '0', '19', '2', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('730', '0', '0', '0', '0', '19', '3', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('731', '0', '0', '0', '0', '19', '4', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('732', '0', '0', '0', '0', '19', '5', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('733', '0', '0', '0', '0', '19', '6', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('734', '0', '0', '0', '0', '19', '7', '0', '2');
INSERT INTO `psb_setbiaya` VALUES ('735', '1', '300000', '0', '14000000', '1', '7', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('736', '1', '300000', '0', '7500000', '10', '1', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('737', '1', '300000', '0', '7500000', '10', '2', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('738', '1', '300000', '0', '7500000', '10', '3', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('739', '1', '300000', '0', '7500000', '10', '4', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('740', '1', '300000', '0', '7500000', '10', '5', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('741', '1', '300000', '0', '7500000', '10', '6', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('742', '1', '300000', '0', '7500000', '10', '7', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('743', '1', '300000', '0', '15000000', '4', '7', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('744', '1', '400000', '0', '37500000', '5', '7', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('745', '1', '400000', '0', '32000000', '6', '7', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('746', '1', '500000', '0', '33000000', '7', '7', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('747', '1', '300000', '0', '14000000', '8', '1', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('748', '1', '300000', '0', '14000000', '8', '2', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('749', '1', '300000', '0', '14000000', '8', '3', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('750', '1', '300000', '0', '14000000', '8', '4', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('751', '1', '300000', '0', '14000000', '8', '5', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('752', '1', '300000', '0', '14000000', '8', '6', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('753', '1', '300000', '0', '14000000', '8', '7', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('754', '1', '300000', '0', '7000000', '9', '1', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('755', '1', '300000', '0', '7000000', '9', '2', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('756', '1', '300000', '0', '7000000', '9', '3', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('757', '1', '300000', '0', '7000000', '9', '4', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('758', '1', '300000', '0', '7000000', '9', '5', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('759', '1', '300000', '0', '7000000', '9', '6', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('760', '1', '300000', '0', '7000000', '9', '7', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('761', '1', '400000', '0', '31250000', '12', '1', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('762', '1', '400000', '0', '31250000', '12', '2', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('763', '1', '400000', '0', '31250000', '12', '3', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('764', '1', '400000', '0', '31250000', '12', '4', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('765', '1', '400000', '0', '31250000', '12', '5', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('766', '1', '400000', '0', '31250000', '12', '6', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('767', '1', '400000', '0', '31250000', '12', '7', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('768', '1', '400000', '0', '0', '13', '1', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('769', '1', '400000', '0', '0', '13', '2', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('770', '1', '400000', '0', '0', '13', '3', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('771', '1', '400000', '0', '0', '13', '4', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('772', '1', '400000', '0', '0', '13', '5', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('773', '1', '400000', '0', '0', '13', '6', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('774', '1', '400000', '0', '0', '13', '7', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('775', '1', '400000', '0', '0', '14', '1', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('776', '1', '400000', '0', '0', '14', '2', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('777', '1', '400000', '0', '0', '14', '3', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('778', '1', '400000', '0', '0', '14', '4', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('779', '1', '400000', '0', '0', '14', '5', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('780', '1', '400000', '0', '0', '14', '6', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('781', '1', '400000', '0', '0', '14', '7', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('782', '1', '400000', '0', '0', '15', '1', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('783', '1', '400000', '0', '0', '15', '2', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('784', '1', '400000', '0', '0', '15', '3', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('785', '1', '400000', '0', '0', '15', '4', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('786', '1', '400000', '0', '0', '15', '5', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('787', '1', '400000', '0', '0', '15', '6', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('788', '1', '400000', '0', '0', '15', '7', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('789', '1', '400000', '0', '0', '16', '1', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('790', '1', '400000', '0', '0', '16', '2', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('791', '1', '400000', '0', '0', '16', '3', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('792', '1', '400000', '0', '0', '16', '4', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('793', '1', '400000', '0', '0', '16', '5', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('794', '1', '400000', '0', '0', '16', '6', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('795', '1', '400000', '0', '0', '16', '7', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('796', '1', '400000', '0', '0', '17', '1', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('797', '1', '400000', '0', '0', '17', '2', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('798', '1', '400000', '0', '0', '17', '3', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('799', '1', '400000', '0', '0', '17', '4', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('800', '1', '400000', '0', '0', '17', '5', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('801', '1', '400000', '0', '0', '17', '6', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('802', '1', '400000', '0', '0', '17', '7', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('803', '1', '400000', '0', '0', '18', '1', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('804', '1', '400000', '0', '0', '18', '2', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('805', '1', '400000', '0', '0', '18', '3', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('806', '1', '400000', '0', '0', '18', '4', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('807', '1', '400000', '0', '0', '18', '5', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('808', '1', '400000', '0', '0', '18', '6', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('809', '1', '400000', '0', '0', '18', '7', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('810', '1', '400000', '0', '0', '19', '1', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('811', '1', '400000', '0', '0', '19', '2', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('812', '1', '400000', '0', '0', '19', '3', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('813', '1', '400000', '0', '0', '19', '4', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('814', '1', '400000', '0', '0', '19', '5', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('815', '1', '400000', '0', '0', '19', '6', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('816', '1', '400000', '0', '0', '19', '7', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('817', '0', '0', '0', '0', '1', '1', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('818', '0', '0', '0', '0', '1', '2', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('819', '0', '0', '0', '0', '1', '3', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('820', '0', '0', '0', '0', '1', '4', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('821', '0', '0', '0', '0', '1', '5', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('822', '0', '0', '0', '0', '1', '6', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('823', '0', '0', '0', '0', '1', '7', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('824', '0', '0', '0', '0', '10', '1', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('825', '0', '0', '0', '0', '10', '2', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('826', '0', '0', '0', '0', '10', '3', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('827', '0', '0', '0', '0', '10', '4', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('828', '0', '0', '0', '0', '10', '5', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('829', '0', '0', '0', '0', '10', '6', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('830', '0', '0', '0', '0', '10', '7', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('831', '0', '0', '0', '0', '4', '1', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('832', '0', '0', '0', '0', '4', '2', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('833', '0', '0', '0', '0', '4', '3', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('834', '0', '0', '0', '0', '4', '4', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('835', '0', '0', '0', '0', '4', '5', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('836', '0', '0', '0', '0', '4', '6', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('837', '0', '0', '0', '0', '4', '7', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('838', '0', '0', '0', '0', '5', '1', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('839', '0', '0', '0', '0', '5', '2', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('840', '0', '0', '0', '0', '5', '3', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('841', '0', '0', '0', '0', '5', '4', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('842', '0', '0', '0', '0', '5', '5', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('843', '0', '0', '0', '0', '5', '6', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('844', '0', '0', '0', '0', '5', '7', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('845', '0', '0', '0', '0', '6', '1', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('846', '0', '0', '0', '0', '6', '2', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('847', '0', '0', '0', '0', '6', '3', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('848', '0', '0', '0', '0', '6', '4', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('849', '0', '0', '0', '0', '6', '5', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('850', '0', '0', '0', '0', '6', '6', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('851', '0', '0', '0', '0', '6', '7', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('852', '0', '0', '0', '0', '7', '1', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('853', '0', '0', '0', '0', '7', '2', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('854', '0', '0', '0', '0', '7', '3', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('855', '0', '0', '0', '0', '7', '4', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('856', '0', '0', '0', '0', '7', '5', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('857', '0', '0', '0', '0', '7', '6', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('858', '0', '0', '0', '0', '7', '7', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('859', '0', '0', '0', '0', '8', '1', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('860', '0', '0', '0', '0', '8', '2', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('861', '0', '0', '0', '0', '8', '3', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('862', '0', '0', '0', '0', '8', '4', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('863', '0', '0', '0', '0', '8', '5', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('864', '0', '0', '0', '0', '8', '6', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('865', '0', '0', '0', '0', '8', '7', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('866', '0', '0', '0', '0', '9', '1', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('867', '0', '0', '0', '0', '9', '2', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('868', '0', '0', '0', '0', '9', '3', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('869', '0', '0', '0', '0', '9', '4', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('870', '0', '0', '0', '0', '9', '5', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('871', '0', '0', '0', '0', '9', '6', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('872', '0', '0', '0', '0', '9', '7', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('873', '0', '0', '0', '0', '12', '1', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('874', '0', '0', '0', '0', '12', '2', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('875', '0', '0', '0', '0', '12', '3', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('876', '0', '0', '0', '0', '12', '4', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('877', '0', '0', '0', '0', '12', '5', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('878', '0', '0', '0', '0', '12', '6', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('879', '0', '0', '0', '0', '12', '7', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('880', '0', '0', '0', '0', '13', '1', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('881', '0', '0', '0', '0', '13', '2', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('882', '0', '0', '0', '0', '13', '3', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('883', '0', '0', '0', '0', '13', '4', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('884', '0', '0', '0', '0', '13', '5', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('885', '0', '0', '0', '0', '13', '6', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('886', '0', '0', '0', '0', '13', '7', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('887', '0', '0', '0', '0', '14', '1', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('888', '0', '0', '0', '0', '14', '2', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('889', '0', '0', '0', '0', '14', '3', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('890', '0', '0', '0', '0', '14', '4', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('891', '0', '0', '0', '0', '14', '5', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('892', '0', '0', '0', '0', '14', '6', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('893', '0', '0', '0', '0', '14', '7', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('894', '0', '0', '0', '0', '15', '1', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('895', '0', '0', '0', '0', '15', '2', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('896', '0', '0', '0', '0', '15', '3', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('897', '0', '0', '0', '0', '15', '4', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('898', '0', '0', '0', '0', '15', '5', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('899', '0', '0', '0', '0', '15', '6', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('900', '0', '0', '0', '0', '15', '7', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('901', '0', '0', '0', '0', '16', '1', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('902', '0', '0', '0', '0', '16', '2', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('903', '0', '0', '0', '0', '16', '3', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('904', '0', '0', '0', '0', '16', '4', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('905', '0', '0', '0', '0', '16', '5', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('906', '0', '0', '0', '0', '16', '6', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('907', '0', '0', '0', '0', '16', '7', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('908', '0', '0', '0', '0', '17', '1', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('909', '0', '0', '0', '0', '17', '2', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('910', '0', '0', '0', '0', '17', '3', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('911', '0', '0', '0', '0', '17', '4', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('912', '0', '0', '0', '0', '17', '5', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('913', '0', '0', '0', '0', '17', '6', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('914', '0', '0', '0', '0', '17', '7', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('915', '0', '0', '0', '0', '18', '1', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('916', '0', '0', '0', '0', '18', '2', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('917', '0', '0', '0', '0', '18', '3', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('918', '0', '0', '0', '0', '18', '4', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('919', '0', '0', '0', '0', '18', '5', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('920', '0', '0', '0', '0', '18', '6', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('921', '0', '0', '0', '0', '18', '7', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('922', '0', '0', '0', '0', '19', '1', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('923', '0', '0', '0', '0', '19', '2', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('924', '0', '0', '0', '0', '19', '3', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('925', '0', '0', '0', '0', '19', '4', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('926', '0', '0', '0', '0', '19', '5', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('927', '0', '0', '0', '0', '19', '6', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('928', '0', '0', '0', '0', '19', '7', '0', '3');
INSERT INTO `psb_setbiaya` VALUES ('929', '2', '0', '0', '0', '1', '1', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('930', '2', '0', '0', '0', '1', '2', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('931', '2', '0', '0', '0', '1', '3', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('932', '2', '0', '0', '0', '1', '4', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('933', '2', '0', '0', '0', '1', '5', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('934', '2', '0', '0', '0', '1', '6', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('935', '2', '0', '0', '0', '1', '7', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('936', '2', '0', '0', '0', '10', '1', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('937', '2', '0', '0', '0', '10', '2', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('938', '2', '0', '0', '0', '10', '3', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('939', '2', '0', '0', '0', '10', '4', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('940', '2', '0', '0', '0', '10', '5', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('941', '2', '0', '0', '0', '10', '6', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('942', '2', '0', '0', '0', '10', '7', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('943', '2', '0', '0', '0', '4', '1', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('944', '2', '0', '0', '0', '4', '2', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('945', '2', '0', '0', '0', '4', '3', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('946', '2', '0', '0', '0', '4', '4', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('947', '2', '0', '0', '0', '4', '5', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('948', '2', '0', '0', '0', '4', '6', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('949', '2', '0', '0', '0', '4', '7', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('950', '2', '400000', '1500000', '22500000', '5', '1', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('951', '2', '400000', '1500000', '22500000', '5', '2', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('952', '2', '400000', '1500000', '22500000', '5', '3', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('953', '2', '400000', '1500000', '22500000', '5', '4', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('954', '2', '400000', '1500000', '22500000', '5', '5', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('955', '2', '400000', '1500000', '22500000', '5', '6', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('956', '2', '400000', '1500000', '22500000', '5', '7', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('957', '2', '400000', '2000000', '18000000', '6', '1', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('958', '2', '400000', '2000000', '18000000', '6', '2', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('959', '2', '400000', '2000000', '18000000', '6', '3', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('960', '2', '400000', '2000000', '18000000', '6', '4', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('961', '2', '400000', '2000000', '18000000', '6', '5', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('962', '2', '400000', '2000000', '18000000', '6', '6', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('963', '2', '400000', '2000000', '18000000', '6', '7', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('964', '2', '0', '0', '0', '7', '1', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('965', '2', '0', '0', '0', '7', '2', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('966', '2', '0', '0', '0', '7', '3', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('967', '2', '0', '0', '0', '7', '4', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('968', '2', '0', '0', '0', '7', '5', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('969', '2', '0', '0', '0', '7', '6', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('970', '2', '0', '0', '0', '7', '7', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('971', '2', '0', '0', '0', '8', '1', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('972', '2', '0', '0', '0', '8', '2', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('973', '2', '0', '0', '0', '8', '3', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('974', '2', '0', '0', '0', '8', '4', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('975', '2', '0', '0', '0', '8', '5', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('976', '2', '0', '0', '0', '8', '6', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('977', '2', '0', '0', '0', '8', '7', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('978', '2', '0', '0', '0', '9', '1', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('979', '2', '0', '0', '0', '9', '2', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('980', '2', '0', '0', '0', '9', '3', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('981', '2', '0', '0', '0', '9', '4', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('982', '2', '0', '0', '0', '9', '5', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('983', '2', '0', '0', '0', '9', '6', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('984', '2', '0', '0', '0', '9', '7', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('985', '2', '400000', '1500000', '18750000', '12', '1', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('986', '2', '400000', '1500000', '18750000', '12', '2', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('987', '2', '400000', '1500000', '18750000', '12', '3', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('988', '2', '400000', '1500000', '18750000', '12', '4', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('989', '2', '400000', '1500000', '18750000', '12', '5', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('990', '2', '400000', '1500000', '18750000', '12', '6', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('991', '2', '400000', '1500000', '18750000', '12', '7', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('992', '2', '400000', '1500000', '15000000', '13', '1', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('993', '2', '400000', '1500000', '15000000', '13', '2', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('994', '2', '400000', '1500000', '15000000', '13', '3', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('995', '2', '400000', '1500000', '15000000', '13', '4', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('996', '2', '400000', '1500000', '15000000', '13', '5', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('997', '2', '400000', '1500000', '15000000', '13', '6', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('998', '2', '400000', '1500000', '15000000', '13', '7', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('999', '2', '400000', '1600000', '11250000', '14', '1', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1000', '2', '400000', '1600000', '11250000', '14', '2', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1001', '2', '400000', '1600000', '11250000', '14', '3', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1002', '2', '400000', '1600000', '11250000', '14', '4', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1003', '2', '400000', '1600000', '11250000', '14', '5', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1004', '2', '400000', '1600000', '11250000', '14', '6', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1005', '2', '400000', '1600000', '11250000', '14', '7', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1006', '2', '400000', '1600000', '7500000', '15', '1', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1007', '2', '400000', '1600000', '7500000', '15', '2', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1008', '2', '400000', '1600000', '7500000', '15', '3', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1009', '2', '400000', '1600000', '7500000', '15', '4', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1010', '2', '400000', '1600000', '7500000', '15', '5', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1011', '2', '400000', '1600000', '7500000', '15', '6', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1012', '2', '400000', '1600000', '7500000', '15', '7', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1013', '2', '400000', '1700000', '3750000', '16', '1', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1014', '2', '400000', '1700000', '3750000', '16', '2', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1015', '2', '400000', '1700000', '3750000', '16', '3', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1016', '2', '400000', '1700000', '3750000', '16', '4', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1017', '2', '400000', '1700000', '3750000', '16', '5', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1018', '2', '400000', '1700000', '3750000', '16', '6', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1019', '2', '400000', '1700000', '3750000', '16', '7', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1020', '2', '400000', '2000000', '13500000', '17', '1', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1021', '2', '400000', '2000000', '13500000', '17', '2', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1022', '2', '400000', '2000000', '13500000', '17', '3', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1023', '2', '400000', '2000000', '13500000', '17', '4', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1024', '2', '400000', '2000000', '13500000', '17', '5', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1025', '2', '400000', '2000000', '13500000', '17', '6', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1026', '2', '400000', '2000000', '13500000', '17', '7', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1027', '2', '400000', '2000000', '9000000', '18', '1', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1028', '2', '400000', '2000000', '9000000', '18', '2', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1029', '2', '400000', '2000000', '9000000', '18', '3', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1030', '2', '400000', '2000000', '9000000', '18', '4', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1031', '2', '400000', '2000000', '9000000', '18', '5', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1032', '2', '400000', '0', '9000000', '18', '6', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1033', '2', '400000', '0', '9000000', '18', '7', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1034', '2', '400000', '0', '4500000', '19', '1', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1035', '2', '400000', '0', '4500000', '19', '2', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1036', '2', '400000', '0', '4500000', '19', '3', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1037', '2', '400000', '0', '4500000', '19', '4', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1038', '2', '400000', '0', '4500000', '19', '5', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1039', '2', '400000', '0', '4500000', '19', '6', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1040', '2', '400000', '0', '4500000', '19', '7', '5', '3');
INSERT INTO `psb_setbiaya` VALUES ('1041', '0', '0', '0', '0', '1', '7', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1042', '0', '0', '0', '0', '10', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1043', '0', '0', '0', '0', '10', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1044', '0', '0', '0', '0', '10', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1045', '0', '0', '0', '0', '10', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1046', '0', '0', '0', '0', '10', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1047', '0', '0', '0', '0', '10', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1048', '0', '0', '0', '0', '10', '7', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1049', '0', '0', '0', '0', '4', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1050', '0', '0', '0', '0', '4', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1051', '0', '0', '0', '0', '4', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1052', '0', '0', '0', '0', '4', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1053', '0', '0', '0', '0', '4', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1054', '0', '0', '0', '0', '4', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1055', '0', '0', '0', '0', '4', '7', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1056', '0', '0', '0', '0', '5', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1057', '0', '0', '0', '0', '5', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1058', '0', '0', '0', '0', '5', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1059', '0', '0', '0', '0', '5', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1060', '0', '0', '0', '0', '5', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1061', '0', '0', '0', '0', '5', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1062', '0', '0', '0', '0', '5', '7', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1063', '0', '0', '0', '0', '6', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1064', '0', '0', '0', '0', '6', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1065', '0', '0', '0', '0', '6', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1066', '0', '0', '0', '0', '6', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1067', '0', '0', '0', '0', '6', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1068', '0', '0', '0', '0', '6', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1069', '0', '0', '0', '0', '6', '7', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1070', '0', '0', '0', '0', '7', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1071', '0', '0', '0', '0', '7', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1072', '0', '0', '0', '0', '7', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1073', '0', '0', '0', '0', '7', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1074', '0', '0', '0', '0', '7', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1075', '0', '0', '0', '0', '7', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1076', '0', '0', '0', '0', '7', '7', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1077', '0', '0', '0', '0', '8', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1078', '0', '0', '0', '0', '8', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1079', '0', '0', '0', '0', '8', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1080', '0', '0', '0', '0', '8', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1081', '0', '0', '0', '0', '8', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1082', '0', '0', '0', '0', '8', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1083', '0', '0', '0', '0', '8', '7', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1084', '0', '0', '0', '0', '9', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1085', '0', '0', '0', '0', '9', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1086', '0', '0', '0', '0', '9', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1087', '0', '0', '0', '0', '9', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1088', '0', '0', '0', '0', '9', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1089', '0', '0', '0', '0', '9', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1090', '0', '0', '0', '0', '9', '7', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1091', '0', '0', '0', '0', '12', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1092', '0', '0', '0', '0', '12', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1093', '0', '0', '0', '0', '12', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1094', '0', '0', '0', '0', '12', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1095', '0', '0', '0', '0', '12', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1096', '0', '0', '0', '0', '12', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1097', '0', '0', '0', '0', '12', '7', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1098', '0', '0', '0', '0', '13', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1099', '0', '0', '0', '0', '13', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1100', '0', '0', '0', '0', '13', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1101', '0', '0', '0', '0', '13', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1102', '0', '0', '0', '0', '13', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1103', '0', '0', '0', '0', '13', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1104', '0', '0', '0', '0', '13', '7', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1105', '0', '0', '0', '0', '14', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1106', '0', '0', '0', '0', '14', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1107', '0', '0', '0', '0', '14', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1108', '0', '0', '0', '0', '14', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1109', '0', '0', '0', '0', '14', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1110', '0', '0', '0', '0', '14', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1111', '0', '0', '0', '0', '14', '7', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1112', '0', '0', '0', '0', '15', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1113', '0', '0', '0', '0', '15', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1114', '0', '0', '0', '0', '15', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1115', '0', '0', '0', '0', '15', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1116', '0', '0', '0', '0', '15', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1117', '0', '0', '0', '0', '15', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1118', '0', '0', '0', '0', '15', '7', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1119', '0', '0', '0', '0', '16', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1120', '0', '0', '0', '0', '16', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1121', '0', '0', '0', '0', '16', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1122', '0', '0', '0', '0', '16', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1123', '0', '0', '0', '0', '16', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1124', '0', '0', '0', '0', '16', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1125', '0', '0', '0', '0', '16', '7', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1126', '0', '0', '0', '0', '17', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1127', '0', '0', '0', '0', '17', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1128', '0', '0', '0', '0', '17', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1129', '0', '0', '0', '0', '17', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1130', '0', '0', '0', '0', '17', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1131', '0', '0', '0', '0', '17', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1132', '0', '0', '0', '0', '17', '7', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1133', '0', '0', '0', '0', '18', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1134', '0', '0', '0', '0', '18', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1135', '0', '0', '0', '0', '18', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1136', '0', '0', '0', '0', '18', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1137', '0', '0', '0', '0', '18', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1138', '0', '0', '0', '0', '18', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1139', '0', '0', '0', '0', '18', '7', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1140', '0', '0', '0', '0', '19', '1', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1141', '0', '0', '0', '0', '19', '2', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1142', '0', '0', '0', '0', '19', '3', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1143', '0', '0', '0', '0', '19', '4', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1144', '0', '0', '0', '0', '19', '5', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1145', '0', '0', '0', '0', '19', '6', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1146', '0', '0', '0', '0', '19', '7', '0', '4');
INSERT INTO `psb_setbiaya` VALUES ('1147', '3', '300000', '500000', '12000000', '1', '7', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1148', '3', '300000', '1100000', '7000000', '10', '1', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1149', '3', '300000', '1100000', '7000000', '10', '2', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1150', '3', '300000', '1100000', '7000000', '10', '3', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1151', '3', '300000', '1100000', '7000000', '10', '4', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1152', '3', '300000', '1100000', '7000000', '10', '5', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1153', '3', '300000', '1100000', '7000000', '10', '6', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1154', '3', '300000', '1100000', '7000000', '10', '7', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1155', '3', '300000', '1100000', '13500000', '4', '1', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1156', '3', '300000', '1100000', '13500000', '4', '2', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1157', '3', '300000', '1100000', '13500000', '4', '3', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1158', '3', '300000', '1100000', '13500000', '4', '4', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1159', '3', '300000', '1100000', '13500000', '4', '5', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1160', '3', '300000', '1100000', '13500000', '4', '6', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1161', '3', '300000', '1100000', '13500000', '4', '7', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1162', '3', '0', '0', '0', '5', '1', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1163', '3', '0', '0', '0', '5', '2', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1164', '3', '0', '0', '0', '5', '3', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1165', '3', '0', '0', '0', '5', '4', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1166', '3', '0', '0', '0', '5', '5', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1167', '3', '0', '0', '0', '5', '6', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1168', '3', '0', '0', '0', '5', '7', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1169', '3', '0', '0', '0', '6', '1', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1170', '3', '0', '0', '0', '6', '2', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1171', '3', '0', '0', '0', '6', '3', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1172', '3', '0', '0', '0', '6', '4', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1173', '3', '0', '0', '0', '6', '5', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1174', '3', '0', '0', '0', '6', '6', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1175', '3', '0', '0', '0', '6', '7', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1176', '3', '0', '0', '0', '7', '1', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1177', '3', '0', '0', '0', '7', '2', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1178', '3', '0', '0', '0', '7', '3', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1179', '3', '0', '0', '0', '7', '4', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1180', '3', '0', '0', '0', '7', '5', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1181', '3', '0', '0', '0', '7', '6', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1182', '3', '0', '0', '0', '7', '7', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1183', '3', '300000', '900000', '12000000', '8', '1', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1184', '3', '300000', '900000', '12000000', '8', '2', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1185', '3', '300000', '900000', '12000000', '8', '3', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1186', '3', '300000', '900000', '12000000', '8', '4', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1187', '3', '300000', '900000', '12000000', '8', '5', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1188', '3', '300000', '900000', '12000000', '8', '6', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1189', '3', '300000', '900000', '12000000', '8', '7', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1190', '3', '300000', '1000000', '6000000', '9', '1', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1191', '3', '300000', '1000000', '6000000', '9', '2', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1192', '3', '300000', '1000000', '6000000', '9', '3', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1193', '3', '300000', '1000000', '6000000', '9', '4', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1194', '3', '300000', '1000000', '6000000', '9', '5', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1195', '3', '300000', '1000000', '6000000', '9', '6', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1196', '3', '300000', '1000000', '6000000', '9', '7', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1197', '3', '0', '0', '0', '12', '1', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1198', '3', '0', '0', '0', '12', '2', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1199', '3', '0', '0', '0', '12', '3', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1200', '3', '0', '0', '0', '12', '4', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1201', '3', '0', '0', '0', '12', '5', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1202', '3', '0', '0', '0', '12', '6', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1203', '3', '0', '0', '0', '12', '7', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1204', '3', '0', '0', '0', '13', '1', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1205', '3', '0', '0', '0', '13', '2', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1206', '3', '0', '0', '0', '13', '3', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1207', '3', '0', '0', '0', '13', '4', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1208', '3', '0', '0', '0', '13', '5', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1209', '3', '0', '0', '0', '13', '6', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1210', '3', '0', '0', '0', '13', '7', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1211', '3', '0', '0', '0', '14', '1', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1212', '3', '0', '0', '0', '14', '2', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1213', '3', '0', '0', '0', '14', '3', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1214', '3', '0', '0', '0', '14', '4', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1215', '3', '0', '0', '0', '14', '5', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1216', '3', '0', '0', '0', '14', '6', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1217', '3', '0', '0', '0', '14', '7', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1218', '3', '0', '0', '0', '15', '1', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1219', '3', '0', '0', '0', '15', '2', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1220', '3', '0', '0', '0', '15', '3', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1221', '3', '0', '0', '0', '15', '4', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1222', '3', '0', '0', '0', '15', '5', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1223', '3', '0', '0', '0', '15', '6', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1224', '3', '0', '0', '0', '15', '7', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1225', '3', '0', '0', '0', '16', '1', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1226', '3', '0', '0', '0', '16', '2', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1227', '3', '0', '0', '0', '16', '3', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1228', '3', '0', '0', '0', '16', '4', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1229', '3', '0', '0', '0', '16', '5', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1230', '3', '0', '0', '0', '16', '6', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1231', '3', '0', '0', '0', '16', '7', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1232', '3', '0', '0', '0', '17', '1', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1233', '3', '0', '0', '0', '17', '2', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1234', '3', '0', '0', '0', '17', '3', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1235', '3', '0', '0', '0', '17', '4', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1236', '3', '0', '0', '0', '17', '5', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1237', '3', '0', '0', '0', '17', '6', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1238', '3', '0', '0', '0', '17', '7', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1239', '3', '0', '0', '0', '18', '1', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1240', '3', '0', '0', '0', '18', '2', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1241', '3', '0', '0', '0', '18', '3', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1242', '3', '0', '0', '0', '18', '4', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1243', '3', '0', '0', '0', '18', '5', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1244', '3', '0', '0', '0', '18', '6', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1245', '3', '0', '0', '0', '18', '7', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1246', '3', '0', '0', '0', '19', '1', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1247', '3', '0', '0', '0', '19', '2', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1248', '3', '0', '0', '0', '19', '3', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1249', '3', '0', '0', '0', '19', '4', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1250', '3', '0', '0', '0', '19', '5', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1251', '3', '0', '0', '0', '19', '6', '8', '4');
INSERT INTO `psb_setbiaya` VALUES ('1252', '3', '0', '0', '0', '19', '7', '8', '4');

-- ----------------------------
-- Table structure for psb_statussiswa
-- ----------------------------
DROP TABLE IF EXISTS `psb_statussiswa`;
CREATE TABLE `psb_statussiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `urutan` int(10) unsigned NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`status`),
  UNIQUE KEY `UX_statussiswa` (`replid`),
  KEY `IX_statussiswa_ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_statussiswa
-- ----------------------------

-- ----------------------------
-- Table structure for psb_syarat
-- ----------------------------
DROP TABLE IF EXISTS `psb_syarat`;
CREATE TABLE `psb_syarat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `syarat` varchar(100) NOT NULL,
  `wajib` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_syarat
-- ----------------------------

-- ----------------------------
-- Table structure for psb_tmp
-- ----------------------------
DROP TABLE IF EXISTS `psb_tmp`;
CREATE TABLE `psb_tmp` (
  `dcid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `photo` mediumblob NOT NULL,
  PRIMARY KEY (`dcid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_tmp
-- ----------------------------

-- ----------------------------
-- Table structure for psb_tmp_saudara
-- ----------------------------
DROP TABLE IF EXISTS `psb_tmp_saudara`;
CREATE TABLE `psb_tmp_saudara` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sesid` varchar(40) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `sekolah` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_tmp_saudara
-- ----------------------------
