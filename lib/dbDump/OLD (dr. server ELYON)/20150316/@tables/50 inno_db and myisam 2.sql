/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-03-16 23:51:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_hrd
-- ----------------------------
DROP TABLE IF EXISTS `admin_hrd`;
CREATE TABLE `admin_hrd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(30) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `mod` int(1) NOT NULL DEFAULT '0',
  `ordering` int(2) NOT NULL,
  `parent` int(2) NOT NULL DEFAULT '0',
  `icon` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admin_hrd
-- ----------------------------
INSERT INTO `admin_hrd` VALUES ('2', 'Settings', '#', '0', '2', '0', 'settings.png');
INSERT INTO `admin_hrd` VALUES ('3', 'Penggajian', '#', '0', '5', '0', 'tools.png');
INSERT INTO `admin_hrd` VALUES ('4', 'Master', '#', '0', '3', '0', 'apperance.png');
INSERT INTO `admin_hrd` VALUES ('8', 'Departemen', 'departemen', '1', '1', '4', '');
INSERT INTO `admin_hrd` VALUES ('10', 'Setting WebSite', 'settingwebsite', '1', '6', '2', '');
INSERT INTO `admin_hrd` VALUES ('14', 'User Login', 'user', '1', '1', '2', '');
INSERT INTO `admin_hrd` VALUES ('73', 'Karyawan', '#', '0', '4', '0', 'karyawan.png');
INSERT INTO `admin_hrd` VALUES ('75', 'Jabatan', 'jabatan', '1', '2', '4', '');
INSERT INTO `admin_hrd` VALUES ('76', 'Pendidikan', 'pendidikan', '1', '3', '4', '');
INSERT INTO `admin_hrd` VALUES ('77', 'Status Karyawan', 'statuskaryawan', '1', '4', '4', '');
INSERT INTO `admin_hrd` VALUES ('79', 'Daftar Karyawan', 'karyawan', '1', '1', '73', '');
INSERT INTO `admin_hrd` VALUES ('80', 'History Karyawan', 'historykaryawan', '1', '2', '73', '');
INSERT INTO `admin_hrd` VALUES ('81', 'Kelengkapan Berkas', 'kelengkapanberkas', '1', '3', '73', '');
INSERT INTO `admin_hrd` VALUES ('82', 'Absensi Karyawan', 'absensi', '1', '4', '73', '');
INSERT INTO `admin_hrd` VALUES ('83', 'Penggajian Karyawan', 'penggajian', '1', '1', '3', '');
INSERT INTO `admin_hrd` VALUES ('87', 'Agama', 'agama', '1', '5', '4', '');
INSERT INTO `admin_hrd` VALUES ('88', 'Cuti Karyawan', 'cuti', '1', '6', '73', '');

-- ----------------------------
-- Table structure for aka_absen
-- ----------------------------
DROP TABLE IF EXISTS `aka_absen`;
CREATE TABLE `aka_absen` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `absen` varchar(3) NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_absen
-- ----------------------------
INSERT INTO `aka_absen` VALUES ('1', '1', 'H', '2014-01-23', '');
INSERT INTO `aka_absen` VALUES ('2', '2', 'H', '2014-01-23', '');
INSERT INTO `aka_absen` VALUES ('3', '4', 'H', '2014-01-23', '');
INSERT INTO `aka_absen` VALUES ('4', '1', 'H', '2014-01-22', '');
INSERT INTO `aka_absen` VALUES ('5', '2', 'H', '2014-01-22', '');
INSERT INTO `aka_absen` VALUES ('6', '4', 'S', '2014-01-22', '');
INSERT INTO `aka_absen` VALUES ('7', '7', 'H', '2015-01-01', '');
INSERT INTO `aka_absen` VALUES ('8', '5', 'H', '2015-01-01', '');
INSERT INTO `aka_absen` VALUES ('9', '4', 'H', '2015-01-01', '');
INSERT INTO `aka_absen` VALUES ('10', '2', 'H', '2015-01-01', '');

-- ----------------------------
-- Table structure for aka_absen_guru
-- ----------------------------
DROP TABLE IF EXISTS `aka_absen_guru`;
CREATE TABLE `aka_absen_guru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guru` int(10) unsigned NOT NULL,
  `absen` varchar(3) NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_absen_guru
-- ----------------------------
INSERT INTO `aka_absen_guru` VALUES ('1', '2', 'H', '2014-01-23', '');
INSERT INTO `aka_absen_guru` VALUES ('2', '3', 'H', '2014-01-23', '');
INSERT INTO `aka_absen_guru` VALUES ('3', '1', 'H', '2014-01-23', '');
INSERT INTO `aka_absen_guru` VALUES ('4', '4', 'H', '2014-01-23', '');

-- ----------------------------
-- Table structure for aka_alumni
-- ----------------------------
DROP TABLE IF EXISTS `aka_alumni`;
CREATE TABLE `aka_alumni` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunlulus` varchar(4) NOT NULL DEFAULT '0000',
  `siswa` int(10) unsigned NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_alumni
-- ----------------------------
INSERT INTO `aka_alumni` VALUES ('5', '1', '577', 'yes');

-- ----------------------------
-- Table structure for aka_daftarnilai
-- ----------------------------
DROP TABLE IF EXISTS `aka_daftarnilai`;
CREATE TABLE `aka_daftarnilai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `penilaian` int(10) unsigned NOT NULL,
  `siswa` int(10) unsigned NOT NULL,
  `nilai` float NOT NULL DEFAULT '0',
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_daftarnilai
-- ----------------------------

-- ----------------------------
-- Table structure for aka_grup
-- ----------------------------
DROP TABLE IF EXISTS `aka_grup`;
CREATE TABLE `aka_grup` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `urut` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_grup
-- ----------------------------

-- ----------------------------
-- Table structure for aka_jadwal
-- ----------------------------
DROP TABLE IF EXISTS `aka_jadwal`;
CREATE TABLE `aka_jadwal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `semester` int(10) unsigned NOT NULL DEFAULT '0',
  `kelas` int(10) unsigned NOT NULL,
  `hari` smallint(5) unsigned NOT NULL,
  `jam` mediumint(8) unsigned NOT NULL,
  `sks` int(10) unsigned NOT NULL,
  `ruang` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_jadwal
-- ----------------------------
INSERT INTO `aka_jadwal` VALUES ('2', '1', '0', '1', '1', '1', '1', '0');
INSERT INTO `aka_jadwal` VALUES ('3', '1', '0', '1', '1', '2', '2', '0');
INSERT INTO `aka_jadwal` VALUES ('4', '1', '0', '1', '1', '3', '13', '0');
INSERT INTO `aka_jadwal` VALUES ('5', '1', '0', '1', '1', '4', '14', '0');
INSERT INTO `aka_jadwal` VALUES ('6', '1', '0', '1', '2', '1', '3', '0');
INSERT INTO `aka_jadwal` VALUES ('7', '1', '0', '1', '1', '5', '25', '0');
INSERT INTO `aka_jadwal` VALUES ('8', '1', '0', '1', '1', '6', '24', '0');
INSERT INTO `aka_jadwal` VALUES ('10', '1', '0', '1', '2', '2', '36', '0');
INSERT INTO `aka_jadwal` VALUES ('11', '1', '0', '1', '2', '3', '38', '0');
INSERT INTO `aka_jadwal` VALUES ('14', '1', '0', '2', '1', '2', '28', '0');
INSERT INTO `aka_jadwal` VALUES ('15', '1', '0', '2', '2', '1', '29', '0');
INSERT INTO `aka_jadwal` VALUES ('16', '1', '0', '2', '1', '3', '39', '0');
INSERT INTO `aka_jadwal` VALUES ('17', '1', '0', '2', '1', '4', '41', '0');
INSERT INTO `aka_jadwal` VALUES ('19', '1', '0', '1', '1', '7', '37', '0');
INSERT INTO `aka_jadwal` VALUES ('20', '1', '0', '1', '2', '4', '26', '0');
INSERT INTO `aka_jadwal` VALUES ('21', '1', '0', '2', '2', '4', '40', '0');
INSERT INTO `aka_jadwal` VALUES ('22', '1', '0', '2', '2', '2', '16', '0');
INSERT INTO `aka_jadwal` VALUES ('23', '1', '0', '2', '2', '3', '15', '0');
INSERT INTO `aka_jadwal` VALUES ('25', '1', '0', '2', '1', '6', '5', '0');
INSERT INTO `aka_jadwal` VALUES ('26', '1', '0', '2', '1', '7', '4', '0');
INSERT INTO `aka_jadwal` VALUES ('27', '1', '0', '3', '1', '4', '7', '0');
INSERT INTO `aka_jadwal` VALUES ('28', '1', '0', '2', '2', '5', '6', '0');
INSERT INTO `aka_jadwal` VALUES ('29', '1', '0', '3', '1', '5', '8', '0');
INSERT INTO `aka_jadwal` VALUES ('30', '1', '0', '3', '1', '1', '44', '0');
INSERT INTO `aka_jadwal` VALUES ('31', '1', '0', '3', '1', '2', '43', '0');
INSERT INTO `aka_jadwal` VALUES ('32', '1', '0', '2', '1', '1', '27', '0');
INSERT INTO `aka_jadwal` VALUES ('34', '1', '0', '5', '1', '2', '176', '0');
INSERT INTO `aka_jadwal` VALUES ('36', '1', '0', '5', '1', '5', '178', '0');
INSERT INTO `aka_jadwal` VALUES ('37', '1', '0', '5', '1', '6', '177', '0');
INSERT INTO `aka_jadwal` VALUES ('39', '1', '0', '5', '1', '1', '179', '0');
INSERT INTO `aka_jadwal` VALUES ('40', '1', '0', '6', '1', '7', '180', '0');

-- ----------------------------
-- Table structure for aka_jadwal_set
-- ----------------------------
DROP TABLE IF EXISTS `aka_jadwal_set`;
CREATE TABLE `aka_jadwal_set` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `hari` int(10) unsigned NOT NULL,
  `jam` int(10) unsigned NOT NULL DEFAULT '0',
  `aktif` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_jadwal_set
-- ----------------------------
INSERT INTO `aka_jadwal_set` VALUES ('1', '1', '1', '1', '1');
INSERT INTO `aka_jadwal_set` VALUES ('2', '1', '1', '2', '1');
INSERT INTO `aka_jadwal_set` VALUES ('3', '1', '1', '3', '1');
INSERT INTO `aka_jadwal_set` VALUES ('4', '1', '1', '4', '1');
INSERT INTO `aka_jadwal_set` VALUES ('5', '1', '1', '5', '1');
INSERT INTO `aka_jadwal_set` VALUES ('6', '1', '1', '6', '1');
INSERT INTO `aka_jadwal_set` VALUES ('7', '1', '1', '7', '1');
INSERT INTO `aka_jadwal_set` VALUES ('8', '1', '2', '1', '1');
INSERT INTO `aka_jadwal_set` VALUES ('9', '1', '2', '2', '1');
INSERT INTO `aka_jadwal_set` VALUES ('10', '1', '2', '3', '1');
INSERT INTO `aka_jadwal_set` VALUES ('11', '1', '2', '4', '1');
INSERT INTO `aka_jadwal_set` VALUES ('12', '1', '2', '5', '1');
INSERT INTO `aka_jadwal_set` VALUES ('13', '1', '2', '6', '1');
INSERT INTO `aka_jadwal_set` VALUES ('14', '1', '2', '7', '1');
INSERT INTO `aka_jadwal_set` VALUES ('15', '1', '3', '1', '1');
INSERT INTO `aka_jadwal_set` VALUES ('16', '1', '3', '2', '1');
INSERT INTO `aka_jadwal_set` VALUES ('17', '1', '3', '3', '1');
INSERT INTO `aka_jadwal_set` VALUES ('18', '1', '3', '4', '1');
INSERT INTO `aka_jadwal_set` VALUES ('19', '1', '3', '5', '1');
INSERT INTO `aka_jadwal_set` VALUES ('20', '1', '3', '6', '1');
INSERT INTO `aka_jadwal_set` VALUES ('21', '1', '3', '7', '1');
INSERT INTO `aka_jadwal_set` VALUES ('22', '1', '4', '1', '1');
INSERT INTO `aka_jadwal_set` VALUES ('23', '1', '4', '2', '1');
INSERT INTO `aka_jadwal_set` VALUES ('24', '1', '4', '3', '1');
INSERT INTO `aka_jadwal_set` VALUES ('25', '1', '4', '4', '1');
INSERT INTO `aka_jadwal_set` VALUES ('26', '1', '4', '5', '1');
INSERT INTO `aka_jadwal_set` VALUES ('27', '1', '4', '6', '1');
INSERT INTO `aka_jadwal_set` VALUES ('28', '1', '4', '7', '1');
INSERT INTO `aka_jadwal_set` VALUES ('29', '1', '5', '1', '1');
INSERT INTO `aka_jadwal_set` VALUES ('30', '1', '5', '2', '1');
INSERT INTO `aka_jadwal_set` VALUES ('31', '1', '5', '3', '1');
INSERT INTO `aka_jadwal_set` VALUES ('32', '1', '5', '4', '1');
INSERT INTO `aka_jadwal_set` VALUES ('33', '1', '5', '5', '1');
INSERT INTO `aka_jadwal_set` VALUES ('34', '1', '5', '6', '1');
INSERT INTO `aka_jadwal_set` VALUES ('35', '1', '5', '7', '1');
INSERT INTO `aka_jadwal_set` VALUES ('36', '3', '1', '1', '1');
INSERT INTO `aka_jadwal_set` VALUES ('37', '3', '1', '2', '1');
INSERT INTO `aka_jadwal_set` VALUES ('38', '3', '1', '3', '1');
INSERT INTO `aka_jadwal_set` VALUES ('39', '3', '1', '4', '1');
INSERT INTO `aka_jadwal_set` VALUES ('40', '3', '1', '5', '1');
INSERT INTO `aka_jadwal_set` VALUES ('41', '3', '1', '6', '1');
INSERT INTO `aka_jadwal_set` VALUES ('42', '3', '1', '7', '1');
INSERT INTO `aka_jadwal_set` VALUES ('43', '3', '2', '1', '1');
INSERT INTO `aka_jadwal_set` VALUES ('44', '3', '2', '2', '1');
INSERT INTO `aka_jadwal_set` VALUES ('45', '3', '2', '3', '1');
INSERT INTO `aka_jadwal_set` VALUES ('46', '3', '2', '4', '1');
INSERT INTO `aka_jadwal_set` VALUES ('47', '3', '2', '5', '1');
INSERT INTO `aka_jadwal_set` VALUES ('48', '3', '2', '6', '1');
INSERT INTO `aka_jadwal_set` VALUES ('49', '3', '2', '7', '1');
INSERT INTO `aka_jadwal_set` VALUES ('50', '3', '3', '1', '1');
INSERT INTO `aka_jadwal_set` VALUES ('51', '3', '3', '2', '1');
INSERT INTO `aka_jadwal_set` VALUES ('52', '3', '3', '3', '1');
INSERT INTO `aka_jadwal_set` VALUES ('53', '3', '3', '4', '1');
INSERT INTO `aka_jadwal_set` VALUES ('54', '3', '3', '5', '1');
INSERT INTO `aka_jadwal_set` VALUES ('55', '3', '3', '6', '1');
INSERT INTO `aka_jadwal_set` VALUES ('56', '3', '3', '7', '1');
INSERT INTO `aka_jadwal_set` VALUES ('57', '3', '4', '1', '1');
INSERT INTO `aka_jadwal_set` VALUES ('58', '3', '4', '2', '1');
INSERT INTO `aka_jadwal_set` VALUES ('59', '3', '4', '3', '1');
INSERT INTO `aka_jadwal_set` VALUES ('60', '3', '4', '4', '1');
INSERT INTO `aka_jadwal_set` VALUES ('61', '3', '4', '5', '1');
INSERT INTO `aka_jadwal_set` VALUES ('62', '3', '4', '6', '1');
INSERT INTO `aka_jadwal_set` VALUES ('63', '3', '4', '7', '1');
INSERT INTO `aka_jadwal_set` VALUES ('64', '3', '5', '1', '1');
INSERT INTO `aka_jadwal_set` VALUES ('65', '3', '5', '2', '1');
INSERT INTO `aka_jadwal_set` VALUES ('66', '3', '5', '3', '1');
INSERT INTO `aka_jadwal_set` VALUES ('67', '3', '5', '4', '1');
INSERT INTO `aka_jadwal_set` VALUES ('68', '3', '5', '5', '1');
INSERT INTO `aka_jadwal_set` VALUES ('69', '3', '5', '6', '1');
INSERT INTO `aka_jadwal_set` VALUES ('70', '3', '5', '7', '1');

-- ----------------------------
-- Table structure for aka_jenismutasi
-- ----------------------------
DROP TABLE IF EXISTS `aka_jenismutasi`;
CREATE TABLE `aka_jenismutasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_jenismutasi
-- ----------------------------
INSERT INTO `aka_jenismutasi` VALUES ('1', 'Pindah sekolah');

-- ----------------------------
-- Table structure for aka_jurnal
-- ----------------------------
DROP TABLE IF EXISTS `aka_jurnal`;
CREATE TABLE `aka_jurnal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guru` int(10) unsigned NOT NULL,
  `pelajaran` int(10) unsigned NOT NULL,
  `kelas` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_jurnal
-- ----------------------------

-- ----------------------------
-- Table structure for aka_kegiatan
-- ----------------------------
DROP TABLE IF EXISTS `aka_kegiatan`;
CREATE TABLE `aka_kegiatan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `efektif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_kegiatan
-- ----------------------------
INSERT INTO `aka_kegiatan` VALUES ('1', '1', '2014-07-15', '0000-00-00', '1', 'Hari pertama masuk tahun ajaran 2014-2015');
INSERT INTO `aka_kegiatan` VALUES ('3', '1', '2014-12-25', '0000-00-00', '1', 'Merry Christmas');

-- ----------------------------
-- Table structure for aka_komennilai
-- ----------------------------
DROP TABLE IF EXISTS `aka_komennilai`;
CREATE TABLE `aka_komennilai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `pelajaran` int(10) unsigned NOT NULL,
  `komen` varchar(300) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_komennilai
-- ----------------------------

-- ----------------------------
-- Table structure for aka_komenrapor
-- ----------------------------
DROP TABLE IF EXISTS `aka_komenrapor`;
CREATE TABLE `aka_komenrapor` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `siswa` int(10) unsigned NOT NULL,
  `komen` varchar(300) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_komenrapor
-- ----------------------------

-- ----------------------------
-- Table structure for aka_mutasi
-- ----------------------------
DROP TABLE IF EXISTS `aka_mutasi`;
CREATE TABLE `aka_mutasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` int(10) unsigned NOT NULL DEFAULT '0',
  `jenismutasi` int(10) unsigned NOT NULL,
  `siswa` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(500) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_mutasi
-- ----------------------------

-- ----------------------------
-- Table structure for aka_ruang
-- ----------------------------
DROP TABLE IF EXISTS `aka_ruang`;
CREATE TABLE `aka_ruang` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_ruang
-- ----------------------------

