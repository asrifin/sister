/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-05-31 10:35:22
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sar_detailaktivitas
-- ----------------------------
INSERT INTO `sar_detailaktivitas` VALUES ('2', '20', '', '1', '50000', '0', '2015-06-02', '0000-00-00');
INSERT INTO `sar_detailaktivitas` VALUES ('3', '20', '', '100', '10000', '0', '2015-05-05', '0000-00-00');
