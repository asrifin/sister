/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-03-20 22:49:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_kategorianggaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_kategorianggaran`;
CREATE TABLE `keu_kategorianggaran` (
  `replid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_kategorianggaran
-- ----------------------------
INSERT INTO `keu_kategorianggaran` VALUES ('1', 'ATK', 'alat tulis kantor');
INSERT INTO `keu_kategorianggaran` VALUES ('2', 'lingkungan', 'dana perwatan lingkungan sekolah');
INSERT INTO `keu_kategorianggaran` VALUES ('3', 'kesiswaan', 'dana kegiatan ekstrakurikuler siswa');
