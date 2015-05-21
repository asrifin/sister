/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-05-21 08:35:29
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
) ENGINE=MyISAM AUTO_INCREMENT=1081 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_jurnal
-- ----------------------------
INSERT INTO `keu_jurnal` VALUES ('1080', '2', '22', '900', 'k', '0', '0', '2015-05-21 07:41:35');
INSERT INTO `keu_jurnal` VALUES ('1078', '1', '1', '35000', 'k', '0', '0', '2015-05-21 07:19:02');
INSERT INTO `keu_jurnal` VALUES ('1077', '1', '190', '35000', 'd', '0', '0', '2015-05-21 07:19:02');
INSERT INTO `keu_jurnal` VALUES ('1079', '2', '1', '900', 'd', '0', '0', '2015-05-21 07:41:34');
