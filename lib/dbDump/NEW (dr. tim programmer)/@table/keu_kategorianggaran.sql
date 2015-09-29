/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sistermetta

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-09-27 11:44:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_kategorianggaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_kategorianggaran`;
CREATE TABLE `keu_kategorianggaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `departemen` int(11) NOT NULL,
  `tingkat` int(11) NOT NULL,
  `detilrekening` int(11) NOT NULL,
  `kategorianggaran` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `tingkat` (`tingkat`) USING BTREE,
  KEY `detilrekening` (`detilrekening`) USING BTREE,
  KEY `departemen` (`departemen`) USING BTREE,
  CONSTRAINT `departemenFK4` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detilrekeningFK` FOREIGN KEY (`detilrekening`) REFERENCES `keu_detilrekening` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tingkatFK` FOREIGN KEY (`tingkat`) REFERENCES `aka_tingkat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_kategorianggaran
-- ----------------------------
INSERT INTO `keu_kategorianggaran` VALUES ('13', '1', '1', '2', 'ATK ', 'untuk keperluan alat tulis kantor ');
INSERT INTO `keu_kategorianggaran` VALUES ('14', '1', '1', '4', 'buku ', 'biaya buku pendamping siswa');
