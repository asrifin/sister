/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-06-13 07:47:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_detilanggaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_detilanggaran`;
CREATE TABLE `keu_detilanggaran` (
  `replid` int(10) NOT NULL AUTO_INCREMENT,
  `kategorianggaran` int(10) NOT NULL,
  `tingkat` int(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `tahunbuku` int(10) NOT NULL,
  `hargasatuan` double(14,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `kategorianggaran` (`kategorianggaran`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_detilanggaran
-- ----------------------------
INSERT INTO `keu_detilanggaran` VALUES ('37', '16', '8', 'spidol whiteboard x', 'tujuan spidol untuk papan tulis tiap kelas x', '1', '0');
INSERT INTO `keu_detilanggaran` VALUES ('39', '16', '8', 'kertas HVS A4', '', '1', '0');
INSERT INTO `keu_detilanggaran` VALUES ('40', '16', '8', 'penghapus whiteboard', 'atk ', '1', '0');
INSERT INTO `keu_detilanggaran` VALUES ('41', '16', '8', 'penggaris', '', '1', '0');
INSERT INTO `keu_detilanggaran` VALUES ('42', '16', '8', 'tes', 'ok', '1', '0');
INSERT INTO `keu_detilanggaran` VALUES ('43', '17', '8', 'beras', 'persediaan beras untuk baksos', '1', '0');
INSERT INTO `keu_detilanggaran` VALUES ('44', '20', '8', 'semen', '', '1', '0');
INSERT INTO `keu_detilanggaran` VALUES ('45', '16', '8', 'ballpoin', '', '1', '0');
INSERT INTO `keu_detilanggaran` VALUES ('46', '16', '8', 'white board', '', '1', '0');
INSERT INTO `keu_detilanggaran` VALUES ('47', '17', '8', 'tepung', 'persediaan tepung', '1', '0');
INSERT INTO `keu_detilanggaran` VALUES ('48', '16', '8', 'sapu', 'ok', '1', '0');
