/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-05-25 14:32:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_jenistrans
-- ----------------------------
DROP TABLE IF EXISTS `keu_jenistrans`;
CREATE TABLE `keu_jenistrans` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `kode` varchar(5) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_jenistrans
-- ----------------------------
INSERT INTO `keu_jenistrans` VALUES ('1', 'jurnal umum', 'ju');
INSERT INTO `keu_jenistrans` VALUES ('2', 'pemasukkan', 'in');
INSERT INTO `keu_jenistrans` VALUES ('3', 'pengeluaran', 'out');
