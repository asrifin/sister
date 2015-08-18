/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2015-08-18 17:48:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sensor
-- ----------------------------
DROP TABLE IF EXISTS `sensor`;
CREATE TABLE `sensor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `word` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sensor
-- ----------------------------
INSERT INTO `sensor` VALUES ('1', 'Kontol');
INSERT INTO `sensor` VALUES ('2', 'Anjing');
INSERT INTO `sensor` VALUES ('3', 'Anjeng');
INSERT INTO `sensor` VALUES ('4', 'anjrit');
INSERT INTO `sensor` VALUES ('5', 'memek');
INSERT INTO `sensor` VALUES ('6', 'tempek');
INSERT INTO `sensor` VALUES ('7', 'Bangsat');
INSERT INTO `sensor` VALUES ('8', 'fuck');
INSERT INTO `sensor` VALUES ('9', 'eSDeCe');
