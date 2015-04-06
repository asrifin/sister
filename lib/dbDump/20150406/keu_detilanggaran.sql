/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-04-06 13:40:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_detilanggaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_detilanggaran`;
CREATE TABLE `keu_detilanggaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kategorianggaran` int(11) NOT NULL,
  `departemen` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `rekening` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `kategorianggaran` (`kategorianggaran`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_detilanggaran
-- ----------------------------
INSERT INTO `keu_detilanggaran` VALUES ('1', '1', '1', 'white board', '6', 'OK');
INSERT INTO `keu_detilanggaran` VALUES ('3', '1', '2', 'kertas HVS', '12', 'ok bos');
INSERT INTO `keu_detilanggaran` VALUES ('4', '1', '1', 'penghapus', '219', 'yes');
INSERT INTO `keu_detilanggaran` VALUES ('5', '1', '1', 'barang kertajaya', '3', 'kertajaya ok banget');
INSERT INTO `keu_detilanggaran` VALUES ('6', '1', '2', 'jk', '7', 'ok');
