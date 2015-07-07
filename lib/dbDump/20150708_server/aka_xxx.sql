/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2015-07-08 04:24:51
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_alumni
-- ----------------------------
INSERT INTO `aka_alumni` VALUES ('1', '1', '1', '');

-- ----------------------------
-- Table structure for aka_angkatan
-- ----------------------------
DROP TABLE IF EXISTS `aka_angkatan`;
CREATE TABLE `aka_angkatan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `angkatan` varchar(10) NOT NULL,
  `departemen` int(10) unsigned NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `FK_angkatan_departemen` (`departemen`),
  KEY `IX_angkatan_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_angkatan
-- ----------------------------
INSERT INTO `aka_angkatan` VALUES ('1', '2013', '1', '1', 'Tahun Ajaran 2013-2014', '2014-01-22 23:49:16');
INSERT INTO `aka_angkatan` VALUES ('2', '2014', '1', '1', 'Tahun Ajaran 2014-2015', '2014-03-19 04:34:07');
INSERT INTO `aka_angkatan` VALUES ('3', '2013', '2', '1', 'Tahun Ajaran 2013-2014', '2014-03-19 04:34:45');
INSERT INTO `aka_angkatan` VALUES ('4', '2014', '2', '1', 'Tahun Ajaran 2014-2015', '2014-03-19 04:35:00');
INSERT INTO `aka_angkatan` VALUES ('5', '2013', '3', '1', 'Tahun Ajaran 2013-2014', '2014-03-19 04:35:20');
INSERT INTO `aka_angkatan` VALUES ('6', '2014', '3', '1', 'Tahun Ajaran 2014-2015', '2014-03-19 04:35:34');
INSERT INTO `aka_angkatan` VALUES ('7', '2015', '1', '1', 'Tahun Ajaran 2015-2016', '2014-11-28 23:55:59');
INSERT INTO `aka_angkatan` VALUES ('8', '2016', '1', '1', 'Tahun Ajaran 2016-2017', '2015-01-28 08:53:00');
INSERT INTO `aka_angkatan` VALUES ('11', '2015', '3', '1', 'Tahun Ajaran 2015-2015 (epiii)', '2015-02-03 09:48:42');

-- ----------------------------
-- Table structure for aka_aspekpenilaian
-- ----------------------------
DROP TABLE IF EXISTS `aka_aspekpenilaian`;
CREATE TABLE `aka_aspekpenilaian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aspekpenilaian` varchar(50) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_dasarpenilaian_replid` (`replid`),
  KEY `IX_dasarpenilaian_ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_aspekpenilaian
-- ----------------------------

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
-- Table structure for aka_grading
-- ----------------------------
DROP TABLE IF EXISTS `aka_grading`;
CREATE TABLE `aka_grading` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guru` int(10) unsigned NOT NULL,
  `tingkat` int(10) unsigned NOT NULL,
  `pelajaran` int(10) unsigned NOT NULL,
  `aspekpenilaian` int(10) unsigned NOT NULL,
  `nmin` decimal(6,1) NOT NULL,
  `nmax` decimal(6,1) NOT NULL,
  `grading` varchar(2) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `FK_aturangrading_pegawai` (`guru`),
  KEY `FK_aturangrading_tingkat` (`tingkat`),
  KEY `FK_aturangrading_pelajaran` (`pelajaran`),
  KEY `FK_aturangrading_dasarpenilaian` (`aspekpenilaian`),
  KEY `IX_aturangrading_ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_grading
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
-- Table structure for aka_guru
-- ----------------------------
DROP TABLE IF EXISTS `aka_guru`;
CREATE TABLE `aka_guru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `kode` varchar(3) NOT NULL,
  `pegawai` int(10) unsigned NOT NULL DEFAULT '0',
  `pelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_guru_pegawai` (`pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_guru
-- ----------------------------
INSERT INTO `aka_guru` VALUES ('1', '1', '', '55', '3', '1', '');
INSERT INTO `aka_guru` VALUES ('2', '1', '', '145', '4', '1', '');
INSERT INTO `aka_guru` VALUES ('3', '1', '', '54', '1', '1', '');
INSERT INTO `aka_guru` VALUES ('4', '1', '', '78', '2', '1', '');
INSERT INTO `aka_guru` VALUES ('5', '1', '', '18', '7', '1', '');
INSERT INTO `aka_guru` VALUES ('12', '2', '', '133', '9', '1', 'benny - en');
INSERT INTO `aka_guru` VALUES ('13', '3', '', '158', '10', '1', 'dan - eng');
INSERT INTO `aka_guru` VALUES ('14', '1', '', '124', '6', '1', '');
INSERT INTO `aka_guru` VALUES ('15', '3', '', '152', '10', '1', 'INGG - ALBERT - 107.');

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
-- Table structure for aka_kelas
-- ----------------------------
DROP TABLE IF EXISTS `aka_kelas`;
CREATE TABLE `aka_kelas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelas` varchar(100) NOT NULL,
  `tahunajaran` int(10) unsigned NOT NULL,
  `tingkat` int(10) unsigned NOT NULL,
  `kapasitas` int(10) unsigned NOT NULL DEFAULT '0',
  `wali` int(10) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `FK_kelas_pegawai` (`wali`),
  KEY `IX_kelas_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_kelas
-- ----------------------------
INSERT INTO `aka_kelas` VALUES ('5', 'PG-A1', '1', '4', '15', '2', '', '2014-03-19 11:46:25');
INSERT INTO `aka_kelas` VALUES ('6', 'PG-A2', '1', '4', '15', '0', '', '2014-03-19 11:50:19');
INSERT INTO `aka_kelas` VALUES ('7', 'PG-A3', '1', '4', '15', '2', '', '2014-03-19 11:50:40');
INSERT INTO `aka_kelas` VALUES ('8', 'PG-A4', '1', '4', '15', '2', '', '2014-03-19 11:50:53');
INSERT INTO `aka_kelas` VALUES ('9', 'KG-A1', '1', '5', '18', '2', '', '2014-03-19 11:51:30');
INSERT INTO `aka_kelas` VALUES ('10', 'KG-A2', '1', '5', '18', '0', '', '2014-03-19 11:51:44');
INSERT INTO `aka_kelas` VALUES ('11', 'KG-A3', '1', '5', '18', '2', '', '2014-03-19 11:51:56');
INSERT INTO `aka_kelas` VALUES ('12', 'KG-A4', '1', '5', '18', '2', '', '2014-03-19 11:52:06');
INSERT INTO `aka_kelas` VALUES ('13', 'P-1A', '1', '6', '24', '2', '', '2014-03-19 11:52:39');
INSERT INTO `aka_kelas` VALUES ('14', 'P-1B', '1', '6', '24', '0', '', '2014-03-19 11:52:54');
INSERT INTO `aka_kelas` VALUES ('15', 'P-1C', '1', '6', '24', '2', '', '2014-03-19 11:53:10');
INSERT INTO `aka_kelas` VALUES ('16', 'P-1D', '1', '6', '24', '2', '', '2014-03-19 11:53:23');
INSERT INTO `aka_kelas` VALUES ('17', 'P-2A', '1', '6', '24', '2', '', '2014-03-19 11:53:54');
INSERT INTO `aka_kelas` VALUES ('18', 'P-2B', '1', '6', '24', '2', '', '2014-03-19 11:54:08');
INSERT INTO `aka_kelas` VALUES ('19', 'P-2C', '1', '6', '24', '2', '', '2014-03-19 11:54:26');
INSERT INTO `aka_kelas` VALUES ('20', 'P-2D', '1', '6', '24', '2', '', '2014-03-19 11:54:38');
INSERT INTO `aka_kelas` VALUES ('21', 'P-3A', '1', '6', '24', '2', '', '2014-03-19 11:54:55');
INSERT INTO `aka_kelas` VALUES ('22', 'P-3B', '1', '6', '24', '2', '', '2014-03-19 11:55:05');
INSERT INTO `aka_kelas` VALUES ('23', 'P-3C', '1', '6', '24', '2', '', '2014-03-19 11:55:15');
INSERT INTO `aka_kelas` VALUES ('24', 'P-3D', '1', '6', '24', '2', '', '2014-03-19 11:55:26');
INSERT INTO `aka_kelas` VALUES ('25', 'PG-A1', '3', '11', '15', '3', '', '2014-03-19 11:58:23');
INSERT INTO `aka_kelas` VALUES ('26', 'PG-A2', '3', '11', '15', '0', '', '2014-03-19 11:59:03');
INSERT INTO `aka_kelas` VALUES ('27', 'PG-B1', '3', '11', '15', '0', '', '2014-03-19 11:59:19');
INSERT INTO `aka_kelas` VALUES ('28', 'PG-B2', '3', '11', '15', '0', '', '2014-03-19 11:59:31');
INSERT INTO `aka_kelas` VALUES ('29', 'KG-A1', '3', '12', '15', '0', '', '2014-03-19 11:59:50');
INSERT INTO `aka_kelas` VALUES ('30', 'KG-A2', '3', '12', '15', '0', '', '2014-03-19 12:00:01');
INSERT INTO `aka_kelas` VALUES ('31', 'KG-B1', '3', '12', '15', '0', '', '2014-03-19 12:00:16');
INSERT INTO `aka_kelas` VALUES ('32', 'KG-B2', '3', '12', '15', '0', '', '2014-03-19 12:00:28');
INSERT INTO `aka_kelas` VALUES ('33', 'Sec-1A', '1', '7', '24', '1', '', '2014-03-19 12:04:17');
INSERT INTO `aka_kelas` VALUES ('34', 'Sec-1B', '1', '7', '24', '0', '', '2014-03-19 12:04:47');
INSERT INTO `aka_kelas` VALUES ('35', 'Sec-1C', '1', '7', '24', '2', '', '2014-03-19 12:05:04');
INSERT INTO `aka_kelas` VALUES ('36', 'Sec-1D', '1', '7', '24', '2', '', '2014-03-19 12:05:15');
INSERT INTO `aka_kelas` VALUES ('37', 'Sec-2A', '1', '7', '24', '2', '', '2014-03-19 12:05:27');
INSERT INTO `aka_kelas` VALUES ('38', 'Sec-2B', '1', '7', '24', '2', '', '2014-03-19 12:05:39');
INSERT INTO `aka_kelas` VALUES ('39', 'Sec-2C', '1', '7', '24', '2', '', '2014-03-19 12:05:51');
INSERT INTO `aka_kelas` VALUES ('40', 'Sec-2D', '1', '7', '24', '2', '', '2014-03-19 12:06:04');
INSERT INTO `aka_kelas` VALUES ('41', 'Grade 11A', '1', '8', '24', '1', '', '2014-03-19 12:06:31');
INSERT INTO `aka_kelas` VALUES ('43', 'Grade 11B', '1', '8', '24', '0', '', '2014-03-19 12:07:05');
INSERT INTO `aka_kelas` VALUES ('44', 'Grade 11C', '1', '8', '24', '1', '', '2014-03-19 12:07:58');
INSERT INTO `aka_kelas` VALUES ('45', 'Grade 11D', '1', '8', '24', '1', '', '2014-03-19 12:08:13');
INSERT INTO `aka_kelas` VALUES ('46', 'P-1A', '2', '9', '24', '2', '', '2014-03-19 12:08:49');
INSERT INTO `aka_kelas` VALUES ('47', 'P-1B', '2', '9', '24', '0', '', '2014-03-19 12:09:01');
INSERT INTO `aka_kelas` VALUES ('48', 'P-2A', '2', '9', '24', '0', '', '2014-03-19 12:09:17');
INSERT INTO `aka_kelas` VALUES ('49', 'P-2B', '2', '9', '24', '0', '', '2014-03-19 12:09:39');
INSERT INTO `aka_kelas` VALUES ('52', 'P-3A', '2', '9', '24', '0', '', '2014-03-19 12:11:44');
INSERT INTO `aka_kelas` VALUES ('53', 'P-3B', '2', '9', '24', '0', '', '2014-03-19 12:11:59');
INSERT INTO `aka_kelas` VALUES ('54', 'P-4A', '2', '9', '24', '0', '', '2014-03-19 12:12:11');
INSERT INTO `aka_kelas` VALUES ('55', 'P-4B', '2', '9', '24', '0', '', '2014-03-19 12:12:21');
INSERT INTO `aka_kelas` VALUES ('56', 'P-5A', '2', '9', '24', '0', '', '2014-03-19 12:12:30');
INSERT INTO `aka_kelas` VALUES ('57', 'P-5B', '2', '9', '24', '0', '', '2014-03-19 12:12:40');
INSERT INTO `aka_kelas` VALUES ('58', 'P-6A', '2', '9', '24', '0', '', '2014-03-19 12:12:50');
INSERT INTO `aka_kelas` VALUES ('59', 'P-6B', '2', '9', '24', '0', '', '2014-03-19 12:13:02');
INSERT INTO `aka_kelas` VALUES ('60', 'Sec-1A', '2', '10', '24', '2', '', '2014-03-19 12:13:25');
INSERT INTO `aka_kelas` VALUES ('61', 'Sec-1B', '2', '10', '24', '0', '', '2014-03-19 12:13:45');
INSERT INTO `aka_kelas` VALUES ('62', 'Sec-2A', '2', '10', '24', '0', '', '2014-03-19 12:14:01');
INSERT INTO `aka_kelas` VALUES ('63', 'Sec-2B', '2', '10', '24', '0', '', '2014-03-19 12:14:13');
INSERT INTO `aka_kelas` VALUES ('64', 'Sec-3A', '2', '10', '24', '0', '', '2014-03-19 12:14:22');
INSERT INTO `aka_kelas` VALUES ('65', 'Sec-3B', '2', '10', '24', '0', '', '2014-03-19 12:14:34');
INSERT INTO `aka_kelas` VALUES ('66', 'Sec-4A', '2', '10', '24', '0', '', '2014-03-19 12:14:45');
INSERT INTO `aka_kelas` VALUES ('67', 'Sec-4B', '2', '10', '24', '0', '', '2014-03-19 12:14:55');
INSERT INTO `aka_kelas` VALUES ('68', 'Grade 11A', '2', '13', '24', '2', '', '2014-03-19 12:15:49');
INSERT INTO `aka_kelas` VALUES ('69', 'Grade 11B', '2', '13', '24', '0', '', '2014-03-19 12:16:03');
INSERT INTO `aka_kelas` VALUES ('70', 'Grade 12A', '2', '13', '24', '0', '', '2014-03-19 12:16:13');
INSERT INTO `aka_kelas` VALUES ('71', 'Grade 12B', '2', '13', '24', '0', '', '2014-03-19 12:16:24');
INSERT INTO `aka_kelas` VALUES ('72', 'KG-B1', '1', '5', '18', '0', '', '2014-03-19 12:24:56');
INSERT INTO `aka_kelas` VALUES ('73', 'KG-B2', '1', '5', '18', '0', '', '2014-03-19 12:25:09');
INSERT INTO `aka_kelas` VALUES ('74', 'KG-B3', '1', '5', '18', '0', '', '2014-03-19 12:25:21');
INSERT INTO `aka_kelas` VALUES ('75', 'KG-B4', '1', '5', '18', '0', '', '2014-03-19 12:25:33');
INSERT INTO `aka_kelas` VALUES ('76', 'PG-B1', '1', '4', '15', '0', '', '2014-03-19 12:27:14');
INSERT INTO `aka_kelas` VALUES ('77', 'PG-B2', '1', '4', '15', '0', '', '2014-03-19 12:27:25');
INSERT INTO `aka_kelas` VALUES ('78', 'PG-B3', '1', '4', '15', '0', '', '2014-03-19 12:27:35');
INSERT INTO `aka_kelas` VALUES ('79', 'PG-B4', '1', '4', '15', '0', '', '2014-03-19 12:27:46');
INSERT INTO `aka_kelas` VALUES ('81', 'P-4A', '1', '6', '24', '0', '', '2014-03-19 12:31:17');
INSERT INTO `aka_kelas` VALUES ('82', 'P-4B', '1', '6', '24', '0', '', '2014-03-19 12:31:29');
INSERT INTO `aka_kelas` VALUES ('83', 'P-4C', '1', '6', '24', '0', '', '2014-03-19 12:31:39');
INSERT INTO `aka_kelas` VALUES ('84', 'P-4D', '1', '6', '24', '0', '', '2014-03-19 12:31:52');
INSERT INTO `aka_kelas` VALUES ('85', 'P-5A', '1', '6', '24', '0', '', '2014-03-19 12:32:05');
INSERT INTO `aka_kelas` VALUES ('86', 'P-5B', '1', '6', '24', '0', '', '2014-03-19 12:32:18');
INSERT INTO `aka_kelas` VALUES ('87', 'P-5C', '1', '6', '24', '0', '', '2014-03-19 12:32:30');
INSERT INTO `aka_kelas` VALUES ('88', 'P-5D', '1', '6', '24', '0', '', '2014-03-19 12:32:40');
INSERT INTO `aka_kelas` VALUES ('89', 'P-6A', '1', '6', '24', '0', '', '2014-03-19 12:32:52');
INSERT INTO `aka_kelas` VALUES ('90', 'P-6B', '1', '6', '24', '0', '', '2014-03-19 12:33:02');
INSERT INTO `aka_kelas` VALUES ('91', 'P-6C', '1', '6', '24', '0', '', '2014-03-19 12:33:14');
INSERT INTO `aka_kelas` VALUES ('92', 'P-6D', '1', '6', '24', '0', '', '2014-03-19 12:33:29');
INSERT INTO `aka_kelas` VALUES ('93', 'Sec-3A', '1', '7', '24', '0', '', '2014-03-19 12:35:44');
INSERT INTO `aka_kelas` VALUES ('94', 'Sec-3B', '1', '7', '24', '0', '', '2014-03-19 12:35:54');
INSERT INTO `aka_kelas` VALUES ('95', 'Sec-3C', '1', '7', '24', '0', '', '2014-03-19 12:36:05');
INSERT INTO `aka_kelas` VALUES ('96', 'Sec-3D', '1', '7', '24', '0', '', '2014-03-19 12:36:16');
INSERT INTO `aka_kelas` VALUES ('97', 'Sec-4A', '1', '7', '24', '0', '', '2014-03-19 12:36:37');
INSERT INTO `aka_kelas` VALUES ('98', 'Sec-4B', '1', '7', '24', '0', '', '2014-03-19 12:36:48');
INSERT INTO `aka_kelas` VALUES ('99', 'Sec-4C', '1', '7', '24', '0', '', '2014-03-19 12:36:58');
INSERT INTO `aka_kelas` VALUES ('100', 'Sec-4D', '1', '7', '24', '0', '', '2014-03-19 12:37:08');
INSERT INTO `aka_kelas` VALUES ('101', 'Grade 12A', '1', '8', '24', '0', '', '2014-03-19 12:38:08');
INSERT INTO `aka_kelas` VALUES ('102', 'Grade 12B', '1', '8', '24', '0', '', '2014-03-19 12:38:17');
INSERT INTO `aka_kelas` VALUES ('103', 'Grade 12C', '1', '8', '24', '0', '', '2014-03-19 12:38:28');
INSERT INTO `aka_kelas` VALUES ('104', 'Grade 12D', '1', '8', '24', '0', '', '2014-03-19 12:38:40');
INSERT INTO `aka_kelas` VALUES ('105', 'Grade 11A', '5', '16', '100', '5', 'tes bro tlg nnti dhpus lg y', '2015-01-28 16:00:32');

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
-- Table structure for aka_pelajaran
-- ----------------------------
DROP TABLE IF EXISTS `aka_pelajaran`;
CREATE TABLE `aka_pelajaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `skm` float NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_pelajaran
-- ----------------------------
INSERT INTO `aka_pelajaran` VALUES ('1', '1', 'FIS', 'Fisika', '70', '');
INSERT INTO `aka_pelajaran` VALUES ('2', '1', 'MAT', 'Matematika', '70', '');
INSERT INTO `aka_pelajaran` VALUES ('3', '1', 'BIO', 'Biologi', '70', '');
INSERT INTO `aka_pelajaran` VALUES ('4', '1', 'EKO', 'Ekonomi', '65', '');
INSERT INTO `aka_pelajaran` VALUES ('5', '1', 'AGA', 'Agama', '70', '');
INSERT INTO `aka_pelajaran` VALUES ('6', '1', 'KIM', 'Kimia', '70', '');
INSERT INTO `aka_pelajaran` VALUES ('7', '1', 'ENG', 'English', '70', '');
INSERT INTO `aka_pelajaran` VALUES ('8', '2', 'AGA', 'Agama', '70', '');
INSERT INTO `aka_pelajaran` VALUES ('9', '2', 'ENG', 'English', '70', '');
INSERT INTO `aka_pelajaran` VALUES ('10', '3', 'ING', 'Inggris', '0', '');

-- ----------------------------
-- Table structure for aka_penilaian
-- ----------------------------
DROP TABLE IF EXISTS `aka_penilaian`;
CREATE TABLE `aka_penilaian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guru` int(10) unsigned NOT NULL,
  `pelajaran` int(10) unsigned NOT NULL,
  `kelas` int(10) unsigned NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `kkm` float NOT NULL DEFAULT '70',
  `bobot` float NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_penilaian
-- ----------------------------

