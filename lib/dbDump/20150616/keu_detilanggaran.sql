/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-06-16 17:25:10
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_detilanggaran
-- ----------------------------
INSERT INTO `keu_detilanggaran` VALUES ('43', '17', 'beras', 'persediaan beras untuk baksos', '0');
INSERT INTO `keu_detilanggaran` VALUES ('44', '20', 'semen', '', '0');
INSERT INTO `keu_detilanggaran` VALUES ('47', '17', 'tepung', 'persediaan tepung', '0');
INSERT INTO `keu_detilanggaran` VALUES ('59', '16', 'mantap', 'wenak', '5000');
INSERT INTO `keu_detilanggaran` VALUES ('61', '16', 'map besar', 'untuk menyimpan file dan dokumen penting', '20000');
