/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-03-30 15:38:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for grupmodul
-- ----------------------------
DROP TABLE IF EXISTS `grupmodul`;
CREATE TABLE `grupmodul` (
  `id_grupmodul` int(11) NOT NULL AUTO_INCREMENT,
  `grupmodul` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL,
  PRIMARY KEY (`id_grupmodul`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of grupmodul
-- ----------------------------
INSERT INTO `grupmodul` VALUES ('1', 'satu', 'four');
INSERT INTO `grupmodul` VALUES ('2', 'dua', 'four');
INSERT INTO `grupmodul` VALUES ('3', 'tiga', 'four');
