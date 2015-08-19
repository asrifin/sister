/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-05-22 07:43:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kon_levelkatgrupmenu
-- ----------------------------
DROP TABLE IF EXISTS `kon_levelkatgrupmenu`;
CREATE TABLE `kon_levelkatgrupmenu` (
  `id_levelkatgrupmenu` int(11) NOT NULL AUTO_INCREMENT,
  `id_level` int(11) NOT NULL,
  `id_katgrupmenu` int(11) NOT NULL,
  PRIMARY KEY (`id_levelkatgrupmenu`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_levelkatgrupmenu
-- ----------------------------
INSERT INTO `kon_levelkatgrupmenu` VALUES ('1', '1', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('2', '1', '2');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('3', '2', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('4', '2', '2');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('5', '3', '2');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('6', '4', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('7', '4', '2');
