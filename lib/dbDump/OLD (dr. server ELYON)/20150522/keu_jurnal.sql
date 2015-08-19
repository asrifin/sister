/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-05-26 12:07:35
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
  `debet` double(14,0) NOT NULL DEFAULT '0',
  `kredit` double(14,0) NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=1183 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_jurnal
-- ----------------------------
INSERT INTO `keu_jurnal` VALUES ('1176', '3', '6', '35000', 'k', '0', '0', '2015-05-25 15:56:14');
INSERT INTO `keu_jurnal` VALUES ('1175', '3', '222', '35000', 'd', '0', '0', '2015-05-25 15:56:14');
INSERT INTO `keu_jurnal` VALUES ('1172', '1', '1', '80000', 'd', '0', '0', '2015-05-25 15:47:11');
INSERT INTO `keu_jurnal` VALUES ('1171', '1', '83', '80000', 'k', '0', '0', '2015-05-25 15:47:11');
INSERT INTO `keu_jurnal` VALUES ('1174', '2', '1', '15000', 'k', '0', '0', '2015-05-25 15:47:58');
INSERT INTO `keu_jurnal` VALUES ('1173', '2', '83', '15000', 'd', '0', '0', '2015-05-25 15:47:58');
INSERT INTO `keu_jurnal` VALUES ('1178', '4', '1', '100000', 'd', '0', '0', '2015-05-25 16:00:10');
INSERT INTO `keu_jurnal` VALUES ('1177', '4', '203', '100000', 'k', '0', '0', '2015-05-25 16:00:10');
INSERT INTO `keu_jurnal` VALUES ('1180', '5', '22', '50000', 'k', '0', '0', '2015-05-26 06:08:09');
INSERT INTO `keu_jurnal` VALUES ('1179', '5', '1', '50000', 'd', '0', '0', '2015-05-26 06:08:09');
INSERT INTO `keu_jurnal` VALUES ('1181', '5', '25', '5000', 'k', '0', '0', '2015-05-26 06:08:59');
INSERT INTO `keu_jurnal` VALUES ('1182', '5', '3', '5000', 'd', '0', '0', '2015-05-26 06:09:00');