-- ----------------------------
-- Table structure for aka_rpp
-- ----------------------------
DROP TABLE IF EXISTS `aka_rpp`;
CREATE TABLE `aka_rpp` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guru` int(10) unsigned NOT NULL,
  `tingkat` int(10) unsigned NOT NULL,
  `pelajaran` int(10) unsigned NOT NULL,
  `unit` varchar(100) NOT NULL,
  `deskripsi` text,
  PRIMARY KEY (`replid`),
  KEY `FK_rpp_tingkat` (`tingkat`),
  KEY `FK_rpp_pelajaran` (`pelajaran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_rpp
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
-- Table structure for aka_semester
-- ----------------------------
DROP TABLE IF EXISTS `aka_semester`;
CREATE TABLE `aka_semester` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `tahunajaran` int(10) unsigned NOT NULL,
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `urut` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `FK_semester_departemen` (`tahunajaran`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_semester
-- ----------------------------
INSERT INTO `aka_semester` VALUES ('1', 'Ganjil', '1', '0', 'Juli-Desember', '1');
INSERT INTO `aka_semester` VALUES ('2', 'Genap', '1', '1', 'Januari-Juni', '2');
INSERT INTO `aka_semester` VALUES ('3', 'Ganjil', '2', '0', 'Juli-Desember', '3');
INSERT INTO `aka_semester` VALUES ('4', 'Genap', '2', '1', 'Januari-Juni', '4');
INSERT INTO `aka_semester` VALUES ('5', 'Ganjil', '3', '0', 'Juli-Desember', '5');
INSERT INTO `aka_semester` VALUES ('6', 'Genap', '3', '1', 'Januari-Juni', '6');

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
-- Table structure for aka_siswa
-- ----------------------------
DROP TABLE IF EXISTS `aka_siswa`;
CREATE TABLE `aka_siswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nopendaftaran` varchar(20) NOT NULL,
  `noformulir` varchar(20) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `nis` varchar(100) NOT NULL,
  `nisn` varchar(100) NOT NULL,
  `angkatan` int(10) unsigned NOT NULL DEFAULT '0',
  `panggilan` varchar(30) DEFAULT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `tahunmasuk` int(10) unsigned NOT NULL,
  `sekolahasal` varchar(100) NOT NULL,
  `proses` int(10) unsigned NOT NULL DEFAULT '0',
  `kelompok` int(10) unsigned NOT NULL DEFAULT '0',
  `kriteria` int(10) unsigned NOT NULL DEFAULT '0',
  `golongan` int(10) unsigned NOT NULL DEFAULT '0',
  `suku` int(10) unsigned NOT NULL DEFAULT '0',
  `agama` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
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
  `grup` int(10) unsigned NOT NULL DEFAULT '0',
  `ujian1` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian2` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian3` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rekening` varchar(50) NOT NULL,
  `namabank` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=734 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_siswa
-- ----------------------------
INSERT INTO `aka_siswa` VALUES ('1', 'PSB2013140001', '', 'Dewi Artika Sari', '1001', 'BCD20131001', '1', '', '2', '0', '', '1', '1', '1', '1', '0', '0', '1', '0', 'P', '', '0000-00-00', '', '0', '0', '', '0.0', '0.0', '-', '', '', '', '', '', '', '', '', '', '', '', '', '', '10000000', '10000000', '0', '0', '0', '0', '0', '10000000', '1', '1000000', '0', '0.00', '0.00', '0.00', '2014-01-23 03:25:01', '', '');
INSERT INTO `aka_siswa` VALUES ('2', 'PSB2013140002', '', 'Raden Aditya Putra', '1002', 'BCD20131002', '1', '', '1', '0', '', '1', '1', '1', '1', '0', '0', '1', '0', 'L', '', '0000-00-00', '', '0', '0', '', '0.0', '0.0', '-', '', '', '', '', '', '', '', '', '', '', '', '', '', '10000000', '10000000', '0', '0', '0', '0', '0', '10000000', '1', '1000000', '0', '0.00', '0.00', '0.00', '2014-01-23 03:25:07', '', '');
INSERT INTO `aka_siswa` VALUES ('4', 'PSB2013140003', '', 'Firman Agung Satria', '1003', 'BCD20131003', '1', '', '1', '0', '', '1', '1', '1', '1', '0', '0', '1', '0', 'L', '', '0000-00-00', '', '0', '0', '', '0.0', '0.0', '-', '', '', '', '', '', '', '', '', '', '', '', '', '', '10000000', '10000000', '0', '0', '0', '0', '0', '10000000', '1', '1000000', '0', '0.00', '0.00', '0.00', '2014-01-23 03:25:28', '', '');
INSERT INTO `aka_siswa` VALUES ('5', 'PSB2013140004', '', 'Adinda Irtya Mahardika', '1004', 'BCD20131004', '1', '', '1', '0', '', '1', '1', '1', '1', '0', '0', '1', '0', 'P', '', '0000-00-00', '', '0', '0', '', '0.0', '0.0', '-', '', '', '', '', '', '', '', '', '', '', '', '', '', '10000000', '10000000', '0', '0', '0', '0', '0', '10000000', '1', '1000000', '0', '0.00', '0.00', '0.00', '2014-01-23 03:25:34', '', '');
INSERT INTO `aka_siswa` VALUES ('7', 'PSB2013140005', '', 'Abraham Lionel Sam', '1005', 'BCD20131005', '1', '', '1', '0', '', '1', '1', '1', '1', '0', '0', '1', '0', 'L', '', '0000-00-00', '', '0', '0', '', '0.0', '0.0', '-', '', '', '', '', '', '', '', '', '', '', '', '', '', '10000000', '10000000', '0', '0', '0', '0', '0', '10000000', '1', '1000000', '0', '0.00', '0.00', '0.00', '2014-01-23 03:32:34', '', '');
INSERT INTO `aka_siswa` VALUES ('10', 'PMB2014140001', '', 'Kaitlynn Tiffany L.', '123', '123', '0', '', '1', '0', '', '2', '2', '1', '2', '0', '0', '1', '0', 'P', 'Surabaya', '2012-11-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Delta Raya IV/12 Sidoarjo', '', '0811909765', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '5', '0', '100', '1', '500000', '0', '0.00', '0.00', '0.00', '2014-12-09 03:03:40', '', '');
INSERT INTO `aka_siswa` VALUES ('13', 'PMB2014150138', '', 'tes rungkut', '99', '99', '0', '', '1', '0', '', '3', '5', '1', '1', '0', '0', '1', '0', 'L', '', '0000-00-00', '', '0', '0', '', '0.0', '0.0', '-', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-01-26 06:01:08', '', '');
INSERT INTO `aka_siswa` VALUES ('14', 'PMB2014150141', '', 'Ezell Dean Nugroho', 'P.393', 'P.393', '0', '', '1', '0', '', '2', '25', '1', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2011-11-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Woodland WL 11 / 70 Citraland', '', '03160760758', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-01-26 09:06:15', '', '');
INSERT INTO `aka_siswa` VALUES ('15', 'PMB2014150145', '', 'Jane Evangeline Lee', 'P.394', 'P.394', '0', '', '1', '0', '', '2', '25', '1', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2012-09-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family o-111', '', '0317324653', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-01-26 09:06:30', '', '');
INSERT INTO `aka_siswa` VALUES ('16', 'PMB2014150146', '', 'Kayla Aprillia Tanujaya', 'P.395', 'P.395', '0', '', '1', '0', '', '2', '25', '1', '1', '0', '5', '1', '0', 'P', 'Surabaya', '2012-03-22', '', '0', '0', '', '0.0', '0.0', '-', '', 'Satelit Indah IX / GN-18', '', '0317312413', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-01-26 09:06:40', '', '');
INSERT INTO `aka_siswa` VALUES ('17', 'PMB2014150147', '', 'Luke Caesar Njoto Imanuel', 'P.396', 'P.396', '0', '', '1', '0', '', '2', '25', '1', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2012-05-14', '', '0', '0', '', '0.0', '0.0', '-', '', 'Petemon I / 97', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-01-26 09:06:50', '', '');
INSERT INTO `aka_siswa` VALUES ('18', 'PMB2014150148', '', 'Sean Kennard Sebastian Ho', 'P.397', 'P.397', '0', '', '1', '0', '', '2', '25', '1', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2012-05-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Ngagel Jaya Selatan E-28', '', '0317322771', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-01-26 09:07:00', '', '');
INSERT INTO `aka_siswa` VALUES ('19', 'PMB2014150149', '', 'Trevor Yongnardi', 'P.398', 'P.398', '0', '', '1', '0', '', '2', '25', '1', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2011-10-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Indah Timur G-59', '', '0317311149', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-01-26 09:07:22', '', '');
INSERT INTO `aka_siswa` VALUES ('20', 'PMB2014150150', '', 'Victoria Jolyn Wu', 'P.399', 'P.399', '0', '', '1', '0', '', '2', '25', '1', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2012-07-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Griya Babatan Mukti C-11', '', '0317530363', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-01-26 09:07:31', '', '');
INSERT INTO `aka_siswa` VALUES ('21', 'PMB2014140008', '', 'Sean Kennard Sebastian Ho', '123', '123kpl', '2', '', '1', '0', '', '2', '2', '0', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2012-05-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Ngagel Jaya Selatan E28 Surabaya', '', '085706331688', '', '', '', '', '', '', '', '', '', '14000000', '11304995', '2100000', '595000', '5', '2695005', '0', '11305000', '1', '1000000', '0', '0.00', '0.00', '0.00', '2015-01-27 08:38:20', '', '');
INSERT INTO `aka_siswa` VALUES ('22', 'PMB2014150218', '', 'Abigail Evangelista Hertanto', '599', '0079559673', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-05-11', '', '0', '0', '', '0.0', '0.0', '-', '', 'Manyar Adi 2/3 Sby', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-27 09:00:24', '', '');
INSERT INTO `aka_siswa` VALUES ('23', 'PMB2014150219', '', 'Axel Maynard Abdi', '614', '0075393894', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-06-16', '', '0', '0', '', '0.0', '0.0', '-', '', 'Penjaringan Sari II/40', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-27 09:00:44', '', '');
INSERT INTO `aka_siswa` VALUES ('24', 'PMB2014150220', '', 'Catherine Sharon Ohana Kohartono', '602', '0078712681', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2007-08-13', '', '0', '0', '', '0.0', '0.0', '-', '', 'Dinoyo Tangsi I/20', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-27 09:00:58', '', '');
INSERT INTO `aka_siswa` VALUES ('25', 'PMB2014150221', '', 'Cruz Sia', '617', '0061485435', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-11-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'Galaxy Bumi Permai I-3/12', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-27 09:01:14', '', '');
INSERT INTO `aka_siswa` VALUES ('26', 'PMB2014150222', '', 'Hieronimus Gilbert', '605', '0066889852', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-11-11', '', '0', '0', '', '0.0', '0.0', '-', '', 'Bendul Merisi IX/67', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-27 09:01:31', '', '');
INSERT INTO `aka_siswa` VALUES ('28', 'PMB2014150224', '', 'Jackie Muniaga', '631', '0073774436', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '1', '1', '0', 'L', 'Jakarta', '2007-07-31', '', '0', '0', '', '0.0', '0.0', '-', '', 'Parang Barong 19A', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-27 09:02:12', '', '');
INSERT INTO `aka_siswa` VALUES ('29', 'PMB2014150225', '', 'Jessica', '620', '0067970363', '0', '', '1', '0', '', '3', '5', '1', '1', '0', '5', '1', '0', 'P', 'Surabaya', '2006-12-14', '', '0', '0', '', '0.0', '0.0', '-', '', 'Prapen Indah Timur IV/AA-49', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-01-27 09:02:28', '', '');
INSERT INTO `aka_siswa` VALUES ('30', 'PMB2014150226', '', 'Jesslyn Chrysler Hung', '621', '0075699432', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2007-11-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Sinar Gedangan A-3a, Sda', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-27 09:02:45', '', '');
INSERT INTO `aka_siswa` VALUES ('31', 'PMB2014150227', '', 'Jonathan Jordan Dave', '608', '0073850675', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-05-03', '', '0', '0', '', '0.0', '0.0', '-', '', 'Baruk Tengah XII/CC-107', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-27 09:03:02', '', '');
INSERT INTO `aka_siswa` VALUES ('32', 'PMB2014150233', '', 'Jophelia Christabel Thomas', '609', '0074689377', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2007-09-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Nginden Intan Timur VI / 67', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-27 09:03:18', '', '');
INSERT INTO `aka_siswa` VALUES ('33', 'PMB2014150234', '', 'Joycelyn Kezia', '610', '0079716660', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2007-05-06', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kalikepiting III/17', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-27 09:03:36', '', '');
INSERT INTO `aka_siswa` VALUES ('34', 'PMB2014150235', '', 'Kevin Keane', '625', '0072946412', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-01-30', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kutisari Indah Utara VI/10', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-27 09:03:57', '', '');
INSERT INTO `aka_siswa` VALUES ('35', 'PMB2014150236', '', 'Michelle Dominique', '626', '0078220179', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Balikpapan', '2007-07-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'Panjang Jiwo Permai I - 17', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-27 09:04:11', '', '');
INSERT INTO `aka_siswa` VALUES ('36', 'PMB2014150237', '', 'Ray Thadeus Lee', '612', '0074306295', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-08-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Doho No. 4', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-27 09:04:29', '', '');
INSERT INTO `aka_siswa` VALUES ('37', 'PMB2014150238', '', 'Shannon Audrey', '627', '0074349857', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2007-03-13', '', '0', '0', '', '0.0', '0.0', '-', '', 'Baruk Utara 15/12 ND-117', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-27 09:04:50', '', '');
INSERT INTO `aka_siswa` VALUES ('38', 'PMB2014150239', '', 'Aileen Christy Elysia', '600', '0077420388', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2007-10-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wedoro Regency 19 Waru, Sda', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-27 09:05:19', '', '');
INSERT INTO `aka_siswa` VALUES ('39', 'PMB2014150240', '', 'Beatrice Wiryawan', '615', '0072842803', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2007-04-14', '', '0', '0', '', '0.0', '0.0', '-', '', 'Manyar Tirtoasri 4 /16', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-27 09:05:34', '', '');
INSERT INTO `aka_siswa` VALUES ('40', 'PMB2014150241', '', 'Caitlyn Gunawan', '601', '0078974731', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2007-05-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Medokan Ayu II/O-18', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-27 09:05:46', '', '');
INSERT INTO `aka_siswa` VALUES ('41', 'PMB2014150242', '', 'Christiansen Cruz Adiwinata', '616', '0072550973', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-01-29', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Wiguna Timur Regency 37', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-27 09:06:02', '', '');
INSERT INTO `aka_siswa` VALUES ('42', 'PMB2014150243', '', 'Gabriel Wilson Tejokusumo', '604', '0077372829', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-10-27', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kertajaya Indah VII/II (G 120)', '', '70612238', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-27 09:06:16', '', '');
INSERT INTO `aka_siswa` VALUES ('43', 'PMB2014150244', '', 'Gavriella Angeline', '618', '0073276556', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2007-07-09', '', '0', '0', '', '0.0', '0.0', '-', '', '', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-27 09:06:31', '', '');
INSERT INTO `aka_siswa` VALUES ('45', 'PMB2015150001', '', 'Geraldine Cyrilla Anthony Liem', '99', '212', '6', '', '1', '0', '', '8', '24', '9', '2', '0', '5', '1', '0', 'P', 'Jakarta', '2011-01-27', '', '0', '0', '', '0.0', '0.0', '-', '', 'J. A Suprapto 124 Bojonegoro', '', '0811331409', '', '', '', '', '', '', '', '', '', '7000000', '6650000', '0', '0', '5', '350000', '0', '6650000', '1', '1000000', '0', '0.00', '0.00', '0.00', '2015-01-28 08:49:20', '', '');
INSERT INTO `aka_siswa` VALUES ('46', 'PMB2014150245', '', 'Gemma Ebelina Alexaviere', '603', '0073887430', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2007-01-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Galaxi Bumi Permai TG 2/ 17', '', '5964466', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 01:05:08', '', '');
INSERT INTO `aka_siswa` VALUES ('47', 'PMB2014150247', '', 'Gwyneth Feodora', '619', '0073556114', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-09-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Florence J-5/9, Pakuwon', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 01:05:26', '', '');
INSERT INTO `aka_siswa` VALUES ('48', 'PMB2014150248', '', 'Jason Tungary', '606', '0071895847', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-02-22', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wonorejo Permai Selatan CC-598', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 01:05:48', '', '');
INSERT INTO `aka_siswa` VALUES ('49', 'PMB2014150249', '', 'Jessica Lynn Hartanto', '607', '0074648395', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2007-09-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kutisari Utara VII/38', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 01:06:10', '', '');
INSERT INTO `aka_siswa` VALUES ('50', 'PMB2014150250', '', 'Joel Lois Tanujaya', '622', '0074270572', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-10-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'Anjasmoro Kav. 41 Wistrop, Sda', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 01:06:28', '', '');
INSERT INTO `aka_siswa` VALUES ('51', 'PMB2014150251', '', 'Jonathan Ariel', '623', '0078281714', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Sidoarjo', '2007-02-23', '', '0', '0', '', '0.0', '0.0', '-', '', 'Jemursari XVIII/A-26 Sby', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 01:06:46', '', '');
INSERT INTO `aka_siswa` VALUES ('52', 'PMB2014150252', '', 'Joycelyn Angelica Jap', '624', '0085853988', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-01-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Lebak Arum IV / 23', '', '3890105', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 01:54:20', '', '');
INSERT INTO `aka_siswa` VALUES ('53', 'PMB2014150253', '', 'Kenneth William', '611', '0079667809', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'LA', '2007-04-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Dharmahusada Utara VII/25', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:09:22', '', '');
INSERT INTO `aka_siswa` VALUES ('55', 'PMB2014150255', '', 'Stephan Wibisono', '628', '0072325277', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '1', '1', '0', 'L', 'Surabaya', '2007-09-22', '', '0', '0', '', '0.0', '0.0', '-', '', 'Manyar Kertoarjo VIII/75', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:10:09', '', '');
INSERT INTO `aka_siswa` VALUES ('56', 'PMB2014150256', '', 'Brian Scott Alexander', '501', '0069248716', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2006-08-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Virginia Regency E8-2, Pakuwon City', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:10:49', '', '');
INSERT INTO `aka_siswa` VALUES ('57', 'PMB2014150257', '', 'Charlene Young Cynipta', '488', '0064748420', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '0', '1', '0', 'P', 'Surabaya', '2006-05-06', '', '0', '0', '', '0.0', '0.0', '-', '', 'Manyar Praja III/D-84', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:11:10', '', '');
INSERT INTO `aka_siswa` VALUES ('58', 'PMB2014150258', '', 'Cheryl Wang', '502', '0062476483', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '1', '1', '0', 'P', 'Surabaya', '2006-09-22', '', '0', '0', '', '0.0', '0.0', '-', '', 'Nanas Utara I/18 PCI', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:11:29', '', '');
INSERT INTO `aka_siswa` VALUES ('59', 'PMB2014150259', '', 'Edbert Waskita', '503', '0066584784', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '1', '1', '0', 'L', 'Surabaya', '2006-06-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Medokan Ayu MA I blok O / 39', '', '8720029', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:26:00', '', '');
INSERT INTO `aka_siswa` VALUES ('60', 'PMB2014150260', '', 'Gracia Florentina Witdodo', '504', '0066962738', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-02-16', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wiguna Timur XVIII/30', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:26:19', '', '');
INSERT INTO `aka_siswa` VALUES ('61', 'PMB2014150261', '', 'Grant Amadeus Lee', '493', '0063946843', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Mojokerto', '2006-01-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Doho No. 4', '', '5678948', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:26:38', '', '');
INSERT INTO `aka_siswa` VALUES ('62', 'PMB2014150262', '', 'Gregorius Reynard Sujanto', '494', '0062699871', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-03-06', '', '0', '0', '', '0.0', '0.0', '-', '', 'Nirwana Executive EE-57', '', '8705919', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:26:58', '', '');
INSERT INTO `aka_siswa` VALUES ('63', 'PMB2014150263', '', 'Jason Timothy Dewanto', '507', '0062621153', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-11-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'Galaxy Bumi Permai K3-2', '', '5921301', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:27:28', '', '');
INSERT INTO `aka_siswa` VALUES ('64', 'PMB2014150264', '', 'Jeremy Noel', '508', '0061962242', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-01-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Klampis Harapan III/14', '', '5948369', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:27:46', '', '');
INSERT INTO `aka_siswa` VALUES ('66', 'PMB2014150266', '', 'Marvellius Susanto', '496', '0068552114', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '0', '1', '0', 'L', 'Surabaya', '2006-05-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Prapen Mas AD 25', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:28:24', '', '');
INSERT INTO `aka_siswa` VALUES ('67', 'PMB2014150267', '', 'Richard Kristanto', '497', '0067661794', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-04-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Nirwana Executive CC-411 A', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:28:43', '', '');
INSERT INTO `aka_siswa` VALUES ('68', 'PMB2014150268', '', 'Staceyca Abiel Wibisono', '513', '0065474154', '0', '', '1', '0', '', '3', '5', '1', '1', '0', '5', '1', '0', 'P', 'Surabaya', '2006-05-04', '', '0', '0', '', '0.0', '0.0', '-', '', 'Medokan Ayu Blok MA III -O No. 5', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:28:59', '', '');
INSERT INTO `aka_siswa` VALUES ('69', 'PMB2014150269', '', 'Vanny Valencia', '499', '0061445063', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-02-14', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wiguna Selatan VI/21', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:29:19', '', '');
INSERT INTO `aka_siswa` VALUES ('70', 'PMB2014150270', '', 'Xavio Emanuel Retanubun', '514', '0067362234', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-01-29', '', '0', '0', '', '0.0', '0.0', '-', '', 'Barata Jaya XXI/29', '', '5041211', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:29:45', '', '');
INSERT INTO `aka_siswa` VALUES ('71', 'PMB2014150271', '', 'Cheryl Glinka', '489', '0068498778', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '0', '1', '0', 'P', 'Surabaya', '2006-11-15', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pantai Mentari R 9A', '', '70479642', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:44:29', '', '');
INSERT INTO `aka_siswa` VALUES ('72', 'PMB2014150272', '', 'Dylan Victorio Faith', '490', '0069260674', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '0', '1', '0', 'L', '', '2006-11-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'Rungkut Lor RL 5L/15', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:45:16', '', '');
INSERT INTO `aka_siswa` VALUES ('73', 'PMB2014150273', '', 'Eileen Cynthia Mark', '491', '0066525382', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-10-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kendangsari III / 4A', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:47:13', '', '');
INSERT INTO `aka_siswa` VALUES ('74', 'PMB2014150274', '', 'Francise Rochelle Widodo', '492', '0062206574', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '0', '1', '0', 'P', 'Surabaya', '2006-06-13', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wonorejo Permai Selatan I/64', '', '8722412', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:47:33', '', '');
INSERT INTO `aka_siswa` VALUES ('75', 'PMB2014150275', '', 'Hafizd Dharma Saputra Hardiono', '505', '0066858319', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', '', '2006-10-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'Margono Wongso P // Indahwati', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:47:49', '', '');
INSERT INTO `aka_siswa` VALUES ('76', 'PMB2014150276', '', 'Hellen Septiani Jap', '506', '0069015102', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-09-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Lebak Arum IV / 23', '', '3890105', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:48:34', '', '');
INSERT INTO `aka_siswa` VALUES ('77', 'PMB2014150277', '', 'Jennifer Quinn Santoso', '495', '0062460561', '0', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-04-22', '', '0', '0', '', '0.0', '0.0', '-', '', 'Delta Raya Utara 76, Sda', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:49:00', '', '');
INSERT INTO `aka_siswa` VALUES ('78', 'PMB2014150278', '', 'Jonathan Efant Soeharto', '509', '006354849', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '0', '1', '0', 'L', 'Surabaya', '2006-02-22', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kutisari Indah Utara III/20', '', '8433325', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:50:25', '', '');
INSERT INTO `aka_siswa` VALUES ('79', 'PMB2014150279', '', 'Nicholas Zhu', '510', '0066757947', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2006-06-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pantai Mentari WW-19', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:50:45', '', '');
INSERT INTO `aka_siswa` VALUES ('80', 'PMB2014150280', '', 'Oeitian Verrel Ignatius', '511', '0069883689', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2006-04-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'Apt. Marina Lt.11-2', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:55:08', '', '');
INSERT INTO `aka_siswa` VALUES ('81', 'PMB2014150281', '', 'Richelle Stephanie Notohadipuro', '512', '0069594763', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-06-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Siw Notohadipuro // Lim Agnes', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:56:29', '', '');
INSERT INTO `aka_siswa` VALUES ('82', 'PMB2014150282', '', 'Thea Guntur Kusumanagara', '498', '0065106560', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-08-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Putra Bangsa II/63 Medokan Ayu', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:56:45', '', '');
INSERT INTO `aka_siswa` VALUES ('83', 'PMB2014150283', '', 'Yenlung Calvin Tanusa', '522', '0068725566', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '1', '1', '0', 'L', 'Surabaya', '2006-10-16', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Panjang Jiwo Permai 42', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:56:59', '', '');
INSERT INTO `aka_siswa` VALUES ('84', 'PMB2014150285', '', 'Yoel Camilo Febriyanto', '500', '0068163607', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-02-22', '', '0', '0', '', '0.0', '0.0', '-', '', 'Bumi Marina Emas Barat V/34', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-01-29 06:57:13', '', '');
INSERT INTO `aka_siswa` VALUES ('85', 'PMB2014140010', '', 'Kayla Aprillia Tanujaya', '123', '123', '2', '', '1', '0', '', '2', '2', '0', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2012-04-22', '', '0', '0', '', '0.0', '0.0', '-', '', 'Satelit Indah IX/GN-18', '', '70109151', '', '', '', '', '', '', '', '', '', '66500000', '47381245', '16625000', '2493750', '5', '19118755', '0', '47381300', '1', '1000000', '0', '0.00', '0.00', '0.00', '2015-01-30 01:31:30', '', '');
INSERT INTO `aka_siswa` VALUES ('86', 'PMB2014140009', '', 'Chelsey Felicia Sugianto', '636', '0083339153', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-02-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Satelit Timur II Blok JJ-12', '', '5320745', '', '', '', '', '', '', '', '', '', '37500000', '31875000', '0', '0', '15', '5625000', '0', '31875000', '1', '1700000', '0', '0.00', '0.00', '0.00', '2015-01-30 03:15:55', '', '');
INSERT INTO `aka_siswa` VALUES ('87', 'PMB2014140033', '', 'Kiyora Asami Prasetyo', '690', '0085339120', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', '', '2008-08-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Jl. Tulung Agung 3/39', '', '0817335288', '', '', '', '', '', '', '', '', '', '37500000', '31875000', '0', '0', '15', '5625000', '0', '31875000', '1', '1800000', '0', '0.00', '0.00', '0.00', '2015-01-30 03:16:43', '', '');
INSERT INTO `aka_siswa` VALUES ('88', 'PMB2014140037', '', 'Ferlyne Gabrielly Thie', '660', '0081446708', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '0', '1', '0', 'P', '', '2008-04-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pakuwon Indah the Mansion PF 4 No 8', '', '081357226181', '', '', '', '', '', '', '', '', '', '37500000', '30281250', '0', '1593750', '15', '7218750', '0', '30281300', '1', '1710000', '0', '0.00', '0.00', '0.00', '2015-01-30 03:17:25', '', '');
INSERT INTO `aka_siswa` VALUES ('89', 'PMB2014140038', '', 'Colin Cristo Harianto', '656', '0082453363', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '0', '1', '0', 'L', '', '2008-01-19', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wisata Bukit Mas E3/10', '', '0818372591', '', '', '', '', '', '', '', '', '', '37500000', '31875000', '0', '0', '15', '5625000', '0', '31875000', '1', '1800000', '0', '0.00', '0.00', '0.00', '2015-01-30 03:17:59', '', '');
INSERT INTO `aka_siswa` VALUES ('90', 'PMB2014140039', '', 'Hacken Wunadi', '664', '0087481516', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '0', '1', '0', 'L', '', '2008-09-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family R179A', '', '081233775900', '', '', '', '', '', '', '', '', '', '37500000', '30000000', '0', '0', '20', '7500000', '0', '30000000', '1', '0', '0', '0.00', '0.00', '0.00', '2015-01-30 03:18:36', '', '');
INSERT INTO `aka_siswa` VALUES ('91', 'PMB2014140040', '', 'Josevine Angeline Musa', '688', '0087438069', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '0', '1', '0', 'P', '', '2008-04-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo permai Selatan XI/18', '', '70178869', '', '', '', '', '', '', '', '', '', '37500000', '31875000', '0', '0', '15', '5625000', '0', '3187500', '10', '0', '0', '0.00', '0.00', '0.00', '2015-01-30 03:19:35', '', '');
INSERT INTO `aka_siswa` VALUES ('92', 'PMB2014140041', '', 'Sharon A. Soempiet', '653', '0081874981', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', '', '2008-01-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Royal Residence B3-52A', '', '71227601', '', '', '', '', '', '', '', '', '', '37500000', '30281250', '0', '1593750', '15', '7218750', '0', '7570400', '4', '1710000', '0', '0.00', '0.00', '0.00', '2015-01-30 03:20:17', '', '');
INSERT INTO `aka_siswa` VALUES ('93', 'PMB2014140042', '', 'Michelle Tanaya', '692', '0084544937', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '0', '1', '0', 'P', '', '2008-07-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Jl. Tulung Agung 3/6', '', '59319420', '', '', '', '', '', '', '', '', '', '37500000', '31875000', '0', '0', '15', '5625000', '0', '31875000', '1', '1800000', '0', '0.00', '0.00', '0.00', '2015-01-30 03:20:51', '', '');
INSERT INTO `aka_siswa` VALUES ('94', 'PMB2014140043', '', 'Jenevieve Clairine', '647', '0087851425', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '0', '1', '0', 'P', '', '2008-07-14', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Darmo Harapan II/GG II-C', '', '7317042', '', '', '', '', '', '', '', '', '', '37500000', '31875000', '0', '0', '15', '5625000', '0', '31875000', '1', '1800000', '0', '0.00', '0.00', '0.00', '2015-01-30 03:21:41', '', '');
INSERT INTO `aka_siswa` VALUES ('95', 'PMB2014140044', '', 'Calista Gracious Susanto', '635', '0088407789', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '0', '1', '0', 'P', '', '2008-07-13', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wisata Bukit Indah C1-8', '', '70603754', '', '', '', '', '', '', '', '', '', '37500000', '30281250', '0', '1593750', '15', '7218750', '0', '5046900', '6', '1710000', '0', '0.00', '0.00', '0.00', '2015-01-30 03:22:38', '', '');
INSERT INTO `aka_siswa` VALUES ('96', 'PMB2014140045', '', 'Grace Caroline Cahyono', '683', '0085184842', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '0', '1', '0', 'P', '', '2008-07-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'San Diego M6-28 Pakuwon City', '', '08575506888', '', '', '', '', '', '', '', '', '', '37500000', '31875000', '0', '0', '15', '5625000', '0', '31875000', '1', '1800000', '0', '0.00', '0.00', '0.00', '2015-01-30 03:23:50', '', '');
INSERT INTO `aka_siswa` VALUES ('97', 'PMB2014140046', '', 'Noel Nelson Felix', '693', '0089288765', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '0', '1', '0', 'L', '', '2008-01-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Perum Darmo sentosa Raya Blok i-38', '', '71616111', '', '', '', '', '', '', '', '', '', '37500000', '30000000', '0', '0', '20', '7500000', '0', '30000000', '1', '1800000', '0', '0.00', '0.00', '0.00', '2015-01-30 03:24:23', '', '');
INSERT INTO `aka_siswa` VALUES ('98', 'PMB2014140047', '', 'Filbert Wellington', '641', '0089197385', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '0', '1', '0', 'L', '', '2008-05-14', '', '0', '0', '', '0.0', '0.0', '-', '', 'The Mansion PF-5/22', '', '71047493', '', '', '', '', '', '', '', '', '', '37500000', '30281250', '0', '1593750', '15', '7218750', '0', '30281300', '1', '1710000', '0', '0.00', '0.00', '0.00', '2015-01-30 03:25:23', '', '');
INSERT INTO `aka_siswa` VALUES ('99', 'PMB2014140048', '', 'Ezekiel Shawn Wondo', '680', '0088611332', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '0', '1', '0', 'L', '', '2008-05-04', '', '0', '0', '', '0.0', '0.0', '-', '', 'Centra Park E-19', '', '70597500', '', '', '', '', '', '', '', '', '', '37500000', '31875000', '0', '0', '15', '5625000', '0', '31875000', '1', '1800000', '0', '0.00', '0.00', '0.00', '2015-01-30 03:26:03', '', '');
INSERT INTO `aka_siswa` VALUES ('100', 'PMB2014140051', '', 'Emili Trecia Faustina', '657', '0086021322', '2', '', '1', '0', '', '2', '9', '5', '1', '0', '0', '1', '0', 'P', '', '2008-05-15', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kranggan 102 kav 8', '', '5340131', '', '', '', '', '', '', '', '', '', '37500000', '31875000', '0', '0', '15', '5625000', '0', '31875000', '1', '1800000', '0', '0.00', '0.00', '0.00', '2015-01-30 04:25:27', '', '');
INSERT INTO `aka_siswa` VALUES ('101', 'PMB2014140050', '', 'Fidelia Theodore Chang', '640', '0084672050', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '0', '1', '0', 'P', '', '2008-03-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Hill P-12', '', '081330716553', '', '', '', '', '', '', '', '', '', '37500000', '30281250', '0', '1593750', '15', '7218750', '0', '30281300', '1', '0', '0', '0.00', '0.00', '0.00', '2015-01-30 04:26:19', '', '');
INSERT INTO `aka_siswa` VALUES ('102', 'PMB2014150286', '', 'Adeline Theodora', '471', '0044189694', '3', '', '1', '0', '', '3', '5', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2004-11-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Baruk Barat 3/ B 123', '', '', '', '', '', '', '', '', '', '', '', '11250000', '10687500', '0', '0', '5', '562500', '0', '10687500', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 01:06:44', '', '');
INSERT INTO `aka_siswa` VALUES ('103', 'PMB2014150287', '', 'Bianca Rosarie Ong', '518', '0053861440', '3', '', '1', '0', '', '3', '5', '14', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2005-12-14', '', '0', '0', '', '0.0', '0.0', '-', '', 'Laguna Regency D7/10', '', '', '', '', '', '', '', '', '', '', '', '11250000', '10687500', '0', '0', '5', '562500', '0', '10687500', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 01:07:04', '', '');
INSERT INTO `aka_siswa` VALUES ('104', 'PMB2014150288', '', 'Cynthia Tjahyadi', '472', '0052675110', '3', '', '1', '0', '', '3', '5', '14', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2005-11-25', '', '0', '0', '', '0.0', '0.0', '-', '', 'Jimbaran G1/ 24', '', '', '', '', '', '', '', '', '', '', '', '11250000', '10687500', '0', '0', '5', '562500', '0', '10687500', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 01:08:49', '', '');
INSERT INTO `aka_siswa` VALUES ('106', 'PMB2014150290', '', 'Elvina Waskita Siemjaya', '474', '0042100728', '3', '', '1', '0', '', '3', '5', '14', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2004-12-04', '', '0', '0', '', '0.0', '0.0', '-', '', 'Medokan Ayu MA I Blok O-39', '', '', '', '', '', '', '', '', '', '', '', '11250000', '10687500', '0', '0', '5', '562500', '0', '10687500', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 01:09:28', '', '');
INSERT INTO `aka_siswa` VALUES ('107', 'PMB2014150291', '', 'Gwynne Purnama', '475', '0057266933', '3', '', '1', '0', '', '3', '5', '14', '2', '0', '5', '1', '0', 'P', '', '2005-09-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Rk Panji Makmur D-10, Jl. Panj. Jiwo 46', '', '', '', '', '', '', '', '', '', '', '', '11250000', '10687500', '0', '0', '5', '562500', '0', '10687500', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 01:09:43', '', '');
INSERT INTO `aka_siswa` VALUES ('108', 'PMB2014150292', '', 'Jason Johanes Siwabessi', '476', '0046866603', '3', '', '1', '0', '', '3', '5', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2004-11-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Rajawali 53, Rewin', '', '', '', '', '', '', '', '', '', '', '', '11250000', '10687500', '0', '0', '5', '562500', '0', '10687500', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 01:10:01', '', '');
INSERT INTO `aka_siswa` VALUES ('109', 'PMB2014150293', '', 'Jeremy Philip Dewanto', '477', '0048803803', '3', '', '1', '0', '', '3', '5', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-11-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'Galaxi Bumi Permai K3/ 2', '', '', '', '', '', '', '', '', '', '', '', '11250000', '10687500', '0', '0', '5', '562500', '0', '10687500', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 01:10:16', '', '');
INSERT INTO `aka_siswa` VALUES ('110', 'PMB2014150295', '', 'Jesselyn Christabel Thomas', '478', '0058297055', '3', '', '1', '0', '', '3', '5', '14', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2005-06-29', '', '0', '0', '', '0.0', '0.0', '-', '', 'Nginden Intan Timur VI / 67', '', '', '', '', '', '', '', '', '', '', '', '11250000', '10687500', '0', '0', '5', '562500', '0', '10687500', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 01:14:44', '', '');
INSERT INTO `aka_siswa` VALUES ('111', 'PMB2014150296', '', 'Joel Wilson', '479', '0055829584', '3', '', '1', '0', '', '3', '5', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2009-05-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Ambengan 58', '', '', '', '', '', '', '', '', '', '', '', '11250000', '10687500', '0', '0', '5', '562500', '0', '10687500', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 01:15:03', '', '');
INSERT INTO `aka_siswa` VALUES ('112', 'PMB2014150297', '', 'Kenneth Sujayaputera', '480', '0057713103', '3', '', '1', '0', '', '3', '5', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-04-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Dharmahusada Mas BB-17', '', '', '', '', '', '', '', '', '', '', '', '11250000', '10687500', '0', '0', '5', '562500', '0', '10687500', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 01:15:16', '', '');
INSERT INTO `aka_siswa` VALUES ('113', 'PMB2014150298', '', 'Maedeline Jane Gotama', '481', '0059793480', '3', '', '1', '0', '', '3', '5', '14', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2005-07-04', '', '0', '0', '', '0.0', '0.0', '-', '', 'Purimas Regency B5/6, Rungk. Madya', '', '', '', '', '', '', '', '', '', '', '', '11250000', '10687500', '0', '0', '5', '562500', '0', '10687500', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 01:21:49', '', '');
INSERT INTO `aka_siswa` VALUES ('114', 'PMB2014150299', '', 'Melvern Yeremiah Hartono', '482', '0052992481', '3', '', '1', '0', '', '3', '5', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-07-03', '', '0', '0', '', '0.0', '0.0', '-', '', 'Rungkut Asri Barat V/7', '', '', '', '', '', '', '', '', '', '', '', '11250000', '10687500', '0', '0', '5', '562500', '0', '10687500', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 01:23:15', '', '');
INSERT INTO `aka_siswa` VALUES ('115', 'PMB2014150300', '', 'Mikhael Christalio', '483', '0059336500', '3', '', '1', '0', '', '3', '5', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-11-26', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kutisari Indah Sel. IV/28', '', '8434929', '', '', '', '', '', '', '', '', '', '11250000', '10687500', '0', '0', '5', '562500', '0', '10687500', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 01:23:46', '', '');
INSERT INTO `aka_siswa` VALUES ('116', 'PMB2014150301', '', 'Samuel Abie Maximus', '484', '0054942730', '3', '', '1', '0', '', '3', '5', '14', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2005-01-03', '', '0', '0', '', '0.0', '0.0', '-', '', 'Galaxi Bumi Permai TG 2/ 17', '', '', '', '', '', '', '', '', '', '', '', '11250000', '10687500', '0', '0', '5', '562500', '0', '10687500', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 01:24:00', '', '');
INSERT INTO `aka_siswa` VALUES ('117', 'PMB2014150302', '', 'Tiffany Gracita', '485', '0056531505', '3', '', '1', '0', '', '3', '5', '14', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2005-12-06', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Tirta Akasia 95 Waru', '', '', '', '', '', '', '', '', '', '', '', '11250000', '10687500', '0', '0', '5', '562500', '0', '10687500', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 01:27:11', '', '');
INSERT INTO `aka_siswa` VALUES ('118', 'PMB2014150303', '', 'Andi Cahya Santosa', '264', '0031550431', '3', '', '1', '0', '', '3', '5', '15', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2003-07-19', '', '0', '0', '', '0.0', '0.0', '-', '', 'Rungkut Mapan Tim. IX/ EI - 18', '', '', '', '', '', '', '', '', '', '', '', '7500000', '7125000', '0', '0', '5', '375000', '0', '7125000', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 01:56:32', '', '');
INSERT INTO `aka_siswa` VALUES ('119', 'PMB2014150304', '', 'Ayaka Angela', '284', '0045155535', '3', '', '1', '0', '', '3', '5', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-09-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'Klampis harapan 3/ 14', '', '', '', '', '', '', '', '', '', '', '', '7500000', '7125000', '0', '0', '5', '375000', '0', '7125000', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 01:58:19', '', '');
INSERT INTO `aka_siswa` VALUES ('120', 'PMB2014150305', '', 'Christabelle Serafina', '628', '0045823650', '3', '', '1', '0', '', '3', '5', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-12-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'Jemursari XVIII/A-26 Sby', '', '', '', '', '', '', '', '', '', '', '', '7500000', '7125000', '0', '0', '5', '375000', '0', '7125000', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:01:36', '', '');
INSERT INTO `aka_siswa` VALUES ('121', 'PMB2014150306', '', 'Clement Clint Santoso', '290', '0041739265', '3', '', '1', '0', '', '3', '5', '15', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2004-11-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Delta Raya Ut. 76, Sda', '', '', '', '', '', '', '', '', '', '', '', '7500000', '7125000', '0', '0', '5', '375000', '0', '7125000', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:01:53', '', '');
INSERT INTO `aka_siswa` VALUES ('122', 'PMB2014150307', '', 'Clifford Hans Gotama', '291', '0041739249', '3', '', '1', '0', '', '3', '5', '15', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2004-08-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Purimas Regency B5/6, Rungk. Madya', '', '', '', '', '', '', '', '', '', '', '', '7500000', '7125000', '0', '0', '5', '375000', '0', '7125000', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:02:09', '', '');
INSERT INTO `aka_siswa` VALUES ('123', 'PMB2014150308', '', 'Cliffton Faith', '292', '0041739260', '3', '', '1', '0', '', '3', '5', '15', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2004-10-17', '', '0', '0', '', '0.0', '0.0', '-', '', 'Galaxi Bumi Permai N4/25', '', '5927200', '', '', '', '', '', '', '', '', '', '7500000', '7125000', '0', '0', '5', '375000', '0', '7125000', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:02:28', '', '');
INSERT INTO `aka_siswa` VALUES ('124', 'PMB2014150309', '', 'Debrina Tanesya Jovanka', '293', '0035754470', '3', '', '1', '0', '', '3', '5', '15', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2003-12-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Wisata Tropodo F-10', '', '8672169', '', '', '', '', '', '', '', '', '', '7500000', '7125000', '0', '0', '5', '375000', '0', '7125000', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:05:19', '', '');
INSERT INTO `aka_siswa` VALUES ('125', 'PMB2014150310', '', 'Faustine Janice Kohar', '299', '0041739244', '3', '', '1', '0', '', '3', '5', '14', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-06-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kedung Tarukan 118', '', '5936127', '', '', '', '', '', '', '', '', '', '11250000', '10687500', '0', '0', '5', '562500', '0', '10687500', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:05:33', '', '');
INSERT INTO `aka_siswa` VALUES ('126', 'PMB2014150311', '', 'Ferdinand Nathan Soetedjo', '301', '0041739252', '3', '', '1', '0', '', '3', '5', '15', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2004-09-04', '', '0', '0', '', '0.0', '0.0', '-', '', 'Puri Mas Jl. Pecatu E II / 12', '', '8781437', '', '', '', '', '', '', '', '', '', '7500000', '7125000', '0', '0', '5', '375000', '0', '7125000', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:05:57', '', '');
INSERT INTO `aka_siswa` VALUES ('127', 'PMB2014150312', '', 'Gracelyne Christabel Halim', '306', '0041739240', '3', '', '1', '0', '', '3', '5', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-05-25', '', '0', '0', '', '0.0', '0.0', '-', '', 'Mulyosari I/161', '', '', '', '', '', '', '', '', '', '', '', '7500000', '7125000', '0', '0', '5', '375000', '0', '7125000', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:06:11', '', '');
INSERT INTO `aka_siswa` VALUES ('128', 'PMB2014150313', '', 'Joel Bezaliel Santoso', '312', '0041739263', '3', '', '1', '0', '', '3', '5', '15', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2004-10-21', '', '0', '0', '', '0.0', '0.0', '-', '', '', '', '', '', '', '', '', '', '', '', '', '', '7500000', '7125000', '0', '0', '5', '375000', '0', '7125000', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:06:23', '', '');
INSERT INTO `aka_siswa` VALUES ('129', 'PMB2014150314', '', 'John Felix Wihelmus', '348', '0042771187', '3', '', '1', '0', '', '3', '5', '15', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2004-08-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Nanas Utara I / 30 PCI', '', '', '', '', '', '', '', '', '', '', '', '7500000', '7125000', '0', '0', '5', '375000', '0', '7125000', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:06:37', '', '');
INSERT INTO `aka_siswa` VALUES ('130', 'PMB2014150315', '', 'Kenneshia Aeriel Haryanto', '315', '0041739241', '3', '', '1', '0', '', '3', '5', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-05-26', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kutisari Indah Ut. 4/ 63', '', '', '', '', '', '', '', '', '', '', '', '7500000', '7125000', '0', '0', '5', '375000', '0', '7125000', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:06:49', '', '');
INSERT INTO `aka_siswa` VALUES ('131', 'PMB2014150316', '', 'Kenny Robin Limanjaya', '316', '0041739261', '3', '', '1', '0', '', '3', '5', '15', '2', '0', '1', '1', '0', 'L', 'Surabaya', '2004-10-19', '', '0', '0', '', '0.0', '0.0', '-', '', 'Barata Jaya XV/ 10', '', '', '', '', '', '', '', '', '', '', '', '7500000', '7125000', '0', '0', '5', '375000', '0', '7125000', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:07:03', '', '');
INSERT INTO `aka_siswa` VALUES ('132', 'PMB2014150317', '', 'Sean Francis Xavier Kho', '345', '0027288199', '3', '', '1', '0', '', '3', '5', '15', '2', '0', '4', '1', '0', 'L', 'Australia', '2003-12-03', '', '0', '0', '', '0.0', '0.0', '-', '', 'Jemur Sari 181', '', '', '', '', '', '', '', '', '', '', '', '7500000', '7125000', '0', '0', '5', '375000', '0', '7125000', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:07:18', '', '');
INSERT INTO `aka_siswa` VALUES ('133', 'PMB2014150320', '', 'Stephanie Abiel Wibisono', '334', '0041739262', '3', '', '1', '0', '', '3', '5', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-10-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Medokan Ayu,Blok MA 3/O5', '', '', '', '', '', '', '', '', '', '', '', '7500000', '7125000', '0', '0', '5', '375000', '0', '7125000', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:07:39', '', '');
INSERT INTO `aka_siswa` VALUES ('134', 'PMB2014150321', '', 'Yuhwa Evelyn Tanusa', '342', '0041739256', '3', '', '1', '0', '', '3', '5', '15', '2', '0', '1', '1', '0', 'P', 'Surabaya', '2004-09-22', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Panjang Jiwo Permai 42', '', '', '', '', '', '', '', '', '', '', '', '7500000', '7125000', '0', '0', '5', '375000', '0', '7125000', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:07:52', '', '');
INSERT INTO `aka_siswa` VALUES ('135', 'PMB2014150322', '', 'Brian Errando Limanjaya', '266', '0031550411', '3', '', '1', '0', '', '3', '5', '16', '2', '0', '1', '1', '0', 'L', 'Surabaya', '2003-03-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Barata Jaya XV/ 10', '', '', '', '', '', '', '', '', '', '', '', '3750000', '3562500', '0', '0', '5', '187500', '0', '3562500', '1', '1700000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:08:10', '', '');
INSERT INTO `aka_siswa` VALUES ('136', 'PMB2014150323', '', 'Esther Ann Tanudiredja', '268', '0031550417', '3', '', '1', '0', '', '3', '5', '16', '1', '0', '5', '1', '0', 'P', 'Surabaya', '2003-05-04', '', '0', '0', '', '0.0', '0.0', '-', '', 'Ambengan 58', '', '5343088', '', '', '', '', '', '', '', '', '', '3750000', '3562500', '0', '0', '5', '187500', '0', '3562500', '1', '1700000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:08:24', '', '');
INSERT INTO `aka_siswa` VALUES ('137', 'PMB2014150324', '', 'Evan Waskita Siemjaya', '269', '0025210416', '3', '', '1', '0', '', '3', '5', '16', '1', '0', '1', '1', '0', 'L', 'Surabaya', '2002-11-26', '', '0', '0', '', '0.0', '0.0', '-', '', 'Medokan Ayu I/ O-39', '', '', '', '', '', '', '', '', '', '', '', '3750000', '3562500', '0', '0', '5', '187500', '0', '3562500', '1', '1700000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:08:40', '', '');
INSERT INTO `aka_siswa` VALUES ('138', 'PMB2014150325', '', 'Feliciana Wihelmus', '349', '0031684474', '3', '', '1', '0', '', '3', '5', '16', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2003-02-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'Nanas Utara I / 30 PCI', '', '', '', '', '', '', '', '', '', '', '', '3750000', '3562500', '0', '0', '5', '187500', '0', '3562500', '1', '1700000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:08:55', '', '');
INSERT INTO `aka_siswa` VALUES ('139', 'PMB2014150326', '', 'Henry Ryan Hartono', '270', '0031550425', '3', '', '1', '0', '', '3', '5', '16', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2003-06-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Rungkut Asri Barat V/7', '', '', '', '', '', '', '', '', '', '', '', '3750000', '3562500', '0', '0', '5', '187500', '0', '3562500', '1', '1700000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:09:06', '', '');
INSERT INTO `aka_siswa` VALUES ('140', 'PMB2014150327', '', 'Kristoforus Stanley Tjahya Kusuma', '273', '0035049660', '3', '', '1', '0', '', '3', '5', '16', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2003-11-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Nginden Intan Barat C4/ 22', '', '', '', '', '', '', '', '', '', '', '', '3750000', '3562500', '0', '0', '5', '187500', '0', '3562500', '1', '1700000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:09:18', '', '');
INSERT INTO `aka_siswa` VALUES ('141', 'PMB2014150328', '', 'Luisa Angela Hadi', '274', '0031550430', '3', '', '1', '0', '', '3', '5', '16', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2003-07-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wonorejo Permai Sel. V-2 / CC-387', '', '', '', '', '', '', '', '', '', '', '', '3750000', '3562500', '0', '0', '5', '187500', '0', '3562500', '1', '1700000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:09:31', '', '');
INSERT INTO `aka_siswa` VALUES ('142', 'PMB2014150329', '', 'Nichole Yang', '275', '0031550422', '3', '', '1', '0', '', '3', '5', '16', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2003-06-06', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pondok Mutiara J-4 Sda.', '', '', '', '', '', '', '', '', '', '', '', '3750000', '3562500', '0', '0', '5', '187500', '0', '3562500', '1', '1700000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:09:47', '', '');
INSERT INTO `aka_siswa` VALUES ('143', 'PMB2014150330', '', 'Odilia Irene', '276', '0031550408', '3', '', '1', '0', '', '3', '5', '16', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2003-02-26', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kutisari XII A / 4', '', '', '', '', '', '', '', '', '', '', '', '3750000', '3562500', '0', '0', '5', '187500', '0', '3562500', '1', '1700000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:10:04', '', '');
INSERT INTO `aka_siswa` VALUES ('144', 'PMB2014150331', '', 'Winston Sujayaputera', '278', '0022128412', '3', '', '1', '0', '', '3', '5', '16', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2003-07-29', '', '0', '0', '', '0.0', '0.0', '-', '', 'Dharmahusada Mas BB-17', '', '', '', '', '', '', '', '', '', '', '', '3750000', '3562500', '0', '0', '5', '187500', '0', '3562500', '1', '1700000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:10:25', '', '');
INSERT INTO `aka_siswa` VALUES ('145', 'PMB2014150332', '', 'Richard Kurniawan', '277', '0031550429', '3', '', '1', '0', '', '3', '5', '16', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2003-06-26', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kutisari XII A / 4', '', '8482969', '', '', '', '', '', '', '', '', '', '3750000', '3562500', '0', '0', '5', '187500', '0', '3562500', '1', '1700000', '0', '0.00', '0.00', '0.00', '2015-02-02 02:13:35', '', '');
INSERT INTO `aka_siswa` VALUES ('146', 'PMB2014150346', '', 'Aida Estella Budiyono', '141', '0027571106', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2002-03-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wisata Bukit Mas B7/2', '', '7534507', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 04:40:16', '', '');
INSERT INTO `aka_siswa` VALUES ('147', 'PMB2014150352', '', 'Angela Joan Parmenas', '142', '0021836879', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2002-09-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Sukomanunggal Jaya XI/XL 25, Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 04:40:31', '', '');
INSERT INTO `aka_siswa` VALUES ('148', 'PMB2014150353', '', 'Bryan Nathaniel Santoso', '144', '0021836849', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2002-02-03', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Baru Barat IX/23 Surabaya', '', '7315904', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 04:40:45', '', '');
INSERT INTO `aka_siswa` VALUES ('149', 'PMB2014150354', '', 'Cathlin Valerie', '145', '0021836871', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2002-08-27', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Gapura E1/39 Surabaya', '', '7457111', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 04:40:58', '', '');
INSERT INTO `aka_siswa` VALUES ('150', 'PMB2014150355', '', 'Christopher Gunarto', '147', '0021836845', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2002-01-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Darmo Harapan EG-2, Surabaya', '', '7324861', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 04:41:13', '', '');
INSERT INTO `aka_siswa` VALUES ('151', 'PMB2014150356', '', 'Darren Boesono', '148', '0021836872', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2002-07-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pakuwon Indah VBR 1, PC3-12 Sby', '', '7391975', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 04:41:29', '', '');
INSERT INTO `aka_siswa` VALUES ('152', 'PMB2014150357', '', 'David Deandre', '149', '0025210418', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'L', 'Palembang', '2002-12-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Jl. Darmo Baru Barat XI/16 Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 04:41:45', '', '');
INSERT INTO `aka_siswa` VALUES ('153', 'PMB2014150358', '', 'Eric Tedja', '151', '0022051353', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '4', '1', '0', 'L', '', '0000-00-00', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Bima Sakti GS-37B THS, Surabaya', '', '7345510', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 04:42:04', '', '');
INSERT INTO `aka_siswa` VALUES ('154', 'PMB2014150359', '', 'Felix Ricardo Thuatja', '152', '0022136167', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '1', '1', '0', 'L', 'Surabaya', '2002-06-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Ngagel 17 RK 12A, Surabaya', '', '5014438', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 04:42:23', '', '');
INSERT INTO `aka_siswa` VALUES ('155', 'PMB2014150360', '', 'Hongjoe Hartono', '158', '0021836874', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2002-08-25', '', '0', '0', '', '0.0', '0.0', '-', '', 'Permata Safira B1/3 Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 04:42:37', '', '');
INSERT INTO `aka_siswa` VALUES ('156', 'PMB2014150362', '', 'Ivana Tejokusumo', '160', '0015699427', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2002-11-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Baru Barat I / 34 Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 04:42:50', '', '');
INSERT INTO `aka_siswa` VALUES ('157', 'PMB2014150363', '', 'Jonathan Tejakusuma', '164', '0021836843', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2002-01-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pakuwon Indah AT 4/16 Surabaya', '', '7523311', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 04:43:06', '', '');
INSERT INTO `aka_siswa` VALUES ('158', 'PMB2014150364', '', 'Julianne Annabelle', '165', '0021836864', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2002-06-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Famili O-101-A Surabaya', '', '5620263', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 04:43:21', '', '');
INSERT INTO `aka_siswa` VALUES ('159', 'PMB2014150365', '', 'Katarina Kartika', '167', '0021836875', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '0', '1', '0', 'P', '', '0000-00-00', '', '0', '0', '', '0.0', '0.0', '-', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 04:43:34', '', '');
INSERT INTO `aka_siswa` VALUES ('160', 'PMB2014150366', '', 'Kent Keitaro Chandra', '168', '0015699430', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2002-04-30', '', '0', '0', '', '0.0', '0.0', '-', '', 'Puri Sentra Raya PS 1/37, Citraland', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 04:43:50', '', '');
INSERT INTO `aka_siswa` VALUES ('161', 'PMB2014150367', '', 'Martinus Yudha', '170', '0015699425', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2001-11-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Puri Sentra Raya EXT PS 1-50 Q ,Citraland', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 04:44:04', '', '');
INSERT INTO `aka_siswa` VALUES ('162', 'PMB2014150368', '', 'Maximillian Donovan', '172', '0021836846', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2002-01-26', '', '0', '0', '', '0.0', '0.0', '-', '', 'Vila Taman Telaga TJ 2/52, Surabaya', '', '7443444', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 04:44:17', '', '');
INSERT INTO `aka_siswa` VALUES ('163', 'PMB2014150369', '', 'Michael Christopher Jerrel', '175', '0021836862', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2002-02-25', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Baru Barat XI/II Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 04:44:32', '', '');
INSERT INTO `aka_siswa` VALUES ('164', 'PMB2014150370', '', 'Stanley Sigit', '178', '0021836863', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2002-06-16', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pakuwon Indah ATL-23 Surabaya', '', '7535518', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 04:44:46', '', '');
INSERT INTO `aka_siswa` VALUES ('165', 'PMB2014150371', '', 'Wilson Tjowanta', '180', '0021058445', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2002-02-17', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pakis Bukit Asoka R-18, Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 04:44:59', '', '');
INSERT INTO `aka_siswa` VALUES ('166', 'PMB2014150372', '', 'Audrey Thoenie Pangestu', '143', '0003628554', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2002-04-13', '', '0', '0', '', '0.0', '0.0', '-', '', 'Simp. Darmo Permai Sel XIX/23 Sby', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 06:22:03', '', '');
INSERT INTO `aka_siswa` VALUES ('167', 'PMB2014150373', '', 'Eldon Wijaya', '150', '0021836883', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'L', 'Surabya', '2002-12-27', '', '0', '0', '', '0.0', '0.0', '-', '', 'Gemblongan 4/8 Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 06:22:21', '', '');
INSERT INTO `aka_siswa` VALUES ('168', 'PMB2014150374', '', 'Christian Tjandra', '146', '0021058449', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2002-07-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Dukuh Kupang XXX/14,Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 06:22:35', '', '');
INSERT INTO `aka_siswa` VALUES ('169', 'PMB2014150375', '', 'Gavin Owen Susanto', '153', '0021836844', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2002-01-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Petemon 3/139 Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 06:22:54', '', '');
INSERT INTO `aka_siswa` VALUES ('170', 'PMB2014150376', '', 'Gerry William Sunaryo', '154', 'blmada', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2002-02-06', '', '0', '0', '', '0.0', '0.0', '-', '', 'Delta Raya Selatan No.15, Sidoarjo', '', '8552106', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 06:23:11', '', '');
INSERT INTO `aka_siswa` VALUES ('171', 'PMB2014150377', '', 'Hansen Lienardi', '155', '0015699431', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2001-12-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kupang Indah XI / 11B Surabaya', '', '0317326978', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 06:23:25', '', '');
INSERT INTO `aka_siswa` VALUES ('172', 'PMB2014150378', '', 'Henson Edward Hidayat', '156', '21058454', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2002-08-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family A-8', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 06:23:44', '', '');
INSERT INTO `aka_siswa` VALUES ('173', 'PMB2014150379', '', 'Herman Albert Dimaclid Sionosa', '157', 'blmada', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'L', 'Filipina', '2002-01-23', '', '0', '0', '', '0.0', '0.0', '-', '', 'Apartemen Puncak Permai Tower B, Sby', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 06:23:59', '', '');
INSERT INTO `aka_siswa` VALUES ('174', 'PMB2014150380', '', 'Isabel Felicia', '159', '0021836848', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2002-02-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Rafles Garden TB XII/35, Surabaya', '', '7400643', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 06:24:13', '', '');
INSERT INTO `aka_siswa` VALUES ('175', 'PMB2014150381', '', 'Jason Claudio Salim', '161', '0021836865', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2002-06-26', '', '0', '0', '', '0.0', '0.0', '-', '', 'Anjasmoro 34 Surabaya', '', '8416130', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 06:24:29', '', '');
INSERT INTO `aka_siswa` VALUES ('176', 'PMB2014150382', '', 'Jefferson Soewargo', '162', '0021836856', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2002-04-06', '', '0', '0', '', '0.0', '0.0', '-', '', 'Royal Park TL IV/23 Citraland, Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 06:24:49', '', '');
INSERT INTO `aka_siswa` VALUES ('177', 'PMB2014150383', '', 'Jennifer', '163', '0021836870', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2002-07-27', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Famili FF-29, Surabaya', '', '7535449', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 06:25:03', '', '');
INSERT INTO `aka_siswa` VALUES ('178', 'PMB2014150384', '', 'Justin Andrew Wijaya', '166', '0022440735', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2002-06-26', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kupang Indah XII/7 Surabaya', '', '0317326867', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 06:25:16', '', '');
INSERT INTO `aka_siswa` VALUES ('179', 'PMB2014150385', '', 'Marissa Gabrielle', '169', '0015699430', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '0', '1', '0', 'P', 'Surabaya', '2001-12-19', '', '0', '0', '', '0.0', '0.0', '-', '', 'Vila Bukit Regensi 2 Blok PD 2 No.30 Sby', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 06:25:30', '', '');
INSERT INTO `aka_siswa` VALUES ('180', 'PMB2014150386', '', 'Matthew Julian Santoso', '171', '0021836868', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'L', 'Malang', '2002-07-17', '', '0', '0', '', '0.0', '0.0', '-', '', 'Panglima Sudirman 67 Gresik', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 06:25:44', '', '');
INSERT INTO `aka_siswa` VALUES ('181', 'PMB2014150387', '', 'Michael Abdi Wangi', '173', '0027336529', '2', '', '1', '0', '', '2', '12', '6', '4', '0', '5', '1', '0', 'L', 'Denpasar', '2002-05-31', '', '0', '0', '', '0.0', '0.0', '-', '', 'Bukit Palma K4/23, Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 06:25:58', '', '');
INSERT INTO `aka_siswa` VALUES ('182', 'PMB2014150388', '', 'Michael Brandon', '174', '0021836847', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2002-01-30', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Simogunung 6A, Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 06:26:13', '', '');
INSERT INTO `aka_siswa` VALUES ('183', 'PMB2014150389', '', 'Patricia Aiko', '176', '0021836866', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'P', '', '0000-00-00', '', '0', '0', '', '0.0', '0.0', '-', '', 'Dukuh Kupang Barat TA/6 Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 06:26:28', '', '');
INSERT INTO `aka_siswa` VALUES ('184', 'PMB2014150390', '', 'Samuel Susanto', '177', 'blmada', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '0', '1', '0', 'L', '', '2002-12-19', '', '0', '0', '', '0.0', '0.0', '-', '', 'Yupiter B5/15', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 06:26:40', '', '');
INSERT INTO `aka_siswa` VALUES ('185', 'PMB2014150391', '', 'Vincent Ariel Tju', '179', '0021836876', '2', '', '1', '0', '', '2', '12', '6', '2', '0', '5', '1', '0', 'L', 'Kediri', '2002-08-29', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Gapura F1/11 Surabaya', '', '7451096', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-02 06:26:54', '', '');
INSERT INTO `aka_siswa` VALUES ('186', 'PMB2014150347', '', 'Angeline Vincentia Danyo', '181', '0021836858', '3', '', '1', '0', '', '3', '5', '6', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2002-04-15', '', '0', '0', '', '0.0', '0.0', '-', '', 'Manyar Jaya XI/ 17', '', '', '', '', '', '', '', '', '', '', '', '18000000', '17100000', '0', '0', '5', '900000', '0', '17100000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-02 06:27:47', '', '');
INSERT INTO `aka_siswa` VALUES ('187', 'PMB2014150393', '', 'Celine Gunawan', '182', '0021870286', '3', '', '1', '0', '', '3', '5', '6', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2002-03-17', '', '0', '0', '', '0.0', '0.0', '-', '', 'Medokan Ayu II/O-18', '', '', '', '', '', '', '', '', '', '', '', '18000000', '17100000', '0', '0', '5', '900000', '0', '17100000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-02 06:28:02', '', '');
INSERT INTO `aka_siswa` VALUES ('188', 'PMB2014150394', '', 'Christopher Faith', '183', '0021836854', '3', '', '1', '0', '', '3', '5', '6', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2002-03-27', '', '0', '0', '', '0.0', '0.0', '-', '', 'Galaxi Bumi Permai N4/25', '', '', '', '', '', '', '', '', '', '', '', '18000000', '17100000', '0', '0', '5', '900000', '0', '17100000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-02 06:28:23', '', '');
INSERT INTO `aka_siswa` VALUES ('189', 'PMB2014150395', '', 'Christovan Chi', '184', '0021836851', '3', '', '1', '0', '', '3', '5', '6', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2002-02-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wonorejo Permai Timur I/67 (EE-229)', '', '', '', '', '', '', '', '', '', '', '', '18000000', '17100000', '0', '0', '5', '900000', '0', '17100000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-02 06:28:36', '', '');
INSERT INTO `aka_siswa` VALUES ('190', 'PMB2014150396', '', 'Daniel Matthew', '186', '0021836859', '3', '', '1', '0', '', '3', '5', '6', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2002-08-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'Klampis Indah III/ 30 C-14', '', '', '', '', '', '', '', '', '', '', '', '18000000', '17100000', '0', '0', '5', '900000', '0', '17100000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-02 06:29:49', '', '');
INSERT INTO `aka_siswa` VALUES ('191', 'PMB2014150397', '', 'Filbert Karsten Thomas', '187', '0022152900', '3', '', '1', '0', '', '3', '5', '6', '2', '0', '5', '1', '0', 'L', 'Jakarta', '2002-02-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Nginden Intan Timur VI / 67', '', '', '', '', '', '', '', '', '', '', '', '18000000', '17100000', '0', '0', '5', '900000', '0', '17100000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-02 06:30:01', '', '');
INSERT INTO `aka_siswa` VALUES ('192', 'PMB2014150398', '', 'Gabriella Theodora', '188', '0025210413', '3', '', '1', '0', '', '3', '5', '6', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2002-09-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'Gading Pantai 29', '', '3898932', '', '', '', '', '', '', '', '', '', '18000000', '17100000', '0', '0', '5', '900000', '0', '17100000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-02 06:30:15', '', '');
INSERT INTO `aka_siswa` VALUES ('193', 'PMB2014150399', '', 'Gerald Chandra Tedjakusuma', '189', '0025210411', '3', '', '1', '0', '', '3', '5', '6', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2002-03-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Medokan Ayu III E - 10', '', '', '', '', '', '', '', '', '', '', '', '18000000', '17100000', '0', '0', '5', '900000', '0', '17100000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-02 06:30:34', '', '');
INSERT INTO `aka_siswa` VALUES ('194', 'PMB2014150400', '', 'Jonathan James Dewanto', '190', '0021836867', '3', '', '1', '0', '', '3', '5', '6', '2', '0', '5', '1', '0', 'L', 'New York', '2002-07-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Galaxi Bumi Permai K3/ 2', '', '', '', '', '', '', '', '', '', '', '', '18000000', '17100000', '0', '0', '5', '900000', '0', '17100000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-02 06:30:46', '', '');
INSERT INTO `aka_siswa` VALUES ('195', 'PMB2014150401', '', 'Michelin Andre', '191', '0025210412', '3', '', '1', '0', '', '3', '5', '6', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2002-05-16', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Sedati Gede 81', '', '', '', '', '', '', '', '', '', '', '', '18000000', '17100000', '0', '0', '5', '900000', '0', '17100000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-02 06:30:59', '', '');
INSERT INTO `aka_siswa` VALUES ('196', 'PMB2014150402', '', 'Phoebe Purnama', '192', '0021836881', '3', '', '1', '0', '', '3', '5', '6', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2002-11-03', '', '0', '0', '', '0.0', '0.0', '-', '', 'Rk Panji Makmur D-10, Jl. Panj. Jiwo 46', '', '', '', '', '', '', '', '', '', '', '', '18000000', '17100000', '0', '0', '5', '900000', '0', '17100000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-02 06:31:11', '', '');
INSERT INTO `aka_siswa` VALUES ('197', 'PMB2014150403', '', 'Anderson Siswanto', '130', '0014911180', '3', '', '1', '0', '', '3', '5', '17', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2001-06-23', '', '0', '0', '', '0.0', '0.0', '-', '', 'Baruk Barat IX / A-92, Surabaya', '', '71128007', '', '', '', '', '', '', '', '', '', '13500000', '12825000', '0', '0', '5', '675000', '0', '12825000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-03 05:26:57', '', '');
INSERT INTO `aka_siswa` VALUES ('198', 'PMB2014150432', '', 'Aveles', '131', '0018311336', '3', '', '1', '0', '', '3', '5', '17', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2001-11-11', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kalirungkut 27 / C-55, Surabaya', '', '', '', '', '', '', '', '', '', '', '', '13500000', '12825000', '0', '0', '5', '675000', '0', '12825000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-03 05:27:12', '', '');
INSERT INTO `aka_siswa` VALUES ('199', 'PMB2014150433', '', 'Clive Marvelous', '132', '0018311330', '3', '', '1', '0', '', '3', '5', '17', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2001-09-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Nelayan 32, Surabaya', '', '3539609', '', '', '', '', '', '', '', '', '', '13500000', '12825000', '0', '0', '5', '675000', '0', '12825000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-03 05:27:27', '', '');
INSERT INTO `aka_siswa` VALUES ('200', 'PMB2014150434', '', 'Graciella Theoderus', '133', '0018311299', '3', '', '1', '0', '', '3', '5', '17', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2001-03-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Baruk Barat 3 / B-123, Surabaya', '', '8709153', '', '', '', '', '', '', '', '', '', '13500000', '12825000', '0', '0', '5', '675000', '0', '12825000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-03 05:27:39', '', '');
INSERT INTO `aka_siswa` VALUES ('201', 'PMB2014150435', '', 'Indradi Lukman', '134', '0018311308', '3', '', '1', '0', '', '3', '5', '17', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2001-04-30', '', '0', '0', '', '0.0', '0.0', '-', '', 'Rungkut Mapan Timur IXEl-12, Surabaya', '', '', '', '', '', '', '', '', '', '', '', '13500000', '12825000', '0', '0', '5', '675000', '0', '12825000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-03 05:27:55', '', '');
INSERT INTO `aka_siswa` VALUES ('202', 'PMB2014150436', '', 'Irvin Kalevi Limanjaya', '135', '0018311321', '3', '', '1', '0', '', '3', '5', '17', '2', '0', '1', '1', '0', 'L', 'Surabaya', '2001-09-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Barata Jaya XV / 10, Surabaya', '', '5045203', '', '', '', '', '', '', '', '', '', '13500000', '12825000', '0', '0', '5', '675000', '0', '12825000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-03 05:28:10', '', '');
INSERT INTO `aka_siswa` VALUES ('203', 'PMB2014150437', '', 'Natasya Anindita', '136', '0004239358', '3', '', '1', '0', '', '3', '5', '17', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2000-05-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'Manyar Tirtomoyo 3/14, Surabaya', '', '5940713', '', '', '', '', '', '', '', '', '', '13500000', '12825000', '0', '0', '5', '675000', '0', '12825000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-03 05:28:24', '', '');
INSERT INTO `aka_siswa` VALUES ('204', 'PMB2014150392', '', 'Adrian Rizaldy Hoemisch', '094', '0018311339', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '3', '1', '0', 'L', 'Surabaya', '2001-12-19', '', '0', '0', '', '0.0', '0.0', '-', '', 'Perum Delta Sari Baru Jl. Delta Raya Utara No.88 SDA', '', '70329324', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:29:19', '', '');
INSERT INTO `aka_siswa` VALUES ('205', 'PMB2014150404', '', 'Agnes Daniella', '095', '0018311296', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '0', '1', '0', 'L', 'Surabaya', '2001-03-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Jajar Tunggal Selatan V/O-9 Surabaya', '', '7313489', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:29:28', '', '');
INSERT INTO `aka_siswa` VALUES ('206', 'PMB2014150405', '', 'Angeline Sugiarto', '096', '0018311332', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '0', '1', '0', 'P', 'USA', '2001-10-13', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Valencia PA 7/47 Surabaya', '', '7329580', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:29:39', '', '');
INSERT INTO `aka_siswa` VALUES ('207', 'PMB2014150406', '', 'Christopher Rayner Halim', '098', '0018311331', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2001-10-04', '', '0', '0', '', '0.0', '0.0', '-', '', 'Gedung Nasional No.11 Surabaya', '', '5310687', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:29:53', '', '');
INSERT INTO `aka_siswa` VALUES ('208', 'PMB2014150407', '', 'Christy', '099', '0025210409', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '1', '1', '0', 'P', 'Surabaya', '2001-01-25', '', '0', '0', '', '0.0', '0.0', '-', '', 'Dupak 17 Ruko Pasifik Megak Blok D-5', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:30:07', '', '');
INSERT INTO `aka_siswa` VALUES ('209', 'PMB2014150408', '', 'Dylan Gregory', '101', '0018311318', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2001-08-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Puspa Raya B 8/9 Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:30:19', '', '');
INSERT INTO `aka_siswa` VALUES ('210', 'PMB2014150409', '', 'Gebryella Natasya Prayogo', '102', '0002864362', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2000-11-14', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kapasari V/16, Surabaya', '', '7520099', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:30:32', '', '');
INSERT INTO `aka_siswa` VALUES ('211', 'PMB2014150410', '', 'Irene Belinda', '105', 'blmada', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2001-01-31', '', '0', '0', '', '0.0', '0.0', '-', '', 'Vila Bukit Regency 3 PE 13 No.9 Sby', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:30:46', '', '');
INSERT INTO `aka_siswa` VALUES ('214', 'PMB2014150412', '', 'Josephine Michelle Chang', '110', '0018311334', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2001-10-30', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Hills Blok P-12 Surabaya', '', '636338', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:32:57', '', '');
INSERT INTO `aka_siswa` VALUES ('215', 'PMB2014150411', '', 'Jason Yaputra', '108', '0018311313', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2001-07-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pakis Tirtosari 15/5 Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:33:11', '', '');
INSERT INTO `aka_siswa` VALUES ('216', 'PMB2014150413', '', 'Kenneth Nathanael Thenios', '112', '0014651633', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2001-10-13', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wonokitri Indah A-15, Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:33:53', '', '');
INSERT INTO `aka_siswa` VALUES ('217', 'PMB2014150414', '', 'Michelle Hernandez', '115', '0018311315', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '5', '1', '0', 'P', 'Malang', '2001-07-30', '', '0', '0', '', '0.0', '0.0', '-', '', 'Petemon Timur 120 Surabaya', '', '5351805', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:34:09', '', '');
INSERT INTO `aka_siswa` VALUES ('218', 'PMB2014150415', '', 'Vanessa Liem', '122', '0015059807', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2001-11-13', '', '0', '0', '', '0.0', '0.0', '-', '', 'Sepanjang Town Haouse C 15-16 SDA', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:34:24', '', '');
INSERT INTO `aka_siswa` VALUES ('219', 'PMB2014150416', '', 'Vondrea Cassey Andoko', '125', '0018311325', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2001-09-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Pondok Indah TX-15 Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:34:38', '', '');
INSERT INTO `aka_siswa` VALUES ('220', 'PMB2014150431', '', 'Jesslyn Antoinette Sutandyo', '109', '0018311337', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2001-11-25', '', '0', '0', '', '0.0', '0.0', '-', '', 'Dukuh Kupang Barat VII/28 Surabaya', '', '5621891', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:42:01', '', '');
INSERT INTO `aka_siswa` VALUES ('221', 'PMB2014150417', '', 'Christopher Louis', '097', '0018311338', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2001-12-03', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Pondok Indah AA-2 Surabaya', '', '70310768', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:44:59', '', '');
INSERT INTO `aka_siswa` VALUES ('222', 'PMB2014150418', '', 'Giselle Angelique', '103', '0018311304', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2000-03-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Vila Bukit Mas Mediterian K-8 SBY', '', '70310768', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:45:22', '', '');
INSERT INTO `aka_siswa` VALUES ('223', 'PMB2014150419', '', 'Hilary', '104', '0018311327', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '1', '1', '0', 'P', 'Surabaya', '2001-09-21', '', '0', '0', '', '0.0', '0.0', '-', '', 'Dupak 17 Blok B9 Surabaya', '', '7091183', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:45:34', '', '');
INSERT INTO `aka_siswa` VALUES ('224', 'PMB2014150420', '', 'Jade Vanessa Pangkey', '106', '0018311297', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2001-03-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Griya Babatan Mukti M-76 Surabaya', '', '7530210', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:45:49', '', '');
INSERT INTO `aka_siswa` VALUES ('225', 'PMB2014150421', '', 'Jason Tanujaya', '107', '0007935373', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '0', '1', '0', 'L', 'Jakarta', '2001-11-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Vila Bukit Regensi 3 PE 8/26 SBY', '', '7391671', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:46:01', '', '');
INSERT INTO `aka_siswa` VALUES ('226', 'PMB2014150422', '', 'Kelvin Williams', '111', '0013215132', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '1', '1', '0', 'L', 'Denpasar', '2001-07-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'The Mansion PF-5/22 Pakuwon Indah', '', '7391671', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:46:14', '', '');
INSERT INTO `aka_siswa` VALUES ('227', 'PMB2014150423', '', 'Kezia Ratih Puspaningrum K.F', '113', '0025210410', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2002-02-23', '', '0', '0', '', '0.0', '0.0', '-', '', 'Tengger Kendangan 19/3 Sby', '', '70867222', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:46:31', '', '');
INSERT INTO `aka_siswa` VALUES ('228', 'PMB2014150424', '', 'Michelle Yang', '116', '0018311305', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '1', '1', '0', 'L', 'Surabaya', '2001-04-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Jl. Semarang 106 B Blok A-18 Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:46:44', '', '');
INSERT INTO `aka_siswa` VALUES ('229', 'PMB2014150425', '', 'Monica Gabriela', '117', '0018311317', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2001-08-13', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman International I Blok C-1/21 SBY', '', '71205898', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:46:57', '', '');
INSERT INTO `aka_siswa` VALUES ('230', 'PMB2014150426', '', 'Natalie Julianto', '118', '0002864365', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2000-12-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Hill Blok L-21A Surabaya', '', '70912379', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:47:10', '', '');
INSERT INTO `aka_siswa` VALUES ('231', 'PMB2014150427', '', 'Nathanael Ray Samuel', '119', '0015699499', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2001-03-19', '', '0', '0', '', '0.0', '0.0', '-', '', 'Dukuh Kupang Barat TA/6 Surabaya', '', '70976447', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:47:23', '', '');
INSERT INTO `aka_siswa` VALUES ('232', 'PMB2014150428', '', 'Nicholas Matthew', '120', '0002864366', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2001-12-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Bukit Darmo Golf Regency D-10 Sby', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:47:36', '', '');
INSERT INTO `aka_siswa` VALUES ('234', 'PMB2014150429', '', 'Verren Violeta', '123', '0018311307', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2001-04-25', '', '0', '0', '', '0.0', '0.0', '-', '', 'Petemon Barat 96 Surabaya', '', '5320496', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:48:42', '', '');
INSERT INTO `aka_siswa` VALUES ('235', 'PMB2014150430', '', 'Vienna Augusta', '124', '0018311316', '2', '', '1', '0', '', '2', '12', '1', '1', '0', '5', '1', '0', 'P', 'Surabaya', '2001-08-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Dharmahusada Indah Utara U-12 Sby', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 05:48:56', '', '');
INSERT INTO `aka_siswa` VALUES ('236', 'PMB2014150440', '', 'Shiela Sutanto', '121', '0001106681', '2', '', '1', '0', '', '2', '12', '17', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2001-09-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Hunian Satelit Yupiter BS 15, SBY', '', '7328360', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-03 06:28:09', '', '');
INSERT INTO `aka_siswa` VALUES ('237', 'PMB2014150438', '', 'Philia Disca', '137', '0018311324', '3', '', '1', '0', '', '3', '5', '17', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2001-09-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Bendul Merisi Sel VI/7, Surabaya', '', '', '', '', '', '', '', '', '', '', '', '13500000', '12825000', '0', '0', '5', '675000', '0', '12825000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-03 06:32:42', '', '');
INSERT INTO `aka_siswa` VALUES ('238', 'PMB2014150442', '', 'Ricky Kurniawan', '138', '0002864367', '3', '', '1', '0', '', '3', '5', '17', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2001-12-29', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kutisari XII A/6, Surabaya', '', '', '', '', '', '', '', '', '', '', '', '13500000', '12825000', '0', '0', '5', '675000', '0', '12825000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-03 06:32:54', '', '');
INSERT INTO `aka_siswa` VALUES ('239', 'PMB2014150443', '', 'Steven Andre Saputra', '139', '0018311302', '3', '', '1', '0', '', '3', '5', '17', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2001-03-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Sedati Gede, Waru-Sidoarjo', '', '', '', '', '', '', '', '', '', '', '', '13500000', '12825000', '0', '0', '5', '675000', '0', '12825000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-03 06:33:05', '', '');
INSERT INTO `aka_siswa` VALUES ('241', 'PMB2014150445', '', 'Bryan Andrew Wijaya', '047', '0005278497', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2000-08-31', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kupang Indah XII/7 Surabaya', '', '7326867', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:27:07', '', '');
INSERT INTO `aka_siswa` VALUES ('242', 'PMB2014150450', '', 'Bryan Nicklaus Soesanto', '048', '0002864364', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2000-12-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family N-155 Surabaya', '', '7325666', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:27:22', '', '');
INSERT INTO `aka_siswa` VALUES ('243', 'PMB2014150451', '', 'Dean Gracious', '049', '0004556643', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '1', '1', '0', 'L', 'Surabaya', '2000-03-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Citra Harmony G4/18 Sidoarjo', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:27:46', '', '');
INSERT INTO `aka_siswa` VALUES ('244', 'PMB2014150452', '', 'Emeris', '126', 'blmada', '2', '', '1', '0', '', '2', '12', '1', '1', '0', '1', '1', '0', 'P', 'Surabaya', '2000-10-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pondok Wiyung Indah Timur III-35 Blok NX-13', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:28:03', '', '');
INSERT INTO `aka_siswa` VALUES ('245', 'PMB2014150453', '', 'Felecia Gunawan', '127', 'blmada', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '4', '1', '0', 'P', 'Sidoarjo', '2000-09-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Jenggolo II No.2 Sidoarjo', '', '8921408', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:28:17', '', '');
INSERT INTO `aka_siswa` VALUES ('246', 'PMB2014150454', '', 'Fontana Hadisurya Suhandinata', '052', '0006279895', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '1', '1', '0', 'L', 'Surabaya', '2000-09-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wonokitri Indah A 12 Surabaya', '', '5673105', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:28:32', '', '');
INSERT INTO `aka_siswa` VALUES ('247', 'PMB2014150455', '', 'Hanssen Budisantoso Wijaya', '054', '0004436041', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2000-09-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Satelit Utara 6/IT 17 Surabaya', '', '7317395', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:28:45', '', '');
INSERT INTO `aka_siswa` VALUES ('248', 'PMB2014150456', '', 'Jessica Levina', '055', '0005750171', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '0', '1', '0', 'P', 'Surabaya', '2000-11-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Vila Bukit Mas Monaco TB 14 Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:28:58', '', '');
INSERT INTO `aka_siswa` VALUES ('249', 'PMB2014150457', '', 'Joshua Chang', '058', '0018311314', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2000-07-21', '', '0', '0', '', '0.0', '0.0', '-', '', 'Jl.Kendangsari Blok M-10 Sby', '', '72576248', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:29:10', '', '');
INSERT INTO `aka_siswa` VALUES ('250', 'PMB2014150459', '', 'Julio Erson Chuanardi', '059', '0001106680', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '1', '1', '0', 'L', 'Surabaya', '2000-07-14', '', '0', '0', '', '0.0', '0.0', '-', '', 'Puri Widya Kencana J3-10 Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:29:23', '', '');
INSERT INTO `aka_siswa` VALUES ('251', 'PMB2014150461', '', 'Kevin Ferdinand', '060', '0004436037', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2000-08-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Jl. Dupak 72 Surabaya', '', '70616958', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:29:45', '', '');
INSERT INTO `aka_siswa` VALUES ('252', 'PMB2014150463', '', 'Neysa Winaldo', '064', '0004436022', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2000-04-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Jl. Tanjung Sari Baru 4/21 Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:30:00', '', '');
INSERT INTO `aka_siswa` VALUES ('253', 'PMB2014150466', '', 'Richard Theofilus Pangestu', '129', '0003629774', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2000-12-13', '', '0', '0', '', '0.0', '0.0', '-', '', 'Simpang Darmo Permai Selatan 19/23', '', '7344810', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:30:33', '', '');
INSERT INTO `aka_siswa` VALUES ('254', 'PMB2014150468', '', 'Shienny Hartanto', '069', '0007935545', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2000-11-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Permai Timur IV/32, Surabaya', '', '7318787', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:49:41', '', '');
INSERT INTO `aka_siswa` VALUES ('255', 'PMB2014150470', '', 'Brandon Jordania Putra Liyanto', '046', '9995657281', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '5', '1', '0', 'L', 'Manado', '1999-12-27', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Satelit Utara BT-23 SBY', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:50:00', '', '');
INSERT INTO `aka_siswa` VALUES ('256', 'PMB2014150472', '', 'Edwina Aurelia Saksana', '050', '0004043797', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2000-03-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Indah Timur M-24 Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:50:16', '', '');
INSERT INTO `aka_siswa` VALUES ('257', 'PMB2014150473', '', 'Elita Stacia', '051', '0008370483', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2000-09-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Gilang 70 Sda / Wiyung Indah I/B', '', '7882908', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:50:36', '', '');
INSERT INTO `aka_siswa` VALUES ('258', 'PMB2014150474', '', 'Fia Sabrina Boedijono', '140', '0004436039', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2000-09-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Satelit Timur QQ-28, Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:50:54', '', '');
INSERT INTO `aka_siswa` VALUES ('259', 'PMB2014150475', '', 'Gabrielle Angelica', '128', '0003629769', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2000-08-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kondominium Graha Famili PB 704 Sby', '', '77770577', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:51:11', '', '');
INSERT INTO `aka_siswa` VALUES ('260', 'PMB2014150476', '', 'Hans Sebastian Mulyawan', '053', '0006279867', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2000-05-20', '', '0', '0', '', '0.0', '0.0', '-', '', '', '', '13950', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:51:25', '', '');
INSERT INTO `aka_siswa` VALUES ('261', 'PMB2014150477', '', 'Joseph Ervan Nathanael', '057', '0004436040', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2000-09-06', '', '0', '0', '', '0.0', '0.0', '-', '', 'Puri Lidah Kulon Indah B no.27 Surabaya', '', '7526457', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:51:38', '', '');
INSERT INTO `aka_siswa` VALUES ('262', 'PMB2014150478', '', 'Nicholas Valentino Gumulia', '065', '0011174582', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2000-07-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Royal Residence C 02/15 Surabaya', '', '83981428', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:51:50', '', '');
INSERT INTO `aka_siswa` VALUES ('263', 'PMB2014150479', '', 'Ray Chandrakesuma', '068', '0004436047', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '4', '1', '0', 'L', 'Jakarta', '2000-10-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Permai Selatan I/32', '', '71118008', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:52:02', '', '');
INSERT INTO `aka_siswa` VALUES ('264', 'PMB2014150480', '', 'Tania Alverina Djayanto', '070', '0004436036', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2000-08-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Jl. Lidah Bukit Mas Brat XII C6-02 Sby', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:52:14', '', '');
INSERT INTO `aka_siswa` VALUES ('265', 'PMB2014150481', '', 'Vania Aurellia Wijaya', '073', '0006765518', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '1', '1', '0', 'P', 'Surabaya', '2000-09-15', '', '0', '0', '', '0.0', '0.0', '-', '', 'Jl.Pradah Permai III-16 Surabaya', '', '7341458', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:52:25', '', '');
INSERT INTO `aka_siswa` VALUES ('266', 'PMB2014150482', '', 'Wesley Evan Soegiarto', '071', '0000114926', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2000-12-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Park I Blok 2B no 8-9 Sby', '', '7328965', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:52:38', '', '');
INSERT INTO `aka_siswa` VALUES ('267', 'PMB2014150483', '', 'Wincent Tanjaya', '072', '0004436031', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2000-07-27', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Permai Selatan X/126, Surabaya', '', '7318765', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:52:50', '', '');
INSERT INTO `aka_siswa` VALUES ('268', 'PMB2014150484', '', 'Yoel Kristian Simanjaya', '074', '0004436021', '2', '', '1', '0', '', '2', '12', '18', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2000-03-04', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wisma Lidah Kulon A-43 Surabaya', '', '7532470', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:53:02', '', '');
INSERT INTO `aka_siswa` VALUES ('269', 'PMB2014150444', '', 'Angelina Siswanto', '083', '9998961066', '3', '', '1', '0', '', '3', '5', '18', '2', '0', '5', '1', '0', 'P', 'Surabaya', '1999-12-31', '', '0', '0', '', '0.0', '0.0', '-', '', 'Baruk Barat IX/A-92 Surabaya', '', '8712368', '', '', '', '', '', '', '', '', '', '9000000', '8550000', '0', '0', '5', '450000', '0', '8550000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-06 05:56:34', '', '');
INSERT INTO `aka_siswa` VALUES ('270', 'PMB2014150486', '', 'Anthony Vincentius Danyo', '084', '0004436026', '3', '', '1', '0', '', '3', '5', '18', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2000-05-29', '', '0', '0', '', '0.0', '0.0', '-', '', 'Manyar Jaya Praja XI/ 17', '', '5948146', '', '', '', '', '', '', '', '', '', '9000000', '8550000', '0', '0', '5', '450000', '0', '8550000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-06 05:56:44', '', '');
INSERT INTO `aka_siswa` VALUES ('271', 'PMB2014150487', '', 'Argya Putra Ganiartha', '085', '0004436024', '3', '', '1', '0', '', '3', '5', '18', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2000-04-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Jl. Nginden Intan Tim. 17/ 44', '', '70123442', '', '', '', '', '', '', '', '', '', '9000000', '8550000', '0', '0', '5', '450000', '0', '8550000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-06 05:56:58', '', '');
INSERT INTO `aka_siswa` VALUES ('272', 'PMB2014150488', '', 'Ethan Gunadi Angstrong', '087', '0013234947', '3', '', '1', '0', '', '3', '5', '18', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2001-09-17', '', '0', '0', '', '0.0', '0.0', '-', '', 'Laguna Indah A2/7', '', '', '', '', '', '', '', '', '', '', '', '9000000', '8550000', '0', '0', '5', '450000', '0', '8550000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-06 05:57:10', '', '');
INSERT INTO `aka_siswa` VALUES ('273', 'PMB2014150489', '', 'Evelyn Gunawan', '088', '0006641679', '3', '', '1', '0', '', '3', '5', '18', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2000-03-30', '', '0', '0', '', '0.0', '0.0', '-', '', 'Medokan Ayu II/O-18', '', '', '', '', '', '', '', '', '', '', '', '9000000', '8550000', '0', '0', '5', '450000', '0', '8550000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-06 05:57:23', '', '');
INSERT INTO `aka_siswa` VALUES ('274', 'PMB2014150490', '', 'Felicia Christy', '089', '0007706889', '3', '', '1', '0', '', '3', '5', '18', '2', '0', '5', '1', '0', 'P', 'Jakarta', '2000-10-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Nginden Intan Timur VI/67', '', '', '', '', '', '', '', '', '', '', '', '9000000', '8550000', '0', '0', '5', '450000', '0', '8550000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-06 05:57:33', '', '');
INSERT INTO `aka_siswa` VALUES ('275', 'PMB2014150491', '', 'Frederick William Sanjoto', '090', '0019723806', '3', '', '1', '0', '', '3', '5', '18', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2001-01-22', '', '0', '0', '', '0.0', '0.0', '-', '', 'Jl. Duku 6 CA 357', '', '', '', '', '', '', '', '', '', '', '', '9000000', '8550000', '0', '0', '5', '450000', '0', '8550000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-06 05:57:48', '', '');
INSERT INTO `aka_siswa` VALUES ('276', 'PMB2014150492', '', 'Hansel', '091', '0018311335', '3', '', '1', '0', '', '3', '5', '18', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2000-11-04', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kalirungkut 27/ C-55', '', '', '', '', '', '', '', '', '', '', '', '9000000', '8550000', '0', '0', '5', '450000', '0', '8550000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-06 05:58:00', '', '');
INSERT INTO `aka_siswa` VALUES ('277', 'PMB2014150493', '', 'Richard Andrew Santoso', '092', '0004436035', '3', '', '1', '0', '', '3', '5', '18', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2000-08-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Kali Rungkut 5/ J-16', '', '70818799', '', '', '', '', '', '', '', '', '', '9000000', '8550000', '0', '0', '5', '450000', '0', '8550000', '1', '2000000', '0', '0.00', '0.00', '0.00', '2015-02-06 05:58:13', '', '');
INSERT INTO `aka_siswa` VALUES ('278', 'PMB2014150485', '', 'Alice Pricillya', '018', '9993005192', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '5', '1', '0', 'L', 'Medan', '1999-10-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Sukomanunggal Jaya F/12, Sby', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:58:53', '', '');
INSERT INTO `aka_siswa` VALUES ('279', 'PMB2014150495', '', 'Amelia Fandrayani Lim', '019', 'blmada', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '0', '1', '0', 'P', '', '1999-04-19', '', '0', '0', '', '0.0', '0.0', '-', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:59:05', '', '');
INSERT INTO `aka_siswa` VALUES ('280', 'PMB2014150496', '', 'Christie Megawati Budiono', '020', '9995657269', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '5', '1', '0', 'P', 'Surabaya', '1999-09-23', '', '0', '0', '', '0.0', '0.0', '-', '', 'South Emerald Mansion TM2/10', '', '70903375', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:59:16', '', '');
INSERT INTO `aka_siswa` VALUES ('281', 'PMB2014150497', '', 'Inez Beatrice Wanamarta', '021', '9993005190', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '5', '1', '0', 'P', 'Maastricht Belanda', '1999-07-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Bogowonto 3, Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:59:30', '', '');
INSERT INTO `aka_siswa` VALUES ('282', 'PMB2014150498', '', 'Ivan Nathan Parmenas', '022', '9995657256', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '5', '1', '0', 'L', 'Malang', '1999-02-23', '', '0', '0', '', '0.0', '0.0', '-', '', 'Sukomanunggal Jaya XI / XL 25, Sby', '', '7316202', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:59:43', '', '');
INSERT INTO `aka_siswa` VALUES ('283', 'PMB2014150499', '', 'Jason Immanuel Gabriel', '023', '9995266433', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '5', '1', '0', 'L', 'Surabaya', '1999-01-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Boulevard BDG-OP-B2/23 Sby', '', '7310013', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 05:59:58', '', '');
INSERT INTO `aka_siswa` VALUES ('284', 'PMB2014150500', '', 'Jason Pangkey', '024', '9995657263', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '5', '1', '0', 'L', 'Surabaya', '1999-07-30', '', '0', '0', '', '0.0', '0.0', '-', '', 'Griya Babatan Mukti M-76 Sby', '', '7530210', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 06:00:21', '', '');
INSERT INTO `aka_siswa` VALUES ('285', 'PMB2014150501', '', 'Jessica Setyono', '025', '9985457831', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '5', '1', '0', 'P', 'Surabaya', '1999-12-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Jl.Petemon Barat 204A, Sby', '', '5350851', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 06:00:29', '', '');
INSERT INTO `aka_siswa` VALUES ('286', 'PMB2014150502', '', 'Ken Chandrakesuma', '027', '9995657254', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '4', '1', '0', 'L', 'Jakarta', '1999-02-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Permai Selatan I / 32, Sby', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 06:00:40', '', '');
INSERT INTO `aka_siswa` VALUES ('287', 'PMB2014150503', '', 'Laura Brigita Pangkey', '028', '9995657279', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '4', '1', '0', 'P', 'Surabaya', '1999-11-19', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman pondok Indah LY-2 Sby', '', '60050203', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 06:00:54', '', '');
INSERT INTO `aka_siswa` VALUES ('288', 'PMB2014150504', '', 'Natalya Lim', '029', '9995657252', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2000-01-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Famili Blok N-46, Sby', '', '7346683', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 06:01:06', '', '');
INSERT INTO `aka_siswa` VALUES ('289', 'PMB2014150505', '', 'Safira Antonia Goenawan', '030', '9995657266', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '1', '1', '0', 'P', 'Surabaya', '1999-08-19', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Park I 2C/9, Sby', '', '5667886', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 06:01:17', '', '');
INSERT INTO `aka_siswa` VALUES ('290', 'PMB2014150506', '', 'Thesalonica Shinta P.N.K.F', '031', '9995657280', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '5', '1', '0', 'P', 'Surabaya', '1999-12-21', '', '0', '0', '', '0.0', '0.0', '-', '', 'Tengger Kendangan 19/3 Sby', '', '70867222', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 06:01:27', '', '');
INSERT INTO `aka_siswa` VALUES ('291', 'PMB2014150507', '', 'Vincent Nicholas Katuari', '032', '9995657278', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '4', '1', '0', 'L', 'Surabaya', '1999-11-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Dharmahusada Indah Utara U-12, Sby', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 06:01:39', '', '');
INSERT INTO `aka_siswa` VALUES ('292', 'PMB2014150508', '', 'Wilson Philipe', '033', '9994276834', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '5', '1', '0', 'L', 'Surabaya', '1999-03-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Famili PP-31, Sby', '', '7533366', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 06:01:51', '', '');
INSERT INTO `aka_siswa` VALUES ('293', 'PMB2014150509', '', 'Christina', '002', '9980042582', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '5', '1', '0', 'P', 'Surabaya', '1998-03-26', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Gilang 70 Sda / Wiyung Indah I/B', '', '7882908', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 06:02:09', '', '');
INSERT INTO `aka_siswa` VALUES ('294', 'PMB2014150510', '', 'Darren Gracious', '003', '9977046369', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '1', '1', '0', 'L', 'Surabaya', '1997-11-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Citra Harmony G4/18 Sidoarjo', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 06:02:22', '', '');
INSERT INTO `aka_siswa` VALUES ('295', 'PMB2014150511', '', 'Edward Jehan Soetopo', '004', '9985457830', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '5', '1', '0', 'L', 'Jakarta', '1998-11-15', '', '0', '0', '', '0.0', '0.0', '-', '', 'Komp. Bintang Diponggo Kav.754 SBY', '', '5663292', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 06:02:34', '', '');
INSERT INTO `aka_siswa` VALUES ('296', 'PMB2014150512', '', 'Enrico Soewandi', '005', 'blmada', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '0', '1', '0', 'L', '', '0000-00-00', '', '0', '0', '', '0.0', '0.0', '-', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 06:02:47', '', '');
INSERT INTO `aka_siswa` VALUES ('297', 'PMB2014150513', '', 'Ezra Joy Gunawan', '006', '9985457832', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '5', '1', '0', 'L', 'Surabaya', '1998-12-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Dupak 3-9 Blok A 12 SBY', '', '7314888', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 06:02:59', '', '');
INSERT INTO `aka_siswa` VALUES ('298', 'PMB2014150514', '', 'Gracielle Ganda', '008', '9985457815', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '5', '1', '0', 'P', 'Surabaya', '1998-02-06', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family N-47 SBY', '', '7385689', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 06:03:14', '', '');
INSERT INTO `aka_siswa` VALUES ('299', 'PMB2014150515', '', 'Hartanto Tanjung', '009', '9995578677', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '5', '1', '0', 'L', 'Surabaya', '1997-10-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Darmo Permai II Darmo Green Garden C-6 Surabaya', '', '7317600', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 06:03:25', '', '');
INSERT INTO `aka_siswa` VALUES ('300', 'PMB2014150516', '', 'Jason Aditya Tjandra', '017', 'blmada', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '0', '1', '0', 'L', '', '1998-01-21', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kertajaya Indah VI/F-324', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 06:03:37', '', '');
INSERT INTO `aka_siswa` VALUES ('301', 'PMB2014150517', '', 'Matthew Christian', '012', '9975578678', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '5', '1', '0', 'L', 'Surabaya', '1997-10-16', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Darmo Permai II/C-19 SBY', '', '5681896', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 06:03:51', '', '');
INSERT INTO `aka_siswa` VALUES ('302', 'PMB2014150518', '', 'Naveno Cendikiawan', '013', '9985457828', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '5', '1', '0', 'L', 'Surabaya', '1999-02-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Bratang Gede 101 SBY', '', '50466451', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 06:03:59', '', '');
INSERT INTO `aka_siswa` VALUES ('303', 'PMB2014150519', '', 'Vincenzio Evan Siemon', '014', '9995657274', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '4', '1', '0', 'L', 'Surabaya', '1999-10-13', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Regency 2 PD3/11 Pakuwon Indah SBY', '', '7391112', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 06:04:10', '', '');
INSERT INTO `aka_siswa` VALUES ('304', 'PMB2014150520', '', 'Williams Louis Aditya', '016', 'blmada', '2', '', '1', '0', '', '2', '10', '7', '2', '0', '5', '1', '0', 'L', 'Probolinggo', '1998-05-17', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Baru Timur 4/27 Sby', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-06 06:04:22', '', '');
INSERT INTO `aka_siswa` VALUES ('366', 'PMB2014150590', '', 'Aldrich Kennan Sumargo', '547', '0078789871', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-06-25', '', '0', '0', '', '0.0', '0.0', '-', '', 'Sambongan III/10', '', '0313536106', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 01:07:50', '', '');
INSERT INTO `aka_siswa` VALUES ('371', 'PMB2014150591', '', 'Aurelia Mareta Koesno', '526', '0074972185', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2007-03-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Baru Barat 8/21', '', '0313573364', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 01:10:00', '', '');
INSERT INTO `aka_siswa` VALUES ('372', 'PMB2014150592', '', 'Bryan Aurelius Kho', '550', '0071475423', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '1', '1', '0', 'L', 'Surabaya', '2007-04-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kencana Sari Barat Blok G No. 6', '', '0315688355', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 01:10:23', '', '');
INSERT INTO `aka_siswa` VALUES ('373', 'PMB2014150593', '', 'Chen Xin E', '527', '0075567751', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '1', '1', '0', 'P', 'Surabaya', '2007-03-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Royal Resindence C 1 No. 21', '', '0317913480', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 01:10:41', '', '');
INSERT INTO `aka_siswa` VALUES ('374', 'PMB2014150594', '', 'Christalin Maeko Sumarno', '528', '0066184897', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-12-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Petemon Timur 112', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 01:40:18', '', '');
INSERT INTO `aka_siswa` VALUES ('375', 'PMB2014150595', '', 'Clarence Moeljadi Salim', '571', '0064518148', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-11-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Mas Monaco TA-15', '', '0315615057', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 01:41:29', '', '');
INSERT INTO `aka_siswa` VALUES ('376', 'PMB2014150596', '', 'Dylan Matthew Tedjokoesoemo', '553', '0073675942', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-07-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman International I / FK-20', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 01:41:45', '', '');
INSERT INTO `aka_siswa` VALUES ('377', 'PMB2014150597', '', 'Eunike Audrey Mantalik', '574', '0076939699', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2007-08-31', '', '0', '0', '', '0.0', '0.0', '-', '', 'Royal Residence B 10-97', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 01:42:03', '', '');
INSERT INTO `aka_siswa` VALUES ('378', 'PMB2014150598', '', 'Jonathan Gerald Linardi', '558', '0072712902', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2007-03-23', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Pondok Indah Blok RX - 29', '', '7526671', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 01:42:23', '', '');
INSERT INTO `aka_siswa` VALUES ('379', 'PMB2014150599', '', 'Jonathan Limantara', '559', '0076476482', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-05-03', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Indah Barat II / F-9', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 01:42:38', '', '');
INSERT INTO `aka_siswa` VALUES ('380', 'PMB2014150600', '', 'Jonathan Louis Hartono Ong', '535', '0074585580', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2007-05-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Dukuh Kupang Barat XXII / 26', '', '5676441', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 01:44:27', '', '');
INSERT INTO `aka_siswa` VALUES ('381', 'PMB2014150601', '', 'Jason Antolin Theios', '579', '0077597956', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-01-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Banyu Urip Wetan  5/95-97 / Vila Bukit Mas Paris SA-30', '', '0315684506', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 01:44:46', '', '');
INSERT INTO `aka_siswa` VALUES ('382', 'PMB2014150602', '', 'Josh Franklin Linarto', '536', '0071855334', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-05-27', '', '0', '0', '', '0.0', '0.0', '-', '', 'Vila Valensia CA 5/50', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 01:45:01', '', '');
INSERT INTO `aka_siswa` VALUES ('383', 'PMB2014150603', '', 'Justin Tyrone Pangkey', '538', '0078179800', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-07-04', '', '0', '0', '', '0.0', '0.0', '-', '', 'Griya Babatan Mukti Blok M-76', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 01:45:15', '', '');
INSERT INTO `aka_siswa` VALUES ('384', 'PMB2014150604', '', 'Kaitlyn Lievia', '562', '0073360951', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-04-17', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wisata Bukit Mas (Venesia) B2 / 5', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 01:45:36', '', '');
INSERT INTO `aka_siswa` VALUES ('385', 'PMB2014150605', '', 'Marvel Nathanael Tedjakusuma', '565', '0074159404', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-01-26', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Darmo 47', '', '5622790', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 01:46:17', '', '');
INSERT INTO `aka_siswa` VALUES ('386', 'PMB2014150606', '', 'Nicole Audrey William', '585', '0077163248', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2007-10-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family U-107', '', '03173226056', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 01:46:31', '', '');
INSERT INTO `aka_siswa` VALUES ('387', 'PMB2014150607', '', 'Olivia Harsono', '568', '0072926074', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2007-05-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Isen No. 9', '', '0317315576', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 01:46:43', '', '');
INSERT INTO `aka_siswa` VALUES ('388', 'PMB2014150608', '', 'Richie Lawrance Chan', '587', '0076306226', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-10-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Wonocolo 102 Taman Sepanjang, Sidoarjo', '', '7886555', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 01:46:58', '', '');
INSERT INTO `aka_siswa` VALUES ('389', 'PMB2014150609', '', 'Rico Ganendra Lie', '588', '0079101548', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '3', '1', '0', 'L', 'Jakarta', '2007-04-29', '', '0', '0', '', '0.0', '0.0', '-', '', 'Satelit Indah 7 No. 1', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 01:47:15', '', '');
INSERT INTO `aka_siswa` VALUES ('390', 'PMB2014150610', '', 'Seraphine Saputera', '544', '0076765376', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2007-08-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'South Emerald Mansion TK-7/12C', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 01:47:28', '', '');
INSERT INTO `aka_siswa` VALUES ('391', 'PMB2014150611', '', 'Atherton Irawan', '549', '0072467785', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-08-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Nyi Cempo Barat No. 50 Taman Sepanjang', '', '7871545', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:10:26', '', '');
INSERT INTO `aka_siswa` VALUES ('392', 'PMB2014150612', '', 'Celine Aurellya', '551', '0078490929', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '1', '1', '0', 'P', 'Surabaya', '2007-03-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Royal Residen B2 / 90 Wiyung, Sby', '', '7510090', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:10:41', '', '');
INSERT INTO `aka_siswa` VALUES ('393', 'PMB2014150613', '', 'Denisa Patricia Gunarto', '573', '0066907620', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-12-29', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Darmo Harapan II/EG-2', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:10:54', '', '');
INSERT INTO `aka_siswa` VALUES ('394', 'PMB2014150614', '', 'Eugenia Caitlin', '529', '0079893815', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2007-12-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Harapan Utara VIII / Blok EU-32', '', '0317385848', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:11:13', '', '');
INSERT INTO `aka_siswa` VALUES ('395', 'PMB2014150615', '', 'Gloria Valerie Lim', '556', '0084129718', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-02-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Puri Sentra Raya PS 2 No. 41 Citraland', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:11:27', '', '');
INSERT INTO `aka_siswa` VALUES ('396', 'PMB2014150616', '', 'Gracia Queenie Wijaya', '532', '0069109097', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2006-11-29', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kupang Indah 12 No. 7', '', '7326867', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:11:41', '', '');
INSERT INTO `aka_siswa` VALUES ('397', 'PMB2014150617', '', 'Gweneth E. Wijaya', '578', '0079120291', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'P', 'Perth Australia', '2007-07-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'raya Darmo Permai II / 36', '', '0317319362', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:11:57', '', '');
INSERT INTO `aka_siswa` VALUES ('398', 'PMB2014150618', '', 'Jevaughn Aviel Kurniawan', '557', '0078894563', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '0', '1', '0', 'L', 'Surabaya', '2007-02-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Puri Lidah Kulon Indah B-27', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:12:13', '', '');
INSERT INTO `aka_siswa` VALUES ('399', 'PMB2014150619', '', 'Justin Hartanto', '580', '0069771366', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-12-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Tulungagung III/8, Sby', '', '0315321447', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:12:26', '', '');
INSERT INTO `aka_siswa` VALUES ('400', 'PMB2014150620', '', 'Justin Lee Sanyoto', '560', '0073554195', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-01-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Regency 2/PD 3-12 Pakuwon Indah', '', '7391118', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:18:13', '', '');
INSERT INTO `aka_siswa` VALUES ('401', 'PMB2014150621', '', 'Kaitlyn Halim', '561', '0077842007', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '1', '1', '0', 'P', 'Surabaya', '2007-07-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Famili Blok N-170, Sby', '', '0317320228', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:18:26', '', '');
INSERT INTO `aka_siswa` VALUES ('402', 'PMB2014150622', '', 'Kathleen Wijaya', '539', '0078471521', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2007-03-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family L-117', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:18:48', '', '');
INSERT INTO `aka_siswa` VALUES ('403', 'PMB2014150623', '', 'Kevin Timothy Tanjung', '540', '0071644647', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-07-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Lebak Permai I No. 5, Sby', '', '3813088', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:19:33', '', '');
INSERT INTO `aka_siswa` VALUES ('408', 'PMB2014150625', '', 'Kimiko Yauri', '564', '0079953632', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2007-07-31', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Regency 3 PE 8 No. 18 Pakuwon Indah', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:22:45', '', '');
INSERT INTO `aka_siswa` VALUES ('409', 'PMB2014150626', '', 'Lyonel Elzabad Anantara', '541', '0076507699', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-07-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman International 1 B7 / 39 Citraland', '', '7414406', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:23:04', '', '');
INSERT INTO `aka_siswa` VALUES ('410', 'PMB2014150627', '', 'Matthew William Suwarno', '583', '0073906503', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-01-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Gayung Kebonsari Besar 20, Sby', '', '0318290789', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:23:16', '', '');
INSERT INTO `aka_siswa` VALUES ('411', 'PMB2014150628', '', 'Natania Juan Hendrajaya', '567', '0064062332', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-09-29', '', '0', '0', '', '0.0', '0.0', '-', '', 'Royal Resindence B2-103', '', '7510325', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:23:29', '', '');
INSERT INTO `aka_siswa` VALUES ('412', 'PMB2014150629', '', 'Phrisca', '543', '0077218904', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '1', '1', '0', 'P', 'Jakarta', '2007-07-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Dupak 17 Ruko Pasifik Megah Blok D-5', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:23:40', '', '');
INSERT INTO `aka_siswa` VALUES ('413', 'PMB2014150630', '', 'Ryan Joseph', '589', '0072240614', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-11-25', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Sentra Raya D5 / 11 Citraraya, Sby', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:23:53', '', '');
INSERT INTO `aka_siswa` VALUES ('414', 'PMB2014150631', '', 'Shawn William Handoko', '590', '0074436416', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2007-10-25', '', '0', '0', '', '0.0', '0.0', '-', '', 'Puri Widya Utama i-I / 5', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:24:12', '', '');
INSERT INTO `aka_siswa` VALUES ('415', 'PMB2014150632', '', 'Verrell Tristan Sulistiano', '570', '0077536097', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Jakarta', '2007-07-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Bukit Telaga Golf TH 2 No. 2 Citraland', '', '0317400577', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:24:23', '', '');
INSERT INTO `aka_siswa` VALUES ('416', 'PMB2014150633', '', 'William Chandra', '546', '0072161519', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '1', '1', '0', 'L', 'Surabaya', '2007-03-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Perum Graha Family P-18', '', '0317524704', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-11 03:24:38', '', '');
INSERT INTO `aka_siswa` VALUES ('417', 'PMB2014150289', '', 'Daniel Gunawan', '740', '0058073798', '3', '', '1', '0', '', '3', '5', '14', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2005-01-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Medokan Ayu II/O-18', '', '', '', '', '', '', '', '', '', '', '', '11250000', '10687500', '0', '0', '5', '562500', '0', '10687500', '1', '1600000', '0', '0.00', '0.00', '0.00', '2015-02-11 04:46:48', '', '');
INSERT INTO `aka_siswa` VALUES ('418', 'PMB2014150265', '', 'Jessie Huang', '739', '0064247858', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '1', '1', '0', 'P', '', '2006-08-31', '', '0', '0', '', '0.0', '0.0', '-', '', 'Juanda Regency A-11', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 04:47:46', '', '');
INSERT INTO `aka_siswa` VALUES ('419', 'PMB2014150254', '', 'Kenny Ezekiel Hartanto', '738', '0075904609', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-05-15', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wiguna Tengah 9/24', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 04:49:08', '', '');
INSERT INTO `aka_siswa` VALUES ('420', 'PMB2014150001', '', 'Angeline Jessie Kurnia Patricia', '708', '0081499015', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-01-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Tambak Adi 66, Surabaya', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:04:15', '', '');
INSERT INTO `aka_siswa` VALUES ('421', 'PMB2014150135', '', 'Arthur Kristanto', '709', '0084443663', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-08-30', '', '0', '0', '', '0.0', '0.0', '-', '', 'Nirwana Executive CC-411 A', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:07:41', '', '');
INSERT INTO `aka_siswa` VALUES ('422', 'PMB2014150136', '', 'Cahyadi Sudrajat Lauwandy', '710', '0081857745', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '1', '1', '0', 'L', 'Surabaya', '2008-03-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Mojoklanggru Kidul H/12', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:11:14', '', '');
INSERT INTO `aka_siswa` VALUES ('423', 'PMB2014150137', '', 'Christopher Rich Gondo', '711', '0083628155', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '1', '1', '0', 'L', 'Surabaya', '2008-09-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Rungkut Mapan Barat IX / AH-33', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:13:06', '', '');
INSERT INTO `aka_siswa` VALUES ('424', 'PMB2014150166', '', 'Grace Victoria Santoso', '713', '0081527964', '3', '', '1', '0', '', '3', '5', '5', '1', '0', '0', '1', '0', 'P', 'Surabaya', '2008-03-19', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Wiguna Utara 36', '', '8703821', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:14:24', '', '');
INSERT INTO `aka_siswa` VALUES ('425', 'PMB2014150193', '', 'Jessica Joyce Natania', '714', '0084827230', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-09-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Grha Tirta Akasia 95, Waru', '', '8557843', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:19:08', '', '');
INSERT INTO `aka_siswa` VALUES ('426', 'PMB2014150194', '', 'Giselle Cathryne Victoris Estelle', '712', '0083684994', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-09-27', '', '0', '0', '', '0.0', '0.0', '-', '', 'Rungkut Lor RL 2B/22', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:20:14', '', '');
INSERT INTO `aka_siswa` VALUES ('427', 'PMB2014150195', '', 'Johannes Kennard Sujanto', '715', '0083054117', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-10-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Nirwana Executive EE-57', '', '8705919', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:21:16', '', '');
INSERT INTO `aka_siswa` VALUES ('428', 'PMB2014150196', '', 'Joshua Ivanson Lie', '716', '0083229676', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Atlanta', '2008-05-21', '', '0', '0', '', '0.0', '0.0', '-', '', 'Lebak Jaya III A Utara / 5', '', '3894131', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:21:50', '', '');
INSERT INTO `aka_siswa` VALUES ('429', 'PMB2014150197', '', 'Louisel Yang', '717', '0082340413', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-10-22', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wiguna Tengah XII / 11', '', '71571076', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:22:34', '', '');
INSERT INTO `aka_siswa` VALUES ('430', 'PMB2014150198', '', 'Marcel Johannes Kraus', '718', '0084255260', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Frankenthal', '2008-04-29', '', '0', '0', '', '0.0', '0.0', '-', '', 'Ngagel Jaya Selatan II/ 7', '', '0315025206', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:23:07', '', '');
INSERT INTO `aka_siswa` VALUES ('431', 'PMB2014150199', '', 'Michael Yang Rahardjo', '719', '0089117649', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-07-11', '', '0', '0', '', '0.0', '0.0', '-', '', 'Nginden Intan Timur E2 // 22', '', '5944108', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:23:41', '', '');
INSERT INTO `aka_siswa` VALUES ('432', 'PMB2014150200', '', 'Reyhan Adi Jayawasita', '720', '0084388872', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-07-17', '', '0', '0', '', '0.0', '0.0', '-', '', 'Gry Permata Gedangan BII/3, Sdj', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:26:55', '', '');
INSERT INTO `aka_siswa` VALUES ('433', 'PMB2014150201', '', 'Shayfer Ann Yapari', '721', '0082389332', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabya', '2008-03-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Tenggilis Mejoyo AI / 9', '', '8497451', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:27:18', '', '');
INSERT INTO `aka_siswa` VALUES ('434', 'PMB2014150202', '', 'Steven Grant Santoso', '722', '0084176806', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-01-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Delta Raya Utara 76, Sda', '', '8555428', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:27:45', '', '');
INSERT INTO `aka_siswa` VALUES ('435', 'PMB2014150203', '', 'Alveria Evangeline Suthandaru', '723', '0081499015', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-07-14', '', '0', '0', '', '0.0', '0.0', '-', '', 'Rungkut Asri Barat III/8', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:30:09', '', '');
INSERT INTO `aka_siswa` VALUES ('436', 'PMB2014150204', '', 'Chad Sia', '724', '0088581066', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-03-30', '', '0', '0', '', '0.0', '0.0', '-', '', 'Galaxi Bumi Permai I-3/ 12', '', '0315996061', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:31:05', '', '');
INSERT INTO `aka_siswa` VALUES ('437', 'PMB2014150205', '', 'Chrisfusion Verden Adiwinata', '726', '0084070839', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-03-14', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Wiguna Timur Regency 37', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:31:54', '', '');
INSERT INTO `aka_siswa` VALUES ('438', 'PMB2014150206', '', 'Dylan Archer Alexander', '727', '0088751654', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '4', '1', '0', 'L', 'Sydney', '2008-01-23', '', '0', '0', '', '0.0', '0.0', '-', '', 'Virginia Regency E8-2, Pakuwon City', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:32:20', '', '');
INSERT INTO `aka_siswa` VALUES ('439', 'PMB2014150207', '', 'John Winston Wilhelmus', '728', '0077375347', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '0', '1', '0', 'L', 'Surabaya', '2008-12-16', '', '0', '0', '', '0.0', '0.0', '-', '', 'Nanas Utara I / 30 PCI', '', '70157779', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:32:49', '', '');
INSERT INTO `aka_siswa` VALUES ('440', 'PMB2014150208', '', 'Jonathan Christian Thomasoey', '729', '0081638492', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2008-07-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pakuwon City, Villa Riviera B1-12', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:40:14', '', '');
INSERT INTO `aka_siswa` VALUES ('441', 'PMB2014150210', '', 'Joyleen Huang', '730', '0083537182', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '1', '1', '0', 'L', '', '2008-01-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Juanda Regency A-11', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:40:45', '', '');
INSERT INTO `aka_siswa` VALUES ('442', 'PMB2014150212', '', 'Kevin Ade Pratama', '731', '0089882543', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-09-26', '', '0', '0', '', '0.0', '0.0', '-', '', 'Tropodo Indah K-12', '', '70579680', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:41:14', '', '');
INSERT INTO `aka_siswa` VALUES ('443', 'PMB2014150213', '', 'Matthew Ivanson Lie', '732', '0083757928', '3', '', '1', '0', '', '3', '5', '5', '1', '0', '5', '1', '0', 'L', 'Atlanta', '2008-05-21', '', '0', '0', '', '0.0', '0.0', '-', '', 'Lebak Jaya III A Utara / 5', '', '3894131', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:41:39', '', '');
INSERT INTO `aka_siswa` VALUES ('444', 'PMB2014150214', '', 'Oeitian James Ignatius', '733', '0081745417', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2008-02-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'Apt. Marina Lt.11-2', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:42:04', '', '');
INSERT INTO `aka_siswa` VALUES ('445', 'PMB2014150215', '', 'Rebecca Chen', '734', '0086686458', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'New York', '2008-04-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wonorejo Permai Utara BB-515 / VII -28', '', '8781745', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:42:33', '', '');
INSERT INTO `aka_siswa` VALUES ('446', 'PMB2014150216', '', 'Shannon Susanto', '735', '0088861384', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-08-26', '', '0', '0', '', '0.0', '0.0', '-', '', 'Nginden Intan Barat C1-28', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:42:57', '', '');
INSERT INTO `aka_siswa` VALUES ('447', 'PMB2014150217', '', 'Sheby Netisha Tanjung', '736', '0085082690', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-02-11', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pondok Citra Eksekutif E-1', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:43:22', '', '');
INSERT INTO `aka_siswa` VALUES ('448', 'PMB2014150223', '', 'Ivania Nathalia Louis Sumolang', '737', '0062186632', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '5', '1', '0', 'P', 'Manado', '2007-01-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Semanggi Green Lake B2/42', '', '', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-11 06:57:21', '', '');
INSERT INTO `aka_siswa` VALUES ('449', 'PMB2014150494', '', 'Cheryll Evangeline Arifin', '725', '0086993392', '3', '', '1', '0', '', '3', '5', '5', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2008-09-13', '', '0', '0', '', '0.0', '0.0', '-', '', 'Rungkut Mapan Tengah II / CA-6', '', '0811375657', '', '', '', '', '', '', '', '', '', '22500000', '21375000', '0', '0', '5', '1125000', '0', '21375000', '1', '1500000', '0', '0.00', '0.00', '0.00', '2015-02-13 03:33:23', '', '');
INSERT INTO `aka_siswa` VALUES ('450', 'PMB2014150530', '', 'Calista Gracious Susanto', '635', '0088407789', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-07-13', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wisata Bukit Mas C1 / 8', '', '0317527285', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:27:33', '', '');
INSERT INTO `aka_siswa` VALUES ('451', 'PMB2014150531', '', 'Christopher Njoto Imanuel', '637', '0084144288', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-12-25', '', '0', '0', '', '0.0', '0.0', '-', '', 'Petemon I/97', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:28:02', '', '');
INSERT INTO `aka_siswa` VALUES ('452', 'PMB2014150532', '', 'David Anderson Wistorohardjo', '638', '0079154820', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-12-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kupang Baru I/99', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:28:57', '', '');
INSERT INTO `aka_siswa` VALUES ('453', 'PMB2014150533', '', 'Emily Yongnardi', '639', '0089868180', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-02-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Indah Timur G-59', '', '0317311149', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:29:39', '', '');
INSERT INTO `aka_siswa` VALUES ('454', 'PMB2014150534', '', 'Fidelia Theodore Chang', '640', '0084672050', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-03-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Hill Blok P-12', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:30:17', '', '');
INSERT INTO `aka_siswa` VALUES ('455', 'PMB2014150535', '', 'Filbert Wellington', '641', '0089197385', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '1', '1', '0', 'L', 'Surabaya', '2008-05-14', '', '0', '0', '', '0.0', '0.0', '-', '', 'The Mansion PF-5/22', '', '0313577472', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:30:55', '', '');
INSERT INTO `aka_siswa` VALUES ('456', 'PMB2014150536', '', 'Gabrielle Grace', '642', '0082997795', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-07-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Diamond Hill DR 5-6 Citraland', '', '0317458368', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:31:38', '', '');
INSERT INTO `aka_siswa` VALUES ('457', 'PMB2014150725', '', 'Jeslyn Victoria Lim', '447', '0067573269', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-10-21', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family FF 10', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:36:10', '', '');
INSERT INTO `aka_siswa` VALUES ('458', 'PMB2014150724', '', 'Jean-Vif Chandra', '446', '0067413589', '2', '', '1', '0', '', '2', '9', '13', '1', '0', '5', '1', '0', 'L', 'Surabaya', '2006-12-22', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Sentra Raya D2 / 3', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:36:41', '', '');
INSERT INTO `aka_siswa` VALUES ('459', 'PMB2014150723', '', 'Harrel Ethan Macksoegie', '415', '0069945520', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-08-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Simo Kwagean 98', '', '7492164', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:37:04', '', '');
INSERT INTO `aka_siswa` VALUES ('460', 'PMB2014150721', '', 'Geoffrey Daniel (Geo)', '700', '0065405327', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-05-13', '', '0', '0', '', '0.0', '0.0', '-', '', 'Diamond Hill DR 5-6 Citraland', '', '0317458368', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:37:27', '', '');
INSERT INTO `aka_siswa` VALUES ('461', 'PMB2014150720', '', 'Fennie Natalie Solaiman', '429', '0066233686', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-06-29', '', '0', '0', '', '0.0', '0.0', '-', '', 'Galeria Golf No. 25', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:37:48', '', '');
INSERT INTO `aka_siswa` VALUES ('462', 'PMB2014150719', '', 'Felicia Frederica', '413', '0064403738', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-11-16', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family Blok L-55', '', '71111555', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:38:10', '', '');
INSERT INTO `aka_siswa` VALUES ('463', 'PMB2014150717', '', 'Eiffelinne Rudijanto', '444', '0069840530', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-08-25', '', '0', '0', '', '0.0', '0.0', '-', '', 'International Village 2, H6-6', '', '7451087', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:38:35', '', '');
INSERT INTO `aka_siswa` VALUES ('464', 'PMB2014150716', '', 'Devyn Christopher', '427', '0067502984', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2006-04-27', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Harapan V / EL-9', '', '7349450', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:39:25', '', '');
INSERT INTO `aka_siswa` VALUES ('465', 'PMB2014150715', '', 'Daniel Henry Suwignjo', '412', '0058263125', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '1', '1', '0', 'L', 'Surabaya', '2007-12-17', '', '0', '0', '', '0.0', '0.0', '-', '', 'Bukit Darmo Golf Regency B2', '', '0317328119', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:39:46', '', '');
INSERT INTO `aka_siswa` VALUES ('466', 'PMB2014150714', '', 'Cliff Nelson Tumbelaka', '443', '0063759803', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-04-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Regency 3 PE 10-40, Pakuwon Indah', '', '7391455', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:40:08', '', '');
INSERT INTO `aka_siswa` VALUES ('467', 'PMB2014150713', '', 'Christopher Seputro', '410', '0062262984', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-10-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Mas Meditarnian N-26', '', '5618999', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:40:31', '', '');
INSERT INTO `aka_siswa` VALUES ('468', 'PMB2014150712', '', 'Celine Princess Liangkey', '424', '0068506802', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-09-27', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Hill M-22', '', '5636157', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:41:00', '', '');
INSERT INTO `aka_siswa` VALUES ('469', 'PMB2014150711', '', 'Angelene Veronica Tjandra', '423', '0064425334', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-10-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Internasional I / BI-30', '', '7441126', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:41:24', '', '');
INSERT INTO `aka_siswa` VALUES ('470', 'PMB2014150710', '', 'Anneliese Josephine Irawan', '406', '0061032170', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-10-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family R-7', '', '0317533777', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:41:46', '', '');
INSERT INTO `aka_siswa` VALUES ('471', 'PMB2014150709', '', 'Zeng Xian Lun', '519', '0059004159', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'L', 'Mojokerto', '2005-09-23', '', '0', '0', '', '0.0', '0.0', '-', '', 'Alam Galaxy A 10/06, Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:42:33', '', '');
INSERT INTO `aka_siswa` VALUES ('472', 'PMB2014150708', '', 'William Widjaja', '456', '0067625266', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-04-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Vila Bukit Mas K-12A', '', '08123112356', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:42:58', '', '');
INSERT INTO `aka_siswa` VALUES ('473', 'PMB2014150707', '', 'Thierry Hegan Ho', '422', '0068072582', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2006-09-25', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Darmo Permai  I/28', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:43:29', '', '');
INSERT INTO `aka_siswa` VALUES ('474', 'PMB2014150706', '', 'Terrance Edmund L', '438', '0062826817', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2006-06-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Permai Selatan I / 32', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:43:56', '', '');
INSERT INTO `aka_siswa` VALUES ('475', 'PMB2014150705', '', 'Ricky Sugiarto Tjandra', '420', '0069758326', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '1', '1', '0', 'L', 'Surabaya', '2006-06-29', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Harapan Indah XX - 8', '', '7317255', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:44:20', '', '');
INSERT INTO `aka_siswa` VALUES ('476', 'PMB2014150704', '', 'Regina Amadea', '452', '0069605098', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-10-16', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Satelit Indah AT-1', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:46:08', '', '');
INSERT INTO `aka_siswa` VALUES ('477', 'PMB2014150703', '', 'Olethea Kylie Theharin', '592', '0054617386', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2005-11-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Palma Grandia K-4/7, Sby', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 05:46:33', '', '');
INSERT INTO `aka_siswa` VALUES ('478', 'PMB2014150702', '', 'Maxwell Gautama', '450', '0063378742', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-03-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family U.142', '', '0317386500', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:32:12', '', '');
INSERT INTO `aka_siswa` VALUES ('479', 'PMB2014150701', '', 'Lavinia Geovanni Tanujaya', '433', '0068326255', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-10-16', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Mas Blok H No. 1', '', '5663797', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:32:37', '', '');
INSERT INTO `aka_siswa` VALUES ('480', 'PMB2014150700', '', 'Kathleen Cristaline Abigail', '432', '0064058196', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-04-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Prambanan Residence CF/07', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:33:00', '', '');
INSERT INTO `aka_siswa` VALUES ('481', 'PMB2014150699', '', 'Kaitlyn Angeline Santoso', '449', '0064393794', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-08-11', '', '0', '0', '', '0.0', '0.0', '-', '', 'Dian Istana AI - 20', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:33:30', '', '');
INSERT INTO `aka_siswa` VALUES ('482', 'PMB2014150698', '', 'Jonathan Febreson Kanesa', '448', '0065421199', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-02-13', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Indah Timur IV Blok O No. 2', '', '7311001', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:33:51', '', '');
INSERT INTO `aka_siswa` VALUES ('483', 'PMB2014150697', '', 'Jennifer Wongsowinoto', '417', '0062451105', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-06-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wisata Bukit Mas C4-5', '', '7522784', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:34:17', '', '');
INSERT INTO `aka_siswa` VALUES ('484', 'PMB2014150696', '', 'Gwenyth Jazlyn Korompis', '414', '0068485833', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-09-29', '', '0', '0', '', '0.0', '0.0', '-', '', 'Bintang Diponggo Kav 825', '', '5687611', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:34:58', '', '');
INSERT INTO `aka_siswa` VALUES ('485', 'PMB2014150695', '', 'Davide William Susanto', '426', '0062648844', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-12-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wisata Bukit Mas I / C1-8', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:36:17', '', '');
INSERT INTO `aka_siswa` VALUES ('486', 'PMB2014150694', '', 'Chelsea Clarissa', '442', '0065109069', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-03-19', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pregolan Bunder 46 - 48', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:36:48', '', '');
INSERT INTO `aka_siswa` VALUES ('487', 'PMB2014150693', '', 'Celine Tannia Prajogo', '441', '0062147084', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-09-21', '', '0', '0', '', '0.0', '0.0', '-', '', 'Satelit Indah GN-4', '', '7314462', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:37:13', '', '');
INSERT INTO `aka_siswa` VALUES ('488', 'PMB2014150692', '', 'Benedict Ongko Wibowo', '407', '0073652772', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-01-27', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kupang Indah 7 / 6', '', '7311731', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:37:56', '', '');
INSERT INTO `aka_siswa` VALUES ('489', 'PMB2014150691', '', 'Steven Henry Christanto', '455', '0065261459', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-10-31', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Baru Timur II/27', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:39:55', '', '');
INSERT INTO `aka_siswa` VALUES ('490', 'PMB2014150690', '', 'Shelby Wijaya', '437', '0066513072', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-02-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kupang Indah VII / 22', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:40:44', '', '');
INSERT INTO `aka_siswa` VALUES ('491', 'PMB2014150689', '', 'Reinna Wijaya Alie', '435', '0068358844', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-03-14', '', '0', '0', '', '0.0', '0.0', '-', '', 'Satelit Indah 6 JN No. 5', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:41:21', '', '');
INSERT INTO `aka_siswa` VALUES ('492', 'PMB2014150688', '', 'Regina Soempiet', '453', '0064292262', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-06-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'Royal Residence Baimoral B3-52A', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:41:46', '', '');
INSERT INTO `aka_siswa` VALUES ('493', 'PMB2014150687', '', 'Nixie Van Chen', '434', '0066641374', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-09-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Mas RC-21', '', '5680118', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:43:24', '', '');
INSERT INTO `aka_siswa` VALUES ('494', 'PMB2014150686', '', 'Nicholas Yuwono', '419', '0067530572', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-02-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'Satelit Indah 9 / GN-12', '', '7318494', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:43:50', '', '');
INSERT INTO `aka_siswa` VALUES ('495', 'PMB2014150685', '', 'Jayden Gil Gunawan', '416', '0063807381', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-05-25', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pakis Tirtosari VII / 81', '', '5674211', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:44:22', '', '');
INSERT INTO `aka_siswa` VALUES ('496', 'PMB2014150684', '', 'Jamie Axi Lee', '431', '0062674261', '2', '', '1', '0', '', '2', '9', '1', '1', '0', '4', '1', '0', 'L', 'Surabaya', '2006-06-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Selat Golf J2 / 21 Citraland', '', '0317400010', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:44:53', '', '');
INSERT INTO `aka_siswa` VALUES ('497', 'PMB2014150683', '', 'James Dendy', '430', '0066418372', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '1', '1', '0', 'L', 'Surabaya', '2006-12-03', '', '0', '0', '', '0.0', '0.0', '-', '', 'Royal Residence BI / 21A', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:45:28', '', '');
INSERT INTO `aka_siswa` VALUES ('498', 'PMB2014150682', '', 'Ernest Kenneth Young Sumarno', '445', '0052632020', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-12-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Petemon Timur No 112', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:46:03', '', '');
INSERT INTO `aka_siswa` VALUES ('499', 'PMB2014150681', '', 'Erleen Chandra Tang', '428', '0068980949', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '1', '1', '0', 'P', 'Surabaya', '2006-10-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Harapan Utara VII / EY-11', '', '83934138', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:46:31', '', '');
INSERT INTO `aka_siswa` VALUES ('500', 'PMB2014150679', '', 'Early Angel Thie', '593', '0076990429', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2007-03-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pakuwon The Mansion PF4 No. 8', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:47:12', '', '');
INSERT INTO `aka_siswa` VALUES ('501', 'PMB2014150661', '', 'Winleon Tanjaya', '591', '0079974614', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-05-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Permai Selatan X / 126', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:48:41', '', '');
INSERT INTO `aka_siswa` VALUES ('502', 'PMB2014150656', '', 'Reinaldo Darence Halim', '569', '0067998751', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabya', '2006-12-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Gedung Nasional No. 11', '', '5322700', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:49:18', '', '');
INSERT INTO `aka_siswa` VALUES ('503', 'PMB2014150654', '', 'Quinn Annabelle', '586', '0072659936', '2', '', '1', '0', '', '2', '9', '17', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2007-10-03', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pakis Tirtosari 2 / 8', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:49:42', '', '');
INSERT INTO `aka_siswa` VALUES ('504', 'PMB2014150652', '', 'Natascha Yap', '542', '0067843338', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'P', 'USA', '2006-12-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kencana Sari Timur D / 24', '', '0315610973', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:52:17', '', '');
INSERT INTO `aka_siswa` VALUES ('505', 'PMB2014150651', '', 'Matthew Alvaro Tanair', '566', '0071593887', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-03-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wisata Bukit Mas II / 15-22', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:52:51', '', '');
INSERT INTO `aka_siswa` VALUES ('508', 'PMB2014150648', '', 'Kalleo Abram Joneus (Kalleo)', '698', '0063632011', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-08-06', '', '0', '0', '', '0.0', '0.0', '-', '', 'Tanjung Pura 24 Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:54:28', '', '');
INSERT INTO `aka_siswa` VALUES ('509', 'PMB2014150646', '', 'Joshua Daniel Wijaya', '537', '0075767037', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-12-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Bukit Darmo Golf G-51', '', '0317345000', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 06:55:06', '', '');
INSERT INTO `aka_siswa` VALUES ('510', 'PMB2014150645', '', 'Jillian Athalia Nigel', '534', '0071664011', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2007-05-06', '', '0', '0', '', '0.0', '0.0', '-', '', 'Woodland WL 12 / 12', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:02:10', '', '');
INSERT INTO `aka_siswa` VALUES ('511', 'PMB2014150644', '', 'Gwen Angellica Ali Harsanto', '533', '0064674954', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2006-10-25', '', '0', '0', '', '0.0', '0.0', '-', '', 'Royal Residence B 10 / 93', '', '8713405', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:07:42', '', '');
INSERT INTO `aka_siswa` VALUES ('512', 'PMB2014150643', '', 'Frederich Marciano', '576', '0073034070', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-09-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Regency 2 PD 7-2 Pakuwon', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:08:07', '', '');
INSERT INTO `aka_siswa` VALUES ('513', 'PMB2014150642', '', 'Fico Cesar Boedijono', '531', '0076271849', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-02-06', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Satelite Timur QQ-28', '', '7313138', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:08:40', '', '');
INSERT INTO `aka_siswa` VALUES ('514', 'PMB2014150641', '', 'Faylinn Avarielle Suganda', '530', '0075604745', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '4', '1', '0', 'P', 'Malang', '2007-07-11', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family D-109', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:09:12', '', '');
INSERT INTO `aka_siswa` VALUES ('515', 'PMB2014150640', '', 'Fairy Fu', '575', '0076385226', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2007-02-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'Manukan Lor 1 F / 4, Sby', '', '031-7405002', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:09:51', '', '');
INSERT INTO `aka_siswa` VALUES ('516', 'PMB2014150639', '', 'Ethan Isaac Silfanus', '554', '0075135937', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-09-26', '', '0', '0', '', '0.0', '0.0', '-', '', 'Gubeng Kertajaya 7-Y/9', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:10:52', '', '');
INSERT INTO `aka_siswa` VALUES ('517', 'PMB2014150638', '', 'Christabel', '552', '0073888797', '2', '', '1', '0', '', '2', '9', '1', '1', '0', '5', '1', '0', 'P', 'Surabaya', '2007-06-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Pondok Jati AP - 9 Geluran Sepanjang', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:11:25', '', '');
INSERT INTO `aka_siswa` VALUES ('518', 'PMB2014150637', '', 'Arnold Jansen Kho', '525', '0076157744', '2', '', '1', '0', '', '2', '9', '1', '1', '0', '4', '1', '0', 'L', 'Surabaya', '2007-04-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Lebak Indah Jaya I kav 9', '', '0313821484', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:11:54', '', '');
INSERT INTO `aka_siswa` VALUES ('519', 'PMB2014150636', '', 'Angela Monique Tejakusuma', '548', '0073380229', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2007-08-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Satelit Indah III / LN No. 5', '', '0317346469', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:12:14', '', '');
INSERT INTO `aka_siswa` VALUES ('520', 'PMB2014150635', '', 'Alexander Budihartono', '524', '0072433502', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '4', '1', '0', 'L', 'Brisbane', '2007-01-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Pondok Indah LX-7', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:12:38', '', '');
INSERT INTO `aka_siswa` VALUES ('521', 'PMB2014150634', '', 'Aislyn Samantha Ang', '523', '0079866277', '2', '', '1', '0', '', '2', '9', '1', '1', '0', '5', '1', '0', 'P', 'Singapore', '2007-11-21', '', '0', '0', '', '0.0', '0.0', '-', '', 'Puncak Permai II / 2A', '', '7315266', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:13:00', '', '');
INSERT INTO `aka_siswa` VALUES ('522', 'PMB2014150649', '', 'Kevin Adinugroho', '563', '0077757192', '2', '', '1', '0', '', '2', '9', '12', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2007-12-03', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kupang Indah XXI / 11, Sby', '', '0317311574', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:16:55', '', '');
INSERT INTO `aka_siswa` VALUES ('523', 'PMB2014150624', '', 'Andreano Sebastian Dengi', '697', '0073650643', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Padang', '2007-06-25', '', '0', '0', '', '0.0', '0.0', '-', '', 'Sambongan III/10', '', '0313536106', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:18:02', '', '');
INSERT INTO `aka_siswa` VALUES ('524', 'PMB2014150589', '', 'Verlyn Pangestoe (Verlyn)', '696', '0085042216', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-05-03', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Regency 3 PE 10/30', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:20:10', '', '');
INSERT INTO `aka_siswa` VALUES ('525', 'PMB2014150588', '', 'Scott Caleb Johar Gunawan (Scott)', '695', '0086299242', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-10-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Eastwood EW-9/17 Citraland', '', '03181831191', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:20:42', '', '');
INSERT INTO `aka_siswa` VALUES ('526', 'PMB2014150587', '', 'Patricia Michelle Rumoei (Patricia)', '694', '0088286027', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-04-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Simpang Darmo Permai Timur 2 / 2', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:21:15', '', '');
INSERT INTO `aka_siswa` VALUES ('527', 'PMB2014150586', '', 'Noel Nelsen Felix', '693', '0089288765', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-01-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Perum Darmo Sentosa Raya Blok H-21', '', '0315684639', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:21:39', '', '');
INSERT INTO `aka_siswa` VALUES ('528', 'PMB2014150585', '', 'Michelle Tanaya (Michelle)', '692', '0084544937', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2008-07-27', '', '0', '0', '', '0.0', '0.0', '-', '', 'Tulung Agung 3/6 Surabaya', '', '0315319420', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:22:08', '', '');
INSERT INTO `aka_siswa` VALUES ('529', 'PMB2014150584', '', 'Louis Chandoko (Louis)', '691', '0089289623', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-12-19', '', '0', '0', '', '0.0', '0.0', '-', '', 'Forest Mansion B-23', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:22:39', '', '');
INSERT INTO `aka_siswa` VALUES ('530', 'PMB2014150583', '', 'Kiyora Asami Prasetya', '690', '0085339120', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-08-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kertajaya Indah Regency A 25', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:23:17', '', '');
INSERT INTO `aka_siswa` VALUES ('532', 'PMB2014150581', '', 'Josevine Angeline Musa (Josevine)', '688', '0087438069', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-04-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Permai Selatan 11 / 18', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:24:30', '', '');
INSERT INTO `aka_siswa` VALUES ('533', 'PMB2014150580', '', 'Jessica Beatricia (Jessica)', '687', '0087348700', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-02-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Rafles Garden TB XII/35', '', '0317400643', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:25:07', '', '');
INSERT INTO `aka_siswa` VALUES ('534', 'PMB2014150579', '', 'Jerome Keane Lim (Jerome / Keane)', '686', '0083747067', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-07-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'Chofa RE - 11', '', '0317325068', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:25:40', '', '');
INSERT INTO `aka_siswa` VALUES ('535', 'PMB2014150578', '', 'Jedidiah Budiman (Jedidiah)', '685', '0084512531', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-09-15', '', '0', '0', '', '0.0', '0.0', '-', '', 'Progo 8 Surabaya', '', '0315676572', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:26:15', '', '');
INSERT INTO `aka_siswa` VALUES ('536', 'PMB2014150577', '', 'Jade Agung Handojo (Jade)', '684', '0081066633', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2008-03-21', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Harapan VI / EC-19', '', '0317346930', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:26:45', '', '');
INSERT INTO `aka_siswa` VALUES ('537', 'PMB2014150576', '', 'Grace Caroline Cahyono (Grace)', '683', '0085184842', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2008-07-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'Mulyorejo Mega Asri 129', '', '0315964953', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:27:16', '', '');
INSERT INTO `aka_siswa` VALUES ('538', 'PMB2014150575', '', 'Ferdinand Christianto Thomas (Ferdinand)', '682', '0089715606', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2008-02-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Mastrip Kemlaten 26 B', '', '0317674122', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:27:46', '', '');
INSERT INTO `aka_siswa` VALUES ('539', 'PMB2014150574', '', 'Felicia Clarissa Tanurijanto (Felice)', '681', '0081405793', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2008-10-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Puri Sentra Raya PS 2/43 B Citraland', '', '0317440099', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:28:14', '', '');
INSERT INTO `aka_siswa` VALUES ('540', 'PMB2014150582', '', 'Keziah Lim (Kei)', '689', '0082495921', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-05-23', '', '0', '0', '', '0.0', '0.0', '-', '', 'Perum Graha Famili Blok N-46', '', '0317346683', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:28:51', '', '');
INSERT INTO `aka_siswa` VALUES ('541', 'PMB2014150573', '', 'Ezekiel Shawn Wondo (Shawn)', '680', '0088611332', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-05-04', '', '0', '0', '', '0.0', '0.0', '-', '', 'Central Park A. Yani E/19', '', '0318272828', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:29:12', '', '');
INSERT INTO `aka_siswa` VALUES ('542', 'PMB2014150572', '', 'Claris Lievia (Claris)', '679', '0089079284', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-07-29', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wisata Bukit Mas B2/5', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:29:50', '', '');
INSERT INTO `aka_siswa` VALUES ('543', 'PMB2014150571', '', 'Brandon Archer (Brandon)', '678', '0083114195', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-07-15', '', '0', '0', '', '0.0', '0.0', '-', '', 'Tanjungsari Baru 5 Blok GG 36', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:30:20', '', '');
INSERT INTO `aka_siswa` VALUES ('544', 'PMB2014150537', '', 'George Kennedy Kristanto', '643', '0083617983', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-08-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family N-33', '', '0317340928', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:34:56', '', '');
INSERT INTO `aka_siswa` VALUES ('545', 'PMB2014150538', '', 'Gerald Deven Tejokusumo', '644', '0073258870', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-12-11', '', '0', '0', '', '0.0', '0.0', '-', '', 'Gajah Mada 203 Sda', '', '0318962977', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:35:18', '', '');
INSERT INTO `aka_siswa` VALUES ('546', 'PMB2014150539', '', 'Hansel Jornelle', '645', '0089145285', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-10-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kupang Baru 2 No. 25', '', '0317348815', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:35:40', '', '');
INSERT INTO `aka_siswa` VALUES ('547', 'PMB2014150540', '', 'Jeanette Soewargo', '646', '0081006157', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-02-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Royal Park TL IV/23 Citraland', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:36:00', '', '');
INSERT INTO `aka_siswa` VALUES ('548', 'PMB2014150541', '', 'Jenevieve Clairine Setiawan', '647', '0087851425', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-02-14', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Darmo Harapan II / EG - 11C', '', '0317317042', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:36:21', '', '');
INSERT INTO `aka_siswa` VALUES ('549', 'PMB2014150542', '', 'Jessica Johana Ponga', '648', '0089069991', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-04-30', '', '0', '0', '', '0.0', '0.0', '-', '', 'Simo Mulyo Baru Blok 7i / 13', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:36:41', '', '');
INSERT INTO `aka_siswa` VALUES ('550', 'PMB2014150543', '', 'Joshua Alexander Kurt Kyriss', '649', '0081252029', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-06-15', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Satelit Utara 3 Blok PT No.6', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:37:01', '', '');
INSERT INTO `aka_siswa` VALUES ('551', 'PMB2014150544', '', 'Kenneth Boesono', '650', '0089761524', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-03-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Regency PC 3 / 12 Pakuwon Indah', '', '0315031985', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:37:24', '', '');
INSERT INTO `aka_siswa` VALUES ('552', 'PMB2014150545', '', 'Kezia Rexana Lie', '651', '0081145294', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-07-11', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kupang Indah I / 36', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:37:44', '', '');
INSERT INTO `aka_siswa` VALUES ('553', 'PMB2014150546', '', 'Maggie Tse', '652', '0084528149', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2008-12-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Manukan Tama 19-O/47', '', '03171983098', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:38:03', '', '');
INSERT INTO `aka_siswa` VALUES ('554', 'PMB2014150547', '', 'Sharon Alexandra Soempiet', '653', '0081874981', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2009-01-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Royal Residence Balmoral B3-52A', '', '8687854', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:38:27', '', '');
INSERT INTO `aka_siswa` VALUES ('555', 'PMB2014150548', '', 'Yehezkiel Messi Jeremi Sianipar', '654', '0087709501', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-04-26', '', '0', '0', '', '0.0', '0.0', '-', '', 'Silindri 12 HN 2 Kotabatu Driyorejo Gresik', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:38:49', '', '');
INSERT INTO `aka_siswa` VALUES ('556', 'PMB2014150549', '', 'Colin Cristo Harianto (Colin)', '656', '0082453363', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-01-19', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wisata Bukit Mas II / Blok E3 No. 10', '', '0317530738', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:41:08', '', '');
INSERT INTO `aka_siswa` VALUES ('557', 'PMB2014150550', '', 'Emili Tricia Faustine (Mili)', '657', '0086021322', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '1', '1', '0', 'P', 'Surabaya', '2008-05-15', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kranggan No. 102 Kav.8', '', '0315340131', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:42:01', '', '');
INSERT INTO `aka_siswa` VALUES ('558', 'PMB2014150551', '', 'Engelbert Theophile Ho (Elbert)', '658', '0083373263', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-07-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kencanasari Barat 7 / G.38', '', '03171019099', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:42:27', '', '');
INSERT INTO `aka_siswa` VALUES ('559', 'PMB2014150552', '', 'Evaldo Sukoco (Aldo)', '659', '0072829133', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2007-11-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Satelit Indah 3/KN 12 D', '', '0317318508', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:42:57', '', '');
INSERT INTO `aka_siswa` VALUES ('560', 'PMB2014150553', '', 'Ferlyne Gabrielly Thie (Ferlyne)', '660', '0081446708', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2008-04-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pakuwon Indah The Mansion PF 4 No. 8', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:43:18', '', '');
INSERT INTO `aka_siswa` VALUES ('561', 'PMB2014150554', '', 'Gabrielle Abigail Limpo (Bie Bie)', '661', '0086241204', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Melbourne Victoria', '2008-12-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family FF 32', '', '0317534174', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:43:38', '', '');
INSERT INTO `aka_siswa` VALUES ('562', 'PMB2014150555', '', 'Griffith Clairenova Wijaya (Griffith)', '663', '0086367500', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-09-22', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family Blok YY / No. 26', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:44:00', '', '');
INSERT INTO `aka_siswa` VALUES ('563', 'PMB2014150556', '', 'Hacken Wunadi (Hacken)', '664', '0087481516', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-09-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family R 179 A', '', '03131202033', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:44:25', '', '');
INSERT INTO `aka_siswa` VALUES ('564', 'PMB2014150557', '', 'Janice Valerie Judianto (Janice)', '665', '0088848445', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2008-01-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pakuwon Indah, One Golf Terrace AB 11/58', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:44:48', '', '');
INSERT INTO `aka_siswa` VALUES ('565', 'PMB2014150558', '', 'Jesslyn Olivia', '666', '0086451224', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '1', '1', '0', 'P', 'Surabaya', '2008-10-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'Royal Residence B 1/21A', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:46:03', '', '');
INSERT INTO `aka_siswa` VALUES ('566', 'PMB2014150561', '', 'Lionel Edric Zhu (Lin-lin / Lio)', '668', '0086427935', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-07-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'North Emerald Mansion TN 4/3', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:46:31', '', '');
INSERT INTO `aka_siswa` VALUES ('567', 'PMB2014150562', '', 'Louisa Angela Sutiono (Angela)', '669', '0071030695', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2007-12-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family H-38', '', '03170586993', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:47:05', '', '');
INSERT INTO `aka_siswa` VALUES ('568', 'PMB2014150563', '', 'Rafe Titan Hartono (Rafe)', '670', '0081084800', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-05-21', '', '0', '0', '', '0.0', '0.0', '-', '', 'Bintang Diponggo 757', '', '0315670925', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:47:24', '', '');
INSERT INTO `aka_siswa` VALUES ('569', 'PMB2014150564', '', 'Raziela Kelly Ali Harsanto (Kelly)', '671', '0087574339', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2008-05-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Royal Residence B.10/93', '', '0315670925', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:47:50', '', '');
INSERT INTO `aka_siswa` VALUES ('570', 'PMB2014150565', '', 'Richelle Princess Liangkey (Richelle)', '672', '0084220395', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-03-29', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Hill M-22', '', '0315636157', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:48:10', '', '');
INSERT INTO `aka_siswa` VALUES ('571', 'PMB2014150566', '', 'Shane Andersen Tandiono (Shane)', '673', '0086938945', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-04-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Sukomanunggal Jaya 2/35', '', '0317341123', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:49:14', '', '');
INSERT INTO `aka_siswa` VALUES ('572', 'PMB2014150567', '', 'Tifannie Gabrielle Hadiwidjojo (Tifannie)', '674', '0083490661', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-05-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kupang Indah 2 / 52', '', '0317315224', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:49:36', '', '');
INSERT INTO `aka_siswa` VALUES ('573', 'PMB2014150568', '', 'Wilbert Suryajaya Lim (Wilbert)', '675', '0074150479', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2007-11-16', '', '0', '0', '', '0.0', '0.0', '-', '', 'Satelit Utara VII/CT 14', '', '0317316226', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:50:51', '', '');
INSERT INTO `aka_siswa` VALUES ('574', 'PMB2014150569', '', 'Asthon Preston Young Sumarno (Asthon)', '676', '0089231874', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-02-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Petemon Timur No. 114', '', '0315313343', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:51:30', '', '');
INSERT INTO `aka_siswa` VALUES ('575', 'PMB2014150570', '', 'Beatrice Christilove Santoso (Beatrice)', '677', '0084256389', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2008-12-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Manukan Wetan 32', '', '03170397737', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:51:53', '', '');
INSERT INTO `aka_siswa` VALUES ('576', 'PMB2014150464', '', 'Allen Wijaya Alie', '634', '0087131066', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2008-10-19', '', '0', '0', '', '0.0', '0.0', '-', '', 'Satelit Indah 6 JN No. 5', '', '0317318668', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:53:44', '', '');
INSERT INTO `aka_siswa` VALUES ('577', 'PMB2014150521', '', 'Aaron Elliot Tandra', '633', '0086314896', '2', '', '1', '0', '', '2', '9', '5', '2', '0', '4', '1', '0', 'L', 'Jakarta', '2008-10-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family C-60', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-13 07:54:30', '', '');
INSERT INTO `aka_siswa` VALUES ('578', 'PMB2014150831', '', 'Yohanes Tjahyadi', '341', '0041739242', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2004-05-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Vila Sentra Raya AG / 23, Sby', '', '70271689', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:24:35', '', '');
INSERT INTO `aka_siswa` VALUES ('579', 'PMB2014150830', '', 'Tamara Jessica Chandra', '336', '0041739243', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-06-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Babatan Pratama 26 / 47', '', '7523740', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:25:01', '', '');
INSERT INTO `aka_siswa` VALUES ('580', 'PMB2014150828', '', 'Stevan Alexander Surya', '401', '0049204629', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2004-09-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pakis Bukit Asoka R-23', '', '03133119990', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:25:42', '', '');
INSERT INTO `aka_siswa` VALUES ('581', 'PMB2014150827', '', 'Stanley Alexander Sugianto', '333', '0041739253', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2004-09-06', '', '0', '0', '', '0.0', '0.0', '-', '', 'Simo Tambaan Sekolahan No. 2', '', '7328829', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:26:54', '', '');
INSERT INTO `aka_siswa` VALUES ('582', 'PMB2014150826', '', 'Sonya Nahama Wijoyo', '332', '0043648750', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2004-04-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kupang Indah 7 /12, Sby', '', '7311730', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:27:33', '', '');
INSERT INTO `aka_siswa` VALUES ('583', 'PMB2014150825', '', 'Quenny Michaela Anggraini', '328', '0041739254', '2', '', '1', '0', '', '2', '9', '15', '1', '0', '4', '1', '0', 'P', 'Surabaya', '2004-09-14', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kupang Indah 2/22', '', '7316188', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:27:57', '', '');
INSERT INTO `aka_siswa` VALUES ('584', 'PMB2014150824', '', 'Nicholas Kevin Tjoei', '326', '0041739228', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2004-01-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Baru Barat X / 53, Sby', '', '7344193', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:28:19', '', '');
INSERT INTO `aka_siswa` VALUES ('585', 'PMB2014150823', '', 'Netanya Marvela Irawan', '325', '0041739230', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-02-06', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Famili R - 7, Sby', '', '7533777', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:28:40', '', '');
INSERT INTO `aka_siswa` VALUES ('586', 'PMB2014150822', '', 'Nathan Amadeus', '323', '0041739238', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-05-14', '', '0', '0', '', '0.0', '0.0', '-', '', 'Alam Hijau F1 / 20, Sby', '', '7466301', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:29:03', '', '');
INSERT INTO `aka_siswa` VALUES ('587', 'PMB2014150821', '', 'Melinda Fandrayani', '320', '0041739273', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-12-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Satelit Utara VII / CT - 14, Sby', '', '7316226', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:29:26', '', '');
INSERT INTO `aka_siswa` VALUES ('588', 'PMB2014150820', '', 'Louis Darren Irwan', '463', '0037020901', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2003-12-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Imperial Golf Regensi AB 2 No. 6', '', '7391882', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:29:49', '', '');
INSERT INTO `aka_siswa` VALUES ('589', 'PMB2014150819', '', 'Lamtiar Nauli Sabrina Margareth Nababan', '318', '0041739251', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Tangerang', '2004-09-03', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wisma Tengger XVII / 2', '', '7405884', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:30:17', '', '');
INSERT INTO `aka_siswa` VALUES ('590', 'PMB2014150818', '', 'Kayla Calista Anabelle', '314', '0041739247', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-07-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Puri Surya Jaya D5/32, Gedangan', '', '8917657', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:30:59', '', '');
INSERT INTO `aka_siswa` VALUES ('591', 'PMB2014150817', '', 'Jocelyn', '462', '0049806185', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-06-14', '', '0', '0', '', '0.0', '0.0', '-', '', 'Tulung Agung 3 / 8, Surabaya', '', '7056995', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:31:26', '', '');
INSERT INTO `aka_siswa` VALUES ('592', 'PMB2014150816', '', 'He Xing Hua', '307', '0041739248', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Shang Hai', '2004-07-30', '', '0', '0', '', '0.0', '0.0', '-', '', 'Dupak No. 65 Blok B-3 Ruko Mutiara Dupak', '', '71844438', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:31:48', '', '');
INSERT INTO `aka_siswa` VALUES ('593', 'PMB2014150815', '', 'Fiona Chandra', '302', '0041739233', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2004-02-17', '', '0', '0', '', '0.0', '0.0', '-', '', 'Puri Widya Kencana J3 No 2 Citra Raya', '', '7482759', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:32:12', '', '');
INSERT INTO `aka_siswa` VALUES ('594', 'PMB2014150814', '', 'Eunike Jacquelyn Widarto', '298', '0041739259', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-10-13', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Permai Timur VIII/16, Sby', '', '7328528', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:36:12', '', '');
INSERT INTO `aka_siswa` VALUES ('595', 'PMB2014150813', '', 'Emily Francesca Soegijanto', '296', '0041739236', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2020-04-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Baru Barat I / 39', '', '7329845', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:36:34', '', '');
INSERT INTO `aka_siswa` VALUES ('596', 'PMB2014150812', '', 'Devny Fu', '707', '0037745077', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2003-11-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Manukan Lor IF No. 4', '', '03171012546', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:36:57', '', '');
INSERT INTO `aka_siswa` VALUES ('597', 'PMB2014150811', '', 'Clarice Angeline', '289', '0041739245', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-06-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Tanjungsari Baru V / Blok GG-36', '', '7313096', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:37:20', '', '');
INSERT INTO `aka_siswa` VALUES ('598', 'PMB2014150810', '', 'Brivio Darren Wigitono', '286', '0044923536', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2004-08-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Indah Selatan LL - 39', '', '71027122', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:37:49', '', '');
INSERT INTO `aka_siswa` VALUES ('599', 'PMB2014150809', '', 'Wang Xiao Han', '465', '0027026527', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2002-08-13', '', '0', '0', '', '0.0', '0.0', '-', '', 'Rayan Regency F-5', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:38:21', '', '');
INSERT INTO `aka_siswa` VALUES ('600', 'PMB2014150808', '', 'Vanessa Shareen', '464', '0049840906', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-06-19', '', '0', '0', '', '0.0', '0.0', '-', '', 'Babatan Pantai Barat I/66                       Villa Bukit Regency 2PD3-11', '', '7482033', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:38:44', '', '');
INSERT INTO `aka_siswa` VALUES ('601', 'PMB2014150807', '', 'Shelfina', '331', '0041739239', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-05-21', '', '0', '0', '', '0.0', '0.0', '-', '', 'Perum Alam Galaxy, Water Terrace A8 - 3', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:39:07', '', '');
INSERT INTO `aka_siswa` VALUES ('602', 'PMB2014150806', '', 'Rachel Mantalik', '329', '0041739267', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-11-17', '', '0', '0', '', '0.0', '0.0', '-', '', 'Royal Residence B 10/97', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:39:33', '', '');
INSERT INTO `aka_siswa` VALUES ('603', 'PMB2014150805', '', 'Prisca Lovely Gunawan', '327', '0041739237', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-04-29', '', '0', '0', '', '0.0', '0.0', '-', '', 'Sukomanunggal Jaya XI / XL-26', '', '7314888', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:39:53', '', '');
INSERT INTO `aka_siswa` VALUES ('604', 'PMB2014150804', '', 'Naomi Boesono', '321', '0035754471', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2003-12-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pakuwon Indah Villa Bukit Regency I PC3 - 12', '', '7391974', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:40:14', '', '');
INSERT INTO `aka_siswa` VALUES ('605', 'PMB2014150803', '', 'Michelle Katrina Suwanto', '403', '0047392856', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2004-09-17', '', '0', '0', '', '0.0', '0.0', '-', '', 'Simo Rukun VII / 7, Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:40:49', '', '');
INSERT INTO `aka_siswa` VALUES ('606', 'PMB2014150802', '', 'Kenny Wibowo', '317', '0041739231', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '3', '1', '0', 'L', 'Surabaya', '2004-02-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Hunian Satelit II Blok B/2, Sukomanunggal Indah III', '', '7310536', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:41:09', '', '');
INSERT INTO `aka_siswa` VALUES ('607', 'PMB2014150801', '', 'Kayne Juro Chandra (Kayne)', '706', '0049425046', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2020-11-04', '', '0', '0', '', '0.0', '0.0', '-', '', 'Puri Sentra Raya PS 1/37 Citraland', '', '7416677', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:41:34', '', '');
INSERT INTO `aka_siswa` VALUES ('608', 'PMB2014150800', '', 'Joycelyn Eugenia Kurniadi', '313', '0041739232', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-02-14', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wisata Bukit Mas C-5 / 12', '', '7535682', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:41:54', '', '');
INSERT INTO `aka_siswa` VALUES ('609', 'PMB2014150799', '', 'Jeremy Gautama', '311', '0041739246', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2004-07-13', '', '0', '0', '', '0.0', '0.0', '-', '', 'Satelit Indah 7/DN-21, Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:42:17', '', '');
INSERT INTO `aka_siswa` VALUES ('610', 'PMB2014150798', '', 'Jason Lienardi', '309', '0047049912', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2004-04-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kupang Iandah XI / 116', '', '7326978', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:42:45', '', '');
INSERT INTO `aka_siswa` VALUES ('611', 'PMB2014150797', '', 'Graciella Geraldine Supramono', '402', '0040974355', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Banyuwangi', '2004-01-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Sutorejo Utara F 1/2', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:43:10', '', '');
INSERT INTO `aka_siswa` VALUES ('612', 'PMB2014150796', '', 'Giselle Laetitia', '305', '0041739250', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-08-26', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Indah AA 10-12, Pakuwon', '', '7526847', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:43:30', '', '');
INSERT INTO `aka_siswa` VALUES ('613', 'PMB2014150795', '', 'Francis Limanseto', '304', '0041739226', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2004-01-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Babatan Mukti O - 19, Wiyung', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:43:51', '', '');
INSERT INTO `aka_siswa` VALUES ('614', 'PMB2014150794', '', 'Feliana Veronica', '300', '0048089291', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2004-08-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Permai Timur SS - 26', '', '7342890', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:44:17', '', '');
INSERT INTO `aka_siswa` VALUES ('615', 'PMB2014150793', '', 'Edward Christian Budijanto', '295', '0039646636', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2003-10-25', '', '0', '0', '', '0.0', '0.0', '-', '', 'SidosermoAirdas V/F-116', '', '8432601', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:44:40', '', '');
INSERT INTO `aka_siswa` VALUES ('616', 'PMB2014150792', '', 'Devina Claresta', '294', '0041739227', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-01-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'Margorejo Indah 3/B-710', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:45:04', '', '');
INSERT INTO `aka_siswa` VALUES ('617', 'PMB2014150791', '', 'Derric Ang Suhartono', '461', '0049284725', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2004-05-26', '', '0', '0', '', '0.0', '0.0', '-', '', 'Citraland Bukit Golf Utama Blok FI / 3A', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:45:25', '', '');
INSERT INTO `aka_siswa` VALUES ('618', 'PMB2014150790', '', 'Cindy Carina Thomas (Cindy)', '705', '0041239803', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Probolinggo', '2004-08-17', '', '0', '0', '', '0.0', '0.0', '-', '', 'Sidodadi No. 40 Surabaya', '', '0313719890', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:45:45', '', '');
INSERT INTO `aka_siswa` VALUES ('619', 'PMB2014150789', '', 'Charlene Athena Tjahjadi', '288', '0041739229', '2', '', '1', '0', '', '2', '9', '15', '1', '0', '5', '1', '0', 'P', 'Surabaya', '2004-01-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Kupang Jaya B 10', '', '81984321', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:46:05', '', '');
INSERT INTO `aka_siswa` VALUES ('620', 'PMB2014150788', '', 'Cathrioca Keisha', '287', '0041739255', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2004-09-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Pondok Indah AA - 2 Wiyung, Sby', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:46:28', '', '');
INSERT INTO `aka_siswa` VALUES ('621', 'PMB2014150787', '', 'Beatricia Audrey Siemon', '285', '0041739268', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2004-11-27', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Regency 2, PD3/11, Pakuwon Indah, Sby', '', '7391112', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:46:52', '', '');
INSERT INTO `aka_siswa` VALUES ('622', 'PMB2014150786', '', 'Audrey Netanya Benyamin', '283', '0041739235', '2', '', '1', '0', '', '2', '9', '15', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-04-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Satelit Utara III/ET - 36, Sby', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:47:16', '', '');
INSERT INTO `aka_siswa` VALUES ('623', 'PMB2014150785', '', 'William Patrick', '382', '0059185160', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-01-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Taman Telaga II TJ-6 No. 9 Citraland', '', '7450853', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:47:57', '', '');
INSERT INTO `aka_siswa` VALUES ('624', 'PMB2014150784', '', 'Timothy Johannes Wijaya', '365', '0054678338', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-10-16', '', '0', '0', '', '0.0', '0.0', '-', '', 'Bukit Darmo Golf G-51', '', '7383999', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:48:20', '', '');
INSERT INTO `aka_siswa` VALUES ('625', 'PMB2014150783', '', 'Peter Julianto', '398', '0057705292', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-03-23', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Hill L-21 A', '', '5636120', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:48:41', '', '');
INSERT INTO `aka_siswa` VALUES ('626', 'PMB2014150782', '', 'Michelle Ping Ping Lie', '363', '0051745947', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '3', '1', '0', 'P', 'Surabaya', '2005-09-11', '', '0', '0', '', '0.0', '0.0', '-', '', 'Satelit Indah 7 / EN 1', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:49:01', '', '');
INSERT INTO `aka_siswa` VALUES ('627', 'PMB2014150781', '', 'Lianny Patricia Hartono', '395', '0053351549', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2005-03-13', '', '0', '0', '', '0.0', '0.0', '-', '', 'Permata Safira Regency Blok BI / 3', '', '7534207', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:49:21', '', '');
INSERT INTO `aka_siswa` VALUES ('628', 'PMB2014150780', '', 'Kenneth Ongko Wibowo', '361', '0051730909', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-11-07', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kupang Indah 7 / 6', '', '7311731', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:49:41', '', '');
INSERT INTO `aka_siswa` VALUES ('629', 'PMB2014150779', '', 'Karen Leticia', '360', '0057472339', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2005-09-04', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Gapura E6 / 19', '', '7412288', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-16 08:50:10', '', '');
INSERT INTO `aka_siswa` VALUES ('630', 'PMB2014150726', '', 'Maximillian Wilbert', '418', '0061979943', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'L', 'Maximillian Wilbert', '2006-05-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Baru Barat XI / 11', '', '7321670', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:13:01', '', '');
INSERT INTO `aka_siswa` VALUES ('631', 'PMB2014150727', '', 'Phillip Albert Samaoen', '451', '0063486984', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-07-17', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family FF-29', '', '7535449', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:13:24', '', '');
INSERT INTO `aka_siswa` VALUES ('632', 'PMB2014150728', '', 'Samuel Widarto', '436', '0064256471', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-02-17', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Permai Timur I / 29', '', '7314382', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:13:46', '', '');
INSERT INTO `aka_siswa` VALUES ('633', 'PMB2014150729', '', 'Stephanie Meygan Handoko', '421', '0068931151', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2006-05-15', '', '0', '0', '', '0.0', '0.0', '-', '', 'Puri Widya Utama i-I/5', '', '0317348923', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:14:14', '', '');
INSERT INTO `aka_siswa` VALUES ('634', 'PMB2014150730', '', 'Walt Christian Halimsaputera', '439', '0064527573', '2', '', '1', '0', '', '2', '9', '13', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2006-04-26', '', '0', '0', '', '0.0', '0.0', '-', '', 'Satelit Utara 6-IT/10', '', '7325600', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:14:41', '', '');
INSERT INTO `aka_siswa` VALUES ('635', 'PMB2014150731', '', 'Andrew Koespianto', '367', '0055382302', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-06-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family C-38', '', '7346253', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:15:16', '', '');
INSERT INTO `aka_siswa` VALUES ('636', 'PMB2014150732', '', 'Edbert Louise Suryasatria', '594', '0048868938', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2004-12-04', '', '0', '0', '', '0.0', '0.0', '-', '', 'R. Sukomanunggal Jaya 60, Sby', '', '7311560', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:15:51', '', '');
INSERT INTO `aka_siswa` VALUES ('637', 'PMB2014150733', '', 'Edgar Rilley Setyadarma', '352', '0053157035', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-05-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Vila Bukit Mas L 21', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:16:14', '', '');
INSERT INTO `aka_siswa` VALUES ('638', 'PMB2014150734', '', 'Elaine Christian Budijanto', '473', '0045666007', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2004-11-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Woodland 2/122 Citraland', '', '72362838', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:16:38', '', '');
INSERT INTO `aka_siswa` VALUES ('639', 'PMB2014150735', '', 'Farryl Gracious Sie', '390', '0059581272', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2005-05-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Dharmahusada Indah M-17', '', '596427071', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:17:03', '', '');
INSERT INTO `aka_siswa` VALUES ('640', 'PMB2014150736', '', 'Felicia Gabrielle Rumoei', '460', '0059259729', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2005-06-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Simpang Darmo Permai Timur II No. 2', '', '7342738', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:17:27', '', '');
INSERT INTO `aka_siswa` VALUES ('641', 'PMB2014150737', '', 'Fujiana Tanoto (Niu Niu)', '701', '0065993046', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2006-01-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Mas Monaco II TC 6', '', '035614566', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:18:32', '', '');
INSERT INTO `aka_siswa` VALUES ('642', 'PMB2014150738', '', 'Frederick Rico Go', '354', '0058210273', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2006-11-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Indah AAL 36', '', '7524253', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:18:57', '', '');
INSERT INTO `aka_siswa` VALUES ('643', 'PMB2014150739', '', 'Gabriela Keyrin Tjoei', '373', '0053921140', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2005-08-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Baru Barat X/53', '', '7344193', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:19:30', '', '');
INSERT INTO `aka_siswa` VALUES ('644', 'PMB2014150740', '', 'Gerich Greven', '374', '0055799404', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-05-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Petemon Barat 96', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:19:59', '', '');
INSERT INTO `aka_siswa` VALUES ('645', 'PMB2014150741', '', 'Hillary Yauwhanes (Hilly)', '702', '0055512239', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2005-01-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Famili A-51', '', '0315992938', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:20:30', '', '');
INSERT INTO `aka_siswa` VALUES ('646', 'PMB2014150742', '', 'James Marcel Chandra', '357', '0056329892', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-06-17', '', '0', '0', '', '0.0', '0.0', '-', '', 'Babatan Pratama NN 47', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:23:57', '', '');
INSERT INTO `aka_siswa` VALUES ('647', 'PMB2014150743', '', 'Joel Ravael Kurniawan', '459', '0059270359', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-10-03', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kutisari Indah Utara III / 30', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:27:38', '', '');
INSERT INTO `aka_siswa` VALUES ('648', 'PMB2014150744', '', 'Jonathan Budianto', '375', '0055006880', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-09-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Royal Residence B3-47', '', '7510137', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:30:00', '', '');
INSERT INTO `aka_siswa` VALUES ('649', 'PMB2014150745', '', 'Kimberly Zhang', '393', '0053524048', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2005-04-27', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Baru Barat I / 57', '', '7315902', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:30:23', '', '');
INSERT INTO `aka_siswa` VALUES ('650', 'PMB2014150746', '', 'Marcia Jeselyn', '379', '0059640527', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2005-06-03', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Mas D-28', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:30:44', '', '');
INSERT INTO `aka_siswa` VALUES ('651', 'PMB2014150747', '', 'Victoria Ashley Pramoko', '366', '0059258154', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2005-06-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pakis Bukit Anggrek L-12 Darmo Hill', '', '5636119', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:31:05', '', '');
INSERT INTO `aka_siswa` VALUES ('652', 'PMB2014150748', '', 'Yohan Immanuel Hendrajaya', '400', '0041185289', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2004-07-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Royal Residence B 2-103', '', '7510325', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:31:55', '', '');
INSERT INTO `aka_siswa` VALUES ('653', 'PMB2014150749', '', 'Ashley Cecilia Nugroho', '385', '0051641700', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2005-06-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family Utara VII Blok D-187', '', '7343419', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:32:33', '', '');
INSERT INTO `aka_siswa` VALUES ('654', 'PMB2014150750', '', 'Athalia Nichole Nathanusa', '457', '0054773578', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2005-05-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Citraland Pakuwon KS-5', '', '0317480082', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:32:57', '', '');
INSERT INTO `aka_siswa` VALUES ('655', 'PMB2014150751', '', 'Benedict Theodore Hogiharto', '369', '0053220520', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-07-14', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kencanasari Barat 7/G-38', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:33:23', '', '');
INSERT INTO `aka_siswa` VALUES ('656', 'PMB2014150752', '', 'Calistha Kurniawan', '387', '0051399868', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '1', '1', '0', 'P', 'Surabaya', '2005-08-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Hill S-10', '', '5636300', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:33:44', '', '');
INSERT INTO `aka_siswa` VALUES ('657', 'PMB2014150753', '', 'Dave Tristan Hartono', '351', '0055588269', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-10-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Bintang Diponggo 757', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:34:05', '', '');
INSERT INTO `aka_siswa` VALUES ('658', 'PMB2014150754', '', 'Elaine Catalina Lesmana', '458', '0047714461', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2004-12-15', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Bumi Indah No. 18', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:34:29', '', '');
INSERT INTO `aka_siswa` VALUES ('659', 'PMB2014150755', '', 'Ferdinand Jianming Karlim', '372', '0056594202', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '1', '1', '0', 'L', 'Surabaya', '2005-05-17', '', '0', '0', '', '0.0', '0.0', '-', '', 'Achmad Jais 34 Blok B/9, Grand Achmad Jais', '', '0315357791', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:34:53', '', '');
INSERT INTO `aka_siswa` VALUES ('660', 'PMB2014150756', '', 'Gabriel Galuh Susanto Putra', '391', '0057917731', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-07-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Harapan III EA 9', '', '7316959', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:43:21', '', '');
INSERT INTO `aka_siswa` VALUES ('661', 'PMB2014150757', '', 'Gloria Rexana Lie', '355', '0058755106', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'P', 'surabaya', '2006-07-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Simpang Darmo Permai Utara 5 / 35', '', '7342859', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:43:48', '', '');
INSERT INTO `aka_siswa` VALUES ('662', 'PMB2014150758', '', 'Goodwill Bryan Lion', '392', '0055366955', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2005-07-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family B-63', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:44:17', '', '');
INSERT INTO `aka_siswa` VALUES ('663', 'PMB2014150759', '', 'Jeanette Magdalene', '358', '0058856200', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2005-06-23', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Harapan Utara I EM-7', '', '0317317700', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:45:37', '', '');
INSERT INTO `aka_siswa` VALUES ('664', 'PMB2014150760', '', 'Jonathan Harleyson Sutanto', '359', '0059061621', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-05-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Jupiter BS-15 Taman Hunian Satelit', '', '7328360', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:54:15', '', '');
INSERT INTO `aka_siswa` VALUES ('665', 'PMB2014150761', '', 'Kellin Anne Hidayat (Kellin)', '703', '0052784309', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2005-08-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Famili Selatan III / A8', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:54:40', '', '');
INSERT INTO `aka_siswa` VALUES ('666', 'PMB2014150762', '', 'Kimberly Yauwhanes (Kimy)', '704', '0052732829', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2005-01-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Famili A-51', '', '0315992938', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:55:00', '', '');
INSERT INTO `aka_siswa` VALUES ('667', 'PMB2014150763', '', 'Marco Alexander Tejo', '362', '0055809990', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2005-11-16', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Harapan EC-20', '', '7318486', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:55:23', '', '');
INSERT INTO `aka_siswa` VALUES ('668', 'PMB2014150764', '', 'Nathanael Rodrick Ho', '396', '0059040860', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '4', '1', '0', 'L', 'Suraba', '2005-06-16', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Darmo Permai I / 28', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:55:47', '', '');
INSERT INTO `aka_siswa` VALUES ('669', 'PMB2014150765', '', 'Patrick Riche Go', '397', '0053029769', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2005-11-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Indah AAL 36', '', '7524253', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:56:09', '', '');
INSERT INTO `aka_siswa` VALUES ('670', 'PMB2014150766', '', 'Rebecca Ferren', '380', '0045714065', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '1', '1', '0', 'P', 'Surabaya', '2004-12-25', '', '0', '0', '', '0.0', '0.0', '-', '', 'Perum. Graha Family Jl. Pulau Golf Family I (G-32)', '', '7384666', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:56:34', '', '');
INSERT INTO `aka_siswa` VALUES ('671', 'PMB2014150767', '', 'Vedericco Chandra', '381', '0059679751', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2005-07-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'Jajar Tunggal Utara V Blok S No. 5', '', '081331608585', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:56:54', '', '');
INSERT INTO `aka_siswa` VALUES ('672', 'PMB2014150768', '', 'Arnold Nathanael Benjamin', '368', '0052949114', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-09-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'Satelit Utara III / ET 36', '', '7325077', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:57:23', '', '');
INSERT INTO `aka_siswa` VALUES ('673', 'PMB2014150769', '', 'Anneliese', '384', '0054531988', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2005-06-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Kalijaten, Ruko Sepanjang Town House C 15-16', '', '7871720', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:57:42', '', '');
INSERT INTO `aka_siswa` VALUES ('674', 'PMB2014150770', '', 'Brandon Lee Sanyoto', '386', '0058608490', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-10-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Regency 2 / PD 3-12 Pakuwon Indah', '', '7391118', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:58:05', '', '');
INSERT INTO `aka_siswa` VALUES ('675', 'PMB2014150771', '', 'Callie Elspeth Kurniadi', '388', '0059129694', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2005-07-23', '', '0', '0', '', '0.0', '0.0', '-', '', 'Wisata Bukit Mas C-5 / 12', '', '7535682', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:58:27', '', '');
INSERT INTO `aka_siswa` VALUES ('676', 'PMB2014150772', '', 'Celine Lopez Gonzales Tan', '350', '0055356447', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'P', 'Suraaya', '2005-05-14', '', '0', '0', '', '0.0', '0.0', '-', '', 'Apartemen Waterplace Tower A  08-10', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:58:51', '', '');
INSERT INTO `aka_siswa` VALUES ('677', 'PMB2014150773', '', 'Daniel Redondo Pantas Sianipar', '389', '0053935122', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-01-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'selindri 9/3 kota baru driyorejo Gresik', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:59:16', '', '');
INSERT INTO `aka_siswa` VALUES ('678', 'PMB2014150774', '', 'Eugenia Cheryl Sutedjo', '370', '0051634580', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2005-07-30', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family F 58', '', '7385658', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:59:36', '', '');
INSERT INTO `aka_siswa` VALUES ('679', 'PMB2014150775', '', 'Feliza Theodora Putri Tjokro', '371', '0059760626', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2005-05-27', '', '0', '0', '', '0.0', '0.0', '-', '', 'Puri Sentra Raya PS 1-50 Q Citraland', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 04:59:57', '', '');
INSERT INTO `aka_siswa` VALUES ('680', 'PMB2014150776', '', 'Hovan Mac Chen', '356', '0056352805', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2005-08-30', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Mas RC-21', '', '5680118', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:00:20', '', '');
INSERT INTO `aka_siswa` VALUES ('681', 'PMB2014150777', '', 'Jonathan Wongso', '376', '0055823463', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2005-09-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Valensia PA 4/3 Pakuwon Indah', '', '7523055', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:00:47', '', '');
INSERT INTO `aka_siswa` VALUES ('682', 'PMB2014150778', '', 'Josephine Christabelle', '377', '0058547425', '2', '', '1', '0', '', '2', '9', '14', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2005-10-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kupang Baru 2 No. 25', '', '7346835', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:01:09', '', '');
INSERT INTO `aka_siswa` VALUES ('683', 'PMB2014150832', '', 'Astrid Regina Pangkey', '237', '0031550404', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2003-02-16', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Pondok Indah  LY - 2', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:26:18', '', '');
INSERT INTO `aka_siswa` VALUES ('684', 'PMB2014150834', '', 'Audric Owen', '214', '0032568440', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2003-07-19', '', '0', '0', '', '0.0', '0.0', '-', '', 'Undaan Wetan 46 E Sby', '', '5326126', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:26:41', '', '');
INSERT INTO `aka_siswa` VALUES ('685', 'PMB2014150835', '', 'Bryong Ang Suhartono', '467', '0025660461', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2002-12-21', '', '0', '0', '', '0.0', '0.0', '-', '', 'Citraland Bukit Golf Utama Blok FI / 3A', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:29:02', '', '');
INSERT INTO `aka_siswa` VALUES ('686', 'PMB2014150836', '', 'Celine Angelina Prayogo', '267', '0031550451', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2002-12-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kapasari V/16', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:29:33', '', '');
INSERT INTO `aka_siswa` VALUES ('687', 'PMB2014150837', '', 'Cheryl Lim', '217', '0031550446', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2003-10-31', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Famili N - 46', '', '7346683', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:30:01', '', '');
INSERT INTO `aka_siswa` VALUES ('688', 'PMB2014150838', '', 'Edbert Mulyawan', '239', '0031550401', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '1', '1', '0', 'L', 'Surabaya', '2003-01-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Harapan Utara  VIII / EU 20', '', '7318896', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:30:25', '', '');
INSERT INTO `aka_siswa` VALUES ('689', 'PMB2014150839', '', 'Felicia Princess Liangkey', '241', '0031550441', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2003-12-04', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Hill Blok  M - 22', '', '5636157', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:30:50', '', '');
INSERT INTO `aka_siswa` VALUES ('690', 'PMB2014150840', '', 'Grace Calvinia', '242', '0025210415', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2002-11-23', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Semambung 345, Driyorejo-Gresik', '', '7509702', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:31:22', '', '');
INSERT INTO `aka_siswa` VALUES ('691', 'PMB2014150841', '', 'Jazz Bradlee', '221', '0031550414', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2003-03-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Vila Bukit Mas - Mediteran L-16', '', '70929467', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:31:53', '', '');
INSERT INTO `aka_siswa` VALUES ('692', 'PMB2014150842', '', 'Jennifer Alicia Lee', '244', '0031550437', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2003-08-15', '', '0', '0', '', '0.0', '0.0', '-', '', 'Petemon Sidomulyo  IIIA / 31', '', '5350872', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:32:57', '', '');
INSERT INTO `aka_siswa` VALUES ('693', 'PMB2014150843', '', 'Jessica Levina Amelinda', '245', '0031550413', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2003-03-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kupang Indah  19 / 32', '', '7311505', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:33:20', '', '');
INSERT INTO `aka_siswa` VALUES ('694', 'PMB2014150844', '', 'Jonathan Alexander Liyanto', '597', '0035923562', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2003-07-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kedurus IV / 66-B, Sby', '', '0317661792', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:33:41', '', '');
INSERT INTO `aka_siswa` VALUES ('695', 'PMB2014150845', '', 'Justin Tanujaya', '226', '0031550415', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'L', 'Jakarta', '2003-04-03', '', '0', '0', '', '0.0', '0.0', '-', '', 'Vila Bukit Regensi 3 PE 8 / 26', '', '7391671', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:34:00', '', '');
INSERT INTO `aka_siswa` VALUES ('696', 'PMB2014150846', '', 'Klara Immanuela', '227', '0031550442', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2003-10-23', '', '0', '0', '', '0.0', '0.0', '-', '', 'Taman Internasional I / C-1 / 21', '', '7442186', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:34:36', '', '');
INSERT INTO `aka_siswa` VALUES ('697', 'PMB2014150847', '', 'Lincoln Abraham', '521', '0021441351', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2002-10-17', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Permai Timur XIV / 52, Surabaya', '', '0317310692', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:34:56', '', '');
INSERT INTO `aka_siswa` VALUES ('698', 'PMB2014150848', '', 'Louis Samuel Muktiali', '246', '0025210414', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2002-09-21', '', '0', '0', '', '0.0', '0.0', '-', '', 'Babadan Mukti C 16', '', '7530678', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:35:38', '', '');
INSERT INTO `aka_siswa` VALUES ('699', 'PMB2014150849', '', 'Malika Mada Susanto Putri', '228', '0031550416', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2003-04-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Harapan III EA 9', '', '7316959', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:36:15', '', '');
INSERT INTO `aka_siswa` VALUES ('700', 'PMB2014150850', '', 'Matthew Zhang', '230', '0031550433', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2003-08-03', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Baru Barat  I / no. 57', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:36:37', '', '');
INSERT INTO `aka_siswa` VALUES ('701', 'PMB2014150851', '', 'Meylisha Kurniawan', '248', '0031550419', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '1', '1', '0', 'P', 'Surabaya', '2003-05-15', '', '0', '0', '', '0.0', '0.0', '-', '', 'Bukit Pakis Teratai S - 10', '', '5636333', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:36:59', '', '');
INSERT INTO `aka_siswa` VALUES ('702', 'PMB2014150852', '', 'Michelle Devina', '250', '0031550439', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'Malang', '2003-08-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Panglima Sudirman 67, Gresik', '', '3983096', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:37:20', '', '');
INSERT INTO `aka_siswa` VALUES ('703', 'PMB2014150853', '', 'Nelson Claudio Salim', '251', '0031550443', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2003-10-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Anjasmoro 34', '', '5321034', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:37:44', '', '');
INSERT INTO `aka_siswa` VALUES ('704', 'PMB2014150854', '', 'Sheren Pricillia', '256', '0031550412', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'Palembang', '2003-03-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pregolan Bunder 46 - 48', '', '5341682', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:38:07', '', '');
INSERT INTO `aka_siswa` VALUES ('705', 'PMB2014150855', '', 'Tiffany Grace Santoso', '235', '0031550402', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2003-01-29', '', '0', '0', '', '0.0', '0.0', '-', '', 'Dian Istana  A1 - 20', '', '7533858', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:38:30', '', '');
INSERT INTO `aka_siswa` VALUES ('706', 'PMB2014150856', '', 'Vania Sulistiano', '338', '0031798148', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'Jakarta', '2003-12-20', '', '0', '0', '', '0.0', '0.0', '-', '', 'Bukit Telaga Golf TH 2/12 Citraland', '', '0317400577', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:38:55', '', '');
INSERT INTO `aka_siswa` VALUES ('707', 'PMB2014150857', '', 'Vincent Alexander', '257', '0031550420', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2003-05-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Tunjungan 53 F', '', '7440099', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:41:45', '', '');
INSERT INTO `aka_siswa` VALUES ('708', 'PMB2014150858', '', 'Ashley Kaitlyn Yeoh', '236', '0025210417', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2002-12-01', '', '0', '0', '', '0.0', '0.0', '-', '', 'Royal Park TL - 3 / 46, Citra Raya', '', '7409556', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:42:28', '', '');
INSERT INTO `aka_siswa` VALUES ('709', 'PMB2014150859', '', 'Brenda Nicole Soesanto', '215', '0031550436', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2003-08-12', '', '0', '0', '', '0.0', '0.0', '-', '', 'Graha Family  N - 155', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:42:53', '', '');
INSERT INTO `aka_siswa` VALUES ('710', 'PMB2014150860', '', 'Bryan Nathanael', '216', '0031550407', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2003-02-25', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Regency 3 PE 2 No. 18, Surabaya', '', '7523074', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:43:17', '', '');
INSERT INTO `aka_siswa` VALUES ('711', 'PMB2014150861', '', 'Davin Septian Koestiono Kho', '238', '0031550440', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2003-09-03', '', '0', '0', '', '0.0', '0.0', '-', '', 'Water ront WP 7 / 5, CitraLand', '', '740873637', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:43:37', '', '');
INSERT INTO `aka_siswa` VALUES ('712', 'PMB2014150862', '', 'Edward Thejawijaya', '404', '0039816886', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2003-09-06', '', '0', '0', '', '0.0', '0.0', '-', '', 'Delta Sari Indah AM-5 Waru Sidoarjo', '', '8535229', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:43:59', '', '');
INSERT INTO `aka_siswa` VALUES ('713', 'PMB2014150863', '', 'Eugenia Christabel', '240', '0031550400', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2003-01-24', '', '0', '0', '', '0.0', '0.0', '-', '', 'Raya Darmo Permai II, Perum Darmo Green Garden C 19', '', '7325562', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:44:17', '', '');
INSERT INTO `aka_siswa` VALUES ('714', 'PMB2014150864', '', 'Howard Yang', '218', '0031550399', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2019-01-15', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pakuwon Indah AB 2-23 Sby', '', '7391770', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:44:41', '', '');
INSERT INTO `aka_siswa` VALUES ('715', 'PMB2014150865', '', 'Ilona Marsha Go', '219', '0031550409', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'mojokerto', '2003-03-02', '', '0', '0', '', '0.0', '0.0', '-', '', 'North Emerald Mansion TN 3/43, Surabaya', '', '7524253', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:45:04', '', '');
INSERT INTO `aka_siswa` VALUES ('716', 'PMB2014150866', '', 'Jasmine Angela Pangkey', '220', '0031550418', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2003-05-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Griya Babatan Mukti J-33A, Surabaya', '', '7530210', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:45:28', '', '');
INSERT INTO `aka_siswa` VALUES ('717', 'PMB2014150867', '', 'Jasmine Angela Pangkey', '220', '0031550418', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2003-05-08', '', '0', '0', '', '0.0', '0.0', '-', '', 'Griya Babatan Mukti J-33A, Surabaya', '', '7530210', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:46:02', '', '');
INSERT INTO `aka_siswa` VALUES ('718', 'PMB2014150868', '', 'Jason William', '243', '0031550438', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2003-08-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Dupak 72', '', '35424846', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:46:28', '', '');
INSERT INTO `aka_siswa` VALUES ('719', 'PMB2014150869', '', 'Jeanne Angeline Siemon', '222', '0031550435', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '4', '1', '0', 'P', 'Surabaya', '2003-08-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Regency III, PE7-20 Pakuwon Indah , Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:46:49', '', '');
INSERT INTO `aka_siswa` VALUES ('720', 'PMB2014150870', '', 'Jessica', '223', '0038027122', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '1', '1', '0', 'P', 'Surabaya', '2003-12-31', '', '0', '0', '', '0.0', '0.0', '-', '', 'Dupak 17 Blok 9 B', '', '5476264', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:47:07', '', '');
INSERT INTO `aka_siswa` VALUES ('721', 'PMB2014150871', '', 'Jesslyn Gabrielle Hermanto', '224', '0031550448', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2003-11-04', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Permai Sel. 9 / 14', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:47:33', '', '');
INSERT INTO `aka_siswa` VALUES ('722', 'PMB2014150872', '', 'Joseph Chang', '272', '0031301940', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2003-03-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'Kendangsari Blok M-10', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:47:55', '', '');
INSERT INTO `aka_siswa` VALUES ('723', 'PMB2014150873', '', 'Kelly Wijaya', '262', '0039325646', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2003-10-25', '', '0', '0', '', '0.0', '0.0', '-', '', 'Garaha Family L-117', '', '3570313', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:48:14', '', '');
INSERT INTO `aka_siswa` VALUES ('724', 'PMB2014150874', '', 'Marcellius Brian', '229', '0031550449', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '4', '1', '0', 'L', 'Surabaya', '2003-12-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Baru Barat  XI / no. 11', '', '7321670', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:48:44', '', '');
INSERT INTO `aka_siswa` VALUES ('725', 'PMB2014150875', '', 'Michelle Andrea Sutandar', '231', '0031550398', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2003-01-06', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Sentra Raya A5 No. 7 Sby', '', '7410588', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:49:05', '', '');
INSERT INTO `aka_siswa` VALUES ('726', 'PMB2014150876', '', 'Nicholas Chang', '252', '0031550421', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2003-05-28', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Hill Blok  P - 12', '', '5636338', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:49:31', '', '');
INSERT INTO `aka_siswa` VALUES ('727', 'PMB2014150883', '', 'Tristan Robin Aarnoudse', '469', '0039364013', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2003-10-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Permai Selatan I/6, Surabaya', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:52:13', '', '');
INSERT INTO `aka_siswa` VALUES ('728', 'PMB2014150882', '', 'Tabita Aurellia Anam', '234', '0031550434', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2003-08-09', '', '0', '0', '', '0.0', '0.0', '-', '', 'Putat Gede Indah 58', '', '5685226', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:52:38', '', '');
INSERT INTO `aka_siswa` VALUES ('729', 'PMB2014150881', '', 'Sharon Caitlyn Wijaya', '255', '0031550403', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'Surabaya', '2003-02-05', '', '0', '0', '', '0.0', '0.0', '-', '', 'Bukit Darmo Golf Regency Blok D-10, Surabaya', '', '7533806', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:53:05', '', '');
INSERT INTO `aka_siswa` VALUES ('730', 'PMB2014150880', '', 'Samuel King Kurniawan', '233', '0031550426', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'L', 'Sidoarjo', '2003-06-19', '', '0', '0', '', '0.0', '0.0', '-', '', 'Pondok Mutiara I No. 10 Sdj', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:53:29', '', '');
INSERT INTO `aka_siswa` VALUES ('731', 'PMB2014150877', '', 'Petra Julianto', '253', '0031550424', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'L', 'Surabaya', '2003-06-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Hill Blok L 21 A', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:53:55', '', '');
INSERT INTO `aka_siswa` VALUES ('732', 'PMB2014150878', '', 'Rafael Alessandro Sahulata', '254', '0031550450', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'L', 'Jayapura', '2003-12-18', '', '0', '0', '', '0.0', '0.0', '-', '', 'Darmo Sentosa Raya  C - 19', '', '5684773', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:54:20', '', '');
INSERT INTO `aka_siswa` VALUES ('733', 'PMB2014150879', '', 'Ruth Felicia Lukman', '598', '0032168539', '2', '', '1', '0', '', '2', '9', '16', '2', '0', '5', '1', '0', 'P', 'Jakarta', '2003-06-10', '', '0', '0', '', '0.0', '0.0', '-', '', 'Villa Bukit Regency 3 Blok PE 4 No. 25', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '5', '0', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '2015-02-17 05:55:49', '', '');

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
) ENGINE=MyISAM AUTO_INCREMENT=736 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=736 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=736 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=736 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=736 DEFAULT CHARSET=latin1;

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
-- Table structure for aka_statusguru
-- ----------------------------
DROP TABLE IF EXISTS `aka_statusguru`;
CREATE TABLE `aka_statusguru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `statusguru` varchar(50) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_statusguru_replid` (`replid`),
  KEY `IX_statusguru_ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_statusguru
-- ----------------------------

-- ----------------------------
-- Table structure for aka_subtingkat
-- ----------------------------
DROP TABLE IF EXISTS `aka_subtingkat`;
CREATE TABLE `aka_subtingkat` (
  `replid` int(10) NOT NULL AUTO_INCREMENT,
  `subtingkat` varchar(100) NOT NULL,
  `tingkat` int(10) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_subtingkat
-- ----------------------------
INSERT INTO `aka_subtingkat` VALUES ('1', 'kelas 1', '6');
INSERT INTO `aka_subtingkat` VALUES ('2', 'KELAS 2', '6');

-- ----------------------------
-- Table structure for aka_tahunajaran
-- ----------------------------
DROP TABLE IF EXISTS `aka_tahunajaran`;
CREATE TABLE `aka_tahunajaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` varchar(50) NOT NULL,
  `departemen` int(10) unsigned NOT NULL,
  `tglmulai` date NOT NULL,
  `tglakhir` date NOT NULL,
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `FK_tahunajaran_departemen` (`departemen`),
  KEY `IX_tahunajaran_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_tahunajaran
-- ----------------------------
INSERT INTO `aka_tahunajaran` VALUES ('1', '2014-2015', '1', '2014-07-01', '2015-06-30', '1', 'ok', '2014-01-22 23:49:44');
INSERT INTO `aka_tahunajaran` VALUES ('2', '2014-2015', '2', '2014-07-15', '2015-06-15', '1', '', '2014-03-19 04:36:55');
INSERT INTO `aka_tahunajaran` VALUES ('3', '2014-2015', '3', '2014-07-15', '2015-06-15', '1', '', '2014-03-19 04:37:57');
INSERT INTO `aka_tahunajaran` VALUES ('4', '2013-2014', '1', '2013-05-01', '2014-06-30', '0', 'ok', '2014-12-04 08:24:04');
INSERT INTO `aka_tahunajaran` VALUES ('5', '2015-2016', '3', '2015-01-01', '2016-02-01', '0', 'tes bro', '2015-01-28 08:57:00');

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
-- Table structure for aka_tingkat
-- ----------------------------
DROP TABLE IF EXISTS `aka_tingkat`;
CREATE TABLE `aka_tingkat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tingkat` varchar(10) NOT NULL DEFAULT '',
  `tahunajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `IX_tingkat_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_tingkat
-- ----------------------------
INSERT INTO `aka_tingkat` VALUES ('4', 'PG', '1', 'Playgroup', '0', '2014-03-19 04:45:41');
INSERT INTO `aka_tingkat` VALUES ('5', 'KG', '1', 'Kindergarten (TK)', '0', '2014-03-19 04:48:34');
INSERT INTO `aka_tingkat` VALUES ('6', 'Primary', '1', 'SD', '0', '2014-03-19 04:48:55');
INSERT INTO `aka_tingkat` VALUES ('7', 'Secondary', '1', 'SMP', '0', '2014-03-19 04:49:14');
INSERT INTO `aka_tingkat` VALUES ('8', 'HS', '1', 'High School (SMA)', '0', '2014-03-19 04:49:27');
INSERT INTO `aka_tingkat` VALUES ('9', 'P', '2', 'Primary', '0', '2014-03-19 04:57:13');
INSERT INTO `aka_tingkat` VALUES ('10', 'Sec', '2', 'Secondary', '0', '2014-03-19 04:57:25');
INSERT INTO `aka_tingkat` VALUES ('11', 'PG', '3', 'Playgroup', '0', '2014-03-19 04:57:42');
INSERT INTO `aka_tingkat` VALUES ('12', 'KG', '3', 'Kindergarten', '0', '2014-03-19 04:57:58');
INSERT INTO `aka_tingkat` VALUES ('13', 'HS', '2', 'High School', '0', '2014-03-19 05:15:25');
INSERT INTO `aka_tingkat` VALUES ('14', 'Toddler', '1', '', '0', '2014-03-20 04:53:35');
INSERT INTO `aka_tingkat` VALUES ('15', 'Toddler', '3', '', '0', '2014-03-20 04:54:12');
INSERT INTO `aka_tingkat` VALUES ('16', 'HS', '5', 'tes bro tlg nnti dhpus lgi ya', '0', '2015-01-28 08:59:32');

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
