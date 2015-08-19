/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-05-22 15:14:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_jurnal
-- ----------------------------
DROP TABLE IF EXISTS `keu_jurnal`;
CREATE TABLE `keu_jurnal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaksi` int(10) unsigned NOT NULL,
  `rek` int(10) NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `jenis` char(1) NOT NULL,
  `debet` decimal(10,0) NOT NULL DEFAULT '0',
  `kredit` decimal(10,0) NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=1135 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_jurnal
-- ----------------------------
INSERT INTO `keu_jurnal` VALUES ('1125', '1', '1', '50000', 'd', '0', '0', '2015-05-22 09:50:42');
INSERT INTO `keu_jurnal` VALUES ('1126', '1', '22', '50000', 'k', '0', '0', '2015-05-22 09:50:42');
INSERT INTO `keu_jurnal` VALUES ('1127', '2', '18', '40000', 'k', '0', '0', '2015-05-22 09:51:03');
INSERT INTO `keu_jurnal` VALUES ('1128', '2', '2', '40000', 'd', '0', '0', '2015-05-22 09:51:03');
INSERT INTO `keu_jurnal` VALUES ('1129', '3', '33', '20000', 'd', '0', '0', '2015-05-22 09:51:36');
INSERT INTO `keu_jurnal` VALUES ('1130', '3', '4', '20000', 'k', '0', '0', '2015-05-22 09:51:36');
INSERT INTO `keu_jurnal` VALUES ('1131', '4', '23', '60000', 'k', '0', '0', '2015-05-22 09:52:15');
INSERT INTO `keu_jurnal` VALUES ('1132', '4', '1', '60000', 'd', '0', '0', '2015-05-22 09:52:15');
INSERT INTO `keu_jurnal` VALUES ('1133', '5', '85', '15000', 'd', '0', '0', '2015-05-22 10:07:22');
INSERT INTO `keu_jurnal` VALUES ('1134', '5', '1', '15000', 'k', '0', '0', '2015-05-22 10:07:22');
