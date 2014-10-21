/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50620
Source Host           : 127.0.0.1:3306
Source Database       : sisterdb

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2014-10-08 14:14:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for departemen
-- ----------------------------
DROP TABLE IF EXISTS `departemen`;
CREATE TABLE `departemen` (
  `id_departemen` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `kepsek` int(10) unsigned NOT NULL DEFAULT '0',
  `urut` int(10) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) NOT NULL,
  `alamat` varchar(300) NOT NULL,
  `telepon` varchar(30) NOT NULL,
  `photo` blob NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_departemen`),
  UNIQUE KEY `UX_departemen_replid` (`id_departemen`),
  UNIQUE KEY `departemen` (`nama`),
  KEY `FK_departemen_pegawai` (`kepsek`),
  KEY `IX_departemen_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of departemen
-- ----------------------------
INSERT INTO `departemen` VALUES ('1', 'Elyon Sukomanunggal', '0', '1', '', 'Jl. Raya Sukomanunggal Jaya 33A', '(031)732-5999', '', '2014-01-22 06:50:40');
INSERT INTO `departemen` VALUES ('2', 'Elyon Rungkut', '0', '2', '', 'Ruko Rungkut Megah Raya A-25, Jl. Raya Kali Rungkut No. 5', '(031)879-8896', '', '2014-01-24 09:14:27');
INSERT INTO `departemen` VALUES ('3', 'Elyon Kertajaya', '0', '3', '', 'Jl. Kertajaya Indah Timur VII/41', '(031)599-4994', '', '2014-01-24 09:14:34');

-- ----------------------------
-- Table structure for level
-- ----------------------------
DROP TABLE IF EXISTS `level`;
CREATE TABLE `level` (
  `id_level` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(20) NOT NULL,
  `action` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of level
-- ----------------------------
INSERT INTO `level` VALUES ('1', 'SA', 'MTR', 'superadmin');
INSERT INTO `level` VALUES ('2', 'A', 'MTR', 'admin');
INSERT INTO `level` VALUES ('3', 'O', 'TR', 'operator');
INSERT INTO `level` VALUES ('4', 'G', 'R', 'guest');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `id_level` int(11) NOT NULL,
  `pegawai` int(10) unsigned NOT NULL DEFAULT '0',
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `bahasa` varchar(2) NOT NULL DEFAULT '',
  `tlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_login`),
  UNIQUE KEY `username` (`username`),
  KEY `id_level` (`id_level`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id_level`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('1', 'Mr. Admin', 'admin', 'MjEyMzJmMjk3YTU3YTVhNzQzODk0YTBlNGE4MDFmYzM=', '2', '0', '1', 'id', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES ('2', 'operator', 'operator', 'operator', '3', '0', '1', '', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for modul
-- ----------------------------
DROP TABLE IF EXISTS `modul`;
CREATE TABLE `modul` (
  `id_modul` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `modul` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_modul`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of modul
-- ----------------------------
INSERT INTO `modul` VALUES ('1', 'aka', 'akademik', '');
INSERT INTO `modul` VALUES ('2', 'psb', 'penerimaan siswa baru', '');
INSERT INTO `modul` VALUES ('3', 'perpus', 'perpustakaan', '');
INSERT INTO `modul` VALUES ('4', 'sarpras', 'sarana dan prasarana', '');
INSERT INTO `modul` VALUES ('5', 'hrd', 'kepegawaian', '');
INSERT INTO `modul` VALUES ('6', 'keu', 'keuangan', '');
INSERT INTO `modul` VALUES ('7', 'repo', 'repository', '');
INSERT INTO `modul` VALUES ('8', 'man', 'manajemen', '');

-- ----------------------------
-- Table structure for privillege
-- ----------------------------
DROP TABLE IF EXISTS `privillege`;
CREATE TABLE `privillege` (
  `id_privillege` int(11) NOT NULL,
  `id_login` int(11) NOT NULL,
  `id_departemen` int(11) NOT NULL,
  `id_modul` int(11) NOT NULL,
  PRIMARY KEY (`id_privillege`),
  KEY `id_modul` (`id_modul`),
  KEY `id_departemen` (`id_departemen`),
  KEY `id_login` (`id_login`),
  KEY `id_login_2` (`id_login`),
  CONSTRAINT `privillege_ibfk_3` FOREIGN KEY (`id_modul`) REFERENCES `modul` (`id_modul`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `privillege_ibfk_4` FOREIGN KEY (`id_login`) REFERENCES `login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `privillege_ibfk_5` FOREIGN KEY (`id_departemen`) REFERENCES `departemen` (`id_departemen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of privillege
-- ----------------------------
INSERT INTO `privillege` VALUES ('1', '1', '1', '1');
INSERT INTO `privillege` VALUES ('2', '1', '1', '2');
INSERT INTO `privillege` VALUES ('3', '1', '1', '3');