-- ----------------------------
-- Table structure for aka_setting
-- ----------------------------
DROP TABLE IF EXISTS `aka_setting`;
CREATE TABLE `aka_setting` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kunci` char(6) NOT NULL,
  `nilai` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_setting
-- ----------------------------

-- ----------------------------
-- Table structure for aka_siswa_ayah
-- ----------------------------
DROP TABLE IF EXISTS `aka_siswa_ayah`;
CREATE TABLE `aka_siswa_ayah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=735 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_siswa_ayah
-- ----------------------------
INSERT INTO `aka_siswa_ayah` VALUES ('1', '1', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('2', '2', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('4', '4', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('5', '5', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('7', '7', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('11', '10', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('14', '13', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('15', '14', 'Denny Osmond Nugroho', '', '0000-00-00', '0', 'Indonesia', '', '', '0', '085746047047', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('16', '15', 'Lie Teng', '', '0000-00-00', '0', 'Indonesia', '', '', '0', '083856083916', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('17', '16', 'Denny Tanujaya', '', '0000-00-00', '0', 'Indonesia', '', '', '0', '03170109151', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('18', '17', 'Luvit Njoto Kusuma Prawirodiarjo', '', '0000-00-00', '0', 'Indonesia', '', '', '0', '08123572896', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('19', '18', 'Richard Sebastian Ho', '', '0000-00-00', '0', 'Indonesia', '', '', '0', '0818398989', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('20', '19', 'Tony Yongnardi', '', '0000-00-00', '0', '', '', '', '0', '081357676734', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('21', '20', 'Kurniawan', '', '0000-00-00', '0', '', '', '', '0', '08123181606', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('22', '21', 'Richard Sebastian Ho', 'Surabaya', '1972-06-30', '0', 'Indonesia', '', 'Karyawan Swasta', '0', '0818398989', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('23', '22', 'Budijanto Hertanto', '', '0000-00-00', '0', '', '', '', '0', '0811322223', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('24', '23', 'Iwan Aditiarsa', '', '0000-00-00', '0', '', '', '', '0', '081553515758', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('25', '24', 'Yudi Satrio', '', '0000-00-00', '0', '', '', 'Karyawan', '0', '0818399688', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('26', '25', 'Hendrik Sia', '', '0000-00-00', '0', '', '', '', '0', '081524101200', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('27', '26', 'Budiyono Hutomo', '', '0000-00-00', '0', '', '', '', '0', '081259335967', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('29', '28', 'Johny K. Muniaga', '', '0000-00-00', '0', '', '', '', '0', '081330404983', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('30', '29', 'Stefanus Devi Gunawan', '', '0000-00-00', '0', '', '', '', '0', '0811315757', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('31', '30', 'Jhonny', '', '0000-00-00', '0', '', '', '', '0', '081357545517', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('32', '31', 'David Martosentono', '', '0000-00-00', '0', '', '', '', '0', '087775746250', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('33', '32', 'Fianto Anthonius', '', '0000-00-00', '0', '', '', '', '0', '0811373629', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('34', '33', 'Jonatan Halim Tjandra', '', '0000-00-00', '0', '', '', '', '0', '08113417708', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('35', '34', 'Wijaya', '', '0000-00-00', '0', '', '', '', '0', '08165446888', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('36', '35', 'Haryanto', '', '0000-00-00', '0', '', '', '', '0', '0816531435', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('37', '36', 'Levi Lee Ie Thien', '', '0000-00-00', '0', '', '', '', '0', '08123536170', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('38', '37', 'Tjondrosusilo', '', '0000-00-00', '0', '', '', '', '0', '08123599672', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('39', '38', 'Puguh Kris Hermawan', '', '0000-00-00', '0', '', '', '', '0', '088217131582', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('40', '39', 'Ervan Wiryawan Chan', '', '0000-00-00', '0', '', '', '', '0', '08179387001', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('41', '40', 'Hudiono Gunawan', '', '0000-00-00', '0', '', '', '', '0', '08123002833', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('42', '41', 'Christian Adiwinata', '', '0000-00-00', '0', '', '', '', '0', '081330502080', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('43', '42', 'Willy Tejokusumo', '', '0000-00-00', '0', '', '', '', '0', '081282029666', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('44', '43', 'Lo Senjaya Dwi Wicaksono', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('45', '44', 'Tony Yongnardi', 'Surabaya', '1975-12-26', '0', 'Indonesian', '', 'Merchant', '0', '081357676734', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('46', '45', 'Aric', '', '0000-00-00', '0', 'Indonesia', '', '', '0', '081230234566', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('47', '46', 'Denny', '', '0000-00-00', '0', '', '', '', '0', '0811320338', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('48', '47', 'Indradi Hardijanto', '', '0000-00-00', '0', '', '', '', '0', '081515182352', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('49', '48', 'Yansen Tungary', '', '0000-00-00', '0', '', '', '', '0', '081515182352', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('50', '49', 'Daniel', '', '0000-00-00', '0', '', '', '', '0', '081332288000', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('51', '50', 'Herman Tanujaya', '', '0000-00-00', '0', '', '', '', '0', '081515182352', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('52', '51', 'Paulus Teguh', '', '0000-00-00', '0', '', '', '', '0', '081335361881', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('53', '52', 'Jap Herman', '', '0000-00-00', '0', '', '', '', '0', '081332679777', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('54', '53', 'Cahyadi Gunawan', '', '0000-00-00', '0', '', '', '', '0', '0818589461', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('56', '55', 'Wibisono', '', '0000-00-00', '0', '', '', '', '0', '082245656515', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('57', '56', 'Tio Hian Bing', '', '0000-00-00', '0', '', '', '', '0', '08123457000', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('58', '57', 'Santana Young P.', '', '0000-00-00', '0', '', '', '', '0', '083877798998', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('59', '58', 'Ronny Budiharjo', '', '0000-00-00', '0', '', '', '', '0', '0818398741', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('60', '59', 'Freddy Waskita S', '', '0000-00-00', '0', '', '', '', '0', '70905575', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('61', '60', 'Witdodo', '', '0000-00-00', '0', '', '', '', '0', '08165409117', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('62', '61', 'Levi Lee Ie Thien', '', '0000-00-00', '0', '', '', '', '0', '08123536170', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('63', '62', 'Sujanto', '', '0000-00-00', '0', '', '', '', '0', '08563024022', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('64', '63', 'Agung Dewanto', '', '0000-00-00', '0', '', '', '', '0', '08883000162', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('65', '64', 'Richard Oentoro', '', '0000-00-00', '0', '', '', '', '0', '70575260', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('67', '66', 'Kwee Chrisdy S', '', '0000-00-00', '0', '', '', '', '0', '709189999', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('68', '67', 'Budi Kristanto', '', '0000-00-00', '0', '', '', '', '0', '709189999', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('69', '68', 'David Wibisono', '', '0000-00-00', '0', '', '', '', '0', '92520288', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('70', '69', 'Brury', '', '0000-00-00', '0', '', '', '', '0', '8700123', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('71', '70', 'Hubertus R', '', '0000-00-00', '0', '', '', '', '0', '081230076565', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('72', '71', 'Ronny Wibisono', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('73', '72', 'Erwin Irawan', '', '0000-00-00', '0', '', '', '', '0', '08155101031', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('74', '73', 'Basuki Rachman', '', '0000-00-00', '0', '', '', '', '0', '78177180', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('75', '74', 'Widodo', '', '0000-00-00', '0', '', '', '', '0', '08123216288', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('76', '75', 'Margono Wongso P', '', '0000-00-00', '0', '', '', '', '0', '085236005819', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('77', '76', 'Jap Herman', '', '0000-00-00', '0', '', '', '', '0', '081332679777', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('78', '77', 'Budi Santoso', '', '0000-00-00', '0', '', '', '', '0', '0818328585', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('79', '78', 'Anton Soeharto', '', '0000-00-00', '0', '', '', '', '0', '706488841', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('80', '79', 'Hengky Pranajaya', '', '0000-00-00', '0', '', '', '', '0', '08121678335', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('81', '80', 'Prayuda', '', '0000-00-00', '0', '', '', '', '0', '081330622788', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('82', '81', 'Siw Notohadipuro', '', '0000-00-00', '0', '', '', '', '0', '08563383555', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('83', '82', 'Rifky Yudana', '', '0000-00-00', '0', '', '', '', '0', '08123161558', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('84', '83', 'Chandra IT', '', '0000-00-00', '0', '', '', '', '0', '72798209', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('85', '84', 'Liem Edy Soejanto', '', '0000-00-00', '0', '', '', '', '0', '72622206', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('86', '85', 'Denny Tanujaya', 'Surabaya', '1979-10-23', '0', 'Indonesia', '', 'Karyawan Swasta', '0', '70109151', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('87', '86', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('88', '87', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('89', '88', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('90', '89', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('91', '90', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('92', '91', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('93', '92', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('94', '93', 'Hendry', '', '0000-00-00', '0', '', '', '', '0', '081331301211', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('95', '94', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('96', '95', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('97', '96', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('98', '97', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('99', '98', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('100', '99', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('101', '100', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('102', '101', 'Daniel Chang', '', '0000-00-00', '0', '', '', '', '0', '082139568687', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('103', '102', 'Elemas', '', '0000-00-00', '0', '', '', '', '0', '08123024020', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('104', '103', 'Ong Henry', '', '0000-00-00', '0', '', '', '', '0', '62811323332', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('105', '104', 'Hadi Susanto', '', '0000-00-00', '0', '', '', '', '0', '08123285355', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('107', '106', 'Freddy Waskita S', '', '0000-00-00', '0', '', '', '', '0', '081331462888', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('108', '107', 'Agus Purnama', '', '0000-00-00', '0', '', '', '', '0', '70589188', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('109', '108', 'Jeffry Benjamin S', '', '0000-00-00', '0', '', '', '', '0', '08883180717', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('110', '109', 'Agung Dewanto', '', '0000-00-00', '0', '', '', '', '0', '08155252723', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('111', '110', 'Fianto Anthonius', '', '0000-00-00', '0', '', '', '', '0', '0811373629', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('112', '111', 'Tan Henry Sudewo', '', '0000-00-00', '0', '', '', '', '0', '0817321199', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('113', '112', 'Caiwandi Soekohin', '', '0000-00-00', '0', '', '', '', '0', '0811371118', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('114', '113', 'Andy Gotama', '', '0000-00-00', '0', '', '', '', '0', '08123128200', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('115', '114', 'Daniel Hartono', '', '0000-00-00', '0', '', '', '', '0', '08123245986', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('116', '115', 'Lo Senjaya Dwi Wicaksono', '', '0000-00-00', '0', '', '', '', '0', '08563350089', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('117', '116', 'Denny', '', '0000-00-00', '0', '', '', '', '0', '0811320338', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('118', '117', 'Edhi Gunarso', '', '0000-00-00', '0', '', '', '', '0', '8557843', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('119', '118', 'Yudi Oentoro', '', '0000-00-00', '0', '', '', '', '0', '0811347396', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('120', '119', 'Richard Oentoro', '', '0000-00-00', '0', '', '', '', '0', '70618483', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('121', '120', 'Paulus Teguh', '', '0000-00-00', '0', '', '', '', '0', '081335361881', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('122', '121', 'Budi Santoso', '', '0000-00-00', '0', '', '', '', '0', '70336000', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('123', '122', 'Andy Gotama', '', '0000-00-00', '0', '', '', '', '0', '08123128200', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('124', '123', 'Andy Wahjudi', '', '0000-00-00', '0', '', '', '', '0', '91011610', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('125', '124', 'Judijanto', '', '0000-00-00', '0', '', '', '', '0', '72397337', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('126', '125', 'Swandy Kohar', '', '0000-00-00', '0', '', '', '', '0', '70997380', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('127', '126', 'Ferry Arman Soetedjo', '', '0000-00-00', '0', '', '', '', '0', '70580694', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('128', '127', 'Andreas Halim', '', '0000-00-00', '0', '', '', '', '0', '081803133028', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('129', '128', 'Andreas Santoso (alm.)', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('130', '129', 'Jo Lukas Wihelmus', '', '0000-00-00', '0', '', '', '', '0', '085231059999', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('131', '130', 'Faustinus Haryanto', '', '0000-00-00', '0', '', '', '', '0', '70579055', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('132', '131', 'Joko Cipto Lim', '', '0000-00-00', '0', '', '', '', '0', '70183169', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('133', '132', 'Andreas Hartawan', '', '0000-00-00', '0', '', '', '', '0', '08175111313', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('134', '133', 'David Wibisono', '', '0000-00-00', '0', '', '', '', '0', '081933884888', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('135', '134', 'Chandra IT', '', '0000-00-00', '0', '', '', '', '0', '72798209', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('136', '135', 'Joko Cipto Lim', '', '0000-00-00', '0', '', '', '', '0', '70183169', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('137', '136', 'Tan Henry Sudewo', '', '0000-00-00', '0', '', '', '', '0', '70615656', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('138', '137', 'Freddy Waskita S', '', '0000-00-00', '0', '', '', '', '0', '70905575', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('139', '138', 'Jo Lukas Wihelmus', '', '0000-00-00', '0', '', '', '', '0', '085231059999', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('140', '139', 'Daniel Hartono', '', '0000-00-00', '0', '', '', '', '0', '8795917', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('141', '140', 'FX Surya Kusuma', '', '0000-00-00', '0', '', '', '', '0', '70768181', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('142', '141', 'Agustinus Hadi Prijo Raharjo', '', '0000-00-00', '0', '', '', '', '0', '70181257', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('143', '142', 'Wirahadi Yang', '', '0000-00-00', '0', '', '', '', '0', '818317037', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('144', '143', 'Siwi Notohadipuro', '', '0000-00-00', '0', '', '', '', '0', '60100358', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('145', '144', 'Caiwandi Soekohin', '', '0000-00-00', '0', '', '', '', '0', '0811371118', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('146', '145', 'Siwi Notohadipuro', '', '0000-00-00', '0', 'Indonesia', '', '', '0', '08563383555', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('147', '146', 'Beto Budiyono', '', '0000-00-00', '0', '', '', '', '0', '0811376473', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('148', '147', 'Johan Parmenas', '', '0000-00-00', '0', '', '', '', '0', '71227740', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('149', '148', 'Boedi Santoso', '', '0000-00-00', '0', '', '', '', '0', '08123581231', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('150', '149', 'Andries Ingkiriwang', '', '0000-00-00', '0', '', '', '', '0', '082131037888', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('151', '150', 'Roy Gunarto', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('152', '151', 'Rudy Boesono', '', '0000-00-00', '0', '', '', '', '0', '08113643668', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('153', '152', 'Karsuman', '', '0000-00-00', '0', '', '', '', '0', '03191299334', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('154', '153', 'Indrawan Tedja', '', '0000-00-00', '0', '', '', '', '0', '0818399209', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('155', '154', 'Anwar T', '', '0000-00-00', '0', '', '', '', '0', '0811322662', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('156', '155', 'Hartono Chu', '', '0000-00-00', '0', '', '', '', '0', '082139195883', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('157', '156', 'Nio Hartono S.T', '', '0000-00-00', '0', '', '', '', '0', '081331955688', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('158', '157', 'Fandi Tejakesuma', '', '0000-00-00', '0', '', '', '', '0', '0811317189', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('159', '158', 'Mintodjo Yudoputro', '', '0000-00-00', '0', '', '', '', '0', '0817317200', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('160', '159', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('161', '160', 'Hartanto C', '', '0000-00-00', '0', '', '', '', '0', '03170476688', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('162', '161', 'Elidad Tjokro', '', '0000-00-00', '0', '', '', '', '0', '08123536161', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('163', '162', 'Handoko S', '', '0000-00-00', '0', '', '', '', '0', '0816539190', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('164', '163', 'Jeffry Wijaya', '', '0000-00-00', '0', '', '', '', '0', '0818500838', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('165', '164', 'Jeffry Wijaya', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('166', '165', 'Anton T', '', '0000-00-00', '0', '', '', '', '0', '0811374680', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('167', '166', 'Thomas K', '', '0000-00-00', '0', '', '', '', '0', '081938080068', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('168', '167', 'Himawan. W', '', '0000-00-00', '0', '', '', '', '0', '08175160390', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('169', '168', 'Thomas K', '', '0000-00-00', '0', '', '', '', '0', '0816505940', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('170', '169', 'Agus Susanto', '', '0000-00-00', '0', '', '', '', '0', '0338452605', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('171', '170', 'Wanda Susena', '', '0000-00-00', '0', '', '', '', '0', '0816518269', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('172', '171', 'Lie Wie Sian', '', '0000-00-00', '0', '', '', '', '0', '082332076127', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('173', '172', 'Hari Wiryawan', '', '0000-00-00', '0', '', '', '', '0', '081330352939', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('174', '173', 'Herman Aniversario', '', '0000-00-00', '0', '', '', '', '0', '082233989138', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('175', '174', 'Isaac', '', '0000-00-00', '0', '', '', '', '0', '0816520900', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('176', '175', 'Herman Salim', '', '0000-00-00', '0', '', '', '', '0', '08123530298', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('177', '176', 'Sadrach Soewargo', '', '0000-00-00', '0', '', '', '', '0', '081615113555', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('178', '177', 'Robert Samaoen', '', '0000-00-00', '0', '', '', '', '0', '08885011616', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('179', '178', 'Benny Widjaja', '', '0000-00-00', '0', '', '', '', '0', '0811376994', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('180', '179', 'Moeljadi. H', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('181', '180', 'Irwan Santoso', '', '0000-00-00', '0', '', '', '', '0', '08123215073', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('182', '181', 'Ong Sie Kok', '', '0000-00-00', '0', '', '', '', '0', '081220084901', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('183', '182', 'Jemy Tjahyadi', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('184', '183', 'David Samuel', '', '0000-00-00', '0', '', '', '', '0', '081235071000', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('185', '184', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('186', '185', 'Rudi Untung', '', '0000-00-00', '0', '', '', '', '0', '0811312012', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('187', '186', 'Johan Danyo', '', '0000-00-00', '0', '', '', '', '0', '0811319842', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('188', '187', 'Hudiono Gunawan', '', '0000-00-00', '0', '', '', '', '0', '08123002833', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('189', '188', 'Andy Wahyudi', '', '0000-00-00', '0', '', '', '', '0', '5927200', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('190', '189', 'Lie Indrajaya', '', '0000-00-00', '0', '', '', '', '0', '08123008833', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('191', '190', 'Honggo Virgoanto', '', '0000-00-00', '0', '', '', '', '0', '08123111662', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('192', '191', 'Fianto Anthonius T', '', '0000-00-00', '0', '', '', '', '0', '0811373629', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('193', '192', 'Henky kurniawan', '', '0000-00-00', '0', '', '', '', '0', '70026010', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('194', '193', 'David Tedjakusuma', '', '0000-00-00', '0', '', '', '', '0', '081803240553', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('195', '194', 'Agung Dewanto', '', '0000-00-00', '0', '', '', '', '0', '08155252723', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('196', '195', 'Hartanto Andre Saputra', '', '0000-00-00', '0', '', '', '', '0', '08155273899', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('197', '196', 'Agus Purnama', '', '0000-00-00', '0', '', '', '', '0', '70589188', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('198', '197', 'Rudy Siswanto', '', '0000-00-00', '0', '', '', '', '0', '081332174377', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('199', '198', 'Kevin Kho', '', '0000-00-00', '0', '', '', '', '0', '0816502186', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('200', '199', 'Sandi Febrianto', '', '0000-00-00', '0', '', '', '', '0', '08123292134', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('201', '200', 'Elemas', '', '0000-00-00', '0', '', '', '', '0', '08123024020', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('202', '201', 'Yudi Oentoro', '', '0000-00-00', '0', '', '', '', '0', '0811347390', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('203', '202', 'Joko Cipto Lim', '', '0000-00-00', '0', '', '', '', '0', '0811343531', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('204', '203', 'Luky Andrijono', '', '0000-00-00', '0', '', '', '', '0', '60307133', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('205', '204', 'Wolfgang Hoemisch', '', '0000-00-00', '0', '', '', '', '0', '081330679280', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('206', '205', 'Hartanto Yuwono', '', '0000-00-00', '0', '', '', '', '0', '087852751295', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('207', '206', 'Sonny Sugiarto', '', '0000-00-00', '0', '', '', '', '0', '081357212450', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('208', '207', 'Sonny Christanto', '', '0000-00-00', '0', '', '', '', '0', '0816509888', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('209', '208', 'Dedy Sutendy', '', '0000-00-00', '0', '', '', '', '0', '081330367128', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('210', '209', 'Gregorius Hendra.Y', '', '0000-00-00', '0', '', '', '', '0', '70121985', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('211', '210', 'Rudy Prayogo', '', '0000-00-00', '0', '', '', '', '0', '70575240', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('212', '211', 'Tio Hendra Wijaya', '', '0000-00-00', '0', '', '', '', '0', '08113547606', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('215', '214', 'Daniel Chang Tio', '', '0000-00-00', '0', '', '', '', '0', '08213017701', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('216', '215', 'Gunadi Irwan', '', '0000-00-00', '0', '', '', '', '0', '088217122353', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('217', '216', 'Budiyanto Thenios', '', '0000-00-00', '0', '', '', '', '0', '082139929800', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('218', '217', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('219', '218', 'Sonny Limbowo', '', '0000-00-00', '0', '', '', '', '0', '082141311003', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('220', '219', 'Andoko', '', '0000-00-00', '0', '', '', '', '0', '08123008296', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('221', '220', 'Irwan Sutandyo', '', '0000-00-00', '0', '', '', '', '0', '087851525798', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('222', '221', 'Rudy Sudjarwo', '', '0000-00-00', '0', '', '', '', '0', '08199955575', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('223', '222', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('224', '223', 'Seng Kok', '', '0000-00-00', '0', '', '', '', '0', '081803296900', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('225', '224', 'Johsan Pangkey', '', '0000-00-00', '0', '', '', '', '0', '08123078908', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('226', '225', 'Renjani Tanujaya', '', '0000-00-00', '0', '', '', '', '0', '0811377777', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('227', '226', 'Harlianto', '', '0000-00-00', '0', '', '', '', '0', '0811377777', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('228', '227', 'Heru Kurniawan', '', '0000-00-00', '0', '', '', '', '0', '0817851705', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('229', '228', 'Njo King Hwi', '', '0000-00-00', '0', '', '', '', '0', '087810067088', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('230', '229', 'Soetjipto Santoso', '', '0000-00-00', '0', '', '', '', '0', '0817326094', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('231', '230', 'Johannes Julianto', '', '0000-00-00', '0', '', '', '', '0', '0811336952', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('232', '231', 'David Samuel', '', '0000-00-00', '0', '', '', '', '0', '08123536447', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('233', '232', 'Lumanto Wijaya', '', '0000-00-00', '0', '', '', '', '0', '71011818', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('235', '234', 'Fandy Halim', '', '0000-00-00', '0', '', '', '', '0', '70592464', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('236', '235', 'Jimmy Leonardus Katuari', '', '0000-00-00', '0', '', '', '', '0', '081515521971', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('237', '236', 'Gatot Sutanto', '', '0000-00-00', '0', '', '', '', '0', '0818399800', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('238', '237', 'Fendi Hartono', '', '0000-00-00', '0', '', '', '', '0', '081703505366', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('239', '238', 'Siwi Notohadipuro', '', '0000-00-00', '0', '', '', '', '0', '08563383555', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('240', '239', 'Hartanto Andre Saputra', '', '0000-00-00', '0', '', '', '', '0', '08155273899', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('242', '241', 'Benny Wijaya', '', '0000-00-00', '0', '', '', '', '0', '08121756867', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('243', '242', 'Fredy Soesanto', '', '0000-00-00', '0', '', '', '', '0', '0816529019', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('244', '243', 'Gary Gracious', '', '0000-00-00', '0', '', '', '', '0', '085854527150', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('245', '244', 'Edy Soewardi', '', '0000-00-00', '0', '', '', '', '0', '70803146', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('246', '245', 'Tonodarmanto.G', '', '0000-00-00', '0', '', '', '', '0', '08175053433', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('247', '246', 'Alvin Suhadinata', '', '0000-00-00', '0', '', '', '', '0', '081230508898', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('248', '247', 'Chendikia Wijaya', '', '0000-00-00', '0', '', '', '', '0', '70902592', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('249', '248', 'Rachmat Gunawan', '', '0000-00-00', '0', '', '', '', '0', '08125012722', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('250', '249', 'Tjiang Eddy', '', '0000-00-00', '0', '', '', '', '0', '085854100505', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('251', '250', 'Darwin Nazar', '', '0000-00-00', '0', '', '', '', '0', '0811300771', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('252', '251', 'Senijong', '', '0000-00-00', '0', '', '', '', '0', '0818376608', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('253', '252', 'Edwind Sucipto', '', '0000-00-00', '0', '', '', '', '0', '0818327166', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('254', '253', 'Agung Pangestu', '', '0000-00-00', '0', '', '', '', '0', '081938080068', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('255', '254', 'Tan Kiem Tjiang', '', '0000-00-00', '0', '', '', '', '0', '081234001868', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('256', '255', 'Liyanto', '', '0000-00-00', '0', '', '', '', '0', '08129900999', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('257', '256', 'Eka Saksana.S', '', '0000-00-00', '0', '', '', '', '0', '08155140058', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('258', '257', 'Hartono Wandy', '', '0000-00-00', '0', '', '', '', '0', '081332012012', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('259', '258', 'Honggo Bordijono', '', '0000-00-00', '0', '', '', '', '0', '08123572142', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('260', '259', 'Hasan Hakim', '', '0000-00-00', '0', '', '', '', '0', '0818517575', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('261', '260', 'Lie Arifin Mulyawan', '', '0000-00-00', '0', '', '', '', '0', '08165406933', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('262', '261', 'Stevanus Nathanael', '', '0000-00-00', '0', '', '', '', '0', '08123560396', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('263', '262', 'Daniel Hendro.G', '', '0000-00-00', '0', '', '', '', '0', '08123000863', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('264', '263', 'Budihardjo', '', '0000-00-00', '0', '', '', '', '0', '087823965330', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('265', '264', 'Lucas Firman.D', '', '0000-00-00', '0', '', '', '', '0', '085232782243', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('266', '265', 'Ronny Wijaya', '', '0000-00-00', '0', '', '', '', '0', '08123107688', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('267', '266', 'Budi Soegiarto', '', '0000-00-00', '0', '', '', '', '0', '0811336419', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('268', '267', 'Webisono, S.T', '', '0000-00-00', '0', '', '', '', '0', '08179337200', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('269', '268', 'Tenovianto', '', '0000-00-00', '0', '', '', '', '0', '0816503303', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('270', '269', 'Rudy Siswanto', '', '0000-00-00', '0', '', '', '', '0', '71128007', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('271', '270', 'Johan Danyo', '', '0000-00-00', '0', '', '', '', '0', '0811319842', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('272', '271', 'Ganiartha Chandra', '', '0000-00-00', '0', '', '', '', '0', '0818508325', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('273', '272', 'Edward Angstrong', '', '0000-00-00', '0', '', '', '', '0', '081330258878', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('274', '273', 'Hudiono Gunawan', '', '0000-00-00', '0', '', '', '', '0', '8708766', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('275', '274', 'Fianto Anthonius T', '', '0000-00-00', '0', '', '', '', '0', '5936041', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('276', '275', 'Haris D Sanjoto', '', '0000-00-00', '0', '', '', '', '0', '8672632', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('277', '276', 'Kevin Kho', '', '0000-00-00', '0', '', '', '', '0', '0816502186', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('278', '277', 'Rudy', '', '0000-00-00', '0', '', '', '', '0', '0818301007', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('279', '278', 'Karsuman', '', '0000-00-00', '0', '', '', '', '0', '91299334', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('280', '279', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('281', '280', 'Anton', '', '0000-00-00', '0', '', '', '', '0', '0818377828', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('282', '281', 'Ir.Thomas Wanamarta', '', '0000-00-00', '0', '', '', '', '0', '081553007773', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('283', '282', 'Johan Parmenas', '', '0000-00-00', '0', '', '', '', '0', '71227740', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('284', '283', 'Johan Parmenas', '', '0000-00-00', '0', '', '', '', '0', '0811336588', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('285', '284', 'Johsan Pangkey', '', '0000-00-00', '0', '', '', '', '0', '08123078908', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('286', '285', 'Herman Setyono', '', '0000-00-00', '0', '', '', '', '0', '0818308216', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('287', '286', 'Budihardjo Tjandra', '', '0000-00-00', '0', '', '', '', '0', '087854580304', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('288', '287', 'Johan Pangkey', '', '0000-00-00', '0', '', '', '', '0', '08113409632', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('289', '288', 'Gerson Lim', '', '0000-00-00', '0', '', '', '', '0', '0811310951', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('290', '289', 'Setyono Goenawan', '', '0000-00-00', '0', '', '', '', '0', '085850581931', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('291', '290', 'Heru Kurniawan', '', '0000-00-00', '0', '', '', '', '0', '0817851705', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('292', '291', 'Jimmy Leonardus', '', '0000-00-00', '0', '', '', '', '0', '08123208880', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('293', '292', 'Wijono Soewito Tirto', '', '0000-00-00', '0', '', '', '', '0', '0811305548', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('294', '293', 'Hartono Wandy', '', '0000-00-00', '0', '', '', '', '0', '081332012012', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('295', '294', 'Gary Gracious', '', '0000-00-00', '0', '', '', '', '0', '085854527150', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('296', '295', 'S.Yos Soetopo', '', '0000-00-00', '0', '', '', '', '0', '08123040150', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('297', '296', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('298', '297', 'John Gunawan', '', '0000-00-00', '0', '', '', '', '0', '70482094', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('299', '298', 'Minarto Ganda', '', '0000-00-00', '0', '', '', '', '0', '0818320768', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('300', '299', 'Tan Kiap Tong', '', '0000-00-00', '0', '', '', '', '0', '70283966', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('301', '300', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('302', '301', 'Michael Halim', '', '0000-00-00', '0', '', '', '', '0', '70585050', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('303', '302', 'Irawan TW', '', '0000-00-00', '0', '', '', '', '0', '72072155', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('304', '303', 'Yohanes Haryadi Siemon', '', '0000-00-00', '0', '', '', '', '0', '081332588888', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('305', '304', 'Diantoro', '', '0000-00-00', '0', '', '', '', '0', '081939586435', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('367', '366', 'Welhelmus H. Amy Dengi', '', '0000-00-00', '0', '', '', '', '0', '081947714045', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('372', '371', 'Surya', '', '0000-00-00', '0', '', '', '', '0', '0816525122', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('373', '372', 'Handy Hermanto', '', '0000-00-00', '0', '', '', '', '0', '08123513896', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('374', '373', 'Robin Chen', '', '0000-00-00', '0', '', '', '', '0', '081553577555', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('375', '374', 'Ronny Sumarno', '', '0000-00-00', '0', '', '', '', '0', '0811343273', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('376', '375', 'Indra Moeljadi', '', '0000-00-00', '0', '', '', '', '0', '0811370100', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('377', '376', 'Paul T', '', '0000-00-00', '0', '', '', '', '0', '081330720721', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('378', '377', 'Yacop Mantalik', '', '0000-00-00', '0', '', '', '', '0', '081331199000', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('379', '378', 'Latief Ardy', '', '0000-00-00', '0', '', '', '', '0', '0818597755', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('380', '379', 'Huang Feng Ming', '', '0000-00-00', '0', '', '', '', '0', '0811325021', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('381', '380', 'Ong Franky', '', '0000-00-00', '0', '', '', '', '0', '08123043727', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('382', '381', 'Henry Theios', '', '0000-00-00', '0', '', '', '', '0', '083830680960', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('383', '382', 'Suwandojo Hartono Linarto', '', '0000-00-00', '0', '', '', '', '0', '08121641818', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('384', '383', 'Johsan Pangkey', '', '0000-00-00', '0', '', '', '', '0', '08123078908', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('385', '384', 'Tony', '', '0000-00-00', '0', '', '', '', '0', '081330749238', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('386', '385', 'Jonathan Tedjakusuma', '', '0000-00-00', '0', '', '', '', '0', '08155203218', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('387', '386', 'Robert William', '', '0000-00-00', '0', '', '', '', '0', '08123040216', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('388', '387', 'Handra Harsono', '', '0000-00-00', '0', '', '', '', '0', '08563060345', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('389', '388', 'Franky', '', '0000-00-00', '0', '', '', '', '0', '7887337', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('390', '389', 'Amin', '', '0000-00-00', '0', '', '', '', '0', '082139122279', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('391', '390', 'Agustinus Juke Saputera', '', '0000-00-00', '0', '', '', '', '0', '0816536015', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('392', '391', 'Irawan', '', '0000-00-00', '0', '', '', '', '0', '085815537117', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('393', '392', 'Goenarto', '', '0000-00-00', '0', '', '', '', '0', '0816528588', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('394', '393', 'Roy Gunarto', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('395', '394', 'Wikiatnata', '', '0000-00-00', '0', '', '', '', '0', '0817302509', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('396', '395', 'Harry Halim', '', '0000-00-00', '0', '', '', '', '0', '08123028171', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('397', '396', 'Benny Widjaja', '', '0000-00-00', '0', '', '', '', '0', '08121756867', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('398', '397', 'Erwin Gunawan Wijaya', '', '0000-00-00', '0', '', '', '', '0', '081217652244', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('399', '398', 'Vicky Kurniawan', '', '0000-00-00', '0', '', '', '', '0', '0818371277', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('400', '399', 'Robi Hartanto', '', '0000-00-00', '0', '', '', '', '0', '081515158810', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('401', '400', 'Budi Sanyoto', '', '0000-00-00', '0', '', '', '', '0', '081330391228', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('402', '401', 'Halim Yuwono', '', '0000-00-00', '0', '', '', '', '0', '08179385700', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('403', '402', 'Tatang Wijaya', '', '0000-00-00', '0', '', '', '', '0', '0811341773', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('404', '403', 'Wijianto Tanjung', '', '0000-00-00', '0', '', '', '', '0', '08123108559', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('409', '408', 'Irwanto', '', '0000-00-00', '0', '', '', '', '0', '081235056008', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('410', '409', 'Hadi Antara', '', '0000-00-00', '0', '', '', '', '0', '71979581', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('411', '410', 'Deddy Suwarno', '', '0000-00-00', '0', '', '', '', '0', '085859591888', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('412', '411', 'Andreas Hendrajaya', '', '0000-00-00', '0', '', '', '', '0', '08175255907', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('413', '412', 'Ng Seng Tiong al Setiong', '', '0000-00-00', '0', '', '', '', '0', '081330367128', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('414', '413', 'Hendra Lim', '', '0000-00-00', '0', '', '', '', '0', '0317401714', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('415', '414', 'Erwin Handoko', '', '0000-00-00', '0', '', '', '', '0', '081358111118', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('416', '415', 'Sandy Sulistiono', '', '0000-00-00', '0', '', '', '', '0', '0817211177', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('417', '416', 'Rudy Wianto Chandra', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('418', '417', 'Hudiono Gunawan', '', '0000-00-00', '0', '', '', '', '0', '08123002833', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('419', '418', 'Huang Dong Hua', '', '0000-00-00', '0', '', '', '', '0', '08123538075', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('420', '419', 'Budi Hartanto', '', '0000-00-00', '0', '', '', '', '0', '082245656515', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('421', '420', 'Siswanto Kurniawan', '', '0000-00-00', '0', '', '', 'Wiraswasta', '0', '08123518351', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('422', '421', 'Budi Kristanto', '', '0000-00-00', '0', '', '', 'Wiraswasta', '0', '8715735', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('423', '422', 'William Lawrence Tjia', '', '0000-00-00', '0', '', '', 'Wiraswasta', '0', '0315964619', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('424', '423', 'Kurniad', '', '0000-00-00', '0', '', '', '', '0', '0818390018', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('425', '424', 'Budi Santoso', '', '0000-00-00', '0', 'Indonesia', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('426', '425', 'Edhi Gunarso', 'Surabaya', '0000-00-00', '0', 'Indonesia', '', 'Karyawan', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('427', '426', 'Tijo Yongki', '', '0000-00-00', '0', 'Indonesia', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('428', '427', 'Sujianto', '', '0000-00-00', '0', '', '', '', '0', '08563024022', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('429', '428', 'Ivan Wiradikara', '', '0000-00-00', '0', 'Indonesia', '', 'Owner', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('430', '429', 'Jimmy Yang', '', '0000-00-00', '0', 'Indonesia', '', 'Karyawan', '0', '08155092792', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('431', '430', 'Michael Kraus', '', '0000-00-00', '0', 'Indonesia', '', 'Karyawan', '0', '085852509045', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('432', '431', 'Budi Raharjo', '', '0000-00-00', '0', '', '', 'Karyawan', '0', '085330173173', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('433', '432', 'Iwan Djayawasita', '', '0000-00-00', '0', '', '', 'Karyawan', '0', '08121140742', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('434', '433', 'Tommy Yapari', '', '0000-00-00', '0', '', '', 'Egg Distributor', '0', '081803089999', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('435', '434', 'Budi Santoso', '', '0000-00-00', '0', '', '', 'Wiraswasta', '0', '0818328585', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('436', '435', 'Arnold Nathanael Suthandaru', '', '0000-00-00', '0', '', '', 'Wirasawasta', '0', '08165443750', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('437', '436', 'Benediktus Arifin', '', '0000-00-00', '0', '', '', '', '0', '0812311699', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('438', '437', 'Christian Adiwinata', '', '0000-00-00', '0', '', '', '', '0', '081330502080', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('439', '438', 'Tio Hian Bing', '', '0000-00-00', '0', '', '', 'Wiraswasta', '0', '08123457000', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('440', '439', 'Jo Lukas Wihelmus', '', '0000-00-00', '0', '', '', 'Karyawan', '0', '085231059999', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('441', '440', 'Elmard Franciscus Thomasoey', '', '0000-00-00', '0', '', '', 'Wiraswasta', '0', '081330642222', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('442', '441', 'Huang Dong Hua', '', '0000-00-00', '0', '', '', '', '0', '08123538075', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('443', '442', 'Aron Hariyono', '', '0000-00-00', '0', '', '', '', '0', '085931130000', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('444', '443', 'Ivan Wiradikara', '', '0000-00-00', '0', '', '', '', '0', '085851813835', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('445', '444', 'Prayuda', '', '0000-00-00', '0', '', '', '', '0', '081330622788', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('446', '445', 'Cheng Ru Chen', '', '0000-00-00', '0', '', '', 'Karyawan', '0', '08123040478', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('447', '446', 'Kwee Chrisdy Sutanto', '', '0000-00-00', '0', '', '', '', '0', '087854615999', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('448', '447', 'Solaiman Wilmana Tanjung', '', '0000-00-00', '0', '', '', 'Hamba Tuhan', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('449', '448', 'Yusak Wijaya', '', '0000-00-00', '0', '', '', '', '0', '085282369888', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('450', '449', 'Benediktus Arifin', '', '0000-00-00', '0', '', '', 'Dokter', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('451', '450', 'Wely Susanto', '', '0000-00-00', '0', '', '', '', '0', '081227729000', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('452', '451', 'Luvit Njoto Kusuma Prawirodiardjo', '', '0000-00-00', '0', '', '', '', '0', '08123572896', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('453', '452', 'Andre Martinus Wistorohardjo', '', '0000-00-00', '0', '', '', '', '0', '0818510003', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('454', '453', 'Tony Yongnardi', '', '0000-00-00', '0', '', '', '', '0', '081357676734', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('455', '454', 'Daniel Chang Tio', '', '0000-00-00', '0', '', '', '', '0', '081330716553', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('456', '455', 'Harlianto', '', '0000-00-00', '0', '', '', '', '0', '08123985258', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('457', '456', 'Orlando Ong', '', '0000-00-00', '0', '', '', '', '0', '0817109899', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('458', '457', 'Jerry Ruslim', '', '0000-00-00', '0', '', '', '', '0', '085850530444', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('459', '458', 'Andry Chandra', '', '0000-00-00', '0', '', '', '', '0', '08123523619', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('460', '459', 'Soegianto Agus', '', '0000-00-00', '0', '', '', '', '0', '08165438998', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('461', '460', 'Orlando Ong', '', '0000-00-00', '0', '', '', '', '0', '0817109899', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('462', '461', 'Lwa, Hendra Laksmono', '', '0000-00-00', '0', '', '', '', '0', '70758703', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('463', '462', 'Fredy', '', '0000-00-00', '0', '', '', '', '0', '083830830766', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('464', '463', 'Astan Kas Rudijanto Effendy', '', '0000-00-00', '0', '', '', '', '0', '08155003221', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('465', '464', 'Alberth Soegijopranoto Takim', '', '0000-00-00', '0', '', '', '', '0', '083856957588', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('466', '465', 'Henry Suwignjo', '', '0000-00-00', '0', '', '', '', '0', '085732585674', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('467', '466', 'Halim Tumbelaka', '', '0000-00-00', '0', '', '', '', '0', '085851272227', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('468', '467', 'William Seputro', '', '0000-00-00', '0', '', '', '', '0', '087853186999', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('469', '468', 'Johnny Liangkey', '', '0000-00-00', '0', '', '', '', '0', '0811305129', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('470', '469', 'Ronny Tjandra', '', '0000-00-00', '0', '', '', '', '0', '0818328996', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('471', '470', 'Djajanto Irawan', '', '0000-00-00', '0', '', '', '', '0', '081515537777', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('472', '471', 'Zeng Qingsong', '', '0000-00-00', '0', '', '', '', '0', '08563131316', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('473', '472', 'Jacob Pamudji Widjaja', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('474', '473', 'Max Ivan Ho', '', '0000-00-00', '0', '', '', '', '0', '081332022666', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('475', '474', 'Antonius Lesmana', '', '0000-00-00', '0', '', '', '', '0', '087854268111', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('476', '475', 'Jos Sudihartono Tjandra', '', '0000-00-00', '0', '', '', '', '0', '081938666629', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('477', '476', 'Sie, Rudi Tanto', '', '0000-00-00', '0', '', '', '', '0', '08123233622', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('478', '477', 'Hengky Kurniawan', '', '0000-00-00', '0', '', '', '', '0', '081330596949', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('479', '478', 'Gunawan Gautama', '', '0000-00-00', '0', '', '', '', '0', '0811336500', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('480', '479', 'Agustinus Tanujaya', '', '0000-00-00', '0', '', '', '', '0', '0816521711', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('481', '480', 'Eddy Wantoro', '', '0000-00-00', '0', '', '', '', '0', '085852207798', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('482', '481', 'Budi Santoso', '', '0000-00-00', '0', '', '', '', '0', '0811347188', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('483', '482', 'Alexander Kanesa', '', '0000-00-00', '0', '', '', '', '0', '0818309202', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('484', '483', 'Tonny Wongsowinoto', '', '0000-00-00', '0', '', '', '', '0', '0817320027', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('485', '484', 'William Ferdinand Korompis', '', '0000-00-00', '0', '', '', '', '0', '08123575159', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('486', '485', 'Wely Susanto', '', '0000-00-00', '0', '', '', '', '0', '08155053993', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('487', '486', 'Willi', '', '0000-00-00', '0', '', '', '', '0', '91162864', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('488', '487', 'Artha', '', '0000-00-00', '0', '', '', '', '0', '0818321166', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('489', '488', 'Ivan Wibowo', '', '0000-00-00', '0', '', '', '', '0', '70048701', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('490', '489', 'Sonny Christanto', '', '0000-00-00', '0', '', '', '', '0', '70308299', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('491', '490', 'Soegianto Hidajat', '', '0000-00-00', '0', '', '', '', '0', '70951173', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('492', '491', 'Budi Hartono Alie', '', '0000-00-00', '0', '', '', '', '0', '089675801213', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('493', '492', 'Roey Soempiet', '', '0000-00-00', '0', '', '', '', '0', '08123247601', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('494', '493', 'Azis Henry', '', '0000-00-00', '0', '', '', '', '0', '71035555', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('495', '494', 'Jauw Rendy Yuwono', '', '0000-00-00', '0', '', '', '', '0', '081331009978', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('496', '495', 'Reza Gunawan', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('497', '496', 'Julius Gunawan', '', '0000-00-00', '0', '', '', '', '0', '081357167740', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('498', '497', 'Agus Fungsisugi', '', '0000-00-00', '0', '', '', '', '0', '70533276', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('499', '498', 'Ferry Sumarno', '', '0000-00-00', '0', '', '', '', '0', '08175027450', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('500', '499', 'Erwin Chandra Tang', '', '0000-00-00', '0', '', '', '', '0', '081331961001', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('501', '500', 'Freddy Thie', '', '0000-00-00', '0', '', '', '', '0', '081357226181', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('502', '501', 'Webisono,S.T', '', '0000-00-00', '0', '', '', '', '0', '08179337200', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('503', '502', 'Sonny Christanto Halim', '', '0000-00-00', '0', '', '', '', '0', '0816509888', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('504', '503', 'Gunadi Irwan', '', '0000-00-00', '0', '', '', '', '0', '088217122353', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('505', '504', 'Rendjono Yudoputro', '', '0000-00-00', '0', '', '', '', '0', '081234565918', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('506', '505', 'Boy Tanair', '', '0000-00-00', '0', '', '', '', '0', '08782666026', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('509', '508', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('510', '509', 'Oei Ronny Wijaya', '', '0000-00-00', '0', '', '', '', '0', '0818339819', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('511', '510', 'Abednego Mulyono', '', '0000-00-00', '0', '', '', '', '0', '081703399364', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('512', '511', 'Surya Dinata Ali Harsanto', '', '0000-00-00', '0', '', '', '', '0', '081703880883', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('513', '512', 'Santosa Wijaya', '', '0000-00-00', '0', '', '', '', '0', '0811309005', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('514', '513', 'Honggo Boedijono', '', '0000-00-00', '0', '', '', '', '0', '08123022575', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('515', '514', 'Ferry Hendra Suganda', '', '0000-00-00', '0', '', '', '', '0', '08113308141', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('516', '515', 'Antony Poenomo', '', '0000-00-00', '0', '', '', '', '0', '081332003829', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('517', '516', 'Jefry Silfanus', '', '0000-00-00', '0', '', '', '', '0', '0818511819', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('518', '517', 'Marten Liem', '', '0000-00-00', '0', '', '', '', '0', '0818589323', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('519', '518', 'Widjanarko Kho', '', '0000-00-00', '0', '', '', '', '0', '08553739999', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('520', '519', 'David Tejakusuma, The', '', '0000-00-00', '0', '', '', '', '0', '0811335521', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('521', '520', 'Sandy Budi Hartono', '', '0000-00-00', '0', '', '', '', '0', '081259472508', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('522', '521', 'Mochtar Heru Wibowo', '', '0000-00-00', '0', '', '', '', '0', '082195333888', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('523', '522', 'Andy Adinugroho', '', '0000-00-00', '0', '', '', '', '0', '0818581299', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('524', '523', 'Welhelmus H. Amy Dengi', '', '0000-00-00', '0', '', '', '', '0', '081947714045', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('525', '524', 'Wiyono Pangestoe', '', '0000-00-00', '0', '', '', '', '0', '0811336088', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('526', '525', 'Go Hartono Tedjoprawiro Gunawan', '', '0000-00-00', '0', '', '', '', '0', '03177044337', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('527', '526', 'Maximilian Rumoei', '', '0000-00-00', '0', '', '', '', '0', '081330675800', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('528', '527', 'Joeng Dian Cendoyo', '', '0000-00-00', '0', '', '', '', '0', '085648118118', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('529', '528', 'Henry Tanaja', '', '0000-00-00', '0', '', '', '', '0', '0816521211', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('530', '529', 'Chan Iwan Chandoko', '', '0000-00-00', '0', '', '', '', '0', '03170652151', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('531', '530', 'Eka Budi Prasetya', '', '0000-00-00', '0', '', '', '', '0', '0817335288', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('533', '532', 'Johanis Musa', '', '0000-00-00', '0', '', '', '', '0', '082139808988', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('534', '533', 'Isaac Tjoan Loey', '', '0000-00-00', '0', '', '', '', '0', '03177111218', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('535', '534', 'Wendra Halim', '', '0000-00-00', '0', '', '', '', '0', '081803005798', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('536', '535', 'Tjahjana Budiman', '', '0000-00-00', '0', '', '', '', '0', '081553006611', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('537', '536', 'Rudi Handojo', '', '0000-00-00', '0', '', '', '', '0', '0811310073', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('538', '537', 'Agustinus Iwan Tjahjono', '', '0000-00-00', '0', '', '', '', '0', '08563024889', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('539', '538', 'Ong Andris Thomas', '', '0000-00-00', '0', '', '', '', '0', '03170627543', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('540', '539', 'Gunarjo Tanurijanto', '', '0000-00-00', '0', '', '', '', '0', '0811316322', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('541', '540', 'Gerson Lim', '', '0000-00-00', '0', '', '', '', '0', '0811310951', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('542', '541', 'Tung Anggoro Wondo', '', '0000-00-00', '0', '', '', '', '0', '087854998555', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('543', '542', 'Tony', '', '0000-00-00', '0', '', '', '', '0', '081330749238', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('544', '543', 'Go Kwuo Kwong', '', '0000-00-00', '0', '', '', '', '0', '08121615741', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('545', '544', 'Raineir Kristanto', '', '0000-00-00', '0', '', '', '', '0', '08123008788', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('546', '545', 'Hariyono Tejokusumo', '', '0000-00-00', '0', '', '', '', '0', '0852300056111', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('547', '546', 'Efendi', '', '0000-00-00', '0', '', '', '', '0', '08123598020', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('548', '547', 'Sadrach Soewargo Wibowo', '', '0000-00-00', '0', '', '', '', '0', '081615113555', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('549', '548', 'Michael Ang', '', '0000-00-00', '0', '', '', '', '0', '0811317170', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('550', '549', 'Meidel Marsanto Ponga', '', '0000-00-00', '0', '', '', '', '0', '081346633176', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('551', '550', 'Christian Thomas Kurt Kyriss', '', '0000-00-00', '0', '', '', '', '0', '081232222684', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('552', '551', 'Rudy Boesono', '', '0000-00-00', '0', '', '', '', '0', '0818314687', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('553', '552', 'Sendy Rexana Lie', '', '0000-00-00', '0', '', '', '', '0', '081556688166', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('554', '553', 'Tse Hoi Ping', '', '0000-00-00', '0', '', '', '', '0', '083831581999', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('555', '554', 'Roey Soempiet', '', '0000-00-00', '0', '', '', '', '0', '081330218453', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('556', '555', 'Patar Samuel Parningotan Sianipar', '', '0000-00-00', '0', '', '', '', '0', '081331501878', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('557', '556', 'Johanes Reza Harianto', '', '0000-00-00', '0', '', '', '', '0', '0818372591', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('558', '557', 'Oen David', '', '0000-00-00', '0', '', '', '', '0', '085931375800', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('559', '558', 'Ho Ay Kwok', '', '0000-00-00', '0', '', '', '', '0', '087853278889', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('560', '559', 'Sanny', '', '0000-00-00', '0', '', '', '', '0', '0818304756', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('561', '560', 'Freddy Thie', '', '0000-00-00', '0', '', '', '', '0', '081357226181', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('562', '561', 'Iwan Limpo', '', '0000-00-00', '0', '', '', '', '0', '085381383806', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('563', '562', 'Cinta Budiman', '', '0000-00-00', '0', '', '', '', '0', '081234560580', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('564', '563', 'Budi Nugraha', '', '0000-00-00', '0', '', '', '', '0', '081233775900', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('565', '564', 'Johannes Judianto', '', '0000-00-00', '0', '', '', '', '0', '0811596881', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('566', '565', 'Agus Fungsisugi', '', '0000-00-00', '0', '', '', '', '0', '03170533276', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('567', '566', 'Steven', '', '0000-00-00', '0', '', '', '', '0', '0811375837', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('568', '567', 'Bobby', '', '0000-00-00', '0', '', '', '', '0', '0811337708', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('569', '568', 'Bambang Hartono', '', '0000-00-00', '0', '', '', '', '0', '0811372233', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('570', '569', 'Surya Dinata Ali Harsanto', '', '0000-00-00', '0', '', '', '', '0', '0811372233', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('571', '570', 'Johnny Liangkey', '', '0000-00-00', '0', '', '', '', '0', '0817598818', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('572', '571', 'Andreas Tandiono', '', '0000-00-00', '0', '', '', '', '0', '08123288481', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('573', '572', 'Thomas Wibisono Hadiwidjojo', '', '0000-00-00', '0', '', '', '', '0', '0317328051', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('574', '573', 'Lim Kuindra', '', '0000-00-00', '0', '', '', '', '0', '085850473555', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('575', '574', 'Ferry Sumarno', '', '0000-00-00', '0', '', '', '', '0', '082143600275', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('576', '575', 'Chrismadhi Santoso', '', '0000-00-00', '0', '', '', '', '0', '083856225557', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('577', '576', 'Budi Hartono', '', '0000-00-00', '0', '', '', '', '0', '03170997507', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('578', '577', 'Tandra Gunawan', '', '0000-00-00', '0', '', '', '', '0', '0818181834', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('579', '578', 'Alvin Tjahyadi', '', '0000-00-00', '0', '', '', '', '0', '081332269111', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('580', '579', 'Chandra Kirama', '', '0000-00-00', '0', '', '', '', '0', '081357283000', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('581', '580', 'Suryo Pramono Sutrisno Putro', '', '0000-00-00', '0', '', '', '', '0', '081553260260', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('582', '581', 'Tjioe Cokro Soegianto', '', '0000-00-00', '0', '', '', '', '0', '081357378688', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('583', '582', 'Sugiono Wijoyo', '', '0000-00-00', '0', '', '', '', '0', '08553006886', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('584', '583', 'Angola Anggraini', '', '0000-00-00', '0', '', '', '', '0', '08123530591', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('585', '584', 'Ajie Jaya Jatikusuma', '', '0000-00-00', '0', '', '', '', '0', '08123030093', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('586', '585', 'Djajanto Irawan', '', '0000-00-00', '0', '', '', '', '0', '081515537777', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('587', '586', 'Ronald Wibawa Sanjaya', '', '0000-00-00', '0', '', '', '', '0', '0811335016', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('588', '587', 'Lim Kuindra', '', '0000-00-00', '0', '', '', '', '0', '081357859238', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('589', '588', 'Irwan', '', '0000-00-00', '0', '', '', '', '0', '081230575758', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('590', '589', 'DRS. Sabar Nababan, MM', '', '0000-00-00', '0', '', '', '', '0', '081379390111', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('591', '590', 'Eddy Wantoro', '', '0000-00-00', '0', '', '', '', '0', '08585207798', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('592', '591', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('593', '592', 'Zheng Lin', '', '0000-00-00', '0', '', '', '', '0', '085851050002', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('594', '593', 'Abidin Chandra', '', '0000-00-00', '0', '', '', '', '0', '08123001639', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('595', '594', 'Guntur Widarto', '', '0000-00-00', '0', '', '', '', '0', '0811332812', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('596', '595', 'Soegijanto', '', '0000-00-00', '0', '', '', '', '0', '60768585', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('597', '596', 'Antony PoernomoShumanly', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('598', '597', 'Go Kwuo Kwang', '', '0000-00-00', '0', '', '', '', '0', '08121615741', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('599', '598', 'Hogantara Wigitono', '', '0000-00-00', '0', '', '', '', '0', '0818596901', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('600', '599', 'Wang Yin', '', '0000-00-00', '0', '', '', '', '0', '08563023969', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('601', '600', 'Lee Avin Wicaksono', '', '0000-00-00', '0', '', '', '', '0', '08123012433', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('602', '601', 'Halomoan', '', '0000-00-00', '0', '', '', '', '0', '087851243177', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('603', '602', 'Yacop Mantalik', '', '0000-00-00', '0', '', '', '', '0', '081331199000', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('604', '603', 'John Gunawan', '', '0000-00-00', '0', '', '', '', '0', '70482094', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('605', '604', 'Rudy Boesono', '', '0000-00-00', '0', '', '', '', '0', '08113643668', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('606', '605', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('607', '606', 'Ir. Yudi Wibowo,S.H, M.H', '', '0000-00-00', '0', '', '', '', '0', '0818588703', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('608', '607', 'Hartanto Chandra', '', '0000-00-00', '0', '', '', '', '0', '081938002807', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('609', '608', 'Tjing Sheng Kurniadi', '', '0000-00-00', '0', '', '', '', '0', '081231888015', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('610', '609', 'Gunawan Gautama', '', '0000-00-00', '0', '', '', '', '0', '0811336500', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('611', '610', 'Lie Wie Sian', '', '0000-00-00', '0', '', '', '', '0', '70900727', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('612', '611', 'Heru Supramono', '', '0000-00-00', '0', '', '', '', '0', '08123518988', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('613', '612', 'Roony Tanoyo', '', '0000-00-00', '0', '', '', '', '0', '0818303930', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('614', '613', 'Nixon Limanseto', '', '0000-00-00', '0', '', '', '', '0', '08883046142', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('615', '614', 'Marwali', '', '0000-00-00', '0', '', '', '', '0', '0818594681', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('616', '615', 'Sutikno Bidijanto', '', '0000-00-00', '0', '', '', '', '0', '0818516789', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('617', '616', 'Yosef Herodian', '', '0000-00-00', '0', '', '', '', '0', '0815520884', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('618', '617', 'Andryanto Suhartono', '', '0000-00-00', '0', '', '', '', '0', '0817379900', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('619', '618', 'Arman Thomas', '', '0000-00-00', '0', '', '', '', '0', '081332332788', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('620', '619', '', '', '0000-00-00', '0', '', '', '', '0', '0816504321', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('621', '620', 'Rudy Sudjarwo', '', '0000-00-00', '0', '', '', '', '0', '082199955575', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('622', '621', 'Yohanes Haryadi Siemon', '', '0000-00-00', '0', '', '', '', '0', '081332588888', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('623', '622', 'Go Theofilus Benyamin', '', '0000-00-00', '0', '', '', '', '0', '0817309422', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('624', '623', 'Wijaya GOENAWAN', '', '0000-00-00', '0', '', '', '', '0', '0818577335', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('625', '624', 'Ronny Wijaya Oei', '', '0000-00-00', '0', '', '', '', '0', '0818339819', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('626', '625', 'Johannes Julianto SEGER', '', '0000-00-00', '0', '', '', '', '0', '0811336952', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('627', '626', 'Amin', '', '0000-00-00', '0', '', '', '', '0', '081384785556', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('628', '627', 'Hartono Chu', '', '0000-00-00', '0', '', '', '', '0', '082139062888', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('629', '628', 'Ivan Wibowo', '', '0000-00-00', '0', '', '', '', '0', '70761871', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('630', '629', 'Sidharta Sugondo', '', '0000-00-00', '0', '', '', '', '0', '70317837', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('631', '630', 'Jeffry Wijaya', '', '0000-00-00', '0', '', '', '', '0', '0818500838', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('632', '631', 'Robert Samaoen', '', '0000-00-00', '0', '', '', '', '0', '0811320070', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('633', '632', 'Guntur Widarto', '', '0000-00-00', '0', '', '', '', '0', '0811332812', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('634', '633', 'Erwin Handoko', '', '0000-00-00', '0', '', '', '', '0', '081358111118', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('635', '634', 'Michael Christianus Halimsaputera', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('636', '635', 'Sunkono', '', '0000-00-00', '0', '', '', '', '0', '08113635367', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('637', '636', 'Lauw Sang Ganda', '', '0000-00-00', '0', '', '', '', '0', '83000600', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('638', '637', 'LIE Andry Setyadarma', '', '0000-00-00', '0', '', '', '', '0', '78088444', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('639', '638', 'Sutikno Budianto', '', '0000-00-00', '0', '', '', '', '0', '0818516789', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('640', '639', 'David Soetarso', '', '0000-00-00', '0', '', '', '', '0', '0811318923', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('641', '640', 'Maxmillian Rumoei', '', '0000-00-00', '0', '', '', '', '0', '081330675800', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('642', '641', 'Watari Tanoto', '', '0000-00-00', '0', '', '', '', '0', '085810146981', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('643', '642', 'GO Yongky Yoewono', '', '0000-00-00', '0', '', '', '', '0', '0818306655', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('644', '643', 'TJOEI Ajie Jaya Jati Kusuma', '', '0000-00-00', '0', '', '', '', '0', '08123030093', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('645', '644', 'Fandy Halim', '', '0000-00-00', '0', '', '', '', '0', '70592464', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('646', '645', 'Pieter Jouwhanes', '', '0000-00-00', '0', '', '', '', '0', '08165436722', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('647', '646', 'Tjio Chandra Kirama', '', '0000-00-00', '0', '', '', '', '0', '081357283000', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('648', '647', 'Marlon Natanael Kurniawan', '', '0000-00-00', '0', '', '', '', '0', '08172312773', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('649', '648', 'Gunawan', '', '0000-00-00', '0', '', '', '', '0', '9205559', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('650', '649', 'Cahaya', '', '0000-00-00', '0', '', '', '', '0', '70812341', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('651', '650', 'Yohanes', '', '0000-00-00', '0', '', '', '', '0', '72434389', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('652', '651', 'Hengky ADI PRAMOKO', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('653', '652', 'LAUW Andreas Hendrajaya', '', '0000-00-00', '0', '', '', '', '0', '08175255907', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('654', '653', 'Agung Nugroho', '', '0000-00-00', '0', '', '', '', '0', '08155059988', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('655', '654', 'Yosef Herodian', '', '0000-00-00', '0', '', '', '', '0', '08155208847', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('656', '655', 'HO Ay Kwok', '', '0000-00-00', '0', '', '', '', '0', '087853278889', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('657', '656', 'Kurniawan TAN', '', '0000-00-00', '0', '', '', '', '0', '08123020850', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('658', '657', 'Bambang Hartono NJOTO KURNIAWAN', '', '0000-00-00', '0', '', '', '', '0', '0811341122', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('659', '658', 'Antonius Lesmana', '', '0000-00-00', '0', '', '', '', '0', '081515220038', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('660', '659', 'Karlim', '', '0000-00-00', '0', '', '', '', '0', '08123009113', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('661', '660', 'Kusnan Susanto FAIDI', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('662', '661', 'Sendy Rexana Lie', '', '0000-00-00', '0', '', '', '', '0', '70227778', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('663', '662', 'Lion Djajono', '', '0000-00-00', '0', '', '', '', '0', '087851510368', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('664', '663', 'Hartono Pekanto', '', '0000-00-00', '0', '', '', '', '0', '081333111177', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('665', '664', 'Gatot Sutanto', '', '0000-00-00', '0', '', '', '', '0', '081839800', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('666', '665', 'Hari Wiryawan Hidayat', '', '0000-00-00', '0', '', '', '', '0', '081330352939', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('667', '666', 'Pieter Jouwhanes', '', '0000-00-00', '0', '', '', '', '0', '08165436722', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('668', '667', 'Tejo Cahyono', '', '0000-00-00', '0', '', '', '', '0', '08123310793', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('669', '668', 'Ivan Ho', '', '0000-00-00', '0', '', '', '', '0', '0818371856', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('670', '669', 'GO Yongky Yoewono', '', '0000-00-00', '0', '', '', '', '0', '0818306655', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('671', '670', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('672', '671', 'Kusnadi Chandra', '', '0000-00-00', '0', '', '', '', '0', '081331608585', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('673', '672', 'GO Theofilus Benyamin', '', '0000-00-00', '0', '', '', '', '0', '0817309422', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('674', '673', 'Sonny Limbowo', '', '0000-00-00', '0', '', '', '', '0', '70796805', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('675', '674', 'Budi Sanyoto', '', '0000-00-00', '0', '', '', '', '0', '081330391228', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('676', '675', 'TJIANG SHENG Kurniadi', '', '0000-00-00', '0', '', '', '', '0', '081332666177', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('677', '676', 'Roy Gonzales SUTANTO', '', '0000-00-00', '0', '', '', '', '0', '0818503214', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('678', '677', 'Patar Samuel Parningotan Sianipar', '', '0000-00-00', '0', '', '', '', '0', '081331581477', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('679', '678', 'Marino SUTEDJO', '', '0000-00-00', '0', '', '', '', '0', '0811308849', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('680', '679', 'Elidad Tjokro', '', '0000-00-00', '0', '', '', '', '0', '08123536161', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('681', '680', 'Azis Henry', '', '0000-00-00', '0', '', '', '', '0', '72798197', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('682', '681', 'Mulyadi Wongso', '', '0000-00-00', '0', '', '', '', '0', '0811332963', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('683', '682', 'Efendi', '', '0000-00-00', '0', '', '', '', '0', '71018100', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('684', '683', 'Johan Pangkey', '', '0000-00-00', '0', '', '', '', '0', '08113409632', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('685', '684', 'Eddy Citro Fong', '', '0000-00-00', '0', '', '', '', '0', '085232000978', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('686', '685', 'Andrianto Suhartono', '', '0000-00-00', '0', '', '', '', '0', '0817379900', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('687', '686', 'Rudy Prayogo', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('688', '687', 'Gerson Lim', '', '0000-00-00', '0', '', '', '', '0', '0811310951', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('689', '688', 'Hariono Soetantio', '', '0000-00-00', '0', '', '', '', '0', '0811310828', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('690', '689', 'Roy Yapri', '', '0000-00-00', '0', '', '', '', '0', '0811305129', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('691', '690', 'Gatot Setijobudi (Alm)', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('692', '691', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('693', '692', 'Julius Gunawan Lee', '', '0000-00-00', '0', '', '', '', '0', '081330742592', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('694', '693', 'Lauw Hwee Jong', '', '0000-00-00', '0', '', '', '', '0', '0811336087', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('695', '694', 'Welly Liyanto', '', '0000-00-00', '0', '', '', '', '0', '081357626302', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('696', '695', 'Renjani Tanujaya', '', '0000-00-00', '0', '', '', '', '0', '0811377777', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('697', '696', 'Soetjipto Santoso', '', '0000-00-00', '0', '', '', '', '0', '0817326094', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('698', '697', 'Hendry Ongkowidjojo', '', '0000-00-00', '0', '', '', '', '0', '081330399133', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('699', '698', 'Iwan Muktiali', '', '0000-00-00', '0', '', '', '', '0', '08155156002', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('700', '699', 'Kusnan Susanto', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('701', '700', 'Cahaya', '', '0000-00-00', '0', '', '', '', '0', '70812341', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('702', '701', 'Kurniawan Tan', '', '0000-00-00', '0', '', '', '', '0', '08123020850', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('703', '702', 'Irwan Santoso', '', '0000-00-00', '0', '', '', '', '0', '08155141028', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('704', '703', 'Herman Salim', '', '0000-00-00', '0', '', '', '', '0', '0811379578', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('705', '704', 'Willi', '', '0000-00-00', '0', '', '', '', '0', '91162864', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('706', '705', 'Budi Santoso Tjandra', '', '0000-00-00', '0', '', '', '', '0', '0811347188', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('707', '706', 'Sandy Sulistiono', '', '0000-00-00', '0', '', '', '', '0', '0817211177', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('708', '707', 'Gunarjo Tanurijanto', '', '0000-00-00', '0', '', '', '', '0', '0811316322', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('709', '708', 'Yeoh Chye Beng', '', '0000-00-00', '0', '', '', '', '0', '0816512939', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('710', '709', 'Fredy Soesanto', '', '0000-00-00', '0', '', '', '', '0', '086529019', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('711', '710', 'Goenadi Gondowardojo', '', '0000-00-00', '0', '', '', '', '0', '08123026001', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('712', '711', 'Kho Tjie Liong', '', '0000-00-00', '0', '', '', '', '0', '08113410601', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('713', '712', 'Hendrik Purnama', '', '0000-00-00', '0', '', '', '', '0', '08123112387', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('714', '713', 'Michael Christianus Halim S', '', '0000-00-00', '0', '', '', '', '0', '081308905', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('715', '714', 'Indra Soejanto', '', '0000-00-00', '0', '', '', '', '0', '71011665', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('716', '715', 'Yongky Yoewono', '', '0000-00-00', '0', '', '', '', '0', '0818306655', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('717', '716', 'Johsan Pangkey', '', '0000-00-00', '0', '', '', '', '0', '08123078908', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('718', '717', 'Johsan Pangkey', '', '0000-00-00', '0', '', '', '', '0', '08123078908', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('719', '718', 'Senijong', '', '0000-00-00', '0', '', '', '', '0', '0818376608', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('720', '719', 'Yohanes Haryadi Siemon', '', '0000-00-00', '0', '', '', '', '0', '081332588888', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('721', '720', 'Sengkok', '', '0000-00-00', '0', '', '', '', '0', '70426900', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('722', '721', 'Hermanto', '', '0000-00-00', '0', '', '', '', '0', '70631000', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('723', '722', 'Tjiang Eddy', '', '0000-00-00', '0', '', '', '', '0', '08165448760', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('724', '723', 'NG Tatang Widjaja', '', '0000-00-00', '0', '', '', '', '0', '0811341773', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('725', '724', 'Jeffry Wijaya', '', '0000-00-00', '0', '', '', '', '0', '0818500838', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('726', '725', 'Warren Surang Sutandar', '', '0000-00-00', '0', '', '', '', '0', '0811330117', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('727', '726', 'Daniel Chang', '', '0000-00-00', '0', '', '', '', '0', '08123004878', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('728', '727', 'Robert Peter Aarnoudse', '', '0000-00-00', '0', '', '', '', '0', '08175053000', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('729', '728', 'Saiful Anam', '', '0000-00-00', '0', '', '', '', '0', '08123233633', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('730', '729', 'Lumanto Wijaya', '', '0000-00-00', '0', '', '', '', '0', '71011818', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('731', '730', 'Suryadi Kurniawan', '', '0000-00-00', '0', '', '', '', '0', '08121652000', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('732', '731', 'Johannes Julianto', '', '0000-00-00', '0', '', '', '', '0', '0811336952', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('733', '732', 'Izak Herman Eliaser Sahulata', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ayah` VALUES ('734', '733', 'Lukman', '', '0000-00-00', '0', '', '', '', '0', '081514019075', '', '');

-- ----------------------------
-- Table structure for aka_siswa_grup
-- ----------------------------
DROP TABLE IF EXISTS `aka_siswa_grup`;
CREATE TABLE `aka_siswa_grup` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `grup` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_siswa_grup
-- ----------------------------

-- ----------------------------
-- Table structure for aka_siswa_guru
-- ----------------------------
DROP TABLE IF EXISTS `aka_siswa_guru`;
CREATE TABLE `aka_siswa_guru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `guru` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_siswa_guru
-- ----------------------------

-- ----------------------------
-- Table structure for aka_siswa_ibu
-- ----------------------------
DROP TABLE IF EXISTS `aka_siswa_ibu`;
CREATE TABLE `aka_siswa_ibu` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=735 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_siswa_ibu
-- ----------------------------
INSERT INTO `aka_siswa_ibu` VALUES ('1', '1', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('2', '2', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('4', '4', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('5', '5', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('7', '7', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('11', '10', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('14', '13', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('15', '14', 'Astried Aprilia', '', '0000-00-00', '0', 'Indonesia', '', '', '0', '085645437208', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('16', '15', 'Anita Alamsjah', '', '0000-00-00', '0', 'Indonesia', '', '', '0', '083856083916', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('17', '16', 'Moona Wintoro', '', '0000-00-00', '0', 'Indonesia', '', '', '0', '08563478824', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('18', '17', 'Chynthia', '', '0000-00-00', '0', 'Indonesia', '', '', '0', '03170704437', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('19', '18', 'Susana', '', '0000-00-00', '0', 'Indonesia', '', '', '0', '085706331688', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('20', '19', 'Elshin Imelda', '', '0000-00-00', '0', '', '', '', '0', '085731316399', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('21', '20', 'Yuliana Dermawan Kang', '', '0000-00-00', '0', '', '', '', '0', '08123567125', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('22', '21', 'Susana', 'Kediri', '1981-03-28', '0', 'Indonesia', '', 'Apoteker', '0', '085706331688', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('23', '22', 'Santi Rahayu', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('24', '23', 'Silviana Alim', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('25', '24', 'Shanty Kurniawaty', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('26', '25', 'Annie Susatya', '', '0000-00-00', '0', '', '', '', '0', '0816511200', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('27', '26', 'Sylvi', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('29', '28', 'Leli Yuliani', '', '0000-00-00', '0', '', '', '', '0', '081330682001', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('30', '29', 'Christina', '', '0000-00-00', '0', '', '', '', '0', '081222665757', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('31', '30', 'Aily', '', '0000-00-00', '0', '', '', '', '0', '08973813132', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('32', '31', 'Veronica L', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('33', '32', 'Yeny Kosalea', '', '0000-00-00', '0', '', '', '', '0', '08883200715', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('34', '33', 'Nova Renita E', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('35', '34', 'Ria Paulin', '', '0000-00-00', '0', '', '', '', '0', '081553305585', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('36', '35', 'Yunita Kwee', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('37', '36', 'Linawati Tanoyo', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('38', '37', 'Yenni Kurniawan H', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('39', '38', 'Yossy Ana S', '', '0000-00-00', '0', '', '', '', '0', '08783003919', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('40', '39', 'Djawi Cecilia', '', '0000-00-00', '0', '', '', '', '0', '08561198898', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('41', '40', 'Caecilia Anastasia', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('42', '41', 'Desy Susanti', '', '0000-00-00', '0', '', '', '', '0', '0818515305', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('43', '42', 'Ellywati Tanjung', '', '0000-00-00', '0', '', '', '', '0', '08123021424', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('44', '43', 'Anneke F. Ramlan Wilianto', '', '0000-00-00', '0', '', '', '', '0', '08563350089', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('45', '44', 'Elshin Imelda', 'Surabaya', '1979-11-23', '0', 'Indonesian', '', 'House Wife', '0', '085731316399', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('46', '45', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('47', '46', 'Fonie H. Margono', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('48', '47', 'Josianti Multisari I.', '', '0000-00-00', '0', '', '', '', '0', '087852294530', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('49', '48', 'Imelda Sugito', '', '0000-00-00', '0', '', '', '', '0', '087852294530', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('50', '49', 'Siany Linaksita', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('51', '50', 'Lindyawati', '', '0000-00-00', '0', '', '', '', '0', '087852294530', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('52', '51', 'Irine Jaya Atmaja', '', '0000-00-00', '0', '', '', '', '0', '081234811795', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('53', '52', 'Gori Indrawati', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('54', '53', 'Shirley Sukowati', '', '0000-00-00', '0', '', '', '', '0', '0818330725', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('56', '55', 'Megawati Suharto P.', '', '0000-00-00', '0', '', '', '', '0', '082233302955', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('57', '56', 'Ellen Sugianto', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('58', '57', 'Fenny', '', '0000-00-00', '0', '', '', '', '0', '0817398998', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('59', '58', 'Lindawati', '', '0000-00-00', '0', '', '', '', '0', '081216506357', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('60', '59', 'Lita Agus', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('61', '60', 'Liniawati', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('62', '61', 'Linawati Tanoyo', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('63', '62', 'Petra Dewi', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('64', '63', 'Martha Hedi Triana', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('65', '64', 'Indriany', '', '0000-00-00', '0', '', '', '', '0', '70618483', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('67', '66', 'Liliana Fransisca', '', '0000-00-00', '0', '', '', '', '0', '087854615999', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('68', '67', 'Leliana Fajar', '', '0000-00-00', '0', '', '', '', '0', '087854615999', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('69', '68', 'Wenny', '', '0000-00-00', '0', '', '', '', '0', '081245672888', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('70', '69', 'Lince Pieter', '', '0000-00-00', '0', '', '', '', '0', '081332919151', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('71', '70', 'Yusa Jeandelti', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('72', '71', 'Noviani', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('73', '72', 'Linda Airlina', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('74', '73', 'Inge Lukito', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('75', '74', 'Merlin', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('76', '75', 'Indahwati', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('77', '76', 'Gori Indrawati', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('78', '77', 'Siane Prilita', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('79', '78', 'Epifany Budihardjo', '', '0000-00-00', '0', '', '', '', '0', '087852618884', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('80', '79', 'Juini', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('81', '80', 'Retno Susmiharti', '', '0000-00-00', '0', '', '', '', '0', '0811360999', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('82', '81', 'Lim Agnes', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('83', '82', 'Nunuk Watiningsih', '', '0000-00-00', '0', '', '', '', '0', '087856575758', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('84', '83', 'Christien L', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('85', '84', 'Tjin-Tjin', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('86', '85', 'Moona Wintoro', 'Surabaya', '1983-11-08', '0', 'Indonesia', '', 'Ibu Rumah Tangga', '0', '08563478824', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('87', '86', 'Meliani', '', '0000-00-00', '0', '', '', '', '0', '709919099', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('88', '87', 'Lani', '', '0000-00-00', '0', '', '', '', '0', '91127223', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('89', '88', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('90', '89', 'Lesly', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('91', '90', 'Shelly', '', '0000-00-00', '0', '', '', '', '0', '081233775900', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('92', '91', 'Jelly', '', '0000-00-00', '0', '', '', '', '0', '082139808988', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('93', '92', 'Kwince', '', '0000-00-00', '0', '', '', '', '0', '71227601', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('94', '93', 'Jenny', '', '0000-00-00', '0', '', '', '', '0', '081331718181', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('95', '94', 'Rose', '', '2008-07-14', '0', '', '', '', '0', '081330532568', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('96', '95', 'Vonny', '', '0000-00-00', '0', '', '', '', '0', '081227728000', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('97', '96', 'Martinah', '', '0000-00-00', '0', '', '', '', '0', '081357179005', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('98', '97', 'Anik', '', '0000-00-00', '0', '', '', '', '0', '087727272761', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('99', '98', 'Silvya', '', '0000-00-00', '0', '', '', '', '0', '081217893893', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('100', '99', 'Yuvita', '', '0000-00-00', '0', '', '', '', '0', '087854998555', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('101', '100', 'Rita', '', '0000-00-00', '0', '', '', '', '0', '085931375800', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('102', '101', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('103', '102', 'Indahwati Sidharta', '', '0000-00-00', '0', '', '', '', '0', '08123181788', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('104', '103', 'Lily Limoseputro', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('105', '104', 'Wiwik Rusiana', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('107', '106', 'Lita Agus', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('108', '107', 'Lanny Indrawati', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('109', '108', 'Ratna Bayu Anggraeni', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('110', '109', 'Martha Hedi Triana Tanang', '', '0000-00-00', '0', '', '', '', '0', '08883000162', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('111', '110', 'Yeny Kosalea', '', '0000-00-00', '0', '', '', '', '0', '08883200715', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('112', '111', 'Ernawati', '', '0000-00-00', '0', '', '', '', '0', '083857642333', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('113', '112', 'Sherly Wijaya', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('114', '113', 'Rita Citra Rini', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('115', '114', 'Rohani', '', '0000-00-00', '0', '', '', '', '0', '0811312823', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('116', '115', 'Anneke F. Ramlan Wilianto', '', '0000-00-00', '0', '', '', '', '0', '70366755', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('117', '116', 'Fonie H. Margono', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('118', '117', 'Ana', '', '0000-00-00', '0', '', '', '', '0', '08123026595', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('119', '118', 'Inggrid Cynthiawati', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('120', '119', 'Indriany', '', '0000-00-00', '0', '', '', '', '0', '70575260', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('121', '120', 'Irine Jaya Atmaja', '', '0000-00-00', '0', '', '', '', '0', '081234811795', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('122', '121', 'Siane Prilita', '', '0000-00-00', '0', '', '', '', '0', '70808500', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('123', '122', 'Rita Citra Rini', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('124', '123', 'Like Eclesiana S', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('125', '124', 'Putu Indra Juliani M', '', '0000-00-00', '0', '', '', '', '0', '08123526369', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('126', '125', 'Lili Indrayani Thomas', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('127', '126', 'Anita', '', '0000-00-00', '0', '', '', '', '0', '08165409694', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('128', '127', 'Tanty Faridah', '', '0000-00-00', '0', '', '', '', '0', '08155111083', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('129', '128', 'Trisiana Lahinda', '', '0000-00-00', '0', '', '', '', '0', '71457415', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('130', '129', 'Susilawaty', '', '0000-00-00', '0', '', '', '', '0', '70157779', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('131', '130', 'Evi Wijaya', '', '0000-00-00', '0', '', '', '', '0', '08123002212', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('132', '131', 'Nurwati', '', '0000-00-00', '0', '', '', '', '0', '0811335031', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('133', '132', 'Maria Irene', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('134', '133', 'Wenny Sutanto', '', '0000-00-00', '0', '', '', '', '0', '081245672888', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('135', '134', 'Christien L', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('136', '135', 'Nurwati', '', '0000-00-00', '0', '', '', '', '0', '0811335031', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('137', '136', 'Ernawati', '', '0000-00-00', '0', '', '', '', '0', '0817321199', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('138', '137', 'Lita Agus', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('139', '138', 'Susilawaty', '', '0000-00-00', '0', '', '', '', '0', '087851660887', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('140', '139', 'Rohani', '', '0000-00-00', '0', '', '', '', '0', '0811312823', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('141', '140', 'Surya Gunawati', '', '0000-00-00', '0', '', '', '', '0', '0818326536', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('142', '141', 'Ohrin Widjajati', '', '0000-00-00', '0', '', '', '', '0', '08883198788', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('143', '142', 'Erike Lee', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('144', '143', 'Lim Agnes', '', '0000-00-00', '0', '', '', '', '0', '08563383555', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('145', '144', 'Sherly Wijaya', '', '0000-00-00', '0', '', '', '', '0', '0811373388', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('146', '145', 'Lim Agnes', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('147', '146', 'Ang Nita', '', '0000-00-00', '0', '', '', '', '0', '081357999666', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('148', '147', 'Linawati', '', '0000-00-00', '0', '', '', '', '0', '70527747', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('149', '148', 'Elvina.S', '', '0000-00-00', '0', '', '', '', '0', '08165428536', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('150', '149', 'Mein.S', '', '0000-00-00', '0', '', '', '', '0', '085233211999', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('151', '150', 'Imelda', '', '0000-00-00', '0', '', '', '', '0', '083849000211', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('152', '151', 'Elly Tedjo', '', '0000-00-00', '0', '', '', '', '0', '0818314687', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('153', '152', 'Mona', '', '0000-00-00', '0', '', '', '', '0', '0818592267', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('154', '153', 'Slauw Fwi Agus', '', '0000-00-00', '0', '', '', '', '0', '0816510495', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('155', '154', 'Susantinah', '', '0000-00-00', '0', '', '', '', '0', '0811314952', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('156', '155', 'Santi Yuliana', '', '0000-00-00', '0', '', '', '', '0', '081332112212', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('157', '156', 'Irna Juliany', '', '0000-00-00', '0', '', '', '', '0', '08165435288', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('158', '157', 'Heidy D', '', '0000-00-00', '0', '', '', '', '0', '0811312000', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('159', '158', 'Jeanny', '', '0000-00-00', '0', '', '', '', '0', '08165410234', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('160', '159', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('161', '160', 'Felicia H', '', '0000-00-00', '0', '', '', '', '0', '08123006688', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('162', '161', 'Rini Yulia', '', '0000-00-00', '0', '', '', '', '0', '082231393471', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('163', '162', 'Ratnawati H', '', '0000-00-00', '0', '', '', '', '0', '08123456709', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('164', '163', 'Go Lee Tin', '', '0000-00-00', '0', '', '', '', '0', '08123000299', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('165', '164', 'Go Lee Tin', '', '0000-00-00', '0', '', '', '', '0', '70047005', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('166', '165', 'Liem Mariani', '', '0000-00-00', '0', '', '', '', '0', '0811371663', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('167', '166', 'Caroline T', '', '0000-00-00', '0', '', '', '', '0', '081330678168', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('168', '167', 'Ham Tenny', '', '0000-00-00', '0', '', '', '', '0', '081553008052', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('169', '168', 'Caroline T', '', '0000-00-00', '0', '', '', '', '0', '08155227258', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('170', '169', 'Elly Octaviani', '', '0000-00-00', '0', '', '', '', '0', '087857797882', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('171', '170', 'Dita D', '', '0000-00-00', '0', '', '', '', '0', '087853870120', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('172', '171', 'Dewi A', '', '0000-00-00', '0', '', '', '', '0', '70900727', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('173', '172', 'Theong E', '', '0000-00-00', '0', '', '', '', '0', '08123007429', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('174', '173', 'Liberty Dimaclid', '', '0000-00-00', '0', '', '', '', '0', '082233989168', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('175', '174', 'Sriwati Chandra', '', '0000-00-00', '0', '', '', '', '0', '77111218', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('176', '175', 'Viv. S', '', '0000-00-00', '0', '', '', '', '0', '0811379578', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('177', '176', 'Lisa', '', '0000-00-00', '0', '', '', '', '0', '087851287890', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('178', '177', 'Jen Vanda', '', '0000-00-00', '0', '', '', '', '0', '0811320070', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('179', '178', 'Yuliana. G', '', '0000-00-00', '0', '', '', '', '0', '08121756867', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('180', '179', 'Tan Jeanne', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('181', '180', 'Johana', '', '0000-00-00', '0', '', '', '', '0', '08155141028', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('182', '181', 'Elisa Budiarti', '', '0000-00-00', '0', '', '', '', '0', '72330697', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('183', '182', 'Susy Dewi', '', '0000-00-00', '0', '', '', '', '0', '03181984321', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('184', '183', 'Ruth Ningsih', '', '0000-00-00', '0', '', '', '', '0', '08123536447', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('185', '184', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('186', '185', 'Liana.K', '', '0000-00-00', '0', '', '', '', '0', '08155083559', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('187', '186', 'Hermina Soetjipto', '', '0000-00-00', '0', '', '', '', '0', '08123005397', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('188', '187', 'Cecilia A', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('189', '188', 'Like Eclesiana S', '', '0000-00-00', '0', '', '', '', '0', '91011610', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('190', '189', 'Ong Hwee San', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('191', '190', 'Endang H', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('192', '191', 'Yeny Kosalea', '', '0000-00-00', '0', '', '', '', '0', '08883200715', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('193', '192', 'Esther Widjaja', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('194', '193', 'Tjiang Lavina', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('195', '194', 'Martha Hedi T', '', '0000-00-00', '0', '', '', '', '0', '08883000162', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('196', '195', 'Linda', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('197', '196', 'Lanny Indrawati', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('198', '197', 'Daisy Djajanegara', '', '0000-00-00', '0', '', '', '', '0', '8712368', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('199', '198', 'Lely Anita', '', '0000-00-00', '0', '', '', '', '0', '71266471', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('200', '199', 'Maya Amelia T', '', '0000-00-00', '0', '', '', '', '0', '71029096', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('201', '200', 'Indahwati Sidharta', '', '0000-00-00', '0', '', '', '', '0', '08123181788', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('202', '201', 'Inggrid Cynthiayanti', '', '0000-00-00', '0', '', '', '', '0', '8707980', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('203', '202', 'Nurwati', '', '0000-00-00', '0', '', '', '', '0', '70183169', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('204', '203', 'Ratnasari Nenggala', '', '0000-00-00', '0', '', '', '', '0', '5932186', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('205', '204', 'Nanik', '', '0000-00-00', '0', '', '', '', '0', '08814300427', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('206', '205', 'Melia Budiman', '', '0000-00-00', '0', '', '', '', '0', '0811379741', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('207', '206', 'Olivia Widyastuti', '', '0000-00-00', '0', '', '', '', '0', '70982630', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('208', '207', 'Irene Christy', '', '0000-00-00', '0', '', '', '', '0', '083831188888', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('209', '208', 'Jenny Oktavia', '', '0000-00-00', '0', '', '', '', '0', '081330367128', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('210', '209', 'Oktavia E', '', '0000-00-00', '0', '', '', '', '0', '081234051985', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('211', '210', 'Deny Bumiwati', '', '0000-00-00', '0', '', '', '', '0', '03170028800', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('212', '211', 'Lanny Mawarti', '', '0000-00-00', '0', '', '', '', '0', '0818301228', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('215', '214', 'Njo Ai Ling', '', '0000-00-00', '0', '', '', '', '0', '082139568687', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('216', '215', 'Njo Elvi', '', '0000-00-00', '0', '', '', '', '0', '70997899', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('217', '216', 'Ika Yunita', '', '0000-00-00', '0', '', '', '', '0', '08125172222', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('218', '217', 'Susi Irawati', '', '0000-00-00', '0', '', '', '', '0', '08165405658', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('219', '218', 'Thessa Lonica', '', '0000-00-00', '0', '', '', '', '0', '70300874', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('220', '219', 'Surjanti Wati', '', '0000-00-00', '0', '', '', '', '0', '0811343386', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('221', '220', 'Puspita Dewi', '', '0000-00-00', '0', '', '', '', '0', '0811336358', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('222', '221', 'Vonny Kamdari', '', '0000-00-00', '0', '', '', '', '0', '08165458699', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('223', '222', 'Tan Melissa', '', '0000-00-00', '0', '', '', '', '0', '087851766889', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('224', '223', 'Yenny Muliany Legimin', '', '0000-00-00', '0', '', '', '', '0', '0818395833', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('225', '224', 'Tan Djoen Ing', '', '0000-00-00', '0', '', '', '', '0', '0818523734', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('226', '225', 'Sherly Djiady', '', '0000-00-00', '0', '', '', '', '0', '08161138888', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('227', '226', 'Silvya Suherman', '', '0000-00-00', '0', '', '', '', '0', '08161138888', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('228', '227', 'Merry Frans', '', '0000-00-00', '0', '', '', '', '0', '081809000907', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('229', '228', 'Susantini', '', '0000-00-00', '0', '', '', '', '0', '08121656820', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('230', '229', 'Joe Soe San', '', '0000-00-00', '0', '', '', '', '0', '0818339620', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('231', '230', 'Suzana Dewi', '', '0000-00-00', '0', '', '', '', '0', '0811333818', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('232', '231', 'Ruth Ningsih', '', '0000-00-00', '0', '', '', '', '0', '081235071000', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('233', '232', 'Elisabeth Tjioe', '', '0000-00-00', '0', '', '', '', '0', '08123130118', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('235', '234', 'Lita Sumarno', '', '0000-00-00', '0', '', '', '', '0', '0811328719', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('236', '235', 'Shirly S', '', '0000-00-00', '0', '', '', '', '0', '08583030309', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('237', '236', 'Yenny Gunawan', '', '0000-00-00', '0', '', '', '', '0', '70263611', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('238', '237', 'Sisca', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('239', '238', 'Lim Angnes', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('240', '239', 'Linda', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('242', '241', 'Yuliana Gunawan', '', '0000-00-00', '0', '', '', '', '0', '0811376994', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('243', '242', 'Henny Lao.T', '', '0000-00-00', '0', '', '', '', '0', '816509019', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('244', '243', 'Liao Chiung Yu', '', '0000-00-00', '0', '', '', '', '0', '081234076087', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('245', '244', 'Lie-Lie San', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('246', '245', 'Yuniarti Agnes', '', '0000-00-00', '0', '', '', '', '0', '03160570175', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('247', '246', 'Lily Indrawati', '', '0000-00-00', '0', '', '', '', '0', '08155088888', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('248', '247', 'Melinda Wijaya', '', '0000-00-00', '0', '', '', '', '0', '0811307093', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('249', '248', 'Megawati', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('250', '249', 'Patricia', '', '0000-00-00', '0', '', '', '', '0', '081615415439', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('251', '250', 'Erni Tjandra', '', '0000-00-00', '0', '', '', '', '0', '0811374379', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('252', '251', 'MV Ivonne', '', '0000-00-00', '0', '', '', '', '0', '087851515511', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('253', '252', 'Ev.Tarmina', '', '0000-00-00', '0', '', '', '', '0', '08165405725', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('254', '253', 'Alice Lindra', '', '0000-00-00', '0', '', '', '', '0', '081330678168', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('255', '254', 'Maria Susanti', '', '0000-00-00', '0', '', '', '', '0', '0811307273', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('256', '255', 'Funny Natasya', '', '0000-00-00', '0', '', '', '', '0', '08121330000', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('257', '256', 'Mirah', '', '0000-00-00', '0', '', '', '', '0', '0818324335', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('258', '257', 'Khe Merry', '', '0000-00-00', '0', '', '', '', '0', '081332012012', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('259', '258', 'Patricia Surjani', '', '0000-00-00', '0', '', '', '08123020331', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('260', '259', 'Fei Fei', '', '0000-00-00', '0', '', '', '', '0', '0818319788', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('261', '260', 'Selia Widjaja', '', '0000-00-00', '0', '', '', '', '0', '08123250116', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('262', '261', 'Erliza Lasty', '', '0000-00-00', '0', '', '', '', '0', '08123231345', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('263', '262', 'Sri Hayuni Basri', '', '0000-00-00', '0', '', '', '', '0', '0811326381', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('264', '263', 'Sofia Ekawati', '', '0000-00-00', '0', '', '', '', '0', '0818749295', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('265', '264', 'Silvi Sandari', '', '0000-00-00', '0', '', '', '', '0', '08123035091', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('266', '265', 'Indah Ninggsih', '', '0000-00-00', '0', '', '', '', '0', '0818333988', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('267', '266', 'Sinaryawati', '', '0000-00-00', '0', '', '', '', '0', '0811312321', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('268', '267', 'Widyawati, SE', '', '0000-00-00', '0', '', '', '', '0', '08133160607', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('269', '268', 'Luanny Anggapranata', '', '0000-00-00', '0', '', '', '', '0', '0816514074', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('270', '269', 'Daisy Djajanegara', '', '0000-00-00', '0', '', '', '', '0', '081332174377', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('271', '270', 'Hermina Sutjipto', '', '0000-00-00', '0', '', '', '', '0', '08123005397', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('272', '271', 'Indrawati', '', '0000-00-00', '0', '', '', '', '0', '77725888', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('273', '272', 'Elin Gunadi', '', '0000-00-00', '0', '', '', '', '0', '5923949', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('274', '273', 'Cecilia.A', '', '0000-00-00', '0', '', '', '', '0', '08123002833', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('275', '274', 'Yeny Kosalea', '', '0000-00-00', '0', '', '', '', '0', '08883200715', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('276', '275', 'Silvia Dewi', '', '0000-00-00', '0', '', '', '', '0', '087855004799', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('277', '276', 'Lely Anita', '', '0000-00-00', '0', '', '', '', '0', '71266471', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('278', '277', 'Gani Lilyani', '', '0000-00-00', '0', '', '', '', '0', '70596601', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('279', '278', 'Mona', '', '0000-00-00', '0', '', '', '', '0', '60953790', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('280', '279', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('281', '280', 'Tjioe Giok Lioe', '', '0000-00-00', '0', '', '', '', '0', '0811309268', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('282', '281', 'Drg.Fenella', '', '0000-00-00', '0', '', '', '', '0', '08385566688', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('283', '282', 'Linawati Kumala', '', '0000-00-00', '0', '', '', '', '0', '7316202', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('284', '283', 'Linawati Kumala', '', '0000-00-00', '0', '', '', '', '0', '08123014568', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('285', '284', 'Tan Djoen Ing', '', '0000-00-00', '0', '', '', '', '0', '0818523734', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('286', '285', 'Rini Marita.S', '', '0000-00-00', '0', '', '', '', '0', '081553175268', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('287', '286', 'Sofia Ekawati', '', '0000-00-00', '0', '', '', '', '0', '0215854601', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('288', '287', 'Irena Amalia', '', '0000-00-00', '0', '', '', '', '0', '0811327851', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('289', '288', 'Lyfangda Widjaja', '', '0000-00-00', '0', '', '', '', '0', '0811334020', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('290', '289', 'Susy Indriati', '', '0000-00-00', '0', '', '', '', '0', '085850743999', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('291', '290', 'Merry Frans', '', '0000-00-00', '0', '', '', '', '0', '081809000907', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('292', '291', 'Shirly Suganda', '', '0000-00-00', '0', '', '', '', '0', '0811379996', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('293', '292', 'Julianne', '', '0000-00-00', '0', '', '', '', '0', '0818576988', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('294', '293', 'Khe Merry', '', '0000-00-00', '0', '', '', '', '0', '081332012012', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('295', '294', 'Liao Chiung Yu', '', '0000-00-00', '0', '', '', '', '0', '081234076087', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('296', '295', 'Sandra Halim', '', '0000-00-00', '0', '', '', '', '0', '77887789', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('297', '296', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('298', '297', 'Yetty Hartanto', '', '0000-00-00', '0', '', '', '', '0', '08123585960', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('299', '298', 'Caroline Haryono', '', '0000-00-00', '0', '', '', '', '0', '0811336100', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('300', '299', 'Pang Sien Fang', '', '0000-00-00', '0', '', '', '', '0', '70339797', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('301', '300', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('302', '301', 'Aju Trisna', '', '0000-00-00', '0', '', '', '', '0', '0816518151', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('303', '302', 'Puji Shiarfin', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('304', '303', 'Natasya Widjaja', '', '0000-00-00', '0', '', '', '', '0', '08113438888', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('305', '304', 'Yenny', '', '0000-00-00', '0', '', '', '', '0', '085233861308', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('367', '366', 'Ambar Metasari', '', '0000-00-00', '0', '', '', '', '0', '081993355413', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('372', '371', 'Herlina', '', '0000-00-00', '0', '', '', '', '0', '087853398417', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('373', '372', 'Debby Parwanto', '', '0000-00-00', '0', '', '', '', '0', '08123292980', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('374', '373', 'Vienna Wu', '', '0000-00-00', '0', '', '', '', '0', '081331058111', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('375', '374', 'Lidya Lewi Santoso', '', '0000-00-00', '0', '', '', '', '0', '0811340082', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('376', '375', 'Ineke Salim', '', '0000-00-00', '0', '', '', '', '0', '08123180059', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('377', '376', 'Enry', '', '0000-00-00', '0', '', '', '', '0', '0811309195', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('378', '377', 'Laurent Gunawan', '', '0000-00-00', '0', '', '', '', '0', '08175200788', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('379', '378', 'Selvia Anggraini', '', '0000-00-00', '0', '', '', '', '0', '0819806689', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('380', '379', 'Ervin', '', '0000-00-00', '0', '', '', '', '0', '08113520903', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('381', '380', 'Leny Damayanti Hartono', '', '0000-00-00', '0', '', '', '', '0', '08123043631', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('382', '381', 'Selvy Fantoro', '', '0000-00-00', '0', '', '', '', '0', '081330045153', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('383', '382', 'Vilan Oktafia', '', '0000-00-00', '0', '', '', '', '0', '0818326779', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('384', '383', 'Tan Djoen Ing', '', '0000-00-00', '0', '', '', '', '0', '0818523734', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('385', '384', 'Ester Yuliana', '', '0000-00-00', '0', '', '', '', '0', '0811300429', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('386', '385', 'Elly Herawati', '', '0000-00-00', '0', '', '', '', '0', '083854508886', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('387', '386', 'Elizabeth Theogianto', '', '0000-00-00', '0', '', '', '', '0', '0816500653', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('388', '387', 'Nancy Lemanso', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('389', '388', 'Go Ping Ching', '', '0000-00-00', '0', '', '', '', '0', '085850485999', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('390', '389', 'Yati', '', '0000-00-00', '0', '', '', '', '0', '08121216222', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('391', '390', 'Sherly Sudarso', '', '0000-00-00', '0', '', '', '', '0', '08152100812', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('392', '391', 'Linda Wijyogo', '', '0000-00-00', '0', '', '', '', '0', '0818522558', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('393', '392', 'Yuli Indriani', '', '0000-00-00', '0', '', '', '', '0', '70970918', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('394', '393', 'Imelda', '', '0000-00-00', '0', '', '', '', '0', '0818517103', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('395', '394', 'Renata Hilda Rifaie', '', '0000-00-00', '0', '', '', '', '0', '08123030378', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('396', '395', 'Sienny Sinta Dewi', '', '0000-00-00', '0', '', '', '', '0', '0811372556', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('397', '396', 'Yuliana Gunawan', '', '0000-00-00', '0', '', '', '', '0', '0811376994', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('398', '397', 'Shienny Octavia', '', '0000-00-00', '0', '', '', '', '0', '081234512549', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('399', '398', 'Angel Setiawan', '', '0000-00-00', '0', '', '', '', '0', '0811347154', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('400', '399', 'Erlin', '', '0000-00-00', '0', '', '', '', '0', '081515158808', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('401', '400', 'Ratna Juniwati', '', '0000-00-00', '0', '', '', '', '0', '08123541117', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('402', '401', 'Ekawati', '', '0000-00-00', '0', '', '', '', '0', '08123597900', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('403', '402', 'Trisyana Lukito', '', '0000-00-00', '0', '', '', '', '0', '0811341808', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('404', '403', 'Theresia Indrawati', '', '0000-00-00', '0', '', '', '', '0', '03191466667', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('409', '408', 'Nia Sakatika', '', '0000-00-00', '0', '', '', '', '0', '08123208178', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('410', '409', 'The Nita Indah Sari', '', '0000-00-00', '0', '', '', '', '0', '085850007814', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('411', '410', 'Iin Indiyani', '', '0000-00-00', '0', '', '', '', '0', '085850123001', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('412', '411', 'Herliana Lukman', '', '0000-00-00', '0', '', '', '', '0', '0811318094', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('413', '412', 'Atik Susiati', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('414', '413', 'Jelita Irawati', '', '0000-00-00', '0', '', '', '', '0', '0218193002', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('415', '414', 'Kristanti', '', '0000-00-00', '0', '', '', '', '0', '08123011808', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('416', '415', 'Irene Widjaja', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('417', '416', 'Yang Yahui', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('418', '417', 'Cecilia Anastasia', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('419', '418', 'Mira Wijayanti', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('420', '419', 'Jong Yisia', '', '0000-00-00', '0', '', '', '', '0', '082233302955', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('421', '420', 'Lusy Anggraeni', '', '0000-00-00', '0', '', '', '', '0', '0313536789', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('422', '421', 'Leliana Fajar', '', '0000-00-00', '0', '', '', '', '0', '081553210999', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('423', '422', 'Yusiana Limeina Halim', '', '0000-00-00', '0', '', '', '', '0', '083854355549', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('424', '423', 'Ervina Wong', '', '0000-00-00', '0', '', '', 'Karyawan', '0', '082231029082', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('425', '424', 'Yuliana', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('426', '425', 'Ana', '', '0000-00-00', '0', 'Indonesia', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('427', '426', 'Vivi', '', '0000-00-00', '0', '087852635689', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('428', '427', 'Petra Dewi', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('429', '428', 'Erlina Tjandra', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('430', '429', 'Bety', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('431', '430', 'Shirley Tantiono', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('432', '431', 'Yenni', '', '0000-00-00', '0', '', '', '', '0', '08123036238', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('433', '432', 'Rita Wati', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('434', '433', 'ina', '', '0000-00-00', '0', '', '', '', '0', '081236876980', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('435', '434', 'Siane Prilita', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('436', '435', 'Selvi Tjitarso', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('437', '436', 'Meilinda Efendy', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('438', '437', 'Desy Susanti', '', '0000-00-00', '0', '', '', '', '0', '0818515305', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('439', '438', 'Ellen Sugianto', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('440', '439', 'Susilawaty', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('441', '440', 'Indahwati Halim', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('442', '441', 'Mira Wijayanti', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('443', '442', 'mDessy Christina Hariono', '', '0000-00-00', '0', '', '', '', '0', '8661867', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('444', '443', 'Erlina Tjandra', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('445', '444', 'Retno Susmiharti', '', '0000-00-00', '0', '', '', '', '0', '0811360999', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('446', '445', 'Jenny Hartono', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('447', '446', 'Liliana Fransisca Wahyuni', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('448', '447', 'Erni', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('449', '448', 'Jois Esther', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('450', '449', 'Meilinda Efendy', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('451', '450', 'Vonny Darsono', '', '0000-00-00', '0', '', '', '', '0', '081227728000', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('452', '451', 'Chynthia', '', '0000-00-00', '0', '', '', '', '0', '081331810283', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('453', '452', 'Fera Juwita Sulistyo', '', '0000-00-00', '0', '', '', '', '0', '0818591033', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('454', '453', 'Elshin Imelda', '', '0000-00-00', '0', '', '', '', '0', '085731316399', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('455', '454', 'Njo Ai Ling', '', '0000-00-00', '0', '', '', '', '0', '0818337525', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('456', '455', 'Silvya Suherman', '', '0000-00-00', '0', '', '', '', '0', '081217893893', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('457', '456', 'Elvin Yustine Tanada', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('458', '457', 'Feiliana Ho', '', '0000-00-00', '0', '', '', '', '0', '081331088822', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('459', '458', 'Jessica Jordanius', '', '0000-00-00', '0', '', '', '', '0', '083830171122', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('460', '459', 'Ennie Njoto', '', '0000-00-00', '0', '', '', '', '0', '08123529110', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('461', '460', 'Elvin Yustine Tanada', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('462', '461', 'Iwan Linggawati Soedimo', '', '0000-00-00', '0', '', '', '', '0', '34588432', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('463', '462', 'Ailany Harsono', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('464', '463', 'Juliana YP', '', '0000-00-00', '0', '', '', '', '0', '0816537000', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('465', '464', 'Sianne Phwa', '', '0000-00-00', '0', '', '', '', '0', '08123027797', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('466', '465', 'Ervin Arianti Hardiman', '', '0000-00-00', '0', '', '', '', '0', '0818751332', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('467', '466', 'Olivia Margaretha', '', '0000-00-00', '0', '', '', '', '0', '08165403555', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('468', '467', 'Christian Thenata', '', '0000-00-00', '0', '', '', '', '0', '0811316918', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('469', '468', 'Tan May Ling', '', '0000-00-00', '0', '', '', '', '0', '0818510668', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('470', '469', 'Ilona Kartika Wijaya', '', '0000-00-00', '0', '', '', '', '0', '0818504548', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('471', '470', 'Fanny Gondo', '', '0000-00-00', '0', '', '', '', '0', '081230887777', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('472', '471', 'Mira Meirina', '', '0000-00-00', '0', '', '', '', '0', '08113642188', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('473', '472', 'Maria Octavia Sunur', '', '0000-00-00', '0', '', '', '', '0', '08553000518', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('474', '473', 'Santi Dermawan', '', '0000-00-00', '0', '', '', '', '0', '08165474609', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('475', '474', 'Zhang Lei', '', '0000-00-00', '0', '', '', '', '0', '087823965353', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('476', '475', 'Kurnia Widyastuty', '', '0000-00-00', '0', '', '', '', '0', '0811312802', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('477', '476', 'Ineke', '', '0000-00-00', '0', '', '', '', '0', '08155127772', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('478', '477', 'Lie Lily', '', '0000-00-00', '0', '', '', '', '0', '081808628727', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('479', '478', 'Lielyana', '', '0000-00-00', '0', '', '', '', '0', '08113636500', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('480', '479', 'Yuniliawati', '', '0000-00-00', '0', '', '', '', '0', '0811309081', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('481', '480', 'Linda', '', '0000-00-00', '0', '', '', '', '0', '0811319121', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('482', '481', 'Tanty Indrawati', '', '0000-00-00', '0', '', '', '', '0', '0811344165', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('483', '482', 'Tanty Dyana', '', '0000-00-00', '0', '', '', '', '0', '0818307675', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('484', '483', 'Linda Mariana', '', '0000-00-00', '0', '', '', '', '0', '0816521782', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('485', '484', 'Indah Mayasari', '', '0000-00-00', '0', '', '', '', '0', '081234569078', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('486', '485', 'Vonny Darsono', '', '0000-00-00', '0', '', '', '', '0', '08155183993', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('487', '486', 'Lucyadevi', '', '0000-00-00', '0', '', '', '', '0', '91144123', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('488', '487', 'Nilawati', '', '0000-00-00', '0', '', '', '', '0', '0818301734', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('489', '488', 'Mikewati Kory', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('490', '489', 'Ernawati Soenjoto', '', '0000-00-00', '0', '', '', '', '0', '0816535318', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('491', '490', 'Shierly Lionita', '', '0000-00-00', '0', '', '', '', '0', '70773658', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('492', '491', 'Inge Andryanto Tjoeng', '', '0000-00-00', '0', '', '', '', '0', '0811333076', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('493', '492', 'Kwince Sudany', '', '0000-00-00', '0', '', '', '', '0', '081330218453', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('494', '493', 'Ineke Hendrawati', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('495', '494', 'Vera Sumargo', '', '0000-00-00', '0', '', '', '', '0', '081330618786', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('496', '495', 'Waly Santoso', '', '0000-00-00', '0', '', '', '', '0', '0811849684', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('497', '496', 'Po Ling Lindajati', '', '0000-00-00', '0', '', '', '', '0', '081330742592', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('498', '497', 'Mariana', '', '0000-00-00', '0', '', '', '', '0', '0818583055', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('499', '498', 'Ester Agustinawati', '', '0000-00-00', '0', '', '', '', '0', '0811343449', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('500', '499', 'Tjioe Elias Jayanti', '', '0000-00-00', '0', '', '', '', '0', '082128003888', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('501', '500', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('502', '501', 'Widyawati Widarto,S.E', '', '0000-00-00', '0', '', '', '', '0', '081331606057', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('503', '502', 'Irene Christy Sugiarto', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('504', '503', 'Njo Elvi', '', '0000-00-00', '0', '', '', '', '0', '70997899', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('505', '504', 'Jenny Wirokesumo', '', '0000-00-00', '0', '', '', '', '0', '087852269999', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('506', '505', 'Fanny Lily', '', '0000-00-00', '0', '', '', '', '0', '081332928862', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('509', '508', 'One Remmayanti,S.S', '', '0000-00-00', '0', '', '', '', '0', '088217040072', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('510', '509', 'Phe Caroline Yulia', '', '0000-00-00', '0', '', '', '', '0', '0811379918', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('511', '510', 'Elmeisari Winata', '', '0000-00-00', '0', '', '', '', '0', '70612935', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('512', '511', 'Aprillia Andriani', '', '0000-00-00', '0', '', '', '', '0', '08175282683', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('513', '512', 'Leny Chandra', '', '0000-00-00', '0', '', '', '', '0', '0818399396', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('514', '513', 'Patricia Surjani Handoyosaputro', '', '0000-00-00', '0', '', '', '', '0', '08123020331', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('515', '514', 'Fani Natalia', '', '0000-00-00', '0', '', '', '', '0', '0811373848', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('516', '515', 'Shumanly Melinda Jayadi', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('517', '516', 'Michelle Yoke Quardona Sundara', '', '0000-00-00', '0', '', '', '', '0', '0818500809', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('518', '517', 'Sumiwati', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('519', '518', 'Yuliana Salim', '', '0000-00-00', '0', '', '', '', '0', '08162999', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('520', '519', 'Sophia Brigitte Haryono, Kie', '', '0000-00-00', '0', '', '', '', '0', '081553236888', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('521', '520', 'Sofy Narulita', '', '0000-00-00', '0', '', '', '', '0', '081252843079', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('522', '521', 'Vivit Magaret Sanjoto', '', '0000-00-00', '0', '', '', '', '0', '0317313124', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('523', '522', 'Pinifarina', '', '0000-00-00', '0', '', '', '', '0', '0811311299', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('524', '523', 'Ambar Metasari', '', '0000-00-00', '0', '', '', '', '0', '081993355413', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('525', '524', 'Magdalena', '', '0000-00-00', '0', '', '', '', '0', '0811319688', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('526', '525', 'Josephine Rasjid Gandha', '', '0000-00-00', '0', '', '', '', '0', '087853279060', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('527', '526', 'Herlina Thisnawati', '', '0000-00-00', '0', '', '', '', '0', '082143564750', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('528', '527', 'Anik Sustinah', '', '0000-00-00', '0', '', '', '', '0', '08224446739', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('529', '528', 'Jenny Hartanto', '', '0000-00-00', '0', '', '', '', '0', '081331718181', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('530', '529', 'Lince Rosalita', '', '0000-00-00', '0', '', '', '', '0', '085850315222', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('531', '530', 'Laniana', '', '0000-00-00', '0', '', '', '', '0', '087851661260', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('533', '532', 'Jelly Tanoto', '', '0000-00-00', '0', '', '', '', '0', '03170708818', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('534', '533', 'Sriwati Chandra', '', '0000-00-00', '0', '', '', '', '0', '0816520900', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('535', '534', 'Munigawati Wijaya', '', '0000-00-00', '0', '', '', '', '0', '0817325868', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('536', '535', 'Emil Ryanna Widjaja', '', '0000-00-00', '0', '', '', '', '0', '0811372292', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('537', '536', 'Laura Tantomo', '', '0000-00-00', '0', '', '', '', '0', '08123276130', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('538', '537', 'Martinah', '', '0000-00-00', '0', '', '', '', '0', '085755068888', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('539', '538', 'Liem Yuliana', '', '0000-00-00', '0', '', '', '', '0', '08123503117', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('540', '539', 'Pinny Mustikawati', '', '0000-00-00', '0', '', '', '', '0', '0811310809', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('541', '540', 'Lyfangda Widjaja', '', '0000-00-00', '0', '', '', '', '0', '0811334020', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('542', '541', 'Yuvita Siswanto', '', '0000-00-00', '0', '', '', '', '0', '08165440352', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('543', '542', 'Ko Ester Yuliana', '', '0000-00-00', '0', '', '', '', '0', '0811300429', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('544', '543', 'Oey Erlina Kurniawati', '', '0000-00-00', '0', '', '', '', '0', '081357555168', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('545', '544', 'Santy', '', '0000-00-00', '0', '', '', '', '0', '0818339014', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('546', '545', 'Windy Tjan', '', '0000-00-00', '0', '', '', '', '0', '081331359000', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('547', '546', 'Herlina Tanujaya', '', '0000-00-00', '0', '', '', '', '0', '03171018100', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('548', '547', 'Lisa Wardhani', '', '0000-00-00', '0', '', '', '', '0', '087851287890', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('549', '548', 'Rostanti Kodrat', '', '0000-00-00', '0', '', '', '', '0', '081330532568', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('550', '549', 'Herdi Kabaena', '', '0000-00-00', '0', '', '', '', '0', '08133137506', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('551', '550', 'Jessy Natalia Gunawan', '', '0000-00-00', '0', '', '', '', '0', '081330497196', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('552', '551', 'Elly Tedjo', '', '0000-00-00', '0', '', '', '', '0', '08113643668', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('553', '552', 'Shierly Soeharsono', '', '0000-00-00', '0', '', '', '', '0', '081556688266', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('554', '553', 'Ivy', '', '0000-00-00', '0', '', '', '', '0', '085257957288', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('555', '554', 'Kwince Sudarly', '', '0000-00-00', '0', '', '', '', '0', '08123247601', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('556', '555', 'Uly Dame Ambarita', '', '0000-00-00', '0', '', '', '', '0', '081331581477', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('557', '556', 'Lesly Tanizar', '', '0000-00-00', '0', '', '', '', '0', '08123000288', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('558', '557', 'Sze To Tje In', '', '0000-00-00', '0', '', '', '', '0', '0818393323', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('559', '558', 'Lilies Tianus', '', '0000-00-00', '0', '', '', '', '0', '0811320069', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('560', '559', 'Early Susan', '', '0000-00-00', '0', '', '', '', '0', '08123545845', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('561', '560', 'Ernawati', '', '0000-00-00', '0', '', '', '', '0', '08113547820', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('562', '561', 'Jap Putri Yuliana Ingrid', '', '0000-00-00', '0', '', '', '', '0', '085336771901', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('563', '562', 'Lina Wati', '', '0000-00-00', '0', '', '', '', '0', '081234560580', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('564', '563', 'Shelley Gunawan', '', '0000-00-00', '0', '', '', '', '0', '0818306652', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('565', '564', 'Lily Fujiwati', '', '0000-00-00', '0', '', '', '', '0', '082131882688', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('566', '565', 'Mariana Kasrun', '', '0000-00-00', '0', '', '', '', '0', '0818583055', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('567', '566', 'Cyntiawati', '', '0000-00-00', '0', '', '', '', '0', '0811348353', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('568', '567', 'Anita Chandra', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('569', '568', 'Sianne Soehartono', '', '0000-00-00', '0', '', '', '', '0', '0811341122', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('570', '569', 'Aprillia Andriani', '', '0000-00-00', '0', '', '', '', '0', '0811341122', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('571', '570', 'Tan May Ling', '', '0000-00-00', '0', '', '', '', '0', '082138880888', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('572', '571', 'Evi Trisnawati', '', '0000-00-00', '0', '', '', '', '0', '085230388088', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('573', '572', 'Indah Iskandar Gunawan', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('574', '573', 'Fanny Rahardja', '', '0000-00-00', '0', '', '', '', '0', '081357859238', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('575', '574', 'Ester Agustinawati', '', '0000-00-00', '0', '', '', '', '0', '0811343449', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('576', '575', 'Syenti Dewi', '', '0000-00-00', '0', '', '', '', '0', '083856225558', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('577', '576', 'Inge Andryanto', '', '0000-00-00', '0', '', '', '', '0', '089675801213', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('578', '577', 'Eileen Setiono', '', '0000-00-00', '0', '', '', '', '0', '08179877888', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('579', '578', 'Novie Wulansari', '', '0000-00-00', '0', '', '', '', '0', '70350023', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('580', '579', 'Alisni', '', '0000-00-00', '0', '', '', '', '0', '081357083000', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('581', '580', 'Meylinda', '', '0000-00-00', '0', '', '', '', '0', '081332809999', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('582', '581', 'Yulliana', '', '0000-00-00', '0', '', '', '', '0', '0811372988', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('583', '582', 'Prany Riniwati', '', '0000-00-00', '0', '', '', '', '0', '08123263173', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('584', '583', 'Indrawati Kangmartono', '', '0000-00-00', '0', '', '', '', '0', '08123515838', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('585', '584', 'Maria Indahwati K.', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('586', '585', 'Fanny Gondo', '', '0000-00-00', '0', '', '', '', '0', '081230887777', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('587', '586', 'Lenny Savira', '', '0000-00-00', '0', '', '', '', '0', '08123538575', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('588', '587', 'Kong Fanny Rahardja', '', '0000-00-00', '0', '', '', '', '0', '085850473555', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('589', '588', 'Yuni Hartati Kurnia', '', '0000-00-00', '0', '', '', '', '0', '082139018482', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('590', '589', 'Dameria Frisella S,SH,M.Hum', '', '0000-00-00', '0', '', '', '', '0', '08123078623', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('591', '590', 'Linda', '', '0000-00-00', '0', '', '', '', '0', '0811319121', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('592', '591', 'Erlin', '', '0000-00-00', '0', '', '', '', '0', '0811325024', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('593', '592', 'He Ling Fang', '', '0000-00-00', '0', '', '', '', '0', '081615218608', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('594', '593', 'Meilyta', '', '0000-00-00', '0', '', '', '', '0', '0811308664', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('595', '594', 'Tio Irene Tjandra', '', '0000-00-00', '0', '', '', '', '0', '70903201', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('596', '595', 'Nini Alijhonlay', '', '0000-00-00', '0', '', '', '', '0', '081331278585', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('597', '596', 'Meliana Jayadi', '', '0000-00-00', '0', '', '', '', '0', '081332003829', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('598', '597', 'Erlina Kurniawati', '', '0000-00-00', '0', '', '', '', '0', '71037085', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('599', '598', 'Dewi Kartika', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('600', '599', 'Lin Yun', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('601', '600', 'Ingrid Angdy', '', '0000-00-00', '0', '', '', '', '0', '0811308256', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('602', '601', 'Yulita Sumatri', '', '0000-00-00', '0', '', '', '', '0', '08123533905', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('603', '602', 'Laurent Gunawan', '', '0000-00-00', '0', '', '', '', '0', '33586289', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('604', '603', 'Yetty Hartanto', '', '0000-00-00', '0', '', '', '', '0', '0812358960', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('605', '604', 'elly Tedjo', '', '0000-00-00', '0', '', '', '', '0', '0818314687', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('606', '605', 'Sandradevi Tedjokusumo', '', '0000-00-00', '0', '', '', '', '0', '91000775', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('607', '606', 'Widyanti', '', '0000-00-00', '0', '', '', '', '0', '08113422308', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('608', '607', 'Felicia Hadiwibowo', '', '0000-00-00', '0', '', '', '', '0', '08123006688', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('609', '608', 'Sandra Sudjianto', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('610', '609', 'Lielyana Tjakra', '', '0000-00-00', '0', '', '', '', '0', '081332636500', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('611', '610', 'Dewi Anggrajeni', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('612', '611', 'Mike Tandjaya', '', '0000-00-00', '0', '', '', '', '0', '0812351988', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('613', '612', 'Early Anggraeni', '', '0000-00-00', '0', '', '', '', '0', '70917272', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('614', '613', 'Wenny Tanderiel', '', '0000-00-00', '0', '', '', '', '0', '08883134343', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('615', '614', 'Lilik Andarwati S', '', '0000-00-00', '0', '', '', '', '0', '0817328189', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('616', '615', 'Ratnasiwi', '', '0000-00-00', '0', '', '', '', '0', '08123142838', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('617', '616', 'Liauw Catur Wulan S.', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('618', '617', 'Finie Irawati Prayogo', '', '0000-00-00', '0', '', '', '', '0', '0811309900', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('619', '618', 'Lily Angdi', '', '0000-00-00', '0', '', '', '', '0', '08123461819', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('620', '619', 'Susy Dewi', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('621', '620', 'Vonny Kamdari', '', '0000-00-00', '0', '', '', '', '0', '08165458699', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('622', '621', 'Natasya Widjaja', '', '0000-00-00', '0', '', '', '', '0', '08113438888', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('623', '622', 'Melita Felicia Limantoro', '', '0000-00-00', '0', '', '', '', '0', '0817309411', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('624', '623', 'Debora Indrawati NJOTO', '', '0000-00-00', '0', '', '', '', '0', '081357675777', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('625', '624', 'Caroline Yulia Phe', '', '0000-00-00', '0', '', '', '', '0', '0811379918', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('626', '625', 'Suzana Dewi WIDJAJA', '', '0000-00-00', '0', '', '', '', '0', '0811333818', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('627', '626', 'Yati', '', '0000-00-00', '0', '', '', '', '0', '08121216222', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('628', '627', 'Santi Yuliana Widjaja', '', '0000-00-00', '0', '', '', '', '0', '081332112212', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('629', '628', 'Mikewati Kory', '', '0000-00-00', '0', '', '', '', '0', '70048701', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('630', '629', 'Hungnywati', '', '0000-00-00', '0', '', '', '', '0', '70613812', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('631', '630', 'Go Lee Tin', '', '0000-00-00', '0', '', '', '', '0', '08123000299', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('632', '631', 'Jein Vanda', '', '0000-00-00', '0', '', '', '', '0', '0816210658', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('633', '632', 'Tio Irene Tjandra', '', '0000-00-00', '0', '', '', '', '0', '0811311224', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('634', '633', 'Kristanti', '', '0000-00-00', '0', '', '', '', '0', '08123011808', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('635', '634', 'Aju Trisna Tjakra', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('636', '635', 'Anik Tanjong', '', '0000-00-00', '0', '', '', '', '0', '0811329395', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('637', '636', '085755300600', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('638', '637', 'OEI Yanti', '', '0000-00-00', '0', '', '', '', '0', '08123520430', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('639', '638', 'Ratnasiwi', '', '0000-00-00', '0', '', '', '', '0', '08123142838', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('640', '639', 'Melisa Santoso', '', '0000-00-00', '0', '', '', '', '0', '0811349595', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('641', '640', 'Herlina Trisnawaty', '', '0000-00-00', '0', '', '', '', '0', '081216932089', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('642', '641', 'Hou Amy Tanoto', '', '0000-00-00', '0', '', '', '', '0', '08165428795', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('643', '642', 'LAUW Caroline Lauda', '', '0000-00-00', '0', '', '', '', '0', '081330508970', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('644', '643', 'Maria Indahwati KOSASIH', '', '0000-00-00', '0', '', '', '', '0', '08123012355', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('645', '644', 'Lita Sumarno', '', '0000-00-00', '0', '', '', '', '0', '0811328719', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('646', '645', 'Melia Wijaya', '', '0000-00-00', '0', '', '', '', '0', '08155105168', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('647', '646', 'Alisni', '', '0000-00-00', '0', '', '', '', '0', '081357083000', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('648', '647', 'Shirly Maria Yuniwati', '', '0000-00-00', '0', '', '', '', '0', '087846506888', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('649', '648', 'Tinawati Winarto', '', '0000-00-00', '0', '', '', '', '0', '081330223939', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('650', '649', 'Effie WIKANTA', '', '0000-00-00', '0', '', '', '', '0', '08155296789', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('651', '650', 'Juni Harjati', '', '0000-00-00', '0', '', '', '', '0', '70960788', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('652', '651', 'Jenny Susanto', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('653', '652', 'LIE Herliana Lukman', '', '0000-00-00', '0', '', '', '', '0', '0811318094', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('654', '653', 'Cecilia SOEDIBYO', '', '0000-00-00', '0', '', '', '', '0', '0816518424', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('655', '654', 'L. Catur Wulan S.', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('656', '655', 'HAUW Lilies Tianus', '', '0000-00-00', '0', '', '', '', '0', '0811320069', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('657', '656', 'Jauw Jessica', '', '0000-00-00', '0', '', '', '', '0', '0811310850', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('658', '657', 'LO Sianne Soehartono', '', '0000-00-00', '0', '', '', '', '0', '0811372233', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('659', '658', 'Lenny Lolo', '', '0000-00-00', '0', '', '', '', '0', '087823965353', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('660', '659', 'KENG Indati', '', '0000-00-00', '0', '', '', '', '0', '08165402057', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('661', '660', 'Sunarti', '', '0000-00-00', '0', '', '', '', '0', '0816524200', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('662', '661', 'Shierly Soeharsono', '', '0000-00-00', '0', '', '', '', '0', '70887888', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('663', '662', 'Anggraini Linggodigdo', '', '0000-00-00', '0', '', '', '', '0', '0818300368', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('664', '663', 'Ariyanti Kusuma Dewi', '', '0000-00-00', '0', '', '', '', '0', '085230305555', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('665', '664', 'Yenny Gunawan', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('666', '665', 'Thoeng Evina', '', '0000-00-00', '0', '', '', '', '0', '08123007429', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('667', '666', 'Melia Wijaya', '', '0000-00-00', '0', '', '', '', '0', '08155105168', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('668', '667', 'Vita Lianto', '', '0000-00-00', '0', '', '', '', '0', '0811342893', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('669', '668', 'Santi Dermawan Natalia', '', '0000-00-00', '0', '', '', '', '0', '08165414609', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('670', '669', 'LAUW Caroline Lauda', '', '0000-00-00', '0', '', '', '', '0', '081330508970', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('671', '670', 'Megawati Gunawan', '', '0000-00-00', '0', '', '', '', '0', '0818337048', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('672', '671', 'Linda Tanuwidjaja', '', '0000-00-00', '0', '', '', '', '0', '081330328686', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('673', '672', 'LIM Melita Felicia Limantoro', '', '0000-00-00', '0', '', '', '', '0', '0817309422', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('674', '673', 'Thessalonica', '', '0000-00-00', '0', '', '', '', '0', '70300874', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('675', '674', 'Ratna Juniwati', '', '0000-00-00', '0', '', '', '', '0', '08123541117', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('676', '675', 'Sandra Sudjianto', '', '0000-00-00', '0', '', '', '', '0', '081331333165', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('677', '676', 'Meria Wati WIRONO', '', '0000-00-00', '0', '', '', '', '0', '0811317737', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('678', '677', 'Uly Dame Ria Ambarita', '', '0000-00-00', '0', '', '', '', '0', '081331501878', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('679', '678', 'Carolline WIDJAJA', '', '0000-00-00', '0', '', '', '', '0', '0811308850', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('680', '679', 'Rini Yulia Winta', '', '0000-00-00', '0', '', '', '', '0', '083856403180', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('681', '680', 'Ineke Hendrawati', '', '0000-00-00', '0', '', '', '', '0', '71035555', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('682', '681', 'Susanti', '', '0000-00-00', '0', '', '', '', '0', '08155022723', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('683', '682', 'Herlina Tanujaya', '', '0000-00-00', '0', '', '', '', '0', '08123598020', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('684', '683', 'Irene Amalia', '', '0000-00-00', '0', '', '', '', '0', '0811327851', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('685', '684', 'Lanny Tan', '', '0000-00-00', '0', '', '', '', '0', '08123224787', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('686', '685', 'Finie Irawati Prayogo', '', '0000-00-00', '0', '', '', '', '0', '0811309900', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('687', '686', 'Deny Bumiwati', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('688', '687', 'Lyfangda Widjaja', '', '0000-00-00', '0', '', '', '', '0', '0811334020', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('689', '688', 'Indawati Tjipto', '', '0000-00-00', '0', '', '', '', '0', '0811310818', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('690', '689', 'Tan May Ling', '', '0000-00-00', '0', '', '', '', '0', '0818510668', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('691', '690', 'Lanita Christina', '', '0000-00-00', '0', '', '', '', '0', '08123022335', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('692', '691', 'Tan Melissa FT', '', '0000-00-00', '0', '', '', '', '0', '08165409467', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('693', '692', 'Po Ling Lindajati', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('694', '693', 'Evawati Koesnadi', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('695', '694', 'Debora Terang Miniang', '', '0000-00-00', '0', '', '', '', '0', '081332055002', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('696', '695', 'Sherly Djiady Djie', '', '0000-00-00', '0', '', '', '', '0', '08161138888', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('697', '696', 'Joe Soe San', '', '0000-00-00', '0', '', '', '', '0', '0818339620', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('698', '697', 'Shirley Liz Megawati Tantry Mutualam', '', '0000-00-00', '0', '', '', '', '0', '081230555100', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('699', '698', 'Elly Gunawan7530 678', '', '0000-00-00', '0', '', '', '', '0', '08165420277', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('700', '699', 'Enny Sunarti', '', '0000-00-00', '0', '', '', '', '0', '0816521200', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('701', '700', 'Effie Wikanto', '', '0000-00-00', '0', '', '', '', '0', '70450707', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('702', '701', 'Jauw Jessica', '', '0000-00-00', '0', '', '', '', '0', '0811310850', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('703', '702', 'Yohana Sihen Bundong', '', '0000-00-00', '0', '', '', '', '0', '08123215073', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('704', '703', 'Vivi Soehartin', '', '0000-00-00', '0', '', '', '', '0', '08123530298', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('705', '704', 'Lucyadevi', '', '0000-00-00', '0', '', '', '', '0', '91144123', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('706', '705', 'Tanty Indrawati', '', '0000-00-00', '0', '', '', '', '0', '0811344165', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('707', '706', 'Irene Widjaja', '', '0000-00-00', '0', '', '', '', '0', '0817368333', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('708', '707', 'Pinny Mustikawati', '', '0000-00-00', '0', '', '', '', '0', '0811310809', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('709', '708', 'Lily Suzanna', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('710', '709', 'Henny Lao Tambuwun', '', '0000-00-00', '0', '', '', '', '0', '70699019', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('711', '710', 'Fancy Boedisetiolani', '', '0000-00-00', '0', '', '', '', '0', '0811378881', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('712', '711', 'Liem Lenny Widiawati', '', '0000-00-00', '0', '', '', '', '0', '0811376877', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('713', '712', 'Evi Agustin Suwandi', '', '0000-00-00', '0', '', '', '', '0', '08123243227', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('714', '713', 'Aju Trisna Tjakra', '', '0000-00-00', '0', '', '', '', '0', '0816518151', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('715', '714', 'Sianne Dharmanto Siandy', '', '0000-00-00', '0', '', '', '', '0', '08123507070', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('716', '715', 'Caroline Lauda', '', '0000-00-00', '0', '', '', '', '0', '081330508970', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('717', '716', 'Tan Djoen Ing (Ingrid)', '', '0000-00-00', '0', '', '', '', '0', '0818523734', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('718', '717', 'Tan Djoen Ing (Ingrid)', '', '0000-00-00', '0', '', '', '', '0', '0818523734', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('719', '718', 'MV. Ivonne', '', '0000-00-00', '0', '', '', '', '0', '70997343', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('720', '719', 'Natasya Widjaja', '', '0000-00-00', '0', '', '', '', '0', '08113438888', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('721', '720', 'Yenny Muliany', '', '0000-00-00', '0', '', '', '', '0', '0818395833', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('722', '721', 'Jenny Sulastri Njotorahardjo', '', '0000-00-00', '0', '', '', '', '0', '0811307737', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('723', '722', 'Patricia Gondo Utomo', '', '0000-00-00', '0', '', '', '', '0', '081615415439', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('724', '723', 'Trisyana Lukito', '', '0000-00-00', '0', '', '', '', '0', '0811341808', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('725', '724', 'Go Lee Tin', '', '0000-00-00', '0', '', '', '', '0', '08123000299', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('726', '725', 'Rika Susiani', '', '0000-00-00', '0', '', '', '', '0', '081330680088', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('727', '726', 'Njo Ai Ling', '', '0000-00-00', '0', '', '', '', '0', '08123017701', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('728', '727', 'Ignes Chrisgotami', '', '0000-00-00', '0', '', '', '', '0', '08165431839', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('729', '728', 'Lie San San', '', '0000-00-00', '0', '', '', '', '0', '08165446328', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('730', '729', 'Elisabeth', '', '0000-00-00', '0', '', '', '', '0', '08123130118', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('731', '730', 'Minarni Wartiningsih', '', '0000-00-00', '0', '', '', '', '0', '08123205900', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('732', '731', 'Suzana Dewi Widjaja', '', '0000-00-00', '0', '', '', '', '0', '0811333818', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('733', '732', 'Evy Lindayana', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `aka_siswa_ibu` VALUES ('734', '733', 'Shieny', '', '0000-00-00', '0', '', '', '', '0', '08121230099', '', '');

-- ----------------------------
-- Table structure for aka_siswa_kelas
-- ----------------------------
DROP TABLE IF EXISTS `aka_siswa_kelas`;
CREATE TABLE `aka_siswa_kelas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `kelas` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=411 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_siswa_kelas
-- ----------------------------
INSERT INTO `aka_siswa_kelas` VALUES ('1', '1', '1');
INSERT INTO `aka_siswa_kelas` VALUES ('2', '2', '1');
INSERT INTO `aka_siswa_kelas` VALUES ('3', '4', '1');
INSERT INTO `aka_siswa_kelas` VALUES ('4', '5', '2');
INSERT INTO `aka_siswa_kelas` VALUES ('5', '7', '2');
INSERT INTO `aka_siswa_kelas` VALUES ('6', '1', '41');
INSERT INTO `aka_siswa_kelas` VALUES ('8', '4', '41');
INSERT INTO `aka_siswa_kelas` VALUES ('10', '5', '41');
INSERT INTO `aka_siswa_kelas` VALUES ('11', '7', '41');
INSERT INTO `aka_siswa_kelas` VALUES ('12', '2', '101');
INSERT INTO `aka_siswa_kelas` VALUES ('18', '2', '41');
INSERT INTO `aka_siswa_kelas` VALUES ('19', '186', '60');
INSERT INTO `aka_siswa_kelas` VALUES ('20', '187', '60');
INSERT INTO `aka_siswa_kelas` VALUES ('21', '188', '60');
INSERT INTO `aka_siswa_kelas` VALUES ('22', '189', '60');
INSERT INTO `aka_siswa_kelas` VALUES ('23', '190', '60');
INSERT INTO `aka_siswa_kelas` VALUES ('24', '191', '60');
INSERT INTO `aka_siswa_kelas` VALUES ('25', '192', '60');
INSERT INTO `aka_siswa_kelas` VALUES ('26', '193', '60');
INSERT INTO `aka_siswa_kelas` VALUES ('27', '194', '60');
INSERT INTO `aka_siswa_kelas` VALUES ('28', '195', '60');
INSERT INTO `aka_siswa_kelas` VALUES ('29', '196', '60');
INSERT INTO `aka_siswa_kelas` VALUES ('43', '146', '33');
INSERT INTO `aka_siswa_kelas` VALUES ('44', '147', '33');
INSERT INTO `aka_siswa_kelas` VALUES ('45', '148', '33');
INSERT INTO `aka_siswa_kelas` VALUES ('46', '149', '33');
INSERT INTO `aka_siswa_kelas` VALUES ('47', '150', '33');
INSERT INTO `aka_siswa_kelas` VALUES ('48', '151', '33');
INSERT INTO `aka_siswa_kelas` VALUES ('49', '152', '33');
INSERT INTO `aka_siswa_kelas` VALUES ('50', '153', '33');
INSERT INTO `aka_siswa_kelas` VALUES ('51', '154', '33');
INSERT INTO `aka_siswa_kelas` VALUES ('52', '155', '33');
INSERT INTO `aka_siswa_kelas` VALUES ('53', '156', '33');
INSERT INTO `aka_siswa_kelas` VALUES ('54', '157', '33');
INSERT INTO `aka_siswa_kelas` VALUES ('55', '158', '33');
INSERT INTO `aka_siswa_kelas` VALUES ('56', '159', '33');
INSERT INTO `aka_siswa_kelas` VALUES ('57', '160', '33');
INSERT INTO `aka_siswa_kelas` VALUES ('58', '161', '33');
INSERT INTO `aka_siswa_kelas` VALUES ('59', '162', '33');
INSERT INTO `aka_siswa_kelas` VALUES ('60', '163', '33');
INSERT INTO `aka_siswa_kelas` VALUES ('61', '164', '33');
INSERT INTO `aka_siswa_kelas` VALUES ('62', '165', '33');
INSERT INTO `aka_siswa_kelas` VALUES ('63', '166', '34');
INSERT INTO `aka_siswa_kelas` VALUES ('64', '168', '34');
INSERT INTO `aka_siswa_kelas` VALUES ('65', '167', '34');
INSERT INTO `aka_siswa_kelas` VALUES ('66', '169', '34');
INSERT INTO `aka_siswa_kelas` VALUES ('67', '170', '34');
INSERT INTO `aka_siswa_kelas` VALUES ('68', '171', '34');
INSERT INTO `aka_siswa_kelas` VALUES ('69', '172', '34');
INSERT INTO `aka_siswa_kelas` VALUES ('70', '173', '34');
INSERT INTO `aka_siswa_kelas` VALUES ('71', '174', '34');
INSERT INTO `aka_siswa_kelas` VALUES ('72', '175', '34');
INSERT INTO `aka_siswa_kelas` VALUES ('73', '176', '34');
INSERT INTO `aka_siswa_kelas` VALUES ('74', '177', '34');
INSERT INTO `aka_siswa_kelas` VALUES ('75', '179', '34');
INSERT INTO `aka_siswa_kelas` VALUES ('76', '180', '34');
INSERT INTO `aka_siswa_kelas` VALUES ('77', '183', '34');
INSERT INTO `aka_siswa_kelas` VALUES ('78', '184', '34');
INSERT INTO `aka_siswa_kelas` VALUES ('79', '185', '34');
INSERT INTO `aka_siswa_kelas` VALUES ('80', '204', '37');
INSERT INTO `aka_siswa_kelas` VALUES ('81', '205', '37');
INSERT INTO `aka_siswa_kelas` VALUES ('82', '206', '37');
INSERT INTO `aka_siswa_kelas` VALUES ('83', '207', '37');
INSERT INTO `aka_siswa_kelas` VALUES ('84', '208', '37');
INSERT INTO `aka_siswa_kelas` VALUES ('85', '209', '37');
INSERT INTO `aka_siswa_kelas` VALUES ('86', '210', '37');
INSERT INTO `aka_siswa_kelas` VALUES ('87', '211', '37');
INSERT INTO `aka_siswa_kelas` VALUES ('88', '215', '37');
INSERT INTO `aka_siswa_kelas` VALUES ('89', '220', '37');
INSERT INTO `aka_siswa_kelas` VALUES ('90', '214', '37');
INSERT INTO `aka_siswa_kelas` VALUES ('91', '216', '37');
INSERT INTO `aka_siswa_kelas` VALUES ('92', '217', '37');
INSERT INTO `aka_siswa_kelas` VALUES ('93', '218', '37');
INSERT INTO `aka_siswa_kelas` VALUES ('94', '219', '37');
INSERT INTO `aka_siswa_kelas` VALUES ('95', '221', '38');
INSERT INTO `aka_siswa_kelas` VALUES ('96', '222', '38');
INSERT INTO `aka_siswa_kelas` VALUES ('97', '223', '38');
INSERT INTO `aka_siswa_kelas` VALUES ('98', '224', '38');
INSERT INTO `aka_siswa_kelas` VALUES ('99', '225', '38');
INSERT INTO `aka_siswa_kelas` VALUES ('100', '226', '38');
INSERT INTO `aka_siswa_kelas` VALUES ('101', '227', '38');
INSERT INTO `aka_siswa_kelas` VALUES ('102', '228', '38');
INSERT INTO `aka_siswa_kelas` VALUES ('103', '229', '38');
INSERT INTO `aka_siswa_kelas` VALUES ('104', '230', '38');
INSERT INTO `aka_siswa_kelas` VALUES ('105', '231', '38');
INSERT INTO `aka_siswa_kelas` VALUES ('106', '232', '38');
INSERT INTO `aka_siswa_kelas` VALUES ('107', '236', '38');
INSERT INTO `aka_siswa_kelas` VALUES ('108', '234', '38');
INSERT INTO `aka_siswa_kelas` VALUES ('109', '235', '38');
INSERT INTO `aka_siswa_kelas` VALUES ('110', '197', '62');
INSERT INTO `aka_siswa_kelas` VALUES ('111', '198', '62');
INSERT INTO `aka_siswa_kelas` VALUES ('112', '199', '62');
INSERT INTO `aka_siswa_kelas` VALUES ('113', '200', '62');
INSERT INTO `aka_siswa_kelas` VALUES ('114', '201', '62');
INSERT INTO `aka_siswa_kelas` VALUES ('115', '202', '62');
INSERT INTO `aka_siswa_kelas` VALUES ('116', '203', '62');
INSERT INTO `aka_siswa_kelas` VALUES ('117', '237', '62');
INSERT INTO `aka_siswa_kelas` VALUES ('118', '238', '62');
INSERT INTO `aka_siswa_kelas` VALUES ('119', '239', '62');
INSERT INTO `aka_siswa_kelas` VALUES ('121', '269', '46');
INSERT INTO `aka_siswa_kelas` VALUES ('123', '98', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('124', '314', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('125', '316', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('126', '317', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('127', '318', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('128', '321', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('129', '322', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('130', '323', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('131', '324', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('132', '325', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('133', '305', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('134', '306', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('135', '95', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('136', '86', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('137', '308', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('138', '309', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('139', '310', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('140', '101', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('142', '313', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('143', '315', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('144', '319', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('145', '320', '13');
INSERT INTO `aka_siswa_kelas` VALUES ('146', '344', '14');
INSERT INTO `aka_siswa_kelas` VALUES ('147', '326', '14');
INSERT INTO `aka_siswa_kelas` VALUES ('148', '328', '14');
INSERT INTO `aka_siswa_kelas` VALUES ('149', '329', '14');
INSERT INTO `aka_siswa_kelas` VALUES ('150', '330', '14');
INSERT INTO `aka_siswa_kelas` VALUES ('151', '331', '14');
INSERT INTO `aka_siswa_kelas` VALUES ('152', '332', '14');
INSERT INTO `aka_siswa_kelas` VALUES ('153', '333', '14');
INSERT INTO `aka_siswa_kelas` VALUES ('154', '334', '14');
INSERT INTO `aka_siswa_kelas` VALUES ('155', '335', '14');
INSERT INTO `aka_siswa_kelas` VALUES ('156', '337', '14');
INSERT INTO `aka_siswa_kelas` VALUES ('157', '338', '14');
INSERT INTO `aka_siswa_kelas` VALUES ('158', '339', '14');
INSERT INTO `aka_siswa_kelas` VALUES ('159', '340', '14');
INSERT INTO `aka_siswa_kelas` VALUES ('160', '341', '14');
INSERT INTO `aka_siswa_kelas` VALUES ('161', '342', '14');
INSERT INTO `aka_siswa_kelas` VALUES ('162', '343', '14');
INSERT INTO `aka_siswa_kelas` VALUES ('163', '327', '14');
INSERT INTO `aka_siswa_kelas` VALUES ('164', '345', '15');
INSERT INTO `aka_siswa_kelas` VALUES ('165', '346', '15');
INSERT INTO `aka_siswa_kelas` VALUES ('166', '347', '15');
INSERT INTO `aka_siswa_kelas` VALUES ('167', '348', '15');
INSERT INTO `aka_siswa_kelas` VALUES ('168', '349', '15');
INSERT INTO `aka_siswa_kelas` VALUES ('169', '350', '15');
INSERT INTO `aka_siswa_kelas` VALUES ('170', '351', '15');
INSERT INTO `aka_siswa_kelas` VALUES ('171', '352', '15');
INSERT INTO `aka_siswa_kelas` VALUES ('172', '353', '15');
INSERT INTO `aka_siswa_kelas` VALUES ('173', '354', '15');
INSERT INTO `aka_siswa_kelas` VALUES ('174', '355', '15');
INSERT INTO `aka_siswa_kelas` VALUES ('175', '356', '15');
INSERT INTO `aka_siswa_kelas` VALUES ('176', '357', '15');
INSERT INTO `aka_siswa_kelas` VALUES ('177', '358', '15');
INSERT INTO `aka_siswa_kelas` VALUES ('178', '359', '15');
INSERT INTO `aka_siswa_kelas` VALUES ('179', '360', '15');
INSERT INTO `aka_siswa_kelas` VALUES ('180', '361', '15');
INSERT INTO `aka_siswa_kelas` VALUES ('181', '97', '15');
INSERT INTO `aka_siswa_kelas` VALUES ('182', '363', '15');
INSERT INTO `aka_siswa_kelas` VALUES ('183', '364', '15');
INSERT INTO `aka_siswa_kelas` VALUES ('184', '365', '15');
INSERT INTO `aka_siswa_kelas` VALUES ('185', '366', '17');
INSERT INTO `aka_siswa_kelas` VALUES ('186', '371', '17');
INSERT INTO `aka_siswa_kelas` VALUES ('187', '373', '17');
INSERT INTO `aka_siswa_kelas` VALUES ('188', '374', '17');
INSERT INTO `aka_siswa_kelas` VALUES ('189', '377', '17');
INSERT INTO `aka_siswa_kelas` VALUES ('190', '470', '23');
INSERT INTO `aka_siswa_kelas` VALUES ('191', '467', '23');
INSERT INTO `aka_siswa_kelas` VALUES ('192', '465', '23');
INSERT INTO `aka_siswa_kelas` VALUES ('193', '462', '23');
INSERT INTO `aka_siswa_kelas` VALUES ('194', '459', '23');
INSERT INTO `aka_siswa_kelas` VALUES ('195', '469', '23');
INSERT INTO `aka_siswa_kelas` VALUES ('196', '468', '23');
INSERT INTO `aka_siswa_kelas` VALUES ('197', '464', '23');
INSERT INTO `aka_siswa_kelas` VALUES ('198', '461', '23');
INSERT INTO `aka_siswa_kelas` VALUES ('199', '466', '23');
INSERT INTO `aka_siswa_kelas` VALUES ('200', '463', '23');
INSERT INTO `aka_siswa_kelas` VALUES ('201', '458', '23');
INSERT INTO `aka_siswa_kelas` VALUES ('202', '457', '23');
INSERT INTO `aka_siswa_kelas` VALUES ('203', '488', '22');
INSERT INTO `aka_siswa_kelas` VALUES ('204', '484', '22');
INSERT INTO `aka_siswa_kelas` VALUES ('205', '483', '22');
INSERT INTO `aka_siswa_kelas` VALUES ('206', '475', '22');
INSERT INTO `aka_siswa_kelas` VALUES ('207', '480', '22');
INSERT INTO `aka_siswa_kelas` VALUES ('208', '479', '22');
INSERT INTO `aka_siswa_kelas` VALUES ('209', '487', '22');
INSERT INTO `aka_siswa_kelas` VALUES ('210', '486', '22');
INSERT INTO `aka_siswa_kelas` VALUES ('211', '482', '22');
INSERT INTO `aka_siswa_kelas` VALUES ('212', '481', '22');
INSERT INTO `aka_siswa_kelas` VALUES ('213', '478', '22');
INSERT INTO `aka_siswa_kelas` VALUES ('214', '473', '22');
INSERT INTO `aka_siswa_kelas` VALUES ('215', '485', '22');
INSERT INTO `aka_siswa_kelas` VALUES ('216', '474', '22');
INSERT INTO `aka_siswa_kelas` VALUES ('217', '476', '22');
INSERT INTO `aka_siswa_kelas` VALUES ('218', '472', '22');
INSERT INTO `aka_siswa_kelas` VALUES ('219', '471', '22');
INSERT INTO `aka_siswa_kelas` VALUES ('220', '477', '22');
INSERT INTO `aka_siswa_kelas` VALUES ('245', '684', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('246', '683', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('247', '685', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('248', '686', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('249', '687', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('250', '691', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('251', '695', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('252', '696', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('253', '699', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('254', '700', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('255', '688', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('256', '689', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('257', '690', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('258', '692', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('259', '693', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('260', '698', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('261', '701', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('262', '702', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('263', '703', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('264', '704', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('265', '694', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('266', '697', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('267', '706', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('268', '707', '89');
INSERT INTO `aka_siswa_kelas` VALUES ('269', '709', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('270', '710', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('271', '714', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('272', '715', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('273', '716', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('274', '719', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('275', '720', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('276', '721', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('277', '724', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('278', '725', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('279', '730', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('280', '728', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('281', '708', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('282', '711', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('283', '713', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('284', '718', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('285', '726', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('286', '731', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('287', '732', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('288', '729', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('289', '723', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('290', '722', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('291', '712', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('292', '733', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('293', '727', '90');
INSERT INTO `aka_siswa_kelas` VALUES ('294', '598', '86');
INSERT INTO `aka_siswa_kelas` VALUES ('295', '597', '86');
INSERT INTO `aka_siswa_kelas` VALUES ('296', '595', '86');
INSERT INTO `aka_siswa_kelas` VALUES ('297', '594', '86');
INSERT INTO `aka_siswa_kelas` VALUES ('298', '592', '86');
INSERT INTO `aka_siswa_kelas` VALUES ('299', '590', '86');
INSERT INTO `aka_siswa_kelas` VALUES ('300', '589', '86');
INSERT INTO `aka_siswa_kelas` VALUES ('301', '587', '86');
INSERT INTO `aka_siswa_kelas` VALUES ('302', '586', '86');
INSERT INTO `aka_siswa_kelas` VALUES ('303', '585', '86');
INSERT INTO `aka_siswa_kelas` VALUES ('304', '584', '86');
INSERT INTO `aka_siswa_kelas` VALUES ('305', '583', '86');
INSERT INTO `aka_siswa_kelas` VALUES ('306', '582', '86');
INSERT INTO `aka_siswa_kelas` VALUES ('307', '581', '86');
INSERT INTO `aka_siswa_kelas` VALUES ('308', '593', '86');
INSERT INTO `aka_siswa_kelas` VALUES ('309', '579', '86');
INSERT INTO `aka_siswa_kelas` VALUES ('310', '578', '86');
INSERT INTO `aka_siswa_kelas` VALUES ('311', '580', '86');
INSERT INTO `aka_siswa_kelas` VALUES ('312', '591', '86');
INSERT INTO `aka_siswa_kelas` VALUES ('313', '588', '86');
INSERT INTO `aka_siswa_kelas` VALUES ('314', '596', '86');
INSERT INTO `aka_siswa_kelas` VALUES ('315', '622', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('316', '621', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('317', '620', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('318', '619', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('319', '616', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('320', '615', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('321', '614', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('322', '613', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('323', '612', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('324', '610', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('325', '609', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('326', '608', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('327', '604', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('328', '603', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('329', '602', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('330', '601', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('331', '606', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('332', '605', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('333', '618', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('334', '617', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('335', '611', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('336', '607', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('337', '600', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('338', '599', '85');
INSERT INTO `aka_siswa_kelas` VALUES ('339', '676', '83');
INSERT INTO `aka_siswa_kelas` VALUES ('340', '680', '83');
INSERT INTO `aka_siswa_kelas` VALUES ('341', '629', '83');
INSERT INTO `aka_siswa_kelas` VALUES ('342', '628', '83');
INSERT INTO `aka_siswa_kelas` VALUES ('343', '626', '83');
INSERT INTO `aka_siswa_kelas` VALUES ('344', '624', '83');
INSERT INTO `aka_siswa_kelas` VALUES ('345', '672', '83');
INSERT INTO `aka_siswa_kelas` VALUES ('346', '681', '83');
INSERT INTO `aka_siswa_kelas` VALUES ('347', '682', '83');
INSERT INTO `aka_siswa_kelas` VALUES ('348', '623', '83');
INSERT INTO `aka_siswa_kelas` VALUES ('349', '673', '83');
INSERT INTO `aka_siswa_kelas` VALUES ('350', '674', '83');
INSERT INTO `aka_siswa_kelas` VALUES ('351', '675', '83');
INSERT INTO `aka_siswa_kelas` VALUES ('352', '677', '83');
INSERT INTO `aka_siswa_kelas` VALUES ('353', '678', '83');
INSERT INTO `aka_siswa_kelas` VALUES ('354', '679', '83');
INSERT INTO `aka_siswa_kelas` VALUES ('355', '627', '83');
INSERT INTO `aka_siswa_kelas` VALUES ('356', '625', '83');
INSERT INTO `aka_siswa_kelas` VALUES ('357', '657', '82');
INSERT INTO `aka_siswa_kelas` VALUES ('358', '661', '82');
INSERT INTO `aka_siswa_kelas` VALUES ('359', '663', '82');
INSERT INTO `aka_siswa_kelas` VALUES ('360', '664', '82');
INSERT INTO `aka_siswa_kelas` VALUES ('361', '667', '82');
INSERT INTO `aka_siswa_kelas` VALUES ('362', '655', '82');
INSERT INTO `aka_siswa_kelas` VALUES ('363', '659', '82');
INSERT INTO `aka_siswa_kelas` VALUES ('364', '670', '82');
INSERT INTO `aka_siswa_kelas` VALUES ('365', '671', '82');
INSERT INTO `aka_siswa_kelas` VALUES ('366', '653', '82');
INSERT INTO `aka_siswa_kelas` VALUES ('367', '656', '82');
INSERT INTO `aka_siswa_kelas` VALUES ('368', '660', '82');
INSERT INTO `aka_siswa_kelas` VALUES ('369', '662', '82');
INSERT INTO `aka_siswa_kelas` VALUES ('370', '654', '82');
INSERT INTO `aka_siswa_kelas` VALUES ('371', '658', '82');
INSERT INTO `aka_siswa_kelas` VALUES ('372', '665', '82');
INSERT INTO `aka_siswa_kelas` VALUES ('373', '666', '82');
INSERT INTO `aka_siswa_kelas` VALUES ('374', '668', '82');
INSERT INTO `aka_siswa_kelas` VALUES ('375', '669', '82');
INSERT INTO `aka_siswa_kelas` VALUES ('376', '635', '81');
INSERT INTO `aka_siswa_kelas` VALUES ('377', '636', '81');
INSERT INTO `aka_siswa_kelas` VALUES ('378', '637', '81');
INSERT INTO `aka_siswa_kelas` VALUES ('379', '638', '81');
INSERT INTO `aka_siswa_kelas` VALUES ('380', '639', '81');
INSERT INTO `aka_siswa_kelas` VALUES ('381', '640', '81');
INSERT INTO `aka_siswa_kelas` VALUES ('382', '641', '81');
INSERT INTO `aka_siswa_kelas` VALUES ('383', '642', '81');
INSERT INTO `aka_siswa_kelas` VALUES ('384', '643', '81');
INSERT INTO `aka_siswa_kelas` VALUES ('385', '644', '81');
INSERT INTO `aka_siswa_kelas` VALUES ('386', '645', '81');
INSERT INTO `aka_siswa_kelas` VALUES ('387', '646', '81');
INSERT INTO `aka_siswa_kelas` VALUES ('388', '647', '81');
INSERT INTO `aka_siswa_kelas` VALUES ('389', '648', '81');
INSERT INTO `aka_siswa_kelas` VALUES ('390', '649', '81');
INSERT INTO `aka_siswa_kelas` VALUES ('391', '650', '81');
INSERT INTO `aka_siswa_kelas` VALUES ('392', '651', '81');
INSERT INTO `aka_siswa_kelas` VALUES ('393', '652', '81');
INSERT INTO `aka_siswa_kelas` VALUES ('394', '460', '23');
INSERT INTO `aka_siswa_kelas` VALUES ('395', '630', '23');
INSERT INTO `aka_siswa_kelas` VALUES ('396', '631', '23');
INSERT INTO `aka_siswa_kelas` VALUES ('397', '632', '23');
INSERT INTO `aka_siswa_kelas` VALUES ('398', '633', '23');
INSERT INTO `aka_siswa_kelas` VALUES ('399', '634', '23');
INSERT INTO `aka_siswa_kelas` VALUES ('400', '495', '21');
INSERT INTO `aka_siswa_kelas` VALUES ('401', '494', '21');
INSERT INTO `aka_siswa_kelas` VALUES ('402', '499', '21');
INSERT INTO `aka_siswa_kelas` VALUES ('403', '489', '21');
INSERT INTO `aka_siswa_kelas` VALUES ('404', '490', '21');
INSERT INTO `aka_siswa_kelas` VALUES ('405', '491', '21');
INSERT INTO `aka_siswa_kelas` VALUES ('406', '521', '19');
INSERT INTO `aka_siswa_kelas` VALUES ('407', '520', '19');
INSERT INTO `aka_siswa_kelas` VALUES ('408', '518', '19');
INSERT INTO `aka_siswa_kelas` VALUES ('409', '513', '19');
INSERT INTO `aka_siswa_kelas` VALUES ('410', '519', '19');

-- ----------------------------
-- Table structure for aka_siswa_keluarga
-- ----------------------------
DROP TABLE IF EXISTS `aka_siswa_keluarga`;
CREATE TABLE `aka_siswa_keluarga` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `kakek-nama` varchar(100) NOT NULL,
  `kakek-tgllahir` date NOT NULL,
  `nenek-nama` varchar(100) NOT NULL,
  `nenek-tgllahir` date NOT NULL,
  `tglnikah` date NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=735 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_siswa_keluarga
-- ----------------------------
INSERT INTO `aka_siswa_keluarga` VALUES ('1', '1', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('2', '2', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('4', '4', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('5', '5', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('7', '7', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('11', '10', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('14', '13', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('15', '14', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('16', '15', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('17', '16', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('18', '17', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('19', '18', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('20', '19', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('21', '20', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('22', '21', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('23', '22', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('24', '23', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('25', '24', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('26', '25', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('27', '26', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('29', '28', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('30', '29', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('31', '30', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('32', '31', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('33', '32', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('34', '33', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('35', '34', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('36', '35', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('37', '36', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('38', '37', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('39', '38', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('40', '39', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('41', '40', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('42', '41', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('43', '42', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('44', '43', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('45', '44', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('46', '45', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('47', '46', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('48', '47', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('49', '48', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('50', '49', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('51', '50', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('52', '51', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('53', '52', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('54', '53', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('56', '55', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('57', '56', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('58', '57', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('59', '58', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('60', '59', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('61', '60', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('62', '61', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('63', '62', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('64', '63', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('65', '64', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('67', '66', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('68', '67', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('69', '68', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('70', '69', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('71', '70', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('72', '71', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('73', '72', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('74', '73', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('75', '74', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('76', '75', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('77', '76', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('78', '77', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('79', '78', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('80', '79', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('81', '80', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('82', '81', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('83', '82', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('84', '83', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('85', '84', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('86', '85', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('87', '86', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('88', '87', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('89', '88', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('90', '89', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('91', '90', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('92', '91', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('93', '92', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('94', '93', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('95', '94', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('96', '95', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('97', '96', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('98', '97', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('99', '98', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('100', '99', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('101', '100', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('102', '101', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('103', '102', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('104', '103', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('105', '104', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('107', '106', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('108', '107', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('109', '108', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('110', '109', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('111', '110', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('112', '111', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('113', '112', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('114', '113', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('115', '114', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('116', '115', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('117', '116', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('118', '117', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('119', '118', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('120', '119', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('121', '120', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('122', '121', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('123', '122', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('124', '123', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('125', '124', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('126', '125', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('127', '126', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('128', '127', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('129', '128', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('130', '129', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('131', '130', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('132', '131', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('133', '132', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('134', '133', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('135', '134', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('136', '135', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('137', '136', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('138', '137', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('139', '138', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('140', '139', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('141', '140', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('142', '141', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('143', '142', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('144', '143', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('145', '144', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('146', '145', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('147', '146', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('148', '147', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('149', '148', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('150', '149', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('151', '150', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('152', '151', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('153', '152', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('154', '153', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('155', '154', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('156', '155', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('157', '156', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('158', '157', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('159', '158', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('160', '159', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('161', '160', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('162', '161', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('163', '162', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('164', '163', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('165', '164', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('166', '165', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('167', '166', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('168', '167', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('169', '168', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('170', '169', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('171', '170', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('172', '171', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('173', '172', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('174', '173', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('175', '174', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('176', '175', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('177', '176', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('178', '177', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('179', '178', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('180', '179', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('181', '180', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('182', '181', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('183', '182', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('184', '183', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('185', '184', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('186', '185', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('187', '186', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('188', '187', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('189', '188', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('190', '189', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('191', '190', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('192', '191', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('193', '192', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('194', '193', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('195', '194', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('196', '195', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('197', '196', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('198', '197', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('199', '198', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('200', '199', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('201', '200', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('202', '201', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('203', '202', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('204', '203', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('205', '204', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('206', '205', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('207', '206', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('208', '207', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('209', '208', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('210', '209', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('211', '210', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('212', '211', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('215', '214', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('216', '215', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('217', '216', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('218', '217', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('219', '218', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('220', '219', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('221', '220', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('222', '221', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('223', '222', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('224', '223', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('225', '224', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('226', '225', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('227', '226', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('228', '227', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('229', '228', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('230', '229', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('231', '230', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('232', '231', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('233', '232', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('235', '234', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('236', '235', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('237', '236', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('238', '237', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('239', '238', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('240', '239', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('242', '241', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('243', '242', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('244', '243', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('245', '244', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('246', '245', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('247', '246', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('248', '247', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('249', '248', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('250', '249', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('251', '250', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('252', '251', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('253', '252', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('254', '253', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('255', '254', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('256', '255', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('257', '256', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('258', '257', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('259', '258', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('260', '259', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('261', '260', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('262', '261', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('263', '262', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('264', '263', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('265', '264', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('266', '265', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('267', '266', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('268', '267', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('269', '268', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('270', '269', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('271', '270', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('272', '271', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('273', '272', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('274', '273', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('275', '274', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('276', '275', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('277', '276', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('278', '277', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('279', '278', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('280', '279', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('281', '280', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('282', '281', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('283', '282', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('284', '283', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('285', '284', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('286', '285', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('287', '286', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('288', '287', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('289', '288', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('290', '289', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('291', '290', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('292', '291', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('293', '292', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('294', '293', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('295', '294', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('296', '295', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('297', '296', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('298', '297', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('299', '298', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('300', '299', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('301', '300', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('302', '301', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('303', '302', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('304', '303', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('305', '304', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('367', '366', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('372', '371', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('373', '372', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('374', '373', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('375', '374', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('376', '375', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('377', '376', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('378', '377', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('379', '378', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('380', '379', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('381', '380', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('382', '381', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('383', '382', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('384', '383', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('385', '384', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('386', '385', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('387', '386', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('388', '387', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('389', '388', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('390', '389', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('391', '390', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('392', '391', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('393', '392', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('394', '393', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('395', '394', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('396', '395', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('397', '396', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('398', '397', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('399', '398', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('400', '399', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('401', '400', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('402', '401', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('403', '402', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('404', '403', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('409', '408', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('410', '409', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('411', '410', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('412', '411', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('413', '412', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('414', '413', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('415', '414', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('416', '415', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('417', '416', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('418', '417', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('419', '418', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('420', '419', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('421', '420', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('422', '421', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('423', '422', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('424', '423', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('425', '424', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('426', '425', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('427', '426', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('428', '427', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('429', '428', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('430', '429', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('431', '430', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('432', '431', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('433', '432', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('434', '433', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('435', '434', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('436', '435', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('437', '436', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('438', '437', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('439', '438', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('440', '439', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('441', '440', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('442', '441', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('443', '442', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('444', '443', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('445', '444', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('446', '445', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('447', '446', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('448', '447', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('449', '448', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('450', '449', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('451', '450', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('452', '451', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('453', '452', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('454', '453', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('455', '454', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('456', '455', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('457', '456', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('458', '457', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('459', '458', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('460', '459', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('461', '460', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('462', '461', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('463', '462', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('464', '463', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('465', '464', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('466', '465', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('467', '466', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('468', '467', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('469', '468', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('470', '469', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('471', '470', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('472', '471', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('473', '472', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('474', '473', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('475', '474', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('476', '475', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('477', '476', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('478', '477', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('479', '478', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('480', '479', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('481', '480', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('482', '481', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('483', '482', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('484', '483', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('485', '484', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('486', '485', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('487', '486', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('488', '487', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('489', '488', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('490', '489', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('491', '490', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('492', '491', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('493', '492', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('494', '493', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('495', '494', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('496', '495', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('497', '496', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('498', '497', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('499', '498', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('500', '499', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('501', '500', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('502', '501', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('503', '502', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('504', '503', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('505', '504', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('506', '505', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('509', '508', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('510', '509', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('511', '510', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('512', '511', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('513', '512', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('514', '513', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('515', '514', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('516', '515', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('517', '516', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('518', '517', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('519', '518', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('520', '519', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('521', '520', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('522', '521', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('523', '522', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('524', '523', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('525', '524', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('526', '525', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('527', '526', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('528', '527', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('529', '528', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('530', '529', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('531', '530', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('533', '532', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('534', '533', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('535', '534', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('536', '535', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('537', '536', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('538', '537', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('539', '538', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('540', '539', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('541', '540', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('542', '541', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('543', '542', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('544', '543', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('545', '544', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('546', '545', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('547', '546', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('548', '547', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('549', '548', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('550', '549', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('551', '550', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('552', '551', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('553', '552', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('554', '553', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('555', '554', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('556', '555', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('557', '556', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('558', '557', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('559', '558', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('560', '559', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('561', '560', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('562', '561', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('563', '562', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('564', '563', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('565', '564', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('566', '565', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('567', '566', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('568', '567', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('569', '568', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('570', '569', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('571', '570', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('572', '571', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('573', '572', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('574', '573', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('575', '574', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('576', '575', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('577', '576', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('578', '577', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('579', '578', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('580', '579', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('581', '580', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('582', '581', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('583', '582', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('584', '583', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('585', '584', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('586', '585', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('587', '586', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('588', '587', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('589', '588', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('590', '589', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('591', '590', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('592', '591', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('593', '592', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('594', '593', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('595', '594', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('596', '595', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('597', '596', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('598', '597', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('599', '598', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('600', '599', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('601', '600', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('602', '601', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('603', '602', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('604', '603', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('605', '604', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('606', '605', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('607', '606', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('608', '607', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('609', '608', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('610', '609', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('611', '610', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('612', '611', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('613', '612', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('614', '613', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('615', '614', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('616', '615', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('617', '616', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('618', '617', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('619', '618', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('620', '619', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('621', '620', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('622', '621', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('623', '622', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('624', '623', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('625', '624', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('626', '625', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('627', '626', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('628', '627', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('629', '628', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('630', '629', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('631', '630', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('632', '631', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('633', '632', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('634', '633', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('635', '634', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('636', '635', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('637', '636', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('638', '637', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('639', '638', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('640', '639', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('641', '640', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('642', '641', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('643', '642', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('644', '643', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('645', '644', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('646', '645', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('647', '646', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('648', '647', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('649', '648', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('650', '649', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('651', '650', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('652', '651', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('653', '652', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('654', '653', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('655', '654', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('656', '655', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('657', '656', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('658', '657', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('659', '658', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('660', '659', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('661', '660', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('662', '661', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('663', '662', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('664', '663', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('665', '664', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('666', '665', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('667', '666', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('668', '667', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('669', '668', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('670', '669', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('671', '670', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('672', '671', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('673', '672', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('674', '673', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('675', '674', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('676', '675', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('677', '676', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('678', '677', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('679', '678', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('680', '679', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('681', '680', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('682', '681', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('683', '682', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('684', '683', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('685', '684', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('686', '685', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('687', '686', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('688', '687', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('689', '688', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('690', '689', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('691', '690', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('692', '691', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('693', '692', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('694', '693', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('695', '694', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('696', '695', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('697', '696', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('698', '697', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('699', '698', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('700', '699', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('701', '700', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('702', '701', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('703', '702', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('704', '703', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('705', '704', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('706', '705', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('707', '706', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('708', '707', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('709', '708', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('710', '709', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('711', '710', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('712', '711', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('713', '712', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('714', '713', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('715', '714', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('716', '715', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('717', '716', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('718', '717', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('719', '718', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('720', '719', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('721', '720', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('722', '721', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('723', '722', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('724', '723', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('725', '724', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('726', '725', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('727', '726', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('728', '727', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('729', '728', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('730', '729', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('731', '730', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('732', '731', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('733', '732', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `aka_siswa_keluarga` VALUES ('734', '733', '', '0000-00-00', '', '0000-00-00', '0000-00-00');

-- ----------------------------
-- Table structure for aka_siswa_kontakdarurat
-- ----------------------------
DROP TABLE IF EXISTS `aka_siswa_kontakdarurat`;
CREATE TABLE `aka_siswa_kontakdarurat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `hubungan` varchar(30) NOT NULL,
  `telpon` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=735 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_siswa_kontakdarurat
-- ----------------------------
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('1', '1', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('2', '2', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('4', '4', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('5', '5', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('7', '7', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('11', '10', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('14', '13', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('15', '14', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('16', '15', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('17', '16', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('18', '17', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('19', '18', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('20', '19', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('21', '20', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('22', '21', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('23', '22', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('24', '23', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('25', '24', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('26', '25', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('27', '26', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('29', '28', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('30', '29', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('31', '30', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('32', '31', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('33', '32', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('34', '33', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('35', '34', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('36', '35', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('37', '36', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('38', '37', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('39', '38', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('40', '39', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('41', '40', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('42', '41', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('43', '42', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('44', '43', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('45', '44', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('46', '45', 'Yuniati', 'Nenek', '0811331409');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('47', '46', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('48', '47', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('49', '48', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('50', '49', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('51', '50', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('52', '51', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('53', '52', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('54', '53', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('56', '55', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('57', '56', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('58', '57', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('59', '58', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('60', '59', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('61', '60', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('62', '61', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('63', '62', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('64', '63', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('65', '64', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('67', '66', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('68', '67', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('69', '68', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('70', '69', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('71', '70', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('72', '71', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('73', '72', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('74', '73', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('75', '74', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('76', '75', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('77', '76', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('78', '77', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('79', '78', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('80', '79', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('81', '80', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('82', '81', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('83', '82', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('84', '83', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('85', '84', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('86', '85', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('87', '86', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('88', '87', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('89', '88', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('90', '89', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('91', '90', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('92', '91', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('93', '92', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('94', '93', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('95', '94', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('96', '95', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('97', '96', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('98', '97', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('99', '98', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('100', '99', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('101', '100', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('102', '101', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('103', '102', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('104', '103', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('105', '104', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('107', '106', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('108', '107', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('109', '108', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('110', '109', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('111', '110', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('112', '111', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('113', '112', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('114', '113', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('115', '114', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('116', '115', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('117', '116', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('118', '117', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('119', '118', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('120', '119', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('121', '120', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('122', '121', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('123', '122', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('124', '123', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('125', '124', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('126', '125', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('127', '126', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('128', '127', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('129', '128', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('130', '129', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('131', '130', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('132', '131', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('133', '132', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('134', '133', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('135', '134', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('136', '135', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('137', '136', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('138', '137', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('139', '138', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('140', '139', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('141', '140', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('142', '141', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('143', '142', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('144', '143', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('145', '144', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('146', '145', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('147', '146', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('148', '147', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('149', '148', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('150', '149', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('151', '150', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('152', '151', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('153', '152', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('154', '153', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('155', '154', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('156', '155', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('157', '156', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('158', '157', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('159', '158', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('160', '159', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('161', '160', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('162', '161', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('163', '162', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('164', '163', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('165', '164', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('166', '165', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('167', '166', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('168', '167', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('169', '168', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('170', '169', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('171', '170', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('172', '171', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('173', '172', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('174', '173', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('175', '174', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('176', '175', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('177', '176', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('178', '177', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('179', '178', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('180', '179', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('181', '180', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('182', '181', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('183', '182', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('184', '183', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('185', '184', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('186', '185', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('187', '186', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('188', '187', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('189', '188', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('190', '189', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('191', '190', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('192', '191', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('193', '192', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('194', '193', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('195', '194', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('196', '195', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('197', '196', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('198', '197', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('199', '198', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('200', '199', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('201', '200', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('202', '201', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('203', '202', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('204', '203', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('205', '204', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('206', '205', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('207', '206', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('208', '207', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('209', '208', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('210', '209', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('211', '210', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('212', '211', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('215', '214', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('216', '215', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('217', '216', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('218', '217', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('219', '218', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('220', '219', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('221', '220', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('222', '221', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('223', '222', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('224', '223', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('225', '224', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('226', '225', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('227', '226', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('228', '227', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('229', '228', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('230', '229', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('231', '230', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('232', '231', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('233', '232', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('235', '234', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('236', '235', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('237', '236', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('238', '237', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('239', '238', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('240', '239', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('242', '241', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('243', '242', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('244', '243', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('245', '244', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('246', '245', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('247', '246', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('248', '247', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('249', '248', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('250', '249', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('251', '250', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('252', '251', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('253', '252', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('254', '253', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('255', '254', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('256', '255', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('257', '256', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('258', '257', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('259', '258', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('260', '259', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('261', '260', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('262', '261', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('263', '262', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('264', '263', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('265', '264', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('266', '265', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('267', '266', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('268', '267', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('269', '268', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('270', '269', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('271', '270', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('272', '271', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('273', '272', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('274', '273', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('275', '274', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('276', '275', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('277', '276', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('278', '277', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('279', '278', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('280', '279', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('281', '280', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('282', '281', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('283', '282', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('284', '283', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('285', '284', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('286', '285', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('287', '286', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('288', '287', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('289', '288', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('290', '289', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('291', '290', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('292', '291', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('293', '292', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('294', '293', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('295', '294', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('296', '295', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('297', '296', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('298', '297', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('299', '298', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('300', '299', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('301', '300', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('302', '301', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('303', '302', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('304', '303', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('305', '304', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('367', '366', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('372', '371', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('373', '372', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('374', '373', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('375', '374', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('376', '375', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('377', '376', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('378', '377', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('379', '378', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('380', '379', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('381', '380', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('382', '381', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('383', '382', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('384', '383', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('385', '384', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('386', '385', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('387', '386', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('388', '387', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('389', '388', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('390', '389', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('391', '390', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('392', '391', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('393', '392', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('394', '393', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('395', '394', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('396', '395', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('397', '396', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('398', '397', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('399', '398', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('400', '399', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('401', '400', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('402', '401', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('403', '402', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('404', '403', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('409', '408', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('410', '409', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('411', '410', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('412', '411', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('413', '412', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('414', '413', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('415', '414', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('416', '415', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('417', '416', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('418', '417', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('419', '418', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('420', '419', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('421', '420', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('422', '421', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('423', '422', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('424', '423', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('425', '424', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('426', '425', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('427', '426', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('428', '427', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('429', '428', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('430', '429', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('431', '430', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('432', '431', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('433', '432', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('434', '433', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('435', '434', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('436', '435', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('437', '436', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('438', '437', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('439', '438', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('440', '439', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('441', '440', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('442', '441', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('443', '442', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('444', '443', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('445', '444', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('446', '445', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('447', '446', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('448', '447', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('449', '448', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('450', '449', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('451', '450', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('452', '451', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('453', '452', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('454', '453', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('455', '454', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('456', '455', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('457', '456', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('458', '457', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('459', '458', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('460', '459', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('461', '460', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('462', '461', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('463', '462', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('464', '463', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('465', '464', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('466', '465', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('467', '466', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('468', '467', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('469', '468', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('470', '469', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('471', '470', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('472', '471', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('473', '472', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('474', '473', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('475', '474', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('476', '475', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('477', '476', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('478', '477', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('479', '478', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('480', '479', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('481', '480', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('482', '481', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('483', '482', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('484', '483', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('485', '484', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('486', '485', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('487', '486', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('488', '487', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('489', '488', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('490', '489', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('491', '490', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('492', '491', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('493', '492', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('494', '493', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('495', '494', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('496', '495', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('497', '496', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('498', '497', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('499', '498', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('500', '499', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('501', '500', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('502', '501', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('503', '502', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('504', '503', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('505', '504', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('506', '505', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('509', '508', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('510', '509', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('511', '510', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('512', '511', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('513', '512', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('514', '513', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('515', '514', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('516', '515', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('517', '516', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('518', '517', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('519', '518', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('520', '519', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('521', '520', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('522', '521', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('523', '522', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('524', '523', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('525', '524', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('526', '525', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('527', '526', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('528', '527', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('529', '528', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('530', '529', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('531', '530', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('533', '532', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('534', '533', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('535', '534', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('536', '535', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('537', '536', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('538', '537', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('539', '538', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('540', '539', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('541', '540', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('542', '541', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('543', '542', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('544', '543', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('545', '544', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('546', '545', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('547', '546', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('548', '547', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('549', '548', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('550', '549', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('551', '550', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('552', '551', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('553', '552', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('554', '553', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('555', '554', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('556', '555', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('557', '556', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('558', '557', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('559', '558', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('560', '559', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('561', '560', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('562', '561', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('563', '562', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('564', '563', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('565', '564', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('566', '565', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('567', '566', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('568', '567', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('569', '568', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('570', '569', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('571', '570', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('572', '571', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('573', '572', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('574', '573', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('575', '574', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('576', '575', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('577', '576', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('578', '577', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('579', '578', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('580', '579', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('581', '580', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('582', '581', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('583', '582', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('584', '583', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('585', '584', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('586', '585', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('587', '586', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('588', '587', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('589', '588', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('590', '589', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('591', '590', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('592', '591', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('593', '592', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('594', '593', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('595', '594', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('596', '595', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('597', '596', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('598', '597', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('599', '598', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('600', '599', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('601', '600', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('602', '601', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('603', '602', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('604', '603', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('605', '604', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('606', '605', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('607', '606', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('608', '607', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('609', '608', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('610', '609', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('611', '610', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('612', '611', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('613', '612', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('614', '613', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('615', '614', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('616', '615', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('617', '616', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('618', '617', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('619', '618', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('620', '619', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('621', '620', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('622', '621', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('623', '622', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('624', '623', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('625', '624', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('626', '625', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('627', '626', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('628', '627', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('629', '628', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('630', '629', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('631', '630', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('632', '631', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('633', '632', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('634', '633', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('635', '634', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('636', '635', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('637', '636', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('638', '637', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('639', '638', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('640', '639', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('641', '640', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('642', '641', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('643', '642', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('644', '643', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('645', '644', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('646', '645', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('647', '646', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('648', '647', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('649', '648', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('650', '649', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('651', '650', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('652', '651', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('653', '652', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('654', '653', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('655', '654', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('656', '655', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('657', '656', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('658', '657', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('659', '658', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('660', '659', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('661', '660', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('662', '661', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('663', '662', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('664', '663', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('665', '664', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('666', '665', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('667', '666', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('668', '667', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('669', '668', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('670', '669', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('671', '670', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('672', '671', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('673', '672', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('674', '673', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('675', '674', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('676', '675', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('677', '676', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('678', '677', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('679', '678', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('680', '679', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('681', '680', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('682', '681', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('683', '682', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('684', '683', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('685', '684', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('686', '685', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('687', '686', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('688', '687', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('689', '688', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('690', '689', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('691', '690', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('692', '691', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('693', '692', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('694', '693', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('695', '694', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('696', '695', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('697', '696', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('698', '697', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('699', '698', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('700', '699', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('701', '700', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('702', '701', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('703', '702', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('704', '703', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('705', '704', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('706', '705', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('707', '706', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('708', '707', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('709', '708', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('710', '709', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('711', '710', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('712', '711', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('713', '712', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('714', '713', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('715', '714', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('716', '715', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('717', '716', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('718', '717', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('719', '718', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('720', '719', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('721', '720', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('722', '721', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('723', '722', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('724', '723', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('725', '724', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('726', '725', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('727', '726', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('728', '727', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('729', '728', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('730', '729', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('731', '730', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('732', '731', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('733', '732', '', '', '');
INSERT INTO `aka_siswa_kontakdarurat` VALUES ('734', '733', '', '', '');

-- ----------------------------
-- Table structure for aka_siswa_saudara
-- ----------------------------
DROP TABLE IF EXISTS `aka_siswa_saudara`;
CREATE TABLE `aka_siswa_saudara` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tgllahir` date NOT NULL,
  `sekolah` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=735 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_siswa_saudara
-- ----------------------------
INSERT INTO `aka_siswa_saudara` VALUES ('1', '1', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('2', '2', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('4', '4', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('5', '5', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('7', '7', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('11', '10', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('14', '13', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('15', '14', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('16', '15', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('17', '16', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('18', '17', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('19', '18', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('20', '19', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('21', '20', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('22', '21', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('23', '22', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('24', '23', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('25', '24', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('26', '25', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('27', '26', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('29', '28', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('30', '29', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('31', '30', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('32', '31', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('33', '32', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('34', '33', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('35', '34', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('36', '35', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('37', '36', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('38', '37', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('39', '38', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('40', '39', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('41', '40', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('42', '41', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('43', '42', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('44', '43', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('45', '44', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('46', '45', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('47', '46', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('48', '47', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('49', '48', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('50', '49', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('51', '50', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('52', '51', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('53', '52', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('54', '53', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('56', '55', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('57', '56', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('58', '57', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('59', '58', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('60', '59', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('61', '60', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('62', '61', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('63', '62', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('64', '63', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('65', '64', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('67', '66', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('68', '67', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('69', '68', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('70', '69', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('71', '70', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('72', '71', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('73', '72', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('74', '73', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('75', '74', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('76', '75', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('77', '76', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('78', '77', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('79', '78', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('80', '79', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('81', '80', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('82', '81', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('83', '82', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('84', '83', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('85', '84', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('86', '85', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('87', '86', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('88', '87', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('89', '88', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('90', '89', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('91', '90', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('92', '91', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('93', '92', 'Regina Soempiet', '2006-06-12', 'Elyon International Christian School');
INSERT INTO `aka_siswa_saudara` VALUES ('94', '93', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('95', '94', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('96', '95', 'Davide William Susanto', '2006-12-01', 'Elyon International Christian School');
INSERT INTO `aka_siswa_saudara` VALUES ('97', '96', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('98', '97', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('99', '98', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('100', '99', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('101', '100', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('102', '101', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('103', '102', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('104', '103', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('105', '104', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('107', '106', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('108', '107', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('109', '108', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('110', '109', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('111', '110', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('112', '111', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('113', '112', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('114', '113', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('115', '114', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('116', '115', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('117', '116', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('118', '117', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('119', '118', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('120', '119', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('121', '120', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('122', '121', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('123', '122', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('124', '123', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('125', '124', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('126', '125', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('127', '126', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('128', '127', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('129', '128', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('130', '129', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('131', '130', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('132', '131', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('133', '132', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('134', '133', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('135', '134', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('136', '135', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('137', '136', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('138', '137', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('139', '138', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('140', '139', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('141', '140', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('142', '141', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('143', '142', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('144', '143', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('145', '144', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('146', '145', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('147', '146', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('148', '147', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('149', '148', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('150', '149', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('151', '150', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('152', '151', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('153', '152', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('154', '153', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('155', '154', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('156', '155', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('157', '156', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('158', '157', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('159', '158', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('160', '159', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('161', '160', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('162', '161', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('163', '162', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('164', '163', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('165', '164', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('166', '165', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('167', '166', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('168', '167', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('169', '168', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('170', '169', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('171', '170', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('172', '171', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('173', '172', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('174', '173', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('175', '174', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('176', '175', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('177', '176', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('178', '177', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('179', '178', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('180', '179', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('181', '180', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('182', '181', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('183', '182', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('184', '183', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('185', '184', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('186', '185', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('187', '186', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('188', '187', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('189', '188', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('190', '189', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('191', '190', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('192', '191', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('193', '192', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('194', '193', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('195', '194', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('196', '195', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('197', '196', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('198', '197', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('199', '198', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('200', '199', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('201', '200', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('202', '201', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('203', '202', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('204', '203', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('205', '204', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('206', '205', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('207', '206', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('208', '207', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('209', '208', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('210', '209', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('211', '210', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('212', '211', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('215', '214', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('216', '215', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('217', '216', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('218', '217', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('219', '218', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('220', '219', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('221', '220', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('222', '221', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('223', '222', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('224', '223', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('225', '224', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('226', '225', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('227', '226', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('228', '227', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('229', '228', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('230', '229', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('231', '230', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('232', '231', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('233', '232', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('235', '234', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('236', '235', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('237', '236', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('238', '237', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('239', '238', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('240', '239', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('242', '241', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('243', '242', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('244', '243', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('245', '244', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('246', '245', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('247', '246', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('248', '247', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('249', '248', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('250', '249', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('251', '250', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('252', '251', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('253', '252', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('254', '253', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('255', '254', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('256', '255', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('257', '256', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('258', '257', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('259', '258', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('260', '259', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('261', '260', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('262', '261', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('263', '262', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('264', '263', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('265', '264', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('266', '265', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('267', '266', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('268', '267', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('269', '268', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('270', '269', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('271', '270', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('272', '271', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('273', '272', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('274', '273', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('275', '274', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('276', '275', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('277', '276', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('278', '277', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('279', '278', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('280', '279', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('281', '280', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('282', '281', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('283', '282', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('284', '283', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('285', '284', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('286', '285', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('287', '286', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('288', '287', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('289', '288', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('290', '289', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('291', '290', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('292', '291', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('293', '292', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('294', '293', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('295', '294', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('296', '295', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('297', '296', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('298', '297', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('299', '298', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('300', '299', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('301', '300', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('302', '301', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('303', '302', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('304', '303', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('305', '304', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('367', '366', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('372', '371', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('373', '372', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('374', '373', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('375', '374', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('376', '375', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('377', '376', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('378', '377', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('379', '378', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('380', '379', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('381', '380', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('382', '381', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('383', '382', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('384', '383', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('385', '384', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('386', '385', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('387', '386', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('388', '387', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('389', '388', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('390', '389', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('391', '390', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('392', '391', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('393', '392', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('394', '393', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('395', '394', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('396', '395', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('397', '396', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('398', '397', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('399', '398', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('400', '399', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('401', '400', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('402', '401', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('403', '402', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('404', '403', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('409', '408', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('410', '409', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('411', '410', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('412', '411', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('413', '412', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('414', '413', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('415', '414', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('416', '415', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('417', '416', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('418', '417', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('419', '418', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('420', '419', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('421', '420', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('422', '421', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('423', '422', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('424', '423', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('425', '424', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('426', '425', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('427', '426', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('428', '427', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('429', '428', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('430', '429', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('431', '430', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('432', '431', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('433', '432', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('434', '433', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('435', '434', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('436', '435', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('437', '436', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('438', '437', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('439', '438', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('440', '439', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('441', '440', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('442', '441', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('443', '442', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('444', '443', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('445', '444', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('446', '445', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('447', '446', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('448', '447', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('449', '448', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('450', '449', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('451', '450', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('452', '451', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('453', '452', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('454', '453', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('455', '454', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('456', '455', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('457', '456', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('458', '457', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('459', '458', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('460', '459', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('461', '460', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('462', '461', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('463', '462', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('464', '463', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('465', '464', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('466', '465', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('467', '466', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('468', '467', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('469', '468', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('470', '469', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('471', '470', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('472', '471', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('473', '472', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('474', '473', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('475', '474', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('476', '475', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('477', '476', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('478', '477', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('479', '478', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('480', '479', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('481', '480', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('482', '481', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('483', '482', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('484', '483', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('485', '484', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('486', '485', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('487', '486', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('488', '487', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('489', '488', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('490', '489', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('491', '490', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('492', '491', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('493', '492', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('494', '493', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('495', '494', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('496', '495', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('497', '496', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('498', '497', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('499', '498', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('500', '499', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('501', '500', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('502', '501', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('503', '502', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('504', '503', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('505', '504', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('506', '505', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('509', '508', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('510', '509', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('511', '510', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('512', '511', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('513', '512', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('514', '513', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('515', '514', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('516', '515', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('517', '516', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('518', '517', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('519', '518', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('520', '519', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('521', '520', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('522', '521', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('523', '522', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('524', '523', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('525', '524', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('526', '525', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('527', '526', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('528', '527', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('529', '528', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('530', '529', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('531', '530', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('533', '532', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('534', '533', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('535', '534', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('536', '535', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('537', '536', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('538', '537', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('539', '538', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('540', '539', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('541', '540', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('542', '541', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('543', '542', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('544', '543', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('545', '544', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('546', '545', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('547', '546', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('548', '547', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('549', '548', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('550', '549', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('551', '550', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('552', '551', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('553', '552', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('554', '553', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('555', '554', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('556', '555', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('557', '556', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('558', '557', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('559', '558', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('560', '559', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('561', '560', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('562', '561', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('563', '562', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('564', '563', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('565', '564', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('566', '565', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('567', '566', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('568', '567', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('569', '568', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('570', '569', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('571', '570', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('572', '571', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('573', '572', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('574', '573', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('575', '574', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('576', '575', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('577', '576', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('578', '577', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('579', '578', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('580', '579', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('581', '580', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('582', '581', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('583', '582', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('584', '583', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('585', '584', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('586', '585', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('587', '586', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('588', '587', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('589', '588', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('590', '589', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('591', '590', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('592', '591', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('593', '592', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('594', '593', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('595', '594', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('596', '595', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('597', '596', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('598', '597', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('599', '598', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('600', '599', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('601', '600', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('602', '601', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('603', '602', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('604', '603', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('605', '604', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('606', '605', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('607', '606', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('608', '607', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('609', '608', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('610', '609', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('611', '610', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('612', '611', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('613', '612', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('614', '613', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('615', '614', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('616', '615', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('617', '616', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('618', '617', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('619', '618', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('620', '619', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('621', '620', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('622', '621', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('623', '622', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('624', '623', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('625', '624', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('626', '625', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('627', '626', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('628', '627', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('629', '628', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('630', '629', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('631', '630', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('632', '631', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('633', '632', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('634', '633', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('635', '634', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('636', '635', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('637', '636', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('638', '637', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('639', '638', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('640', '639', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('641', '640', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('642', '641', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('643', '642', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('644', '643', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('645', '644', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('646', '645', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('647', '646', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('648', '647', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('649', '648', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('650', '649', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('651', '650', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('652', '651', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('653', '652', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('654', '653', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('655', '654', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('656', '655', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('657', '656', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('658', '657', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('659', '658', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('660', '659', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('661', '660', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('662', '661', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('663', '662', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('664', '663', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('665', '664', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('666', '665', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('667', '666', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('668', '667', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('669', '668', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('670', '669', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('671', '670', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('672', '671', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('673', '672', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('674', '673', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('675', '674', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('676', '675', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('677', '676', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('678', '677', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('679', '678', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('680', '679', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('681', '680', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('682', '681', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('683', '682', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('684', '683', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('685', '684', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('686', '685', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('687', '686', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('688', '687', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('689', '688', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('690', '689', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('691', '690', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('692', '691', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('693', '692', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('694', '693', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('695', '694', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('696', '695', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('697', '696', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('698', '697', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('699', '698', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('700', '699', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('701', '700', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('702', '701', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('703', '702', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('704', '703', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('705', '704', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('706', '705', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('707', '706', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('708', '707', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('709', '708', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('710', '709', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('711', '710', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('712', '711', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('713', '712', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('714', '713', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('715', '714', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('716', '715', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('717', '716', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('718', '717', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('719', '718', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('720', '719', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('721', '720', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('722', '721', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('723', '722', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('724', '723', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('725', '724', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('726', '725', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('727', '726', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('728', '727', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('729', '728', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('730', '729', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('731', '730', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('732', '731', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('733', '732', '', '0000-00-00', '');
INSERT INTO `aka_siswa_saudara` VALUES ('734', '733', '', '0000-00-00', '');

-- ----------------------------
-- Table structure for aka_siswa_tes
-- ----------------------------
DROP TABLE IF EXISTS `aka_siswa_tes`;
CREATE TABLE `aka_siswa_tes` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `tes` int(10) unsigned NOT NULL,
  `nilai` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_siswa_tes
-- ----------------------------

-- ----------------------------
-- Table structure for aka_sks
-- ----------------------------
DROP TABLE IF EXISTS `aka_sks`;
CREATE TABLE `aka_sks` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `kelas` int(10) unsigned NOT NULL,
  `pelajaran` int(10) unsigned NOT NULL,
  `guru` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=182 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_sks
-- ----------------------------
INSERT INTO `aka_sks` VALUES ('1', '1', '1', '3', '1');
INSERT INTO `aka_sks` VALUES ('2', '1', '1', '3', '1');
INSERT INTO `aka_sks` VALUES ('3', '1', '1', '3', '1');
INSERT INTO `aka_sks` VALUES ('4', '1', '2', '3', '1');
INSERT INTO `aka_sks` VALUES ('5', '1', '2', '3', '1');
INSERT INTO `aka_sks` VALUES ('6', '1', '2', '3', '1');
INSERT INTO `aka_sks` VALUES ('7', '1', '3', '3', '1');
INSERT INTO `aka_sks` VALUES ('8', '1', '3', '3', '1');
INSERT INTO `aka_sks` VALUES ('9', '1', '3', '3', '1');
INSERT INTO `aka_sks` VALUES ('10', '1', '4', '3', '1');
INSERT INTO `aka_sks` VALUES ('11', '1', '4', '3', '1');
INSERT INTO `aka_sks` VALUES ('12', '1', '4', '3', '1');
INSERT INTO `aka_sks` VALUES ('13', '1', '1', '4', '2');
INSERT INTO `aka_sks` VALUES ('14', '1', '1', '4', '2');
INSERT INTO `aka_sks` VALUES ('15', '1', '2', '4', '2');
INSERT INTO `aka_sks` VALUES ('16', '1', '2', '4', '2');
INSERT INTO `aka_sks` VALUES ('17', '1', '3', '4', '2');
INSERT INTO `aka_sks` VALUES ('18', '1', '3', '4', '2');
INSERT INTO `aka_sks` VALUES ('19', '1', '4', '4', '2');
INSERT INTO `aka_sks` VALUES ('20', '1', '4', '4', '2');
INSERT INTO `aka_sks` VALUES ('24', '1', '1', '1', '3');
INSERT INTO `aka_sks` VALUES ('25', '1', '1', '1', '3');
INSERT INTO `aka_sks` VALUES ('26', '1', '1', '1', '3');
INSERT INTO `aka_sks` VALUES ('27', '1', '2', '1', '3');
INSERT INTO `aka_sks` VALUES ('28', '1', '2', '1', '3');
INSERT INTO `aka_sks` VALUES ('29', '1', '2', '1', '3');
INSERT INTO `aka_sks` VALUES ('30', '1', '3', '1', '3');
INSERT INTO `aka_sks` VALUES ('31', '1', '3', '1', '3');
INSERT INTO `aka_sks` VALUES ('32', '1', '3', '1', '3');
INSERT INTO `aka_sks` VALUES ('33', '1', '4', '1', '3');
INSERT INTO `aka_sks` VALUES ('34', '1', '4', '1', '3');
INSERT INTO `aka_sks` VALUES ('35', '1', '4', '1', '3');
INSERT INTO `aka_sks` VALUES ('36', '1', '1', '2', '4');
INSERT INTO `aka_sks` VALUES ('37', '1', '1', '2', '4');
INSERT INTO `aka_sks` VALUES ('38', '1', '1', '2', '4');
INSERT INTO `aka_sks` VALUES ('39', '1', '2', '2', '4');
INSERT INTO `aka_sks` VALUES ('40', '1', '2', '2', '4');
INSERT INTO `aka_sks` VALUES ('41', '1', '2', '2', '4');
INSERT INTO `aka_sks` VALUES ('42', '1', '3', '2', '4');
INSERT INTO `aka_sks` VALUES ('43', '1', '3', '2', '4');
INSERT INTO `aka_sks` VALUES ('44', '1', '3', '2', '4');
INSERT INTO `aka_sks` VALUES ('45', '1', '4', '2', '4');
INSERT INTO `aka_sks` VALUES ('46', '1', '4', '2', '4');
INSERT INTO `aka_sks` VALUES ('47', '1', '4', '2', '4');
INSERT INTO `aka_sks` VALUES ('48', '1', '5', '3', '1');
INSERT INTO `aka_sks` VALUES ('49', '1', '5', '3', '1');
INSERT INTO `aka_sks` VALUES ('50', '1', '6', '3', '1');
INSERT INTO `aka_sks` VALUES ('51', '1', '6', '3', '1');
INSERT INTO `aka_sks` VALUES ('52', '1', '7', '3', '1');
INSERT INTO `aka_sks` VALUES ('53', '1', '7', '3', '1');
INSERT INTO `aka_sks` VALUES ('54', '1', '8', '3', '1');
INSERT INTO `aka_sks` VALUES ('55', '1', '8', '3', '1');
INSERT INTO `aka_sks` VALUES ('56', '1', '9', '3', '1');
INSERT INTO `aka_sks` VALUES ('57', '1', '9', '3', '1');
INSERT INTO `aka_sks` VALUES ('58', '1', '10', '3', '1');
INSERT INTO `aka_sks` VALUES ('59', '1', '10', '3', '1');
INSERT INTO `aka_sks` VALUES ('60', '1', '11', '3', '1');
INSERT INTO `aka_sks` VALUES ('61', '1', '11', '3', '1');
INSERT INTO `aka_sks` VALUES ('62', '1', '12', '3', '1');
INSERT INTO `aka_sks` VALUES ('63', '1', '12', '3', '1');
INSERT INTO `aka_sks` VALUES ('64', '1', '13', '3', '1');
INSERT INTO `aka_sks` VALUES ('65', '1', '13', '3', '1');
INSERT INTO `aka_sks` VALUES ('66', '1', '14', '3', '1');
INSERT INTO `aka_sks` VALUES ('67', '1', '14', '3', '1');
INSERT INTO `aka_sks` VALUES ('68', '1', '15', '3', '1');
INSERT INTO `aka_sks` VALUES ('69', '1', '15', '3', '1');
INSERT INTO `aka_sks` VALUES ('70', '1', '16', '3', '1');
INSERT INTO `aka_sks` VALUES ('71', '1', '16', '3', '1');
INSERT INTO `aka_sks` VALUES ('72', '1', '17', '3', '1');
INSERT INTO `aka_sks` VALUES ('73', '1', '17', '3', '1');
INSERT INTO `aka_sks` VALUES ('74', '1', '18', '3', '1');
INSERT INTO `aka_sks` VALUES ('75', '1', '18', '3', '1');
INSERT INTO `aka_sks` VALUES ('76', '1', '19', '3', '1');
INSERT INTO `aka_sks` VALUES ('77', '1', '19', '3', '1');
INSERT INTO `aka_sks` VALUES ('78', '1', '20', '3', '1');
INSERT INTO `aka_sks` VALUES ('79', '1', '20', '3', '1');
INSERT INTO `aka_sks` VALUES ('80', '1', '21', '3', '1');
INSERT INTO `aka_sks` VALUES ('81', '1', '21', '3', '1');
INSERT INTO `aka_sks` VALUES ('82', '1', '22', '3', '1');
INSERT INTO `aka_sks` VALUES ('83', '1', '22', '3', '1');
INSERT INTO `aka_sks` VALUES ('84', '1', '23', '3', '1');
INSERT INTO `aka_sks` VALUES ('85', '1', '23', '3', '1');
INSERT INTO `aka_sks` VALUES ('86', '1', '24', '3', '1');
INSERT INTO `aka_sks` VALUES ('87', '1', '24', '3', '1');
INSERT INTO `aka_sks` VALUES ('88', '1', '33', '3', '1');
INSERT INTO `aka_sks` VALUES ('89', '1', '33', '3', '1');
INSERT INTO `aka_sks` VALUES ('90', '1', '34', '3', '1');
INSERT INTO `aka_sks` VALUES ('91', '1', '34', '3', '1');
INSERT INTO `aka_sks` VALUES ('92', '1', '35', '3', '1');
INSERT INTO `aka_sks` VALUES ('93', '1', '35', '3', '1');
INSERT INTO `aka_sks` VALUES ('94', '1', '36', '3', '1');
INSERT INTO `aka_sks` VALUES ('95', '1', '36', '3', '1');
INSERT INTO `aka_sks` VALUES ('96', '1', '37', '3', '1');
INSERT INTO `aka_sks` VALUES ('97', '1', '37', '3', '1');
INSERT INTO `aka_sks` VALUES ('98', '1', '38', '3', '1');
INSERT INTO `aka_sks` VALUES ('99', '1', '38', '3', '1');
INSERT INTO `aka_sks` VALUES ('100', '1', '39', '3', '1');
INSERT INTO `aka_sks` VALUES ('101', '1', '39', '3', '1');
INSERT INTO `aka_sks` VALUES ('102', '1', '40', '3', '1');
INSERT INTO `aka_sks` VALUES ('103', '1', '40', '3', '1');
INSERT INTO `aka_sks` VALUES ('104', '1', '41', '3', '1');
INSERT INTO `aka_sks` VALUES ('105', '1', '41', '3', '1');
INSERT INTO `aka_sks` VALUES ('106', '1', '43', '3', '1');
INSERT INTO `aka_sks` VALUES ('107', '1', '43', '3', '1');
INSERT INTO `aka_sks` VALUES ('108', '1', '44', '3', '1');
INSERT INTO `aka_sks` VALUES ('109', '1', '44', '3', '1');
INSERT INTO `aka_sks` VALUES ('110', '1', '45', '3', '1');
INSERT INTO `aka_sks` VALUES ('111', '1', '45', '3', '1');
INSERT INTO `aka_sks` VALUES ('112', '1', '72', '3', '1');
INSERT INTO `aka_sks` VALUES ('113', '1', '72', '3', '1');
INSERT INTO `aka_sks` VALUES ('114', '1', '73', '3', '1');
INSERT INTO `aka_sks` VALUES ('115', '1', '73', '3', '1');
INSERT INTO `aka_sks` VALUES ('116', '1', '74', '3', '1');
INSERT INTO `aka_sks` VALUES ('117', '1', '74', '3', '1');
INSERT INTO `aka_sks` VALUES ('118', '1', '75', '3', '1');
INSERT INTO `aka_sks` VALUES ('119', '1', '75', '3', '1');
INSERT INTO `aka_sks` VALUES ('120', '1', '76', '3', '1');
INSERT INTO `aka_sks` VALUES ('121', '1', '76', '3', '1');
INSERT INTO `aka_sks` VALUES ('122', '1', '77', '3', '1');
INSERT INTO `aka_sks` VALUES ('123', '1', '77', '3', '1');
INSERT INTO `aka_sks` VALUES ('124', '1', '78', '3', '1');
INSERT INTO `aka_sks` VALUES ('125', '1', '78', '3', '1');
INSERT INTO `aka_sks` VALUES ('126', '1', '79', '3', '1');
INSERT INTO `aka_sks` VALUES ('127', '1', '79', '3', '1');
INSERT INTO `aka_sks` VALUES ('128', '1', '81', '3', '1');
INSERT INTO `aka_sks` VALUES ('129', '1', '81', '3', '1');
INSERT INTO `aka_sks` VALUES ('130', '1', '82', '3', '1');
INSERT INTO `aka_sks` VALUES ('131', '1', '82', '3', '1');
INSERT INTO `aka_sks` VALUES ('132', '1', '83', '3', '1');
INSERT INTO `aka_sks` VALUES ('133', '1', '83', '3', '1');
INSERT INTO `aka_sks` VALUES ('134', '1', '84', '3', '1');
INSERT INTO `aka_sks` VALUES ('135', '1', '84', '3', '1');
INSERT INTO `aka_sks` VALUES ('136', '1', '85', '3', '1');
INSERT INTO `aka_sks` VALUES ('137', '1', '85', '3', '1');
INSERT INTO `aka_sks` VALUES ('138', '1', '86', '3', '1');
INSERT INTO `aka_sks` VALUES ('139', '1', '86', '3', '1');
INSERT INTO `aka_sks` VALUES ('140', '1', '87', '3', '1');
INSERT INTO `aka_sks` VALUES ('141', '1', '87', '3', '1');
INSERT INTO `aka_sks` VALUES ('142', '1', '88', '3', '1');
INSERT INTO `aka_sks` VALUES ('143', '1', '88', '3', '1');
INSERT INTO `aka_sks` VALUES ('144', '1', '89', '3', '1');
INSERT INTO `aka_sks` VALUES ('145', '1', '89', '3', '1');
INSERT INTO `aka_sks` VALUES ('146', '1', '90', '3', '1');
INSERT INTO `aka_sks` VALUES ('147', '1', '90', '3', '1');
INSERT INTO `aka_sks` VALUES ('148', '1', '91', '3', '1');
INSERT INTO `aka_sks` VALUES ('149', '1', '91', '3', '1');
INSERT INTO `aka_sks` VALUES ('150', '1', '92', '3', '1');
INSERT INTO `aka_sks` VALUES ('151', '1', '92', '3', '1');
INSERT INTO `aka_sks` VALUES ('152', '1', '93', '3', '1');
INSERT INTO `aka_sks` VALUES ('153', '1', '93', '3', '1');
INSERT INTO `aka_sks` VALUES ('154', '1', '94', '3', '1');
INSERT INTO `aka_sks` VALUES ('155', '1', '94', '3', '1');
INSERT INTO `aka_sks` VALUES ('156', '1', '95', '3', '1');
INSERT INTO `aka_sks` VALUES ('157', '1', '95', '3', '1');
INSERT INTO `aka_sks` VALUES ('158', '1', '96', '3', '1');
INSERT INTO `aka_sks` VALUES ('159', '1', '96', '3', '1');
INSERT INTO `aka_sks` VALUES ('160', '1', '97', '3', '1');
INSERT INTO `aka_sks` VALUES ('161', '1', '97', '3', '1');
INSERT INTO `aka_sks` VALUES ('162', '1', '98', '3', '1');
INSERT INTO `aka_sks` VALUES ('163', '1', '98', '3', '1');
INSERT INTO `aka_sks` VALUES ('164', '1', '99', '3', '1');
INSERT INTO `aka_sks` VALUES ('165', '1', '99', '3', '1');
INSERT INTO `aka_sks` VALUES ('166', '1', '100', '3', '1');
INSERT INTO `aka_sks` VALUES ('167', '1', '100', '3', '1');
INSERT INTO `aka_sks` VALUES ('168', '1', '101', '3', '1');
INSERT INTO `aka_sks` VALUES ('169', '1', '101', '3', '1');
INSERT INTO `aka_sks` VALUES ('170', '1', '102', '3', '1');
INSERT INTO `aka_sks` VALUES ('171', '1', '102', '3', '1');
INSERT INTO `aka_sks` VALUES ('172', '1', '103', '3', '1');
INSERT INTO `aka_sks` VALUES ('173', '1', '103', '3', '1');
INSERT INTO `aka_sks` VALUES ('174', '1', '104', '3', '1');
INSERT INTO `aka_sks` VALUES ('175', '1', '104', '3', '1');
INSERT INTO `aka_sks` VALUES ('176', '1', '5', '4', '2');
INSERT INTO `aka_sks` VALUES ('177', '1', '5', '4', '2');
INSERT INTO `aka_sks` VALUES ('178', '1', '5', '4', '2');
INSERT INTO `aka_sks` VALUES ('179', '1', '5', '4', '2');
INSERT INTO `aka_sks` VALUES ('180', '1', '6', '4', '2');
INSERT INTO `aka_sks` VALUES ('181', '1', '6', '4', '2');

-- ----------------------------
-- Table structure for aka_tahunlulus
-- ----------------------------
DROP TABLE IF EXISTS `aka_tahunlulus`;
CREATE TABLE `aka_tahunlulus` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` int(10) unsigned NOT NULL,
  `nama` varchar(10) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_tahunlulus
-- ----------------------------
INSERT INTO `aka_tahunlulus` VALUES ('1', '1', '2014');

-- ----------------------------
-- Table structure for aka_tes
-- ----------------------------
DROP TABLE IF EXISTS `aka_tes`;
CREATE TABLE `aka_tes` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `urut` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_tes
-- ----------------------------

-- ----------------------------
-- Table structure for aka_tesakademis
-- ----------------------------
DROP TABLE IF EXISTS `aka_tesakademis`;
CREATE TABLE `aka_tesakademis` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_tesakademis
-- ----------------------------

-- ----------------------------
-- Table structure for aka_tmp_saudara
-- ----------------------------
DROP TABLE IF EXISTS `aka_tmp_saudara`;
CREATE TABLE `aka_tmp_saudara` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sesid` varchar(40) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `sekolah` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_tmp_saudara
-- ----------------------------

-- ----------------------------
-- Table structure for app_registry
-- ----------------------------
DROP TABLE IF EXISTS `app_registry`;
CREATE TABLE `app_registry` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kunci` char(6) NOT NULL,
  `nilai` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of app_registry
-- ----------------------------

-- ----------------------------
-- Table structure for appactivate
-- ----------------------------
DROP TABLE IF EXISTS `appactivate`;
CREATE TABLE `appactivate` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app` varchar(10) NOT NULL,
  `user` varchar(20) NOT NULL,
  `kunci` varchar(20) NOT NULL,
  `aktif` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of appactivate
-- ----------------------------
INSERT INTO `appactivate` VALUES ('1', 'rep', 'sdvision', 'W49K71', '1');

-- ----------------------------
-- Table structure for hrd_agama
-- ----------------------------
DROP TABLE IF EXISTS `hrd_agama`;
CREATE TABLE `hrd_agama` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_agama
-- ----------------------------
INSERT INTO `hrd_agama` VALUES ('1', 'Islam', '0');
INSERT INTO `hrd_agama` VALUES ('2', 'Kristen', '0');
INSERT INTO `hrd_agama` VALUES ('3', 'Katolik', '0');

-- ----------------------------
-- Table structure for hrd_bayar
-- ----------------------------
DROP TABLE IF EXISTS `hrd_bayar`;
CREATE TABLE `hrd_bayar` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `bayar` varchar(255) NOT NULL,
  `karyawan` int(4) NOT NULL DEFAULT '0',
  `pid` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_bayar
-- ----------------------------
INSERT INTO `hrd_bayar` VALUES ('1', '2014-06-30', '120000', '35', '1');
INSERT INTO `hrd_bayar` VALUES ('3', '2014-06-30', '80000', '35', '1');
INSERT INTO `hrd_bayar` VALUES ('5', '2014-06-30', '100000', '35', '7');
INSERT INTO `hrd_bayar` VALUES ('6', '2014-07-02', '250000', '34', '12');
INSERT INTO `hrd_bayar` VALUES ('14', '2014-07-15', '250000', '36', '14');
INSERT INTO `hrd_bayar` VALUES ('15', '2014-11-07', '750000', '34', '12');

-- ----------------------------
-- Table structure for hrd_bebantugas
-- ----------------------------
DROP TABLE IF EXISTS `hrd_bebantugas`;
CREATE TABLE `hrd_bebantugas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_bebantugas
-- ----------------------------
INSERT INTO `hrd_bebantugas` VALUES ('1', 'Tidak Ada', '0', '0');
INSERT INTO `hrd_bebantugas` VALUES ('2', 'SD_1,2,3', '10', '0');
INSERT INTO `hrd_bebantugas` VALUES ('3', 'SD_4-6', '15', '0');
INSERT INTO `hrd_bebantugas` VALUES ('4', 'G-7', '25', '0');

-- ----------------------------
-- Table structure for hrd_berkas
-- ----------------------------
DROP TABLE IF EXISTS `hrd_berkas`;
CREATE TABLE `hrd_berkas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `gambar` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `karyawan` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_berkas
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_fungsional
-- ----------------------------
DROP TABLE IF EXISTS `hrd_fungsional`;
CREATE TABLE `hrd_fungsional` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_fungsional
-- ----------------------------
INSERT INTO `hrd_fungsional` VALUES ('1', 'Tidak Ada', '0', '0');
INSERT INTO `hrd_fungsional` VALUES ('2', '3A', '20', '0');
INSERT INTO `hrd_fungsional` VALUES ('3', '3B', '25', '0');
INSERT INTO `hrd_fungsional` VALUES ('4', '3C', '30', '0');

-- ----------------------------
-- Table structure for hrd_golongan
-- ----------------------------
DROP TABLE IF EXISTS `hrd_golongan`;
CREATE TABLE `hrd_golongan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `gajipokok` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=171 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_golongan
-- ----------------------------
INSERT INTO `hrd_golongan` VALUES ('2', '2A0', '1115370');
INSERT INTO `hrd_golongan` VALUES ('3', '2B0', '1239300');
INSERT INTO `hrd_golongan` VALUES ('4', '2C0', '1377000');
INSERT INTO `hrd_golongan` VALUES ('5', '2D0', '1530000');
INSERT INTO `hrd_golongan` VALUES ('6', '3A0', '1700000');
INSERT INTO `hrd_golongan` VALUES ('7', '3B0', '1870000');
INSERT INTO `hrd_golongan` VALUES ('8', '3C0', '2057000');
INSERT INTO `hrd_golongan` VALUES ('9', '3D0', '2262700');
INSERT INTO `hrd_golongan` VALUES ('10', '4A0', '2488970');
INSERT INTO `hrd_golongan` VALUES ('11', '4B0', '2737867');
INSERT INTO `hrd_golongan` VALUES ('12', '4C0', '3011654');
INSERT INTO `hrd_golongan` VALUES ('13', '4D0', '3312819');
INSERT INTO `hrd_golongan` VALUES ('15', '2A1', '1171139');
INSERT INTO `hrd_golongan` VALUES ('16', '2B1', '1301265');
INSERT INTO `hrd_golongan` VALUES ('17', '2C1', '1445850');
INSERT INTO `hrd_golongan` VALUES ('18', '2D1', '1606500');
INSERT INTO `hrd_golongan` VALUES ('19', '3A1', '1785000');
INSERT INTO `hrd_golongan` VALUES ('20', '3B1', '1963500');
INSERT INTO `hrd_golongan` VALUES ('21', '3C1', '2159850');
INSERT INTO `hrd_golongan` VALUES ('22', '3D1', '2375835');
INSERT INTO `hrd_golongan` VALUES ('23', '4A1', '2613419');
INSERT INTO `hrd_golongan` VALUES ('24', '4B1', '2874760');
INSERT INTO `hrd_golongan` VALUES ('25', '4C1', '3162236');
INSERT INTO `hrd_golongan` VALUES ('26', '4D1', '3478460');
INSERT INTO `hrd_golongan` VALUES ('27', '2A2', '1229695');
INSERT INTO `hrd_golongan` VALUES ('28', '2B2', '1366328');
INSERT INTO `hrd_golongan` VALUES ('29', '2C2', '1518143');
INSERT INTO `hrd_golongan` VALUES ('30', '2D2', '1686825');
INSERT INTO `hrd_golongan` VALUES ('31', '3A2', '1874250');
INSERT INTO `hrd_golongan` VALUES ('32', '3B2', '2061675');
INSERT INTO `hrd_golongan` VALUES ('33', '3C2', '2267843');
INSERT INTO `hrd_golongan` VALUES ('34', '3D2', '2494627');
INSERT INTO `hrd_golongan` VALUES ('35', '4A2', '2744089');
INSERT INTO `hrd_golongan` VALUES ('36', '4B2', '3018498');
INSERT INTO `hrd_golongan` VALUES ('37', '4C2', '3320348');
INSERT INTO `hrd_golongan` VALUES ('38', '4D2', '3652383');
INSERT INTO `hrd_golongan` VALUES ('39', '2A3', '1291180');
INSERT INTO `hrd_golongan` VALUES ('40', '2B3', '1434645');
INSERT INTO `hrd_golongan` VALUES ('41', '2C3', '1594050');
INSERT INTO `hrd_golongan` VALUES ('42', '2D3', '1771166');
INSERT INTO `hrd_golongan` VALUES ('43', '3A3', '1967963');
INSERT INTO `hrd_golongan` VALUES ('44', '3B3', '2164759');
INSERT INTO `hrd_golongan` VALUES ('45', '3C3', '2381235');
INSERT INTO `hrd_golongan` VALUES ('46', '3D3', '2619358');
INSERT INTO `hrd_golongan` VALUES ('47', '4A3', '2881294');
INSERT INTO `hrd_golongan` VALUES ('48', '4B3', '3169423');
INSERT INTO `hrd_golongan` VALUES ('49', '4C3', '3486366');
INSERT INTO `hrd_golongan` VALUES ('50', '4D3', '3835002');
INSERT INTO `hrd_golongan` VALUES ('51', '2A4', '1355739');
INSERT INTO `hrd_golongan` VALUES ('52', '2B4', '1506377');
INSERT INTO `hrd_golongan` VALUES ('53', '2C4', '1673752');
INSERT INTO `hrd_golongan` VALUES ('54', '2D4', '1859725');
INSERT INTO `hrd_golongan` VALUES ('55', '3A4', '2066361');
INSERT INTO `hrd_golongan` VALUES ('56', '3B4', '2272997');
INSERT INTO `hrd_golongan` VALUES ('57', '3C4', '2500296');
INSERT INTO `hrd_golongan` VALUES ('58', '3D4', '2750326');
INSERT INTO `hrd_golongan` VALUES ('59', '4A4', '3025359');
INSERT INTO `hrd_golongan` VALUES ('60', '4B4', '3327894');
INSERT INTO `hrd_golongan` VALUES ('61', '4C4', '3660684');
INSERT INTO `hrd_golongan` VALUES ('62', '4D4', '4026752');
INSERT INTO `hrd_golongan` VALUES ('63', '2A5', '1423526');
INSERT INTO `hrd_golongan` VALUES ('64', '2B5', '1581696');
INSERT INTO `hrd_golongan` VALUES ('65', '2C5', '1757440');
INSERT INTO `hrd_golongan` VALUES ('66', '2D5', '1952711');
INSERT INTO `hrd_golongan` VALUES ('67', '3A5', '2169679');
INSERT INTO `hrd_golongan` VALUES ('68', '3B5', '2386647');
INSERT INTO `hrd_golongan` VALUES ('69', '3C5', '2625311');
INSERT INTO `hrd_golongan` VALUES ('70', '3D5', '2887842');
INSERT INTO `hrd_golongan` VALUES ('71', '4A5', '3176627');
INSERT INTO `hrd_golongan` VALUES ('72', '4B5', '3494289');
INSERT INTO `hrd_golongan` VALUES ('73', '4C5', '3843718');
INSERT INTO `hrd_golongan` VALUES ('74', '4D5', '4228090');
INSERT INTO `hrd_golongan` VALUES ('75', '2A6', '1494702');
INSERT INTO `hrd_golongan` VALUES ('76', '2B6', '1660781');
INSERT INTO `hrd_golongan` VALUES ('77', '2C6', '1845312');
INSERT INTO `hrd_golongan` VALUES ('78', '2D6', '2050346');
INSERT INTO `hrd_golongan` VALUES ('79', '3A6', '2278163');
INSERT INTO `hrd_golongan` VALUES ('80', '3B6', '2505979');
INSERT INTO `hrd_golongan` VALUES ('81', '3C6', '2756577');
INSERT INTO `hrd_golongan` VALUES ('82', '3D6', '3032234');
INSERT INTO `hrd_golongan` VALUES ('83', '4A6', '3335458');
INSERT INTO `hrd_golongan` VALUES ('84', '4B6', '3669004');
INSERT INTO `hrd_golongan` VALUES ('85', '4C6', '4035904');
INSERT INTO `hrd_golongan` VALUES ('86', '4D6', '4439494');
INSERT INTO `hrd_golongan` VALUES ('87', '2A7', '1569438');
INSERT INTO `hrd_golongan` VALUES ('88', '2B7', '1743820');
INSERT INTO `hrd_golongan` VALUES ('89', '2C7', '1937577');
INSERT INTO `hrd_golongan` VALUES ('90', '2D7', '2152864');
INSERT INTO `hrd_golongan` VALUES ('91', '3A7', '2392071');
INSERT INTO `hrd_golongan` VALUES ('92', '3B7', '2631278');
INSERT INTO `hrd_golongan` VALUES ('93', '3C7', '2894406');
INSERT INTO `hrd_golongan` VALUES ('94', '3D7', '3183846');
INSERT INTO `hrd_golongan` VALUES ('95', '4A7', '3502231');
INSERT INTO `hrd_golongan` VALUES ('96', '4B7', '3852454');
INSERT INTO `hrd_golongan` VALUES ('97', '4C7', '4237699');
INSERT INTO `hrd_golongan` VALUES ('98', '4D7', '4661469');
INSERT INTO `hrd_golongan` VALUES ('99', '2A8', '1647909');
INSERT INTO `hrd_golongan` VALUES ('100', '2B8', '1831011');
INSERT INTO `hrd_golongan` VALUES ('101', '2C8', '2034456');
INSERT INTO `hrd_golongan` VALUES ('102', '2D8', '2260507');
INSERT INTO `hrd_golongan` VALUES ('103', '3A8', '2511674');
INSERT INTO `hrd_golongan` VALUES ('104', '3B8', '2762842');
INSERT INTO `hrd_golongan` VALUES ('105', '3C8', '3039126');
INSERT INTO `hrd_golongan` VALUES ('106', '3D8', '3343038');
INSERT INTO `hrd_golongan` VALUES ('107', '4A8', '3677342');
INSERT INTO `hrd_golongan` VALUES ('108', '4B8', '4045077');
INSERT INTO `hrd_golongan` VALUES ('109', '4C8', '4449584');
INSERT INTO `hrd_golongan` VALUES ('110', '4D8', '4894543');
INSERT INTO `hrd_golongan` VALUES ('111', '2A9', '1730305');
INSERT INTO `hrd_golongan` VALUES ('112', '2B9', '1922561');
INSERT INTO `hrd_golongan` VALUES ('113', '2C9', '2136179');
INSERT INTO `hrd_golongan` VALUES ('114', '2D9', '2373532');
INSERT INTO `hrd_golongan` VALUES ('115', '3A9', '2637258');
INSERT INTO `hrd_golongan` VALUES ('116', '3B9', '2900984');
INSERT INTO `hrd_golongan` VALUES ('117', '3C9', '3191082');
INSERT INTO `hrd_golongan` VALUES ('118', '3D9', '3510190');
INSERT INTO `hrd_golongan` VALUES ('119', '4A9', '3861209');
INSERT INTO `hrd_golongan` VALUES ('120', '4B9', '4247330');
INSERT INTO `hrd_golongan` VALUES ('121', '4C9', '4672063');
INSERT INTO `hrd_golongan` VALUES ('122', '4D9', '5139270');
INSERT INTO `hrd_golongan` VALUES ('123', '2A10', '1816820');
INSERT INTO `hrd_golongan` VALUES ('124', '2B10', '2018689');
INSERT INTO `hrd_golongan` VALUES ('125', '2C10', '2242988');
INSERT INTO `hrd_golongan` VALUES ('126', '2D10', '2492209');
INSERT INTO `hrd_golongan` VALUES ('127', '3A10', '2769121');
INSERT INTO `hrd_golongan` VALUES ('128', '3B10', '3046033');
INSERT INTO `hrd_golongan` VALUES ('129', '3C10', '3350636');
INSERT INTO `hrd_golongan` VALUES ('130', '3D10', '3685700');
INSERT INTO `hrd_golongan` VALUES ('131', '4A10', '4054270');
INSERT INTO `hrd_golongan` VALUES ('132', '4B10', '4459697');
INSERT INTO `hrd_golongan` VALUES ('133', '4C10', '4905667');
INSERT INTO `hrd_golongan` VALUES ('134', '4D10', '5396233');
INSERT INTO `hrd_golongan` VALUES ('135', '2A11', '1907661');
INSERT INTO `hrd_golongan` VALUES ('136', '2B11', '2119624');
INSERT INTO `hrd_golongan` VALUES ('137', '2C11', '2355137');
INSERT INTO `hrd_golongan` VALUES ('138', '2D11', '2616819');
INSERT INTO `hrd_golongan` VALUES ('139', '3A11', '2907577');
INSERT INTO `hrd_golongan` VALUES ('140', '3B11', '3198335');
INSERT INTO `hrd_golongan` VALUES ('141', '3C11', '3518168');
INSERT INTO `hrd_golongan` VALUES ('142', '3D11', '3869985');
INSERT INTO `hrd_golongan` VALUES ('143', '4A11', '4256983');
INSERT INTO `hrd_golongan` VALUES ('144', '4B11', '4682682');
INSERT INTO `hrd_golongan` VALUES ('145', '4C11', '5150950');
INSERT INTO `hrd_golongan` VALUES ('146', '4D11', '5666045');
INSERT INTO `hrd_golongan` VALUES ('147', '2A12', '2003044');
INSERT INTO `hrd_golongan` VALUES ('148', '2B12', '2225605');
INSERT INTO `hrd_golongan` VALUES ('149', '2C12', '2472894');
INSERT INTO `hrd_golongan` VALUES ('150', '2D12', '2747660');
INSERT INTO `hrd_golongan` VALUES ('151', '3A12', '3052956');
INSERT INTO `hrd_golongan` VALUES ('152', '3B12', '3358251');
INSERT INTO `hrd_golongan` VALUES ('153', '3C12', '3694076');
INSERT INTO `hrd_golongan` VALUES ('154', '3D12', '4063484');
INSERT INTO `hrd_golongan` VALUES ('155', '4A12', '4469833');
INSERT INTO `hrd_golongan` VALUES ('156', '4B12', '4916816');
INSERT INTO `hrd_golongan` VALUES ('157', '4C12', '5408497');
INSERT INTO `hrd_golongan` VALUES ('158', '4D12', '5949347');
INSERT INTO `hrd_golongan` VALUES ('159', '2A13', '2103196');
INSERT INTO `hrd_golongan` VALUES ('160', '2B13', '2336885');
INSERT INTO `hrd_golongan` VALUES ('161', '2C13', '2596539');
INSERT INTO `hrd_golongan` VALUES ('162', '2D13', '2885043');
INSERT INTO `hrd_golongan` VALUES ('163', '3A13', '3205604');
INSERT INTO `hrd_golongan` VALUES ('164', '3B13', '3526164');
INSERT INTO `hrd_golongan` VALUES ('165', '3C13', '3878780');
INSERT INTO `hrd_golongan` VALUES ('166', '3D13', '4266658');
INSERT INTO `hrd_golongan` VALUES ('167', '4A13', '4693324');
INSERT INTO `hrd_golongan` VALUES ('168', '4B13', '5162657');
INSERT INTO `hrd_golongan` VALUES ('169', '4C13', '5678922');
INSERT INTO `hrd_golongan` VALUES ('170', '4D13', '6246814');

-- ----------------------------
-- Table structure for hrd_history
-- ----------------------------
DROP TABLE IF EXISTS `hrd_history`;
CREATE TABLE `hrd_history` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `history` varchar(255) NOT NULL,
  `gambar` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `karyawan` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_history
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_istrianak
-- ----------------------------
DROP TABLE IF EXISTS `hrd_istrianak`;
CREATE TABLE `hrd_istrianak` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_istrianak
-- ----------------------------
INSERT INTO `hrd_istrianak` VALUES ('1', 'Tidak Ada', '0', '0');
INSERT INTO `hrd_istrianak` VALUES ('2', 'Istri Anak', '10', '0');

-- ----------------------------
-- Table structure for hrd_karyawan
-- ----------------------------
DROP TABLE IF EXISTS `hrd_karyawan`;
CREATE TABLE `hrd_karyawan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nip` varchar(15) NOT NULL DEFAULT '',
  `nuptk` varchar(512) NOT NULL,
  `nama` varchar(100) NOT NULL DEFAULT '',
  `kotalahir` varchar(255) NOT NULL,
  `tgllahir` date NOT NULL,
  `kelamin` varchar(15) NOT NULL DEFAULT '',
  `agama` varchar(20) NOT NULL DEFAULT '',
  `menikah` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL DEFAULT '',
  `kota` varchar(100) NOT NULL DEFAULT '',
  `kodepos` varchar(255) NOT NULL,
  `propinsi` varchar(100) NOT NULL DEFAULT '',
  `negara` varchar(100) NOT NULL DEFAULT '',
  `telepon` varchar(15) NOT NULL DEFAULT '-',
  `handphone` varchar(15) NOT NULL DEFAULT '-',
  `foto` text NOT NULL,
  `departemen` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `jabatanlain` varchar(512) NOT NULL,
  `status` varchar(255) NOT NULL,
  `pendidikan_terakhir` varchar(255) NOT NULL,
  `tglditerima` date NOT NULL,
  `tglpercobaan` date NOT NULL,
  `tglkontrak` date NOT NULL,
  `jatahcuti` int(2) NOT NULL DEFAULT '0',
  `norek` varchar(50) NOT NULL,
  `namarek` varchar(50) NOT NULL,
  `npwp` varchar(50) NOT NULL,
  `tipe` enum('0','1','2') NOT NULL DEFAULT '1',
  `tglresign` date NOT NULL,
  `alasan` varchar(255) NOT NULL,
  `lampiran` varchar(255) NOT NULL,
  `tglmelamar` date NOT NULL,
  `golongan` varchar(5) NOT NULL DEFAULT '1',
  `struktural` varchar(5) NOT NULL DEFAULT '1',
  `fungsional` varchar(5) NOT NULL DEFAULT '1',
  `pengabdian` varchar(5) NOT NULL DEFAULT '1',
  `istrianak` varchar(5) NOT NULL DEFAULT '1',
  `uangmakan` varchar(5) NOT NULL DEFAULT '1',
  `uangtransport` varchar(5) NOT NULL DEFAULT '1',
  `bebantugas` varchar(5) NOT NULL DEFAULT '1',
  `walikelas` varchar(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=186 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_karyawan
-- ----------------------------
INSERT INTO `hrd_karyawan` VALUES ('46', '040.06.08', '', 'Claudia Natalia', 'Medan', '1983-03-29', '2', '2', '1', 'Jalan Panduk 29', 'Surabaya', '', 'Jawa Timur', 'Indonesia', '03181368806', '08552200185', '', '10', '11', '', '3', '3', '2008-11-03', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('47', '002.01.02', '', 'Coni Chandra', 'Malang', '1941-08-19', '2', '2', '1', 'Manyar Tirtoyoso (Raya) 77', 'Surabaya', '', 'Jawa Timur', 'Indonesia', '0315911517', '', '', '10', '13', '', '3', '-', '2002-06-03', '0000-00-00', '0000-00-00', '0', 'asd norek', 'asd namarek', 'NPWP', '1', '0000-00-00', '', '', '0000-00-00', '13', '2', '2', '2', '2', '1', '1', '2', '2');
INSERT INTO `hrd_karyawan` VALUES ('48', '099.06.11', '', 'Jenny Hartono, S.E', 'Surabaya', '1974-01-12', '2', '2', '1', 'Wonorejo Permai Utara BB.515/VII-28', 'Surabaya', '', 'Jawa Timur', 'Indonesia', '0318781745', '08123040478', '', '10', '11', '', '3', '4', '2011-10-21', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('49', '140.02.13', '', 'Eunike Laura', 'Surabaya', '1990-03-02', '2', '2', '2', 'Sulung Tengah 34', 'Surabaya', '', 'Jawa Timur', 'Indonesia', '08983790391', '', '', '10', '18', '', '9', '4', '2013-02-25', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('50', '037.06.06', '', 'Maria Karunia Agasta, S.Hum', 'Surabaya', '1985-08-06', '2', '2', '1', 'Mulyorejo Tengah 52-54', 'Surabaya', '', '', '', '', '', '', '10', '11', '', '3', '4', '2006-09-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('51', '011.06.05', '', 'Maya Lusita Suriyandari, S.E.', 'Sidoarjo', '1977-05-28', '2', '2', '1', 'Siwalankerto PJKA No. 9', 'Surabaya', '', '', '', '', '085648177240', '', '10', '11', '', '3', '4', '2005-03-21', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('52', '075.06.10', '', 'Novita Sari Sutanto', 'Surabaya', '1988-11-20', '2', '2', '2', 'Pandegiling 42', 'Surabaya', '', '', '', '', '08165409809', '', '10', '14', '', '3', '4', '2010-05-03', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('53', '131.01.13', '', 'Shanti Mahardikani', 'Surabaya', '1976-05-07', '2', '2', '2', 'Perum. Surya Regency Blok D.6 No.25', 'Surabaya', '', '', '', '', '087853451327', '', '10', '11', '', '9', '3', '2013-07-08', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('54', '076.06.10', '', 'Stephanie Hartanto, S.Psi', 'Surabaya', '1987-09-30', '2', '2', '-', 'Tenggilis Mejoyo AM 4A', '', '', '', '', '', '', '', '10', '11', '', '3', '4', '2010-02-15', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('55', '032.01.13', '', 'Stefany Angelina Trijojo', 'Surabaya', '1988-04-19', '2', '2', '-', 'Manggis No. 12', 'Surabaya', '', '', '', '', '082168808055', '', '10', '11', '', '9', '8', '2013-07-08', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('56', '141.02.13', '', 'Lini Wijaya Sinarli, S.E.', 'Makassar', '1991-07-18', '2', '2', '2', 'Lebak Indah Mas I/23', 'Surabaya', '', '', '', '', '082132427788', '', '10', '11', '', '9', '4', '2013-07-07', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('57', '100.02.12', '', 'Musa Mohamad K', 'Gresik', '1983-10-10', '2', '2', '1', '', '', '', '', '', '', '085732708367', '', '10', '34', '', '3', '3', '2015-01-22', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('58', '109.01.12', '', 'Selli Nur Susanti, S.E.', 'Surabaya', '1981-02-28', '2', '2', '2', '', '', '', '', '', '', '085733362280', '', '10', '11', '', '9', '4', '2011-07-11', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('59', '112.02.12', '', 'Reni', 'Kediri', '1981-06-10', '2', '2', '1', 'Kertajaya Indah Timur 17', '', '', '', '', '', '082140212131', '', '10', '34', '', '3', '3', '2015-01-22', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('60', '080.07.11', '', 'Yossy Ana Susilo, S.E.', 'Surabaya', '1982-08-08', '2', '2', '1', 'Wedoro Regency 19, Waru', 'Sidoarjo', '', '', '', '', '0878530033919', '', '10', '19', '', '3', '4', '2011-04-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('61', '134.01.13', '', 'Chandra Maruli Manullang, S.Pd.', 'Surabaya', '1989-11-18', '1', '2', '1', 'Manukan Lor 7D/7', 'Surabaya', '', '', '', '', '081703348600', '', '12', '11', '', '9', '4', '2013-07-22', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('62', '019.03.05', '', 'Christine Oscar, S.S., M.M.', 'Surabaya', '1982-03-19', '2', '2', '2', 'Kutisari Indah Barat I/96', 'Surabaya', '', '', '', '', '0811376978', '', '12', '14', '', '3', '5', '2005-11-21', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('63', '173.01.14', '', 'Eben Ezer Tarihoran, S.Th., MACE', 'Tapanuli Utara', '1973-02-19', '1', '2', '1', 'Griyo Wage Asri I Blok J/17, Taman Wage', 'Sidoarjo', '', '', '', '03171340921', '085850363345', '', '14', '11', '', '9', '5', '2014-07-07', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('64', '184.01.14', '', 'Fongling Natalia Budisungkono', 'Surabaya', '1992-07-01', '2', '2', '2', 'Bendul Merisi Selatan III/37', 'Surabaya', '', '', '', '', '085749405144', '', '12', '11', '', '3', '4', '2014-08-25', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('65', '077.06.10', '', 'Helen Wijaya, S.T.', 'Surabaya', '1982-12-04', '2', '2', '1', 'Jemursari Regency B38; Manyar Rejo IX/56', 'Surabaya', '', '', '', '', '0818513443', '', '12', '11', '', '3', '4', '2010-10-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('66', '027.06.07', '', 'Jiely Angela, S.S.', 'Balikpapan', '1974-03-30', '2', '2', '2', '', '', '', '', '', '', '', '', '12', '11', '', '3', '4', '2005-07-25', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('67', '082.08.08', '', 'Hanis Sri Utami', 'Surabaya', '1973-09-13', '2', '-', '1', '', '', '', '', '', '', '', '', '11', '27', '', '3', '3', '2008-10-06', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('68', '022.06.06', '', 'Imanda Wijaya, S.Psi.', 'Kediri', '1976-02-03', '2', '2', '1', 'Siwalankerto IIB/7', 'Surabaya', '', '', '', '', '08155021530', '', '12', '11', '', '3', '4', '2006-03-20', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('69', '191.01.12', '', 'Landero Cecille', 'Filipina', '1987-09-12', '2', '2', '2', '', '', '', '', '', '', '', '', '12', '11', '', '9', '4', '2012-06-14', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('70', '192.01.13', '', 'Kimberly Ceniza Allego, BSEd.', 'Filipina', '1987-10-05', '2', '2', '2', '', '', '', '', '', '', '', '', '12', '11', '', '9', '4', '2013-07-22', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('71', '193.01.14', '', 'Leah Garcia Candilosas, B.S.Ch.E.', 'Filipina', '1987-08-21', '2', '2', '2', '', '', '', '', '', '', '', '', '12', '11', '', '9', '4', '2014-03-10', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('72', '116.02.12', '', 'Lilies Winda Arditya, S.E.', 'Surabaya', '1988-11-02', '2', '2', '1', 'Raganata No.10A', 'Sidoarjo', '', '', '', '', '085733112602', '', '12', '19', '', '3', '4', '2012-07-09', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('73', '185.01.14', '', 'Liza Rosana, S.Pd.', 'Surabaya', '1979-04-03', '2', '2', '2', 'Griya Suci Permai E6/17A', 'Gresik', '', '', '', '', '085649493387', '3d0a8ca33ebd08de88e5b8dcc7fcb2b8.jpg', '12', '11', '', '9', '4', '2014-08-29', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('74', '121.01.12', '', 'Maria Elvi Priantini, S.E.', 'Surabaya', '1975-05-20', '2', '2', '1', '', '', '', '', '', '', '', '', '12', '11', '', '3', '4', '2012-10-15', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('75', '024.06.06', '', 'Martha Engeline M., S.IP., M.M.', 'Surabaya', '1974-05-17', '2', '2', '1', 'Candi Lontar Kulon 44Q-4', 'Surabaya', '', '', '', '', '081331184946', '', '11', '14', '', '3', '5', '2006-07-10', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('76', '020.06.06', '', 'M.I. Judi Kristiani', 'Kediri', '1972-08-11', '2', '2', '1', 'Komplek TNI AL, Jl. Badik No.2 Seruni Tebel', 'Sidoarjo', '', '', '', '', '081331834159', '', '12', '11', '', '3', '-', '2005-10-17', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('77', '126.01.13', '', 'Putri Iin Alimsijah, B.Sc.', 'Surabaya', '1985-11-19', '2', '2', '2', 'Kertajaya Indah VII/47', 'Surabaya', '', '', '', '', '08983958276', '', '12', '11', '', '9', '4', '2013-03-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('78', '094.06.09', '', 'Robby Sutaryo', 'Makassar', '1955-05-27', '1', '2', '1', 'Petemon Kali 46A, 31', 'Surabaya', '', '', '', '', '081330900939', '', '14', '11', '', '3', '9', '2009-10-05', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('79', '056.08.07', '', 'Sahat Mauli Simorangkir', 'Sidoarjo', '1980-07-09', '1', '2', '1', '', '', '', '', '', '', '', '', '32', '29', '', '3', '3', '2007-10-22', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('80', '135.01.03', '', 'Sony Kurniawan, S.Pd.', 'Blitar', '1981-09-29', '1', '2', '1', '', '', '', '', '', '', '', '', '14', '14', '', '3', '4', '2013-07-22', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('81', '153.01.14', '', 'Tan Hwa San, S.E., M.M., M.Div., MACE', 'Surabaya', '1972-06-18', '1', '2', '2', 'Pondok Tjandra Indah, Jl. Duku VII/CB 44 ', 'Surabaya', '', '', '', '', '', '', '12', '20', '', '3', '5', '2015-01-23', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('82', '071.06.10', '', 'Yunus Denny S.', 'Jember', '1975-07-14', '1', '2', '1', 'Siwalankerto Timur I/60', 'Surabaya', '', '', '', '', '081914736956', '', '12', '11', '', '3', '-', '2010-07-05', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('83', '096.06.11', '', 'Caroline Florentine, S.Psi.', '', '1988-05-01', '2', '2', '2', 'Wisata Bukit Mas 2 F4 No 17-18', 'Surabaya', '', '', '', '', '', '7d8ac6284839960e4cab65de86c8f94b.jpg', '9', '11', '', '3', '4', '2012-01-23', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('84', '015.06.05', '', 'Deasy Arieyanthi, S.Psi.', 'Surabaya', '1976-12-18', '2', '2', '2', 'Tengger III buntu 23', 'Surabaya', '', '', '', '', '', '6d887ee44c3c0cafc14dc12232efd2a9.jpg', '9', '11', '', '3', '4', '2005-05-02', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('85', '009.06.04', '', 'Debbie Tresiani Kwapela, S.Pd.', '', '1974-03-23', '2', '2', '2', 'Manukan Yoso IV/7D-3', 'Surabaya', '', '', '', '', '', '24bd2d213d31fa0bd5cf1c2031a4a435.jpg', '9', '11', '', '3', '4', '2004-07-19', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('86', '031.06.08', '', 'Eliana Lieman', 'Tulungagung', '1979-09-15', '2', '2', '1', 'Tanjung Sari Baru 5/64', 'Surabaya', '', '', '', '', '0816558720', '22e6f0d5ea46eb650d833fe2d3225197.jpg', '9', '11', '', '3', '4', '2008-08-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('87', '127.01.13', '', 'Elizabeth Sunjoto, S.Sn.', 'Surabaya', '1989-01-20', '2', '2', '2', 'Darmo Hill O-40', 'Surabaya', '', '', '', '', '08123153899', 'cd6bc004656f2333f7573f86c1216b35.jpg', '9', '11', '', '3', '4', '2013-05-27', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('88', '016.06.05', '', 'Elly Mayasari, S.Pd.', 'Surabaya', '1983-08-03', '2', '2', '1', 'Griya Babatan Mukti K-3, Wiyung', 'Surabaya', '', '', '', '', '085646363080', '84e4774f56f6d2e1552eda8499d37011.jpg', '9', '11', '', '3', '4', '2005-05-09', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('89', '010.06.05', '', 'Erika Magdalena, S.Pd.', 'Surabaya', '1982-11-06', '2', '2', '1', 'Perum Menteng Regency C-2', 'Gresik', '', '', '', '', '085648280222', '0b7d71fad7fd4b1d0de29ac305fa5d97.jpg', '9', '11', '', '3', '4', '2004-10-18', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('90', '014.06.05', '', 'Evy Lindayana, S.Si., Apt.', 'Dobo', '1975-03-31', '2', '2', '1', 'Jajar Tunggal Utara C-19', 'Surabaya', '', '', '', '', '08123008784', '62e3968497115f34b177c13752b5fa47.jpg', '9', '14', '', '3', '4', '2005-05-23', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('91', '102.01.12', '', 'Helen, S.E.', 'Malang', '1981-08-26', '2', '2', '1', '', '', '', '', '', '', '08123303289', '50569f7579cf55d697fa4a5be234456d.jpg', '9', '11', '', '3', '4', '2012-08-20', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('92', '028.06.07', '', 'Ika Sari, S.Psi', 'Surabaya', '1977-09-11', '2', '2', '2', 'Sidotopo Wetan 131', 'Surabaya', '', '', '', '', '085648777947', '2bdae99f8ac25463e1fa870317fa8369.jpg', '9', '11', '', '3', '4', '2007-08-20', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('93', '095.06.11', '', 'Irene Vanessa, S.S.', 'Surabaya', '1986-09-14', '2', '2', '1', 'Raya Karah Indah N-45', 'Surabaya', '', '', '', '', '08123101240', '1e9b1f3c14f83a48f991ce12b38e1334.jpg', '9', '11', '', '3', '4', '2011-08-22', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('94', '119.01.12', '', 'Julini Liunardi, S.E.', 'Surabaya', '1990-12-23', '2', '2', '2', '', '', '', '', '', '', '', '08c455826ae5f230804c27b347c37179.jpg', '9', '11', '', '9', '4', '2012-09-03', '0000-00-00', '2015-08-31', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('95', '033.06.07', '', 'Lia Debora', 'Surabaya', '1985-03-13', '2', '2', '1', 'Jagalan 7/10', 'Surabaya', '', '', '', '', '081333099811', '542dbd24d5c90715921dfe38c1b01c6b.jpg', '9', '11', '', '3', '3', '2013-07-01', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('96', '045.06.08', '', 'Maria Putri Ardianasari, S.Pd.', '', '1984-03-27', '2', '2', '1', 'Mliwis 35', 'Surabaya', '', '', '', '', '081235055010', '59cbf3a9ff9d2753d1785094c626ffda.jpg', '9', '11', '', '3', '4', '2008-09-22', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('97', '039.06.09', '', 'Maureen Octavia, S.E', 'Surabaya', '1986-10-14', '2', '2', '1', 'Sambi Kerep N-14 Perum Perhutani', 'Surabaya', '', '', '', '', '08563038589', '2015a56a1f7683c7e11a03ecfda0a412.jpg', '9', '11', '', '3', '4', '2009-02-23', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('98', '004.03.03', '', 'Olivia Tiono Gunawan, S.S., M.M.', 'Surabaya', '1979-06-15', '2', '2', '1', 'Permata Safira Regency F4/27', 'Surabaya', '', '', '', '', '081553205179', '', '9', '13', '', '3', '5', '2003-07-07', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('99', '021.06.06', '', 'Olivia Weol, S.S.', 'Surabaya', '1983-10-25', '2', '2', '1', 'Darmo Permai Utara XI/18', 'Surabaya', '', '', '', '', '08123120689', '95944a8578112448a8d3da40b41fae2b.jpg', '9', '11', '', '3', '4', '2006-03-27', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('100', '088.06.12', '', 'One Remmayanti, S.S.', 'Surabaya', '1971-08-08', '2', '2', '1', 'Jl Tanjung Pura No.24', 'Surabaya', '', '', '', '', '', 'b01530ec6e022c9a17fd4c6b9749ae5b.jpg', '9', '11', '', '3', '4', '2011-02-21', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('101', '073.06.09', '', 'Retina Mastiur Naibaho, S.Pd.', 'Surabaya', '1983-10-10', '2', '2', '1', 'Jugruk Rejosari I / I', 'Surabaya', '', '', '', '', '081330321440', '46e776e7e386dfd804c1ee2e70037ca4.jpg', '9', '11', '', '3', '4', '2009-07-02', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('102', '030.01.08', '', 'Heidi Donesha, M.Div.', 'Texas, USA', '1978-07-08', '2', '2', '2', '', '', '', '', '', '', '', '', '9', '11', '', '9', '5', '2008-07-14', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('103', '092.07.10', '', 'Marseila Krisyane, S.Pd.', 'Surabaya', '1983-06-30', '2', '2', '1', 'Manukan Krajan IV/34', 'Surabaya', '', '', '', '', '', '1009e070f846fb48713152620ad956ec.jpg', '9', '11', '', '3', '4', '2010-06-21', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('104', '007.06.04', '', 'Shierly Lionita, S.E.', 'Surabaya', '1976-04-27', '2', '2', '1', 'Jl Kupang Indah 7 / 22', 'Surabaya', '', '', '', '', '03170951173', 'b5dedd622f45171188e76251bd5221f3.jpg', '9', '11', '', '3', '4', '2004-06-01', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('105', '178.02.14', '', 'Wanda Krisma Nathania, S.Pd.', 'Bojonegoro', '1989-03-04', '2', '2', '1', 'Komplek TNI AL, Rumdis Ampel 1/58 Semampir', 'Surabaya', '', '', '', '', '081235959399', '', '9', '11', '', '9', '4', '2014-07-21', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('108', '035.06.07', '', 'Daniel Krisna S., S.Si., M.M.', 'Surabaya', '1982-12-23', '1', '2', '2', 'Bibis Tama I 4/6', 'Surabaya', '', '', '', '', '085 648 475 656', '', '11', '11', '', '3', '5', '2007-06-25', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('109', '106.01.12', '', 'Daniel O&#039;Hara, S.Th.', 'Blitar', '1984-11-02', '1', '2', '2', 'Simohilir Barat XI/7', 'Surabaya', '', '', '', '', '083 830 246 257', '3f349ffe7a6188488f5ecff319e9eebe.jpg', '11', '11', '', '3', '4', '2012-07-16', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('110', '013.06.05', '', 'David Hendra G., S.E.', 'Surabaya', '1983-06-24', '1', '2', '1', 'Taman Siwalan Indah Blok P-33 Kepatihan', 'Gresik', '', '', '', '', '088 804 892 340', '', '11', '14', '', '3', '4', '2005-05-09', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('111', '137.01.13', '', 'Debora Terang Miniang, S.Pd.', 'Mojokerto', '1969-08-20', '2', '2', '1', 'Kedurus IVB/65', 'Surabaya', '', '', '', '', '081 357 626 302', 'f2d1e3f6eae4d9df5e95710a51101a16.jpg', '11', '11', '', '3', '4', '2013-07-22', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('112', '091.06.12', '', 'Denny Susanto, S.E., BBA', 'Surabaya', '1984-10-19', '1', '2', '2', 'Dukuh Kupang Timur XI/26', 'Surabaya', '', '', '', '', '089 999 986 79', '4100e0a447f2740f413ee25099301d0b.jpg', '11', '11', '', '3', '4', '2011-10-24', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('113', '055.06.09', '', 'Dewi Kartika, S.Pd.', 'Surabaya', '1977-03-25', '2', '2', '1', 'Darmo Indah Barat F-6', '', '', '', '', '', '087 854 343 737', '74919ce84c61068b74700323d6499e47.jpg', '11', '11', '', '3', '4', '2009-08-03', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('114', '151.01.14', '', 'Fritzie Wibisono, S.S.', 'Surabaya', '1979-11-09', '2', '2', '1', 'Taman Pondok Indah PX-20 Wiyung', 'Surabaya', '', '', '', '', '081 515 999 388', '084de96a3c2db87fe232b6b7299af327.jpg', '11', '11', '', '9', '4', '2014-03-17', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('115', '090.06.12', '', 'Iis Santi Melani S., S.T.', 'Surabaya', '1982-07-10', '2', '2', '1', 'Wisma Tengger V/16', '', '', '', '', '', '081 216 654 73', 'c692434465bc5412d76a84521644c055.jpg', '11', '11', '', '3', '4', '2011-06-20', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('116', '194.01.13', '', 'Laarni D. Umoc', 'Filipina', '1970-02-15', '2', '2', '2', '', '', '', '', '', '', '089 628 935 977', '', '11', '11', '', '9', '4', '2013-02-01', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('117', '065.06.10', '', 'Lenny Diana K. Kwan, S.S.', 'Surabaya', '1983-08-10', '2', '2', '1', 'Tanjung Sari Baru 3/27', 'Surabaya', '', '', '', '', '081 230 986 70', '', '11', '11', '', '3', '4', '2010-02-02', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('118', '025.06.06', '', 'Maria Magdalena, S.Ipd.K', 'Pasuruan', '1982-06-05', '2', '2', '1', 'Pucang Jajar Utara 26', '', '', '', '', '', '085 730 072 246', '34b0d332e3b5ef1ac408761e28f0d30b.jpg', '11', '11', '', '3', '4', '2006-09-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('119', '103.01.12', '', 'Oei Bing Bing, M.Pd.', 'Surabaya', '1985-03-25', '2', '2', '1', '', '', '', '', '', '', '081 293 987 377', '', '11', '11', '', '3', '5', '2012-07-02', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('120', '041.06.08', '', 'Rahayu Febiana, S.Psi., M.M.', 'Pasuruan', '1979-02-25', '2', '2', '1', 'Perum Larangan Mega Asri B/38 Candi', 'Sidoarjo', '', '', '', '', '081 231 153 842', '58303325396c535039fbeedeb8632fef.jpg', '11', '11', '', '3', '5', '2006-06-26', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('121', '093.01.11', '', 'Ramilo Nenita C., B.Sc.', 'Filipina', '1958-05-23', '2', '2', '1', '', '', '', '', '', '', '081 216 075 663', '', '11', '11', '', '9', '4', '2011-07-01', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('122', '008.03.04', '', 'Ratna Bayu A., M.Pd.', 'Pandaan', '1970-04-07', '2', '2', '1', '', '', '', '', '', '', '083 856 542 777', '', '11', '13', '', '3', '5', '2004-01-05', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('123', '130.01.13', '', 'Ros Indah Simatupang, S.S.', 'Lobugala, Tapanuli', '1989-03-18', '2', '2', '2', 'Raya Batu Mulia 15A Driyorejo', 'Surabaya', '', '', '', '', '081 370 892 566', 'cf2b581776c6b312bef05f922cbbc413.jpg', '11', '11', '', '3', '4', '2013-06-17', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('124', '082.05.10', '', 'Sandradevi Tedjokusumo, S.T.', 'Surabaya', '1978-10-18', '2', '2', '1', 'Simo Rukun 7/7', 'Surabaya', '', '', '', '', '031 910 007 75', '8762b483c3b66e383a3c318e5439157e.jpg', '11', '11', '', '3', '4', '2015-01-26', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('125', '104.01.12', '', 'Stella Ivonne P.S., MPA', 'Yogyakarta', '1982-03-20', '2', '2', '1', '', '', '', '', '', '', '081 228 899 973', '15f1bb3cfaec64648e2541b70fdd54c1.jpg', '11', '11', '', '3', '5', '2011-11-07', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('126', '190.01.14', '', 'Theresia Ayu Kusdwiharini, M.Pd.', 'Sidoarjo', '1984-07-07', '2', '2', '1', 'Jenggolo 2/E-51', 'Sidoarjo', '', '', '', '', '087 855 247 844', '', '11', '11', '', '9', '5', '2015-08-14', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('127', '067.06.09', '', 'Trofiansi Roliand Dalero, S.Th.', 'Rainis', '1981-04-06', '2', '2', '1', 'Tubanan Baru C25', 'Surabaya', '', '', '', '', '082 400 292 20', 'a46f74b92e04e2a0e4fbe711cfc38a8d.jpg', '11', '20', '', '3', '4', '2009-08-03', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('128', '026.06.07', '', 'Ully D. Ria Ambarita, S.Psi.', 'Surabaya', '1980-06-10', '2', '2', '1', 'Silindri G-3/12 HN2 Driyorejo Kota Baru', 'Gresik', '', '', '', '', '081 331 581 477', '9444903dee71b6d73add417fd083b201.jpg', '11', '11', '', '3', '4', '2007-06-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('129', '047.06.08', '', 'Utin, S.Th.', 'Pontianak', '1974-07-21', '1', '2', '1', 'Pakis Gunung II/16B', 'Surabaya', '', '', '', '', '081 332 195 047', 'd749f109f1bfc50d769c4b1961b38320.jpg', '11', '11', '', '3', '4', '2008-01-09', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('130', '052.07.09', '', 'Yobel Edi Waluyo, S.Th.', 'Kediri', '1987-05-04', '1', '2', '1', 'Donowati 2/16', 'Surabaya', '', '', '', '', '085 733 247 111', '3b5bd37c90f6838c1dfbbdaac555e392.jpg', '11', '11', '', '3', '4', '2009-04-13', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('131', '133.01.13', '', 'Agustinus, S.Th.', 'Tuban', '1983-10-27', '1', '2', '1', 'Tubanan Baru C25', 'Surabaya', '', '', '', '', '', '7f5e35871204e695b278e26012602aed.jpg', '13', '11', '', '3', '4', '2013-07-01', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('132', '182.01.14', '', 'Anastasia Ratna Handayani, S.Pd.', 'Malang', '1975-05-13', '2', '2', '1', 'Simorejo 26', 'Surabaya', '', '', '', '', '0856 4630 0513', '', '13', '11', '', '9', '4', '2014-08-11', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('133', '201.01.14', '', 'Benny Edward Goodman, B.A.', 'Amerika', '1967-08-17', '1', '2', '1', 'Peneleh 3/54', 'Surabaya', '', '', '', '', '', 'f7031bcb28e95a47edad69b83fc83d4f.jpg', '13', '11', '', '9', '4', '2014-10-21', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('134', '202.01.15', '', 'Cherry Lou P. Cunanan, B.Sc.', 'Filipina', '1975-05-15', '2', '2', '2', '', '', '', '', '', '', '', '3679043986ac4b982e469e9e9ad8381c.jpg', '13', '11', '', '9', '4', '2015-01-15', '0000-00-00', '2016-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('135', '068.06.08', '', 'Danang Panca, S.T.', 'Sidoarjo', '1976-09-06', '1', '2', '1', 'Jl. Suningrat 39 Ketegan', 'Sidoarjo', '', '', '', '', '085 648 053 910', '5a5aa342315b71893814a4a22073f168.jpg', '13', '11', '', '3', '4', '2006-01-03', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('136', '006.06.04', '', 'Desy Yovitaningsih, S.T.', 'Surabaya', '1978-12-22', '2', '2', '1', 'Ketintang Timur PTT 2/24', 'Surabaya', '', '', '', '', '081 332 532 848', 'cc5160c7e5646035a0ef1925b010af89.jpg', '13', '14', '', '3', '4', '2004-05-24', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('137', '200.01.14', '', 'Elena Ose Dionisio, B.SEd', 'Filipina', '1975-06-09', '2', '2', '2', '', '', '', '', '', '', '085 852 409 608', 'f85d1e1c0116c9b21332cf2024134d01.jpg', '13', '11', '', '9', '4', '2014-07-07', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('138', '174.01.14', '', 'Erafid Moardhika, S.Pd.', 'Surabaya', '1986-05-15', '1', '2', '1', 'Perum Taman Sejahtera, Jl. Karang Klumprik Utara C-7 Wiyung', 'Surabaya', '', '', '', '', '088 135 213 69', '', '13', '11', '', '9', '4', '2014-07-07', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('139', '198.01.14', '', 'Herman Sionosa, B.Sc.', 'Filipina', '1973-12-28', '1', '2', '1', '', '', '', '', '', '', '082 233 989 138', '', '13', '11', '', '9', '4', '2014-01-07', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('140', '043.06.09', '', 'Kartika, S.Th., M.M.', 'Surabaya', '1987-09-05', '2', '2', '1', 'Wonorejo Permai Selatan 4/CC-277', 'Surabaya', '', '', '', '', '081 938 082 081', '', '13', '15', '', '3', '5', '2009-06-15', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('141', '195.01.13', '', 'Larmy Judan, B.SEd.', 'Filipina', '1976-11-04', '2', '2', '1', '', '', '', '', '', '', '081 803 128 634', '', '13', '11', '', '9', '4', '2013-06-21', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('142', '199.01.14', '', 'Liberty Sionosa, B.SEd.', 'Filipina', '1972-06-12', '2', '2', '1', '', '', '', '', '', '', '082 233 989 168', '', '19', '16', '', '9', '4', '2014-01-07', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('143', '139.01.13', '', 'Massa Simon Wachju Noegroho, S.Pd.', 'Surabaya', '1970-07-17', '1', '3', '1', 'Griya Kebraon Utara AG/28', 'Surabaya', '', '', '', '', '081 216 337 336', '1d0c69cd24d4bb631c58247ab70f1891.jpg', '13', '11', '', '3', '4', '2013-07-01', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('144', '164.03.14', '', 'Merlin Tristano, B.S.', 'Surabaya', '1981-05-03', '2', '2', '2', 'Raya Darmo Permai 3/12', 'Surabaya', '', '', '', '', '089 839 915 43', '', '13', '11', '', '9', '4', '2014-04-01', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('145', '036.06.07', '', 'Naomi Setianingtyas, S.Th.', 'Kediri', '1981-12-01', '2', '2', '1', 'Manukan Tirto IV Blok 22 J/13', 'Surabaya', '', '', '', '', '081 252 763 131', '5caef460dc9799b843d59a5c84e3f749.jpg', '13', '11', '', '3', '4', '2007-09-03', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('146', '196.01.13', '', 'Reynaldo C Masanguid, B,SEd.', 'Filipina', '1976-10-20', '1', '2', '1', '', '', '', '', '', '', '087 751 081 924', '', '13', '11', '', '9', '4', '2013-06-21', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('147', '138.01.13', '', 'Richard Aprianus Manullang, S.E.', 'Surabaya', '1988-04-04', '1', '2', '2', 'Candi Lontar Lor 44-S/36', 'Surabaya', '', '', '', '', '082 141 133 400', '8e62036ed1cfef737e46d85599eb916d.jpg', '13', '14', '', '3', '4', '2013-07-01', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('148', '023.06.06', '', 'Sri Mulyati Widiyani, S.S., M.M.', 'Jombang', '1978-08-09', '2', '2', '2', 'Pakis Tirtosari 3/4', 'Surabaya', '', '', '', '', '081 252 220 91', '', '13', '13', '', '3', '5', '2005-07-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('149', '187.01.14', '', 'Stephen Piere Evan, S.Pd.', 'Sidoarjo', '1991-05-22', '1', '3', '2', 'Durian III/E.490 Pondok Tjandra Indah', '', '', '', '', '', '089 676 438 421', '487272295b42d8cc9fc919cd44506069.jpg', '13', '11', '', '9', '4', '2014-10-14', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('150', '098.01.11', '', 'Tang Chu Kean, B.A.', 'Kedah, Malaysia', '1978-03-12', '1', '2', '1', 'Regency 21, Blok D-15, Arif Rahman Hakim 138 - 142', 'Surabaya', '', '', '', '', '087 852 801 595', '', '13', '36', '', '9', '4', '2011-07-11', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('151', '197.01.13', '', 'Yong Boon Kok, B.Sc. MTM', '', '1968-02-16', '1', '-', '1', 'Manyar Kertoadi 99', 'Surabaya', '', '', '', '', '081 852 9390', '', '13', '11', '', '9', '5', '2013-12-02', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('152', '107.02.14', '', 'Albertus Dicky Sudarmadji, S.Sn.', 'Surabaya', '1988-07-15', '1', '2', '2', 'Praban Wetan V/1', 'Surabaya', '', '', '', '', '0853 5368 6808', '', '31', '21', '', '3', '4', '2011-01-05', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('153', '145.02.13', '', 'Anastasia Marieta Angela', 'Surabaya', '1988-03-02', '2', '3', '1', 'Pakis Gunung IA/03', 'Surabaya', '', '', '', '', '081 232 248 819', 'b7fbe60bf426727e309a70fe536d6c32.jpg', '9', '19', '', '3', '3', '2013-07-22', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('154', '181.02.14', '', 'Betti Kristina Kwalrakun, S.H.', 'Surabaya', '1986-05-18', '2', '2', '1', 'Manukan Wasono VI/6', 'Surabaya', '', '', '', '', '082 233 344 992', '', '13', '19', '', '9', '4', '2014-08-06', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('155', '108.02.12', '', 'Christine Fany T., S.E.', 'Surabaya', '1991-06-22', '2', '2', '2', 'Dukuh Pakis III Taman Makam Pahlawan/56', 'Surabaya', '', '', '', '', '085 732 103 940', 'ccb8fdd848003e015c068fec848cb44e.jpg', '17', '25', '', '3', '4', '2011-01-17', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('156', '123.02.12', '', 'Christine Hartanti', 'Surabaya', '1989-05-03', '2', '2', '2', 'Larangan Mega Asri IX/C-75', 'Sidoarjo', '', '', '', '', '', '', '18', '26', '', '3', '3', '2012-05-28', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('157', '188.02.14', '', 'Christine Irawan, S.E.', 'Surabaya', '1991-04-01', '2', '2', '2', 'Simpang Darmo Permai Selatan V/18', 'Surabaya', '', '', '', '', '081 703 001 350', '24e0fa6e7df45699723e8f111154529b.jpg', '17', '25', '', '9', '4', '2014-12-01', '0000-00-00', '2015-11-30', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('158', '113.02.12', '', 'Danang Tri Saputro', 'Surabaya', '1982-04-23', '2', '2', '2', 'Dukuh Kupang Barat XXXI/17B', 'Surabaya', '', '', '', '', '081 330 007 090', '', '20', '35', '', '3', '3', '2012-06-18', '0000-00-00', '0000-00-00', '5', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('159', '168.02.14', '', 'Desi Nawangwulan, A.Md.', 'Surabaya', '1973-12-12', '2', '2', '1', 'Simo Kwagean 44', 'Surabaya', '', '', '', '', '088 837 746 01', '', '17', '25', '', '9', '9', '2014-07-07', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('160', '085.07.10', '', 'Erik Indra Arlianto', 'Surabaya', '1983-04-30', '1', '2', '1', 'Pradah Permai 2/6', 'Surabaya', '', '', '', '', '081 330 119 813', '', '17', '25', '', '3', '3', '2010-09-20', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('161', '114.02.12', '', 'Firmansyah Novianus', 'Surabaya', '1980-11-14', '1', '2', '1', 'Kedung Anyar 2 No. 52', 'Surabaya', '', '', '', '', '', '', '20', '23', '', '9', '3', '2012-06-18', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('162', '118.02.12', '', 'Johannes Ferry, A.Md.', 'Surabaya', '1977-09-03', '1', '2', '1', 'Siwalankerto Selatan II/31', 'Surabaya', '', '', '', '', '', '', '20', '38', '', '3', '9', '2012-08-06', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('163', '176.02.14', '', 'Ketut Tanto Dharma Putra Sandjaja, S.E.', 'Surabaya', '1983-06-29', '1', '2', '1', 'Darmo Indah Selatan Blok WW No. 29', 'Surabaya', '', '', '', '', '', '', '17', '25', '', '9', '4', '2014-07-16', '0000-00-00', '2015-07-17', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('164', '189.02.14', '', 'Liliswati, S.E.', 'Surabaya', '1978-09-27', '2', '2', '2', 'Menganti Babatan V no. 18', 'Surabaya', '', '', '', '', '081 331 015 654', '6bf90d1fb7dabbbe075800e54fa0b33c.jpg', '17', '25', '', '9', '4', '2014-12-01', '0000-00-00', '2015-11-30', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('165', '050.07.08', '', 'Lucia Wiwik', 'Surabaya', '1970-10-18', '2', '2', '1', 'Jagir Sidomukti 3/49', 'Surabaya', '', '', '', '', '', '', '11', '19', '', '3', '3', '2008-11-19', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('166', '122.02.12', '', 'Maryeta Pramesti Purbarini, S.Ak.', 'Kediri', '1985-04-03', '2', '2', '2', '', '', '', '', '', '', '', '', '17', '39', '', '3', '4', '2012-12-03', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('167', '058.07.09', '', 'Melfa Sinaga, A.Md.', 'Sibaganding', '1987-05-24', '2', '2', '2', 'Gubeng Kertajaya IV A/38', 'Surabaya', '', '', '', '', '', '', '11', '24', '', '3', '9', '2009-07-06', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('168', '142.02.13', '', 'Neria Indah Wiliyanti, S.Psi', 'Kediri', '1981-05-23', '2', '2', '2', 'Petemon IIA No. 29 B', 'Surabaya', '', '', '', '', '08563320447', '6284c8140f1b0cc57a30b4ba3a1c3517.jpg', '18', '26', '', '3', '4', '2013-07-01', '0000-00-00', '0000-00-00', '5', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('169', '051.07.09', '', 'Nicky Melissa Olivia, Sm. Th.', 'Rumbai, Pekanbaru', '1983-05-19', '2', '2', '1', '', '', '', '', '', '', '', '', '13', '19', '', '3', '8', '2009-01-05', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('170', '117.02.12', '', 'Nursuwenik', 'Surabaya', '1965-12-12', '2', '2', '1', 'Dukuh Setro 3/67', 'Surabaya', '', '', '', '', '', 'c4a3bd9c76a43973293a20482cc029c5.jpg', '20', '27', '', '3', '-', '2012-07-02', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('171', '149.02.14', '', 'Pujiati', 'Nagnjuk', '1974-08-15', '2', '2', '1', 'Darmo Indah Barat 3/B-23', 'Surabaya', '', '', '', '', '081 217 645 577', '67cb4b75701745c9d324f3a933e88f25.jpg', '20', '17', '', '3', '7', '2014-01-06', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('172', '186.02.14', '', 'Reski Trya Putri, A.Md.', 'Malang', '1991-12-15', '2', '2', '2', 'Dusun Kopral, Desa Sukowilangun RT 45 RW 07, Kecamatan Kalipare, Kabupaten Malang', '', '', '', '', '', '085 755 237 073', '', '20', '33', '', '9', '9', '2014-09-01', '0000-00-00', '2015-11-30', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('173', '143.02.13', '', 'Sarita Antonia Goenawan', 'Surabaya', '1991-04-08', '2', '2', '2', 'Graha Family R-39', 'Surabaya', '', '', '', '', '081 133 426 89', '', '19', '40', '', '9', '4', '2014-08-11', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('174', '124.02.13', '', 'Sucipto', 'Kediri', '1985-12-20', '1', '2', '1', 'Sangihe No. 2B, Desa Gedangsewu, Pare-Kediri', '', '', '', '', '', '', '9594e17bf07633d0a649e5ab69a0fb3f.jpg', '20', '41', '', '9', '3', '2013-01-07', '0000-00-00', '2015-05-07', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('175', '177.02.14', '', 'Soemiati', 'Surabaya', '1962-04-25', '2', '1', '1', 'Krukah Utara 9-B/3', 'Surabaya', '', '', '', '', '', '', '20', '28', '', '-', '-', '2015-01-27', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('176', '101.02.12', '', 'Sumining', 'Nagnjuk', '1974-01-13', '2', '1', '1', 'Kalibokor II/31D', '', '', '', '', '', '', '', '20', '28', '', '3', '-', '2015-01-27', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('177', '087.09.10', '', 'Suprapto', 'Tuban', '1972-08-13', '1', '1', '1', '', '', '', '', '', '', '', '', '20', '23', '', '3', '-', '2010-10-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('178', '125.02.13', '', 'Susilo', 'Tuban', '1988-12-02', '1', '1', '2', '', '', '', '', '', '', '', '', '20', '23', '', '9', '3', '2013-02-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('179', '005.07.04', '', 'Suyati', 'Madiun', '1985-08-01', '2', '1', '1', 'Donowati Gg. II No. 65', 'Surabaya', '', '', '', '', '', 'd7d01fc0a51e50116f19d20994197577.jpg', '20', '27', '', '3', '3', '2015-01-27', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('180', '084.04.11', '', 'Theresia Indrawati, S.Pd.', 'Surabaya', '1977-03-27', '2', '2', '1', 'Lebak Permai 1/5', 'Surabaya', '', '', '', '', '', '', '-', '32', '', '3', '4', '2011-04-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('181', '152.02.14', '', 'Trinining Sulistyowati', 'Surabaya', '1975-12-01', '2', '2', '1', 'Palem Pertiwi Regency JD 12A, Menganti', 'Gresik', '', '', '', '', '', '', '20', '31', '', '9', '3', '2014-03-10', '0000-00-00', '2015-07-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('182', '150.02.14', '', 'Wanda Lesar', 'Manado', '1973-08-30', '2', '2', '1', 'Wiguna Selatan II/23', 'Surabaya', '', '', '', '', '085 855 181 814', '', '20', '37', '', '3', '3', '2014-02-10', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('183', '110.02.12', '', 'Yohana Titis Wahyu Andayani, S.Kom.', 'Surabaya', '1979-07-02', '2', '2', '1', 'Gayungsari Barat 12 GA-02', 'Surabaya', '', '', '', '', '', '', '33', '42', '', '3', '4', '2011-08-01', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('184', '179.02.14', '', 'Yoppie Azhi Asmara', 'Surabaya', '1987-05-13', '1', '2', '2', 'Jalan Sedati Agung I No. 80 RT 04/ RW 02, Ds. Sedati Agung Kec. Sedati-Kab. Sidoarjo', '', '', '', '', '', '', '', '20', '30', '', '9', '3', '2014-07-21', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('185', '038.07.07', '', 'Yudha Anggara Putra Perdana', 'Kediri', '1986-06-14', '1', '2', '1', 'Sepawon RT 002 RW 003 Ds. Sepawon Kediri', '', '', '', '', '', '', '4cc9b2a8d5824895b9bd503e2f283c94.jpg', '20', '41', '', '3', '3', '2007-07-10', '0000-00-00', '0000-00-00', '6', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for hrd_kelamin
-- ----------------------------
DROP TABLE IF EXISTS `hrd_kelamin`;
CREATE TABLE `hrd_kelamin` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `kelamin` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_kelamin
-- ----------------------------
INSERT INTO `hrd_kelamin` VALUES ('1', 'Laki-laki');
INSERT INTO `hrd_kelamin` VALUES ('2', 'Perempuan');

-- ----------------------------
-- Table structure for hrd_m_agama
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_agama`;
CREATE TABLE `hrd_m_agama` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agama` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_agama
-- ----------------------------
INSERT INTO `hrd_m_agama` VALUES ('1', 'Islam', '0', '');
INSERT INTO `hrd_m_agama` VALUES ('2', 'Kristen', '0', '');
INSERT INTO `hrd_m_agama` VALUES ('3', 'Nasrani', '0', '');
INSERT INTO `hrd_m_agama` VALUES ('4', 'Hindu', '0', '');
INSERT INTO `hrd_m_agama` VALUES ('5', 'Budha', '0', '');

-- ----------------------------
-- Table structure for hrd_m_bagian
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_bagian`;
CREATE TABLE `hrd_m_bagian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bagian` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_bagian
-- ----------------------------
INSERT INTO `hrd_m_bagian` VALUES ('1', 'Akademik', '0', 'Guru, mentor, dan staff pegajar');
INSERT INTO `hrd_m_bagian` VALUES ('2', 'Non Akademik', '0', 'Staff umum, dan bagian lain');

-- ----------------------------
-- Table structure for hrd_m_dokumen
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_dokumen`;
CREATE TABLE `hrd_m_dokumen` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dokumen` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `reminder` int(11) NOT NULL DEFAULT '30',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_dokumen
-- ----------------------------
INSERT INTO `hrd_m_dokumen` VALUES ('1', 'VISA', '0', '30', '');

-- ----------------------------
-- Table structure for hrd_m_jenistraining
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_jenistraining`;
CREATE TABLE `hrd_m_jenistraining` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenistraining` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_jenistraining
-- ----------------------------
INSERT INTO `hrd_m_jenistraining` VALUES ('1', 'Inhouse', '0', '');
INSERT INTO `hrd_m_jenistraining` VALUES ('2', 'Outsource', '0', '');

-- ----------------------------
-- Table structure for hrd_m_kelompok
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_kelompok`;
CREATE TABLE `hrd_m_kelompok` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_kelompok
-- ----------------------------
INSERT INTO `hrd_m_kelompok` VALUES ('1', 'Lokal', '0', '');
INSERT INTO `hrd_m_kelompok` VALUES ('2', 'Ekspatriat', '0', '');

-- ----------------------------
-- Table structure for hrd_m_keluarga
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_keluarga`;
CREATE TABLE `hrd_m_keluarga` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keluarga` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_keluarga
-- ----------------------------
INSERT INTO `hrd_m_keluarga` VALUES ('1', 'Ayah', '0', '');
INSERT INTO `hrd_m_keluarga` VALUES ('2', 'Ibu', '0', '');
INSERT INTO `hrd_m_keluarga` VALUES ('3', 'Suami', '0', '');
INSERT INTO `hrd_m_keluarga` VALUES ('4', 'Istri', '0', '');
INSERT INTO `hrd_m_keluarga` VALUES ('5', 'Anak', '0', '');

-- ----------------------------
-- Table structure for hrd_m_marital
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_marital`;
CREATE TABLE `hrd_m_marital` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `marital` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_marital
-- ----------------------------
INSERT INTO `hrd_m_marital` VALUES ('1', 'Belum menikah', '0', '');
INSERT INTO `hrd_m_marital` VALUES ('2', 'Menikah', '0', '');
INSERT INTO `hrd_m_marital` VALUES ('3', 'Duda / Janda', '0', '');

-- ----------------------------
-- Table structure for hrd_m_posisi
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_posisi`;
CREATE TABLE `hrd_m_posisi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `posisi` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_posisi
-- ----------------------------
INSERT INTO `hrd_m_posisi` VALUES ('1', 'HRD', '0', '');
INSERT INTO `hrd_m_posisi` VALUES ('2', 'General Staff', '0', '');
INSERT INTO `hrd_m_posisi` VALUES ('3', 'Humas', '0', '');
