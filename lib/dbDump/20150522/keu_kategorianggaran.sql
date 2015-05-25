/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-05-21 08:16:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_kategorianggaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_kategorianggaran`;
CREATE TABLE `keu_kategorianggaran` (
  `replid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` int(10) NOT NULL,
  `rekening` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_kategorianggaran
-- ----------------------------
INSERT INTO `keu_kategorianggaran` VALUES ('16', '1', '3', 'ATK', 'alat tulis kantor');
INSERT INTO `keu_kategorianggaran` VALUES ('17', '1', '91', 'logistik', 'bahan bahan logistik bahan pangan ');
INSERT INTO `keu_kategorianggaran` VALUES ('18', '1', '293', 'obat obatan', 'biaya untuk pengobatan seluruh warga sekolah ');
INSERT INTO `keu_kategorianggaran` VALUES ('19', '1', '0', '9', 'ooo');
INSERT INTO `keu_kategorianggaran` VALUES ('20', '1', '34', 'bangunan', 'ok');
