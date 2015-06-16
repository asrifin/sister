/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-06-17 00:01:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_detilanggaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_detilanggaran`;
CREATE TABLE `keu_detilanggaran` (
  `replid` int(10) NOT NULL AUTO_INCREMENT,
  `kategorianggaran` int(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `hargasatuan` double(14,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `kategorianggaran` (`kategorianggaran`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_detilanggaran
-- ----------------------------
INSERT INTO `keu_detilanggaran` VALUES ('62', '16', 'kertas HVS A4 9', 'printer 9', '10000');
INSERT INTO `keu_detilanggaran` VALUES ('63', '16', 'sip', 'woke', '30000');
