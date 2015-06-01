/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-05-29 14:51:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pus_setting2
-- ----------------------------
DROP TABLE IF EXISTS `pus_setting2`;
CREATE TABLE `pus_setting2` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kunci` char(6) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pus_setting2
-- ----------------------------
INSERT INTO `pus_setting2` VALUES ('1', 'idfmt');
INSERT INTO `pus_setting2` VALUES ('2', 'bcfmt');
INSERT INTO `pus_setting2` VALUES ('3', 'titfmt');
INSERT INTO `pus_setting2` VALUES ('4', 'desfmt');
