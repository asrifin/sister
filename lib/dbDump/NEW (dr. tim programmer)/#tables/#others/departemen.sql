/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-08-24 01:12:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for departemen
-- ----------------------------
DROP TABLE IF EXISTS `departemen`;
CREATE TABLE `departemen` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `kepsek` int(10) unsigned NOT NULL DEFAULT '0',
  `urut` int(10) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) NOT NULL,
  `alamat` varchar(300) NOT NULL,
  `telepon` varchar(30) NOT NULL,
  `photo` blob NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_departemen_replid` (`replid`),
  UNIQUE KEY `departemen` (`nama`),
  KEY `FK_departemen_pegawai` (`kepsek`),
  KEY `IX_departemen_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of departemen
-- ----------------------------
INSERT INTO `departemen` VALUES ('1', 'Elyon Sukomanunggal', '0', '1', '', 'Jl. Raya Sukomanunggal Jaya 33A', '(031)732-5999', '', '2014-01-21 23:50:40');
INSERT INTO `departemen` VALUES ('2', 'Elyon Rungkut', '0', '2', '', 'Ruko Rungkut Megah Raya A-25, Jl. Raya Kali Rungkut No. 5', '(031)879-8896', '', '2014-01-24 02:14:27');
INSERT INTO `departemen` VALUES ('3', 'Elyon Kertajaya', '0', '3', '', 'Jl. Kertajaya Indah Timur VII/41', '(031)599-4994', '', '2014-01-24 02:14:34');
