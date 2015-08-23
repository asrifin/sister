/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2015-08-24 03:09:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for psbcalon_bulan
-- ----------------------------
DROP TABLE IF EXISTS `psbcalon_bulan`;
CREATE TABLE `psbcalon_bulan` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psbcalon_bulan
-- ----------------------------
INSERT INTO `psbcalon_bulan` VALUES ('1', 'Januari', '01');
INSERT INTO `psbcalon_bulan` VALUES ('2', 'Februari', '02');
INSERT INTO `psbcalon_bulan` VALUES ('3', 'Maret', '03');
INSERT INTO `psbcalon_bulan` VALUES ('4', 'April', '04');
INSERT INTO `psbcalon_bulan` VALUES ('5', 'Mei', '05');
INSERT INTO `psbcalon_bulan` VALUES ('6', 'Juni', '06');
INSERT INTO `psbcalon_bulan` VALUES ('7', 'Juli', '07');
INSERT INTO `psbcalon_bulan` VALUES ('8', 'Agustus', '08');
INSERT INTO `psbcalon_bulan` VALUES ('9', 'September', '09');
INSERT INTO `psbcalon_bulan` VALUES ('10', 'Oktober', '10');
INSERT INTO `psbcalon_bulan` VALUES ('11', 'Nopember', '11');
INSERT INTO `psbcalon_bulan` VALUES ('12', 'Desember', '12');

-- ----------------------------
-- Table structure for psbcalon_gelombang
-- ----------------------------
DROP TABLE IF EXISTS `psbcalon_gelombang`;
CREATE TABLE `psbcalon_gelombang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psbcalon_gelombang
-- ----------------------------
INSERT INTO `psbcalon_gelombang` VALUES ('1', '1');
INSERT INTO `psbcalon_gelombang` VALUES ('2', '2');
INSERT INTO `psbcalon_gelombang` VALUES ('3', '3');

-- ----------------------------
-- Table structure for psbcalon_level
-- ----------------------------
DROP TABLE IF EXISTS `psbcalon_level`;
CREATE TABLE `psbcalon_level` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `level` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psbcalon_level
-- ----------------------------
INSERT INTO `psbcalon_level` VALUES ('1', 'PGA', 'PLAYGROUP A');
INSERT INTO `psbcalon_level` VALUES ('2', 'PGB', 'PLAYGROUP B');
INSERT INTO `psbcalon_level` VALUES ('3', 'P1', 'PRIMARY 1');
INSERT INTO `psbcalon_level` VALUES ('4', 'KG1', 'KINDERGARDEN 1');

-- ----------------------------
-- Table structure for psbcalon_lokasi
-- ----------------------------
DROP TABLE IF EXISTS `psbcalon_lokasi`;
CREATE TABLE `psbcalon_lokasi` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `lokasi` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psbcalon_lokasi
-- ----------------------------
INSERT INTO `psbcalon_lokasi` VALUES ('1', 'SUKO', 'ELYON SUKOMANUNGGAL');
INSERT INTO `psbcalon_lokasi` VALUES ('2', 'RKT', 'ELYON RUNGKUT');
INSERT INTO `psbcalon_lokasi` VALUES ('3', 'KTJ', 'ELYON KERTAJAYA');

-- ----------------------------
-- Table structure for psbcalon_siswa
-- ----------------------------
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

-- ----------------------------
-- Records of psbcalon_siswa
-- ----------------------------
INSERT INTO `psbcalon_siswa` VALUES ('1', '1', '2', '3', '2', '2015-06-09', '6', '7', '8', '9', '0', '1', '2', '3', '2', '3', 'z1', '2015-06-15', '2015-06-10', '2015-06-17', '', '', '', '', '', '2015-06-30', '2015-06-15', '', '', '', '2015-06-30');
INSERT INTO `psbcalon_siswa` VALUES ('2', 'a', 'a', '19', '1', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', '1', '2', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psbcalon_siswa` VALUES ('3', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'mm', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psbcalon_siswa` VALUES ('4', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'gg', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psbcalon_siswa` VALUES ('5', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psbcalon_siswa` VALUES ('6', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psbcalon_siswa` VALUES ('7', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'ii', 'i', 'i', 'i', 'i', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psbcalon_siswa` VALUES ('8', 'c', 'c', '', '1', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', '1', '6', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psbcalon_siswa` VALUES ('9', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', '', '', '', '', '', '', '', '', '', '', '', '', '2015-06-30', '', '');

-- ----------------------------
-- Table structure for psbcalon_situs
-- ----------------------------
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

-- ----------------------------
-- Records of psbcalon_situs
-- ----------------------------
INSERT INTO `psbcalon_situs` VALUES ('1', 'rekysda@gmail.com', 'Penerimaan Peserta Didik Baru', 'http://192.168.10.166/sister/marketingpsb', 'SISTER - PPDB', 'WebDesign dengan sistem Responsive', 'ppdb,surabaya,indonesia', '5', '50', '5', '4', '3', 'pos', 'Elyon Christian School', 'Surabaya', '1', '1', '12', '1', '2');

-- ----------------------------
-- Table structure for psbcalon_useraura
-- ----------------------------
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

-- ----------------------------
-- Records of psbcalon_useraura
-- ----------------------------
INSERT INTO `psbcalon_useraura` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@elyon.sch.id', 'af0675a9e843c6c8f78163a9118efc78.jpg', 'Administrator', 'aktif', '1', '2015-05-12 09:15:46', '2010-08-27 00:00:00', '2034-08-27 00:00:00', '<p><b>none</b></p>');
INSERT INTO `psbcalon_useraura` VALUES ('28', 'superadmin', 'b11d5ece6353d17f85c5ad30e0a02360', 'rekysda@gmail.com', '', 'Administrator', 'aktif', '1', '2015-03-21 23:05:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');
INSERT INTO `psbcalon_useraura` VALUES ('29', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'user@user.com', '', 'User', 'aktif', '0', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');
