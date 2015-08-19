/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-05-21 08:17:39
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
  `jenis` enum('d','k') NOT NULL,
  `jenistambah` enum('d','k') NOT NULL,
  `jeniskurang` enum('d','k') NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_kategorirekening
-- ----------------------------
INSERT INTO `keu_kategorirekening` VALUES ('1', '1', 'KAS', 'd', 'd', 'k');
INSERT INTO `keu_kategorirekening` VALUES ('2', '1', 'BANK', 'd', 'd', 'k');
INSERT INTO `keu_kategorirekening` VALUES ('3', '1', 'AKTIVA', 'd', 'd', 'k');
INSERT INTO `keu_kategorirekening` VALUES ('4', '2', 'KEWAJIBAN', 'k', 'k', 'd');
INSERT INTO `keu_kategorirekening` VALUES ('5', '3', 'MODAL', 'k', 'k', 'd');
INSERT INTO `keu_kategorirekening` VALUES ('6', '4', 'PENDAPATAN', 'k', 'k', 'd');
INSERT INTO `keu_kategorirekening` VALUES ('7', '5', 'BIAYA', 'd', 'd', 'k');
