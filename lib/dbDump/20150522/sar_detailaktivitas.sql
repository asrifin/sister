/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-06-01 19:22:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sar_detailaktivitas
-- ----------------------------
DROP TABLE IF EXISTS `sar_detailaktivitas`;
CREATE TABLE `sar_detailaktivitas` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `aktivitas` int(11) NOT NULL,
  `item` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL DEFAULT '1',
  `biaya` double(14,0) NOT NULL DEFAULT '0',
  `biaya2` double(14,0) NOT NULL DEFAULT '0',
  `tglbayar` date NOT NULL,
  `tgllunas` date NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sar_detailaktivitas
-- ----------------------------
INSERT INTO `sar_detailaktivitas` VALUES ('23', '30', 'pasir', '1', '100000', '85000', '2015-06-08', '2015-06-08');
INSERT INTO `sar_detailaktivitas` VALUES ('24', '30', 'pot bunga', '50', '10000', '450000', '2015-06-09', '2015-06-10');
INSERT INTO `sar_detailaktivitas` VALUES ('25', '30', 'semen', '2', '50000', '100000', '2015-06-08', '2015-06-09');
