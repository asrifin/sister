/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-04-06 13:41:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_kategorirekening
-- ----------------------------
DROP TABLE IF EXISTS `keu_kategorirekening`;
CREATE TABLE `keu_kategorirekening` (
  `replid` int(10) NOT NULL AUTO_INCREMENT,
  `kode` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nama` varchar(20) NOT NULL,
  `jenis` enum('debit','kredit','debit_kredit') DEFAULT 'debit',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_kategorirekening
-- ----------------------------
INSERT INTO `keu_kategorirekening` VALUES ('1', '1', 'KAS', 'debit_kredit');
INSERT INTO `keu_kategorirekening` VALUES ('2', '1', 'BANK', 'debit_kredit');
INSERT INTO `keu_kategorirekening` VALUES ('3', '1', 'AKTIVA', 'debit_kredit');
INSERT INTO `keu_kategorirekening` VALUES ('4', '2', 'KEWAJIBAN', 'kredit');
INSERT INTO `keu_kategorirekening` VALUES ('5', '3', 'MODAL', 'debit');
INSERT INTO `keu_kategorirekening` VALUES ('6', '4', 'PENDAPATAN', 'debit');
INSERT INTO `keu_kategorirekening` VALUES ('7', '5', 'BIAYA', 'kredit');
